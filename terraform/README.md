# AWS EKS + Lambda Infrastructure with Terraform

This Terraform setup provisions a hybrid cloud architecture on AWS that includes both **Elastic Kubernetes Service (EKS)** for container workloads and **AWS Lambda** for serverless execution. It uses **S3** as a backend for state management and **DynamoDB** for state locking to ensure reliable collaboration and safety.

---

## 🔧 Features

- **Custom VPC** with public and private subnets
- **EKS Cluster** with managed node groups (Amazon Linux 2 AMIs)
- **Application Load Balancer (ALB)** for public traffic ingress
- **Lambda Function** (Python 3.11) with VPC access
- **API Gateway (HTTP)** connected to Lambda
- **IAM Roles & Policies** for secure role assumption
- **Remote Backend Configuration** using S3 and DynamoDB

---

## 📋 Prerequisites

Before executing this Terraform setup, ensure you have the following:

- Terraform v1.6+
- Python 3.11 (for Lambda ZIP packaging)
- AWS CLI configured or environment variables exported:
  ```bash
  export AWS_ACCESS_KEY_ID=your_access_key
  export AWS_SECRET_ACCESS_KEY=your_secret_key
  export AWS_SESSION_TOKEN=your_session_token  # if using temporary credentials
  export AWS_REGION=us-west-2
  ```
- IAM user/role with the following permissions:
  - `AmazonEKSFullAccess`
  - `AmazonVPCFullAccess`
  - `AmazonEC2FullAccess`
  - `IAMFullAccess`
  - `AmazonS3FullAccess`
  - `AWSLambda_FullAccess`
  - `AmazonAPIGatewayAdministrator`

---

## 📁 Directory Structure

```
.
├── main.tf                  # Core infrastructure resources
├── backend.tf               # Remote backend (S3 + DynamoDB)
├── variables.tf             # Input variables
├── outputs.tf               # Output values
├── lambda/                 
│   └── index.py             # Lambda handler function
├── lambda.zip               # Zipped Lambda code (for deployment)
└── README.md                # This file
```

---

## ⚙️ Backend Configuration

Ensure you have the S3 bucket and DynamoDB table created in `us-west-2` before running `terraform init`.

Example backend config in `backend.tf`:
```hcl
terraform {
  backend "s3" {
    bucket         = "bucket_name"
    key            = "particle/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "Table_name"
    encrypt        = true
  }
}
```

---

## 🚀 How to Deploy

1. **Clone the repository**
   ```bash
   git clone https://github.com/krishna120801/Particle41_SimpleTimeService
   cd Particle41_SimpleTimeService/terraform
   ```

3. **Initialize Terraform**
   ```bash
   terraform init
   ```

4. **Review the execution plan**
   ```bash
   terraform plan
   ```

5. **Apply the infrastructure**
   ```bash
   terraform apply
   ```

---

## Outputs

After deployment, Terraform will output:

- EKS cluster configurations and attached resources details like kms, role etc.
- ALB Details like target groups etc.
- Lambda function configuration
- API Gateway endpoint details and resources.

These can be used to integrate services.

---

## Cleanup

To destroy the provisioned infrastructure:
```bash
terraform destroy
```

---

## Notes

- All resources are provisioned in the `us-west-2` region by default.
- Lambda is placed inside private subnets and triggered via API Gateway.
- EKS worker nodes are launched in private subnets with outbound internet access via NAT Gateway.

---
