// This resource provisions the specified number of EC2 instances using the provided AMI and instance type
resource "aws_instance" "this" {
  count         = var.instance_count // Number of instances to create
  ami           = var.ami_id // AMI ID to use for the instances
  instance_type = var.instance_type // EC2 instance type

  tags = {
    Name = "ec2-instance-${count.index + 1}" // Tag each instance with a unique name
  }
} 