// Name of the EKS cluster
variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
}

// IAM role ARN for the EKS control plane
variable "cluster_role_arn" {
  description = "IAM role ARN for the EKS cluster."
  type        = string
}

// IAM role ARN for the EKS worker nodes
variable "node_role_arn" {
  description = "IAM role ARN for the EKS worker nodes."
  type        = string
}

// List of subnet IDs for EKS and ELB
variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster and load balancer."
  type        = list(string)
}

// EC2 instance type for EKS worker nodes
variable "node_instance_type" {
  description = "EC2 instance type for worker nodes."
  type        = string
} 