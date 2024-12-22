locals{
  cluster_name = "homework-cluster"
}

module "assignment_vpc" {
  source = "registry.terraform.io/terraform-aws-modules/vpc/aws"

  name = "assignment_vpc"

  cidr = "10.194.0.0/16"
  azs = ["${var.aws_region}a", "${var.aws_region}c"]
  public_subnets  = ["10.194.0.0/24", "10.194.1.0/24"]
  private_subnets = ["10.194.100.0/24", "10.194.101.0/24"]

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  enable_dns_hostnames   = true

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

  tags = {
    "kubernetes.io/cluster/${local.cluster_name}"  = "shared"
  }
}