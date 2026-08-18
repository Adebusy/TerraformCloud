
output "vpc_id" {
  value = module.network.vpc_id
}


output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.network.public_subnet_id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.network.private_subnet_id
}

output "private_ec2_private_ip" {
  description = "Private IP address of the private EC2 instance"
  value       = module.private-instance.private_ip
}

output "bastion_public_ip" {
  description = "Public IP address of the bastion host"
  value       = module.bastion.public_ip
}

output "bastion_instance_id" {
  description = "Instance ID of the bastion host"
  value       = module.bastion.instance_id
}

output "bastion_security_group_id" {
  description = "Security group ID of the bastion host"
  value       = module.bastion.security_group_id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = module.network.nat_gateway
}