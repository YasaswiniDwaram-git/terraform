resource "aws_instance" "locals" {
  count                  = length(var.instance_names)
  ami                    = data.aws_ami.ami_info.id
  instance_type          = var.instance_names[count.index] == "mysql" ? "t3.micro" : "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = {
    Name = var.instance_names[count.index]
  }

}

resource "aws_instance" "extra_instance" {
  count                  = length(var.instance_names)
  ami                    = data.aws_ami.ami_info.id
  instance_type          = local.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = {
    Name = var.instance_names[count.index]
  }

}
resource "aws_security_group" "allow_ssh_terraform" {
  name        = " allow-SSH "
  description = " Allow port 22"



  # we allow evrything in egress (this is outgoing traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"         #-1 is for evrything but we can give TCP as well
    cidr_blocks = ["0.0.0.0/0"] #allow from everyone
  }

}