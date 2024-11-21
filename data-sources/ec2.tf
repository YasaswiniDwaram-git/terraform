resource "aws_security_group" "allow_ssh_terraform" {
    name = " allow-SSH "
    description = " Allow port 22"
    

    # we allow evrything in egress (this is outgoing traffic)
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp" #-1 is for evrything but we can give TCP as well
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-ssh"
  }

}

resource "aws_instance" "terraform" {
    ami = data.aws_ami.devopspractice.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = {
    Name = "terraform"
  }

}

