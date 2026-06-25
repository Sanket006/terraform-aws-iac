provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source                 = "./modules/ec2"
  vpc_security_group_ids = [module.sg.sg_id]
  subnet_id              = module.vpc.public_subnet_a_id
}

module "alb" {
  source          = "./modules/alb"
  vpc_id          = module.vpc.vpc_id
  security_groups = [module.sg.sg_id]
  subnets         = module.vpc.public_subnet_ids
  target_id       = module.ec2.name
}

module "asg" {
  source                 = "./modules/asg"
  vpc_security_group_ids = [module.sg.sg_id]
  subnets                = module.vpc.public_subnet_ids
  target_group_arns      = [module.alb.target_group_arn]
}

module "rds" {
  source     = "./modules/rds"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
}

module "eks" {
  source        = "./modules/eks"
  region        = var.region
  cluster_name  = "demo-eks-cluster"
  vpc_cidr      = "10.0.0.0/16"
  subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  instance_type = "c7i-flex.large"
  desired_size  = 2
  min_size      = 1
  max_size      = 3
}
