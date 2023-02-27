output "my_instance_id_my_server_dev" {
  description = "InstanceID"
  value       = aws_instance.my_server_dev.id
}
output "my_instance_id_my_server_prod" {
  description = "InstanceID"
  value       = aws_instance.my_server_prod.id
}