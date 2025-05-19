resource "aws_key_pair" "ray_key" {
  key_name   = "ray-key"
  public_key = tls_private_key.ray_key.public_key_openssh
}

resource "tls_private_key" "ray_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content         = tls_private_key.ray_key.private_key_pem
  filename        = "${path.module}/../../../ray-key.pem"
  file_permission = "0600"
}

output "key_name" {
  value = aws_key_pair.ray_key.key_name
} 