
# Final project CI/CD

Example of integration and delivery of the flask application by using the jenkins pipeline to production server. 

IT stack:

1. Python Flask framework.
2. GitHub as application source repository
3. Terraform
4. Docker and DockerHub
5. Jenkins as CI/CD
6. AWS EC2




## Installation

Create my simple project Python Flask an web application fp_app.py and running test to make sure with working code.

![App Screenshot](https://github.com/kushcheva/EPAM_DevOps_Autumn-2022_Final_Project/blob/main/screenshots/1.png?raw=true)

Сreate 2 instances: my_server_dev and my_server_prod with configurations of security group, ssh key and opened ports by using Terraform.

![App Screenshot](https://github.com/kushcheva/EPAM_DevOps_Autumn-2022_Final_Project/blob/main/screenshots/2.png?raw=true)

## Deployment

Running on node my_server_dev Jenkins pipeline which create our Docker build and pushes it to Dockerhub registry. The sourse is Github. 

Then run container `docker run -d -p 5000:5000 kushcheva/fp_app`. Make sure there are no one previous containers and images on our machine. The latest image is pulling from Dockerhub.


![App Screenshot](https://github.com/kushcheva/EPAM_DevOps_Autumn-2022_Final_Project/blob/main/screenshots/3.png?raw=true)


If it is works properly we will deploy latest build by pulling from Dockerhub on my_server_prod and we use separated pipeline not to mix development and production environments. The development pipeline will start by automatic trigger when the previous pipeline have done successfully.

