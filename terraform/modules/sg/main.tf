resource "aws_security_group" "risk_sg" {
  name_prefix = var.security_group_name
  vpc_id      = var.vpc_id

  // Ingress rules
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = lookup(ingress.value, "from_port", 0)
      to_port     = lookup(ingress.value, "to_port", 0)
      protocol    = lookup(ingress.value, "protocol", "tcp")
      cidr_blocks = lookup(ingress.value, "cidr_blocks", [])
    }
  }

  // Egress rules
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = lookup(egress.value, "from_port", 0)
      to_port     = lookup(egress.value, "to_port", 0)
      protocol    = lookup(egress.value, "protocol", "-1")
      cidr_blocks = lookup(egress.value, "cidr_blocks", ["0.0.0.0/0"])
    }
  }
}