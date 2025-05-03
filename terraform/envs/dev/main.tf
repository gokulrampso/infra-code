// Configure Terraform to use S3 as the backend for storing state files securely and remotely
terraform {
  backend "s3" {
    bucket = var.state_bucket // S3 bucket name for state
    key    = "dev/terraform.tfstate" // Path to state file in the bucket
    region = var.aws_region // AWS region for the S3 bucket
  }
}

// Configure the AWS provider to interact with AWS resources in the specified region
provider "aws" {
  region = var.aws_region
}

// This module provisions an EKS cluster (Kubernetes control plane),
// a managed node group with 3 EC2 worker nodes, and an Application Load Balancer (ELB)
module "eks" {
  source             = "../../modules/eks"
  cluster_name       = var.eks_cluster_name // Name of the EKS cluster
  cluster_role_arn   = var.eks_cluster_role_arn // IAM role ARN for EKS control plane
  node_role_arn      = var.eks_node_role_arn // IAM role ARN for worker nodes
  subnet_ids         = var.eks_subnet_ids // Subnets for EKS and ELB
  node_instance_type = var.eks_node_instance_type // Instance type for worker nodes
  node_count         = 3 // Number of worker nodes
} 