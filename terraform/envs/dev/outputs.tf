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