output "id" {
  value = {for k,v in aws_security_group.this : k => v.id} 
}

output "arn" {
  value = {for k,v in aws_security_group.this : k => v.arn} 
}
