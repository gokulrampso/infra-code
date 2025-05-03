// Output the EKS cluster name for reference
output "cluster_name" {
  value = aws_eks_cluster.this.name
}

// Output the EKS cluster API endpoint, needed for kubectl and cluster access
output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

// Output the name of the EKS node group
output "node_group_name" {
  value = aws_eks_node_group.this.node_group_name
}

// Output the DNS name of the Application Load Balancer (ELB) for accessing services
output "elb_dns_name" {
  value = aws_lb.this.dns_name
} 