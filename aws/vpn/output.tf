output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "instance_public_ip" {
  description = "Instance public ip"
  value       = aws_instance.instance.public_ip
}
