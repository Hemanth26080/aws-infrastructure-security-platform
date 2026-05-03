# AWS Infrastructure Security Platform

Enterprise-grade AWS infrastructure with security-first design using Terraform modules. Provides a complete multi-tier architecture with defense-in-depth controls.

## Architecture

This repository contains modular Terraform configurations for building a production-ready AWS environment:

- **00-vpc** - VPC with public/private subnets across multiple AZs
- **10-sg** - Security groups with least-privilege rules
- **20-bastion** - Bastion host for secure SSH access
- **21-vpn** - VPN configuration for private connectivity
- **30-sg_rules** - Additional security group rules
- **40-databases** - RDS instances with encryption
- **50-backend-alb** - Application Load Balancer for backend services
- **60-catalogue** - E-commerce catalogue service infrastructure
- **70-acm** - AWS Certificate Manager for TLS certificates
- **80-frontend-alb** - ALB for frontend applications
- **90-components** - Shared infrastructure components
- **91-cloudfront** - CDN distribution with WAF

## Tech Stack

- **Terraform** (HCL)
- **AWS** (VPC, EC2, RDS, ALB, ACM, CloudFront, Security Groups)

## Usage

Each directory contains independent Terraform modules that can be deployed in order:

```bash
# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Apply changes
terraform apply

# Destroy resources (when needed)
terraform destroy
```

## Security Features

- Bastion host for controlled SSH access
- Security groups with minimal open ports
- Database instances in private subnets
- Encrypted storage (RDS, EBS)
- TLS termination at ALB/CloudFront
- VPN option for private connectivity

## Prerequisites

- AWS account with appropriate permissions
- Terraform 1.x installed
- AWS CLI configured (`aws configure`)

## Notes

Resources are numbered to indicate deployment order. Start with `00-vpc` and proceed sequentially.

## License

MIT