resource "aws_security_group" "this" {
  for_each = var.rules
  name     = each.value.name
  vpc_id   = var.vpc_id
  ingress {
    cidr_blocks = each.value.ingress.cidr_blocks
    from_port   = each.value.ingress.from_port
    to_port     = each.value.ingress.to_port
    protocol    = each.value.ingress.protocol
  }
  // Terraform removes the default rule
  egress {
    from_port   = each.value.egress.from_port
    to_port     = each.value.egress.to_port
    protocol    = each.value.egress.protocol
    cidr_blocks = each.value.egress.cidr_blocks
  }
}
