output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "instance_public_ip" {
  description = "Instance public ip"
  value       = { for key in keys(var.instances) : key => aws_eip.lb[key].public_ip }
}
