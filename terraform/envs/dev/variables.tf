// AWS region to deploy resources
variable "aws_region" {
  description = "AWS region to deploy resources."
  type        = string
}

// S3 bucket for storing Terraform state
variable "state_bucket" {
  description = "S3 bucket for Terraform state."
  type        = string
}

// EC2 instance type for standalone EC2 instances
variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

// AMI ID for EC2 instances
variable "ami_id" {
  description = "AMI ID for EC2 instances."
  type        = string
}

// Name of the EKS cluster
variable "eks_cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
}

// IAM role ARN for the EKS control plane
variable "eks_cluster_role_arn" {
  description = "IAM role ARN for the EKS cluster."
  type        = string
}

// IAM role ARN for the EKS worker nodes
variable "eks_node_role_arn" {
  description = "IAM role ARN for the EKS worker nodes."
  type        = string
}

// List of subnet IDs for EKS and ELB
variable "eks_subnet_ids" {
  description = "List of subnet IDs for the EKS cluster and load balancer."
  type        = list(string)
}

// EC2 instance type for EKS worker nodes
variable "eks_node_instance_type" {
  description = "EC2 instance type for worker nodes."
  type        = string
  default     = "t3.medium"
} 