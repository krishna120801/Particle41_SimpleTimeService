variable region{
    type=string
    default="us-west-2"
}

variable vpc_cidr{
    type=string
    description = "Please provide custom VPC cidr if any"
    default="10.0.0.0/16"
}