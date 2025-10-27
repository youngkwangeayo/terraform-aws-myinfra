# modules/ec2/outputs.tf
output "instance_id" {
  value       = aws_instance.this.id
  description = "The ID of the EC2 instance"
}

output "public_ip" {
  value       = aws_instance.this.public_ip
  description = "Public IP address of the instance"
}

output "private_ip" {
  value       = aws_instance.this.private_ip
  description = "Private IP address of the instance"
}
