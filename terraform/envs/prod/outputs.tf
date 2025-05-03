# Outputs for EKS resources from the eks module
output "eks_cluster_name" {
  description = "Name of the EKS cluster."
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "API endpoint of the EKS cluster."
  value       = module.eks.cluster_endpoint
}

output "eks_node_group_name" {
  description = "Name of the EKS node group."
  value       = module.eks.node_group_name
}

output "eks_elb_dns_name" {
  description = "DNS name of the Application Load Balancer (ELB) for EKS."
  value       = module.eks.elb_dns_name
} 