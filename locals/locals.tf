locals {
    domain_name = "yashd.icu"
    zone_id = "Z00909132T1JJDSG4SBDV"
    instance_type = var.Environment == "prod" ? "t2.nano" : "t2.micro"
}

###count.index will not work in locals 