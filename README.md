# Terraform AWS Load Balanced Application

This project provisions a complete AWS infrastructure using Terraform, including:
- A VPC with public subnets
- Security groups
- EC2 instances
- An Application Load Balancer (ALB)
- S3 bucket for remote state backend

## Project Structure

```
project-1/
├── main.tf
├── variables.tf
├── output.tf
├── provider.tf
├── modules/
│   ├── vpc/
│   ├── ec2/
│   ├── alb/
│   └── s3-backend/
```

## Features

- **VPC Module:** Creates a VPC, two public subnets, an internet gateway, route tables, and a security group.
- **EC2 Module:** Launches two EC2 instances in separate subnets.
- **ALB Module:** Deploys an Application Load Balancer, target group, listener, and attaches EC2 instances.
- **S3 Backend:** Stores Terraform state remotely in an S3 bucket with DynamoDB for state locking.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.0 or later
- AWS CLI configured with appropriate credentials
- An existing S3 bucket and DynamoDB table for remote backend (created by this project)

## Usage

1. **Clone the repository:**
   ```sh
   git clone <repo-url>
   cd project-1
   ```

2. **Initialize Terraform:**
   ```sh
   terraform init
   ```

3. **Set required variables:**
   - Edit `terraform.tfvars` or provide variables via CLI.

4. **Apply the configuration:**
   ```sh
   terraform apply
   ```

5. **Enable Remote Backend:**
   - After the S3 bucket is created, uncomment the `backend "s3"` block in `provider.tf` and run:
     ```sh
     terraform init
     ```
   - Approve the migration to remote state.

## Variables

See `variables.tf` for all configurable options, including:
- VPC and subnet CIDR blocks
- Availability zones
- EC2 AMI and instance type
- ALB and target group settings
- S3 bucket configuration

## Outputs

After apply, Terraform will output:
- Public IPs of both EC2 instances
- S3 bucket name
- VPC ID
- ALB DNS name

## Notes

- The security group allows SSH from a specific IP and HTTP from anywhere.
- The ALB forwards HTTP traffic to both EC2 instances.
- Remote state is managed in S3 with DynamoDB for locking.

## Clean Up

To destroy all resources:
```sh
terraform destroy
```

---

**Author:**  
Brahati