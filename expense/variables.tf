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

variable "zone_id" {
    default = "Z00909132T1JJDSG4SBDV"
}

variable "domain_name" {
    default = "yashd.icu"
}