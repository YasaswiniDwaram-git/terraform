resource "aws_instance" "expense" {
    #count = 3 # this will create 3 instances , but you need n instances from a list then below
    count = length(var.instance_names)
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = merge(
       var.common_tags,
      {
        Name = var.instance_names[count.index]
      }

    )
  }

resource "aws_security_group" "allow_ssh_terraform" {
    name = " allow-SSH "
    description = " Allow port 22"

    

    # we allow evrything in egress (this is outgoing traffic)
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp" #-1 is for evrything but we can give TCP as well
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
  }

  tags = merge(
       var.common_tags,
      {
        Name = "allow-ssh"
      }

    )
}