variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "public_subnet" {
  description = "Public Subnet CIDR"
  type        = list(string)
}

variable "instance_type" {
  description = "instace type for Jenkins server"
  type        = string
}

variable "ec2_key" {
  description = "Key for Jenkins server"
  type        = string
}