resource "aws_security_group" "sg-api-gateway-https" {
  name        = "${var.my_team}-${var.product}-${var.environment}-sg"
  description = "Allow HTTPS Access"
  vpc_id  = "${var.vpc_id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]    
  }

  tags = {
    Name           = "sg-${var.my_team}-${var.product}-${var.environment}"
    Terraform      = "true"
    Environments   = "${var.environment}"
    bussness_owner = "${var.bussness_owner}" 
  }
}