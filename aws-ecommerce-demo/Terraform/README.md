# Terraform

This folder contains a beginner-friendly Terraform configuration for provisioning a simple AWS environment.

## Resources

- VPC
- Public subnet
- Internet gateway
- Route table
- Security group
- EC2 instance

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## Notes

Replace the placeholder AMI ID in variables.tf with a valid Ubuntu AMI ID for your target region before deployment.
