resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow-SSH"
    description = "Allow port 22"

    

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

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp" #-1 is for evrything but we can give TCP as well
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

}

resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    tags = {
    Name = "terraform"
  }


  #here the PC is local so local-exec , else remote-exec
  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip} > private_ip.txt"
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }
provisioner "remote-exec" {
    inline = [  #at inline you can give multiple commands you want to be run on the remote server
               "sudo dnf install ansible -y ",
               "sudo dnf install nginx -y ",
               "sudo systemctl start nginx",
    ]
    
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx",
    ]
  }
}



