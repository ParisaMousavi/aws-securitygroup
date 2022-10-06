variable "vpc_id" {
  type = string
}

variable "rules" {
  type = map(object({
    name = string
    ingress = object({
      cidr_blocks = list(string)
      from_port   = number
      to_port     = number
      protocol    = string
    })
    egress = object({
      cidr_blocks = list(string)
      from_port   = number
      to_port     = number
      protocol    = string
    })
  }))
  default = {
    "ingress-all" = {
      name = "ingress-all"
      egress = {
        cidr_blocks = ["0.0.0.0/0"]
        from_port   = 22
        protocol    = "tcp"
        to_port     = 22
      }
      ingress = {
        cidr_blocks = ["0.0.0.0/0"]
        from_port   = 0
        protocol    = "-1"
        to_port     = 0
      }
    }
  }
}
