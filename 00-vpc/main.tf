module "vpc" {
  source = "git::https://github.com/Hemanth26080/terraform.git//AWS-VPC-Module/terraform-aws-vpc?ref=main"
  #vpc
  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
  environment  = var.environment
  vpc_tags     = var.vpc_tags
  #public subnets
  public_subnet_cidrs = var.public_subnet_cidr
  #private subnets
  private_subnet_cidrs = var.private_subnet_cidr
  #database subnets
  database_subnet_cidrs = var.data_subnet_cidr

  is_peering_required = true
}
