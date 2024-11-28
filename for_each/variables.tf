variable "instances" {
  type        = map
  default     = {
    mysql = "t3.micro"
    backend = "t2.micro"
    frontend = "t2.micro"
  }
  description = "description"
}

variable "zone_id" {
    default = "Z00909132T1JJDSG4SBDV"
}

variable "domain_name" {
    default = "yashd.icu"
}