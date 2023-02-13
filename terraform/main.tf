#----------------------------------------------------------

provider "aws" {
  region = "eu-central-1"
}

resource "aws_default_vpc" "default" {} # This need to be added since AWS Provider v4.29+ to get VPC id

resource "aws_instance" "my_server_dev" {
  ami                    = "ami-06c39ed6b42908a36"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  key_name  = aws_key_pair.serversforfp.id

  tags = {
    Name    = "my_server_dev"
    Owner   = "Tati Kushcheva"
    Project = "Final project Epam_DevOps"
  }
}

resource "aws_instance" "my_server_prod" {
  ami                    = "ami-06c39ed6b42908a36"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  key_name  = aws_key_pair.serversforfp.id

  tags = {
    Name    = "my_server_prod"
    Owner   = "Tati Kushcheva"
    Project = "Final project Epam_DevOps"
  }

}


resource "aws_security_group" "my_webserver"  {
  name   = "My Security Group"
  vpc_id = aws_default_vpc.default.id # This need to be added since AWS Provider v4.29+ to set VPC id


  dynamic "ingress" {
    for_each = ["80", "443", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  ingress {
    description      = "8080 from jenkins"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "My SecurityGroup"
  }
}

resource "aws_key_pair" "serversforfp" {
  key_name   = "serversforfp.pub"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3/5vd53QteowLkK87mW8zwAJizJUrJWpaPzQgGsRIdhxZXx7+lzZmG4lLBx042ZXtkHOJfaLgB2CwKtKNgD3vkCLW7KE0w4kzPHCh2wMyXzxAL0M4A4dQ8DOMHqT8g6O1jIyDv8ZWp+XnaT750x8m9PKqwLIzn84QvoGzHhoXixqBmaa6wGnsimacJxjWm8DYrj1QrnZQAD+Zv72sWp3ShwNgXDEdNOgKep5HZhVMb7bVrQyTINLtPVWvxPM6vTtNyy8pbbi69siErrHWUeGU/BnlCk8C+NyeVYkzrltZw2khL69Cyx9q1nK8PWoFXtGqVEdfKnvVRvEaI9kiQslV tati@tatibook"
}