variable "instance_names" {
  type    = list(string)
  default = ["mysql", "backend", "frontend"]
}

variable "domain_name" {
  default = "yashd.icu"
}

variable "zone_id" {
  default = "Z00909132T1JJDSG4SBDV"
}