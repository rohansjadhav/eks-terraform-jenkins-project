terraform {
  backend "s3" {
    bucket = "eks-terraform-jenkins-backend"
    key    = "dev/jenkins-terraform.tfstate"
    region = "us-east-1"
  }
}