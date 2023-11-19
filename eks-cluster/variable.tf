variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "public_subnet" {
  description = "Public Subnet CIDR"
  type        = list(string)
}

variable "private_subnet" {
  description = "Private Subnet CIDR"
  type        = list(string)
}