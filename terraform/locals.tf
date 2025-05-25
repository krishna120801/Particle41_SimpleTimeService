locals {
    az=slice(data.aws_availability_zones.available.names,0,2)
    number_of_subnets = 2

  private_subnets = [
    for i in range(local.number_of_subnets) :
    cidrsubnet(var.vpc_cidr, 8, i)
  ]

  public_subnets = [
    for i in range(local.number_of_subnets) :
    cidrsubnet(var.vpc_cidr, 8, i + local.number_of_subnets)
  ]
}