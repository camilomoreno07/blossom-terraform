provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.cidr_block
  region = var.region
}

module "ec2" {
  source = "./modules/ec2"
  ec2_profile = module.iam.ec2_profile
  subnet_public1 = module.vpc.subnet_public1
  subnet_public2 = module.vpc.subnet_public2
  subnet_private1 = module.vpc.subnet_private1
  subnet_private2 = module.vpc.subnet_private2
  subnet_private3 = module.vpc.subnet_private3
  subnet_private4 = module.vpc.subnet_private4
  vpc_name = module.vpc.vpc_name
}

module "iam" {
  source = "./modules/iam"
}