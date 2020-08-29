variable "aws_region" {
	default = "us-west-1"
}

variable "vpc_cidr" {
	default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
	type = list(string)
	default = ["10.0.1.0/24", "10.0.2.0/24,"]
}

variable "private_subnets_cidr" {
    type = list(string)
    default = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
}

variable "azs" {
	type = list(string)
	default = ["us-west-1a", "us-west-1b"]
}