# OpenVPN Infrastructure on AWS with Terraform

This repository contains Terraform configurations to deploy OpenVPN servers on AWS across multiple regions (Canada and Ireland) with automated monthly switching using GitLab CI/CD.

## 📋 Table of Contents

- [Architecture Overview](#architecture-overview)
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Modules](#modules)
- [Setup Instructions](#setup-instructions)
- [Deployment](#deployment)
- [Monthly Switching](#monthly-switching)
- [GitLab CI/CD Pipeline](#gitlab-cicd-pipeline)
- [Cleanup](#cleanup)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## 🏗 Architecture Overview

┌─────────────────────────────────────────────────────────────┐
│ AWS Cloud │
│ ┌──────────────────────────────────────────────────────┐ │
│ │ VPC │ │
│ │ ┌──────────────┐ ┌──────────────┐ │ │
│ │ │ Public Subnet│ │Private Subnet│ │ │
│ │ │ (2 AZs) │ │ (2 AZs) │ │ │
│ │ └──────┬───────┘ └──────────────┘ │ │
│ │ │ │ │
│ │ ┌────▼────┐ │ │
│ │ │ OpenVPN │ │ │
│ │ │ EC2 │ │ │
│ │ │ + EIP │ │ │
│ │ └─────────┘ │ │
│ └──────────────────────────────────────────────────────┘ │
│ │
│ Security Group: │
│ - UDP 1194 (OpenVPN) │
│ - TCP 22 (SSH) │
│ - TCP 443 (Web UI) │
│ - TCP 80 (Redirect to HTTPS) │
└─────────────────────────────────────────────────────────────┘


## ✅ Prerequisites

- AWS Account with appropriate permissions
- GitLab CI/CD access
- Docker Hub account (for custom image)
- OpenVPN AMI subscription from AWS Marketplace

### Required Tools
- Terraform >= 1.15.0
- AWS CLI configured
- Git

## 📁 Project Structure

.
├── modules/ # Reusable Terraform modules
│ ├── ec2/ # EC2 instance with OpenVPN
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── security-group/ # Security group rules
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── vpc/ # VPC creation
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── subnet/ # Subnet creation (public/private)
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── internet-gateway/ # Internet Gateway
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── route-table/ # Route tables (public/private)
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── locations/ # Environment-specific configs
│ ├── canada/ # Canada region
│ │ ├── backend.tf # S3 backend config
│ │ └── terraform.tfvars # Canada-specific values
│ └── ireland/ # Ireland region
│ ├── backend.tf
│ └── terraform.tfvars
├── main.tf # Root module configuration
├── variables.tf # Root variables
├── outputs.tf # Root outputs
├── provider.tf # AWS provider config
└── .gitlab-ci.yml # CI/CD pipeline


## 🔧 Modules

| Module | Description | Key Features |
|--------|-------------|--------------|
| **VPC** | Creates Virtual Private Cloud | DNS support, hostnames enabled |
| **Subnet** | Creates public/private subnets | Multi-AZ, configurable IP assignment |
| **Internet Gateway** | Creates IGW for internet access | Single IGW per VPC |
| **Route Table** | Manages routing | Public route to IGW, private isolated |
| **Security Group** | Firewall rules | OpenVPN, SSH, HTTPS access |
| **EC2** | OpenVPN server instance | Optional EIP, custom AMI, user data |

## 🚀 Setup Instructions

### 1. Clone the Repository

git clone https://gitlab.com/your-repo/openvpn-terraform.git
cd openvpn-terraform

### 2. Configure AWS Credentials

export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
Or set in GitLab CI/CD variables.

### 3. Update AMI IDs
Get your OpenVPN AMI IDs from AWS Marketplace and update terraform.tfvars:

# For Canada
openvpn_ami_id = "ami-0a1b2c3d4e5f67890"

# For Ireland
openvpn_ami_id = "ami-0b2c3d4e5f67890a1"

### 4. Create Key Pairs

# For Canada
aws ec2 create-key-pair --region ca-central-1 --key-name EC2Acces-canada --query 'KeyMaterial' --output text > EC2Acces-canada.pem

chmod 400 EC2Acces-canada.pem

# For Ireland

aws ec2 create-key-pair --region eu-west-1 --key-name EC2Acces-ireland --query 'KeyMaterial' --output text > EC2Acces-ireland.pem

chmod 400 EC2Acces-ireland.pem

### 5. Create S3 Bucket for State

aws s3 mb s3://jasland-state-file --region us-east-1
aws s3api put-bucket-versioning --bucket jasland-state-file --versioning-configuration Status=Enabled
📦 Deployment
Deploy to Canada

cd locations/canada
terraform init
terraform plan
terraform apply -auto-approve
Deploy to Ireland

cd locations/ireland
terraform init
terraform plan
terraform apply -auto-approve
Verify Deployment

# Check outputs
terraform output

# Get OpenVPN connection info
terraform output openvpn_connection_info

# SSH to server
ssh -i EC2Acces-canada.pem ec2-user@$(terraform output -raw public_ip)
🔄 Monthly Switching
Manual Switch

# Destroy current environment
cd locations/canada
terraform destroy -auto-approve

# Deploy to new region
cd locations/ireland
terraform apply -auto-approve

## Automated (GitLab Schedule)
The pipeline can automatically switch based on month:

# Odd months → Canada

# Even months → Ireland

Configure schedule in GitLab → CI/CD → Schedules

### 🤖 GitLab CI/CD Pipeline
Pipeline Stages

stages:
  - build      # Build custom Docker image
  - plan       # Terraform plan
  - apply      # Terraform apply (manual)
  - destroy    # Terraform destroy (manual)

### GitLab Variables Required

| Variable|	Description|	Required|
|_|_|_|
|AWS_ACCESS_KEY_ID	|AWS access key|	✅|
|AWS_SECRET_ACCESS_KEY	|AWS secret key|	✅|
|DOCKER_HUB_USERNAME|	Docker Hub username|	For image build|
|DOCKER_HUB_PASSWORD|	Docker Hub token|	For image build|

### Pipeline Triggers

|Branch|	Action|
|_|_|
|canada|	Plan → Manual Apply → Manual Destroy|
|ireland	|Plan → Manual Apply → Manual Destroy|
|main|	Build Docker image (manual)|

### 🧹 Cleanup
Destroy Canada Infrastructure

cd locations/canada
terraform destroy -auto-approve
Destroy Ireland Infrastructure

cd locations/ireland
terraform destroy -auto-approve
Delete S3 State Bucket

aws s3 rm s3://jasland-state-file --recursive
aws s3 rb s3://jasland-state-file

### 🔍 Troubleshooting

## Common Issues

1. Terraform Init Failed
bash
Error: Failed to get existing workspaces
Solution: Check S3 bucket permissions and backend configuration.

2. AMI Not Found
bash
Error: creating EC2 instance: InvalidAMIID.NotFound
Solution: Verify AMI ID exists in the region and you have subscribed to it in AWS Marketplace.

3. Key Pair Not Found
bash
Error: InvalidKeyPair.NotFound
Solution: Create key pair in the specific region:

bash
aws ec2 create-key-pair --region ca-central-1 --key-name EC2Acces-canada
4. GitLab CI Pipeline Fails
bash
Error: Cannot locate backend config
Solution: Ensure backend.tf exists in location folders.

Debug Commands
bash
# Enable debug logging
export TF_LOG=DEBUG
terraform apply

# Check AWS resources
aws ec2 describe-instances --region ca-central-1
aws ec2 describe-vpcs --region ca-central-1

# Validate Terraform config
terraform validate
terraform fmt -recursive

