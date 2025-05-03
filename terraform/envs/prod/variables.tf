variable "aws_region" {
  description = "AWS region to deploy resources."
  type        = string
}

variable "state_bucket" {
  description = "S3 bucket for Terraform state."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances."
  type        = string
} 