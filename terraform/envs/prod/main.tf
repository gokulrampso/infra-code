terraform {
  backend "s3" {
    bucket = var.state_bucket
    key    = "prod/terraform.tfstate"
    region = var.aws_region
  }
}

provider "aws" {
  region = var.aws_region
}

module "ec2_instances" {
  source        = "../../modules/ec2_instances"
  instance_count = 3
  instance_type  = var.instance_type
  ami_id         = var.ami_id
} 