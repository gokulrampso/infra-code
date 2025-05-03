// Output the IDs of all EC2 instances created by this module
output "instance_ids" {
  value = [for i in aws_instance.this : i.id]
}

// Output the public IP addresses of all EC2 instances created by this module
output "public_ips" {
  value = [for i in aws_instance.this : i.public_ip]
} 