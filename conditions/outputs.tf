output "instance_pub_IP_addr" {
  value       = aws_instance.terraform.public_ip
  description = "This is the publice I.P of the instance created."
}
