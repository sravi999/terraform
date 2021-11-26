output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "amis" {
  description = "Latest Ubuntu AMI"
  value       = data.aws_ami.amis.name
}

output "ami_id" {
  description = "Ami ID"
  value       = data.aws_ami.amis.id
}
