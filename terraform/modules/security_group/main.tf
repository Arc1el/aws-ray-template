# Head 노드 보안 그룹을 먼저 생성
resource "aws_security_group" "ray_head" {
  name        = "ray-head-sg"
  description = "Security group for Ray head node"
  vpc_id      = var.vpc_id

  # SSH 접속 허용 (특정 IP에서만)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["1.214.42.138/32"]
  }

  # Ray 대시보드 접근 (특정 IP에서만)
  ingress {
    from_port   = 8265
    to_port     = 8265
    protocol    = "tcp"
    cidr_blocks = ["1.214.42.138/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ray-head-sg"
  }

  # 명시적으로 Worker 보안 그룹이 생성된 후에 Ray 포트 규칙 추가
  lifecycle {
    create_before_destroy = true
  }
}

# Worker 노드 보안 그룹은 Head 보안 그룹이 생성된 후에 생성
resource "aws_security_group" "ray_worker" {
  name        = "ray-worker-sg"
  description = "Security group for Ray worker nodes"
  vpc_id      = var.vpc_id

  # Head 노드로부터의 모든 연결 허용
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.ray_head.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ray-worker-sg"
  }

  depends_on = [aws_security_group.ray_head]
}

# Head 노드의 Ray 포트 규칙은 Worker 보안 그룹이 생성된 후에 추가
resource "aws_security_group_rule" "ray_port" {
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.ray_worker.id
  security_group_id        = aws_security_group.ray_head.id

  depends_on = [aws_security_group.ray_worker]
} 