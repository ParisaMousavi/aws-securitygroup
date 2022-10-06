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
}
