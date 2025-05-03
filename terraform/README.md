# Terraform

This directory contains Terraform infrastructure-as-code (IaC) modules and environment configurations for provisioning AWS resources required for the platform.

## What is created through Terraform?

- **EC2 Instances**: Standalone EC2 instances for general compute needs. The number, type, and AMI are configurable per environment.
- **EKS Cluster**: An AWS-managed Kubernetes control plane (master nodes) for running containerized workloads.
- **EKS Worker Nodes**: A managed node group with 2 EC2 instances that join the EKS cluster as worker nodes.
- **Application Load Balancer (ELB)**: An AWS Application Load Balancer for distributing traffic to services running in the EKS cluster.
- **Remote State Management**: Terraform state is stored securely in an S3 bucket, enabling team collaboration and state locking.

## Structure

- `modules/` - Reusable Terraform modules (e.g., EC2, EKS)
- `envs/` - Environment-specific configurations (e.g., `dev/`, `prod/`)
  - Each environment configures its own backend, variables, and uses the modules to provision resources.

## Prerequisites

Install the following CLI tools:

- [Terraform](https://www.terraform.io/downloads.html) (v1.0+)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) (v2+)
- [kubectl](https://kubernetes.io/docs/tasks/tools/) (for interacting with EKS)

### S3 Bucket and IAM Role for Terraform State

**Before running Terraform, you must create the S3 bucket for state storage and an IAM role or user with permissions to access it.**

#### Example: Create S3 Bucket and DynamoDB Table (for state locking)

```sh
aws s3api create-bucket --bucket my-terraform-state-bucket --region us-west-2
aws dynamodb create-table \
  --table-name terraform-lock-table \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
  --region us-west-2
```

#### Example: IAM Policy for Terraform State Access

Attach this policy to the IAM user or role used by Terraform:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket",
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      "Resource": [
        "arn:aws:s3:::my-terraform-state-bucket",
        "arn:aws:s3:::my-terraform-state-bucket/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "dynamodb:PutItem",
        "dynamodb:GetItem",
        "dynamodb:DeleteItem",
        "dynamodb:Scan",
        "dynamodb:Query",
        "dynamodb:UpdateItem"
      ],
      "Resource": "arn:aws:dynamodb:us-west-2:YOUR_ACCOUNT_ID:table/terraform-lock-table"
    }
  ]
}
```

## Setup Instructions

1. **Clone the repository and navigate to the desired environment directory:**
   ```sh
   cd terraform/envs/dev
   ```
2. **Copy the example tfvars file and fill in your values:**
   ```sh
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars to provide your AWS region, S3 bucket, AMI, subnet IDs, and IAM role ARNs
   ```
3. **Configure your AWS credentials:**
   ```sh
   aws configure
   ```
4. **Initialize Terraform:**
   ```sh
   terraform init
   ```
5. **Review the planned changes:**
   ```sh
   terraform plan
   ```
6. **Apply the configuration:**
   ```sh
   terraform apply
   ```
7. **(Optional) Configure kubectl for EKS access:**
   ```sh
   aws eks --region <your-region> update-kubeconfig --name <your-eks-cluster-name>
   kubectl get nodes
   ```

## Variable Management

- All required variables are documented in `variables.tf` and an example is provided in `terraform.tfvars.example`.
- Always keep sensitive values (like AWS credentials) out of version control.

See the comments in each file for detailed explanations of each resource and variable.
