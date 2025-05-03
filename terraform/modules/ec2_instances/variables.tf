// Number of EC2 instances to create
variable "instance_count" {
  description = "Number of EC2 instances to create."
  type        = number
}

// EC2 instance type for the worker nodes
variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

// AMI ID to use for the EC2 instances
variable "ami_id" {
  description = "AMI ID for EC2 instances."
  type        = string
} 