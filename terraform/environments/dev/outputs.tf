output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "VPC CIDR block"
  value       = module.vpc.vpc_cidr
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.subnet.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.subnet.private_subnet_ids
}

output "database_subnet_ids" {
  description = "List of database subnet IDs"
  value       = module.subnet.database_subnet_ids
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = module.vpc.nat_gateway_id
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = module.vpc.internet_gateway_id
}

output "s3_endpoint_id" {
  description = "S3 VPC Endpoint ID"
  value       = module.vpc.s3_endpoint_id
}

output "ray_head_sg_id" {
  description = "ID of the Ray head node security group"
  value       = module.security_group.ray_head_sg_id
}

output "ray_worker_sg_id" {
  description = "ID of the Ray worker node security group"
  value       = module.security_group.ray_worker_sg_id
} 