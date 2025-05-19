output "ray_head_sg_id" {
  description = "ID of the Ray head node security group"
  value       = aws_security_group.ray_head.id
}

output "ray_worker_sg_id" {
  description = "ID of the Ray worker node security group"
  value       = aws_security_group.ray_worker.id
} 