# 1.command line (terraform plan -var="key=value")
# 2.terraform.tfvars (one in files)
# 3.enviroment variables (export TF_VAR_key=value)
#here to remove this you can use unset TF_VAR_key
# 4.default (ones on script vars file)
#5. if no where , it will ask on prompt

variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "The id of the Devops-pratcice (AMI) to use for the server."
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "tags"{
    type = map
    default = {
        Name = "backend"
        Project = "expense"
        Component = " backend"
        Environment = "DEV"
        Terraform = "true"
    }
}

variable "sg_name" {
    default = "allow-SSH"
}

variable "sg_description" {
    default = "Allow port 22"
}

variable "from_port" {
    default = 22
    type = number
}

variable "to_port" {
    default = 22
    type = number
}

variable "protocol" {
    default = "tcp"
}

variable "ingress_CIDR" {
    type = list(string)
    default = ["0.0.0.0/0"]

}
