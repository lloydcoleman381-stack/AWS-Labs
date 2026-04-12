# AWS Infrastructure & Security Automation Portfolio

A collection of professional-grade AWS laboratories demonstrating Infrastructure as Code (IaC), automated security auditing, and event-driven architecture.

## 🛠 Project Overview
This repository serves as a centralized hub for various AWS cloud engineering projects. Each lab is isolated into a modular sub-directory, mimicking real-world production environments where networking, compute, and storage are managed via Terraform.

## 📂 Featured Laboratories

### 1. VPC & EC2 Deployment (Networking & Compute)
* **Goal:** Deployment of a custom, secure VPC environment.
* **Architecture:** Includes a public subnet, Internet Gateway (IGW), and Security Groups configured for least-privilege SSH access.
* **IaC:** Full lifecycle management (Init, Plan, Apply) using Terraform.

### 2. S3 Security Auditor (Security & Automation)
* **Goal:** Automated monitoring of S3 bucket security posture.
* **Logic:** Uses **S3 Event Notifications** to trigger **AWS Lambda** (Python/Boto3) for real-time inspection of object encryption and bucket ACLs.
* **IAM Strategy:** Implements granular execution roles and bucket policies to enforce encryption-at-rest.

### 3. Serverless Lambda Workflows (Automation)
* **Goal:** Event-driven infrastructure management.
* **Focus:** Automating routine administrative tasks (e.g., automated snapshots or cost-optimization) using EventBridge and Lambda functions.

## 💻 Technical Stack
* **Cloud Provider:** AWS
* **Infrastructure as Code:** Terraform
* **Programming:** Python (Boto3)
* **Security:** IAM Policy Engineering, SSH Key-Pair Authentication
* **CI/CD:** GitHub Version Control

## 🚀 Deployment Instructions
Each lab is a self-contained module. Navigate to the specific directory to deploy:

1. `terraform init` — Initialize provider and backend.
2. `terraform plan` — Preview infrastructure changes.
3. `terraform apply` — Execute the deployment.
4. `terraform destroy` — Clean up resources to prevent cost leakage.
