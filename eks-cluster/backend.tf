terraform {
  backend "s3" {
    bucket = "eks-terraform-jenkins-backend"
    key    = "dev/eks-terraform.tfstate"
    region = "us-east-1"
  }
}