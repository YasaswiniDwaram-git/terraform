variable "instance_names" {
    type = list(string)
    default = [ "mysql" , "frontend" , "backend" ]
}

variable "common_tags"{
    type = map
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}