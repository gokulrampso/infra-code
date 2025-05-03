// This resource provisions the EKS control plane (Kubernetes master nodes managed by AWS)
resource "aws_eks_cluster" "this" {
  name     = var.cluster_name // Name of the EKS cluster
  role_arn = var.cluster_role_arn // IAM role for EKS control plane

  vpc_config {
    subnet_ids = var.subnet_ids // Subnets for EKS networking
  }
}

// This resource provisions a managed node group with a configurable number of EC2 worker nodes for the EKS cluster
resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name // Attach to the above EKS cluster
  node_group_name = "worker-group" // Name of the node group
  node_role_arn   = var.node_role_arn // IAM role for worker nodes
  subnet_ids      = var.subnet_ids // Subnets for worker nodes

  scaling_config {
    desired_size = var.node_count // Desired number of worker nodes
    max_size     = var.node_count // Maximum number of worker nodes
    min_size     = var.node_count // Minimum number of worker nodes
  }

  instance_types = [var.node_instance_type] // EC2 instance type for worker nodes
}

// This resource provisions an Application Load Balancer (ELB) for the EKS cluster
resource "aws_lb" "this" {
  name               = "eks-lb" // Name of the load balancer
  internal           = false // Public-facing load balancer
  load_balancer_type = "application" // Application Load Balancer
  subnets            = var.subnet_ids // Subnets for the load balancer
} 