// Output the IDs of the standalone EC2 instances provisioned by the ec2_instances module
output "instance_ids" {
  description = "IDs of the EC2 instances. Useful for referencing or managing the instances."
  value       = module.ec2_instances.instance_ids
}

// Output the public IP addresses of the standalone EC2 instances
output "public_ips" {
  description = "Public IPs of the EC2 instances. Useful for SSH access or application endpoints."
  value       = module.ec2_instances.public_ips
}

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