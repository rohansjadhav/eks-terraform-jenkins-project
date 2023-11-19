###############################################################
## VPC
###############################################################
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "eks-vpc"
  cidr = var.vpc_cidr

  azs = data.aws_availability_zones.availability.names

  private_subnets = var.private_subnet
  public_subnets  = var.public_subnet

  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = true

  tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
  }
  public_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/elb"               = 1
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"      = 1
  }
}

###############################################################
## EKS
###############################################################
module "eks" {
  source  = "terraform-aws-modules/eks/aws"

  cluster_name    = "eks-cluster"
  cluster_version = "1.26"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    node = { 
      min_size       = 1
      max_size       = 2
      desired_size   = 1
      instance_types = ["t2.micro"]
    }
  }
  tags = {
    Name        = "eks"
    Environment = "dev"
    Terraform   = "true"
  }
}