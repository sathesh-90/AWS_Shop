variable "region" {
  description = "AWS region for deployment"
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "Ubuntu AMI ID for the EC2 instance"
  type        = string
  default     = "ami-xxxxxxxxxxxxxxxxx"
}

variable "instance_type" {
  description = "EC2 instance size"
  type        = string
  default     = "t2.micro"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}
