variable "ingress_rules" {
    default = [
    {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp" #-1 is for evrything but we can give TCP as well
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    description = "opening port 22"
    },

    {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp" #-1 is for evrything but we can give TCP as well
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    description = "opening port 22"
    },

    {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp" #-1 is for evrything but we can give TCP as well
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    description = "opening port 22"
    }

    ]
  }