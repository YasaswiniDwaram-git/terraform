#use output.instances_info , here output.instances_info == aws_instance.expense
output "instances_info" {
  value       = aws_instance.expense
  description = "This is the output of created instances"
}