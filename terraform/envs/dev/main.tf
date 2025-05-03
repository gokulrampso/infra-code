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

// This module provisions 3 standalone EC2 instances for general compute needs
module "ec2_instances" {
  source        = "../../modules/ec2_instances"
  instance_count = 3 // Number of EC2 instances
  instance_type  = var.instance_type // EC2 instance type
  ami_id         = var.ami_id // AMI ID to use for the instances
}

// This module provisions an EKS cluster (Kubernetes control plane),
// a managed node group with 2 EC2 worker nodes, and an Application Load Balancer (ELB)
module "eks" {
  source             = "../../modules/eks"
  cluster_name       = var.eks_cluster_name // Name of the EKS cluster
  cluster_role_arn   = var.eks_cluster_role_arn // IAM role ARN for EKS control plane
  node_role_arn      = var.eks_node_role_arn // IAM role ARN for worker nodes
  subnet_ids         = var.eks_subnet_ids // Subnets for EKS and ELB
  node_instance_type = var.eks_node_instance_type // Instance type for worker nodes
} 