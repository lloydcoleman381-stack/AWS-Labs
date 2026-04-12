# AWS Infrastructure Lab: VPC & EC2 Deployment

**Project Overview:** A hands-on Infrastructure as Code (IaC) project demonstrating the automated deployment of a secure, public-facing AWS environment. This lab focuses on network architecture, security hardening, and version-controlled infrastructure management.

### Tech Stack
* **Infrastructure:** AWS (VPC, EC2, IGW, Route Tables)
* **IaC Tool:** Terraform
* **Configuration:** SSH Key-Pair Authentication, Security Groups
* **Version Control:** GitHub (Migrated from GitLab with full Git history)

### Architecture
The Terraform configuration provisions:
* **VPC:** Custom 10.0.0.0/16 Virtual Private Cloud.
* **Public Subnet:** 10.0.1.0/24 subnet with Auto-assign Public IP enabled.
* **Internet Gateway:** Provides external access for the public subnet.
* **Security Group:** Strict Ingress rules allowing SSH access (Port 22) only from a specific authorized IP address.
* **EC2 Instance:** T3.micro instance running Amazon Linux 2023, bootstrapped with a custom SSH key.

### Migration & Workflow
This repository represents a successful migration from a legacy environment to GitHub.
1. **Code Refactoring:** Updated Terraform configurations for modularity.
2. **State Management:** Successfully migrated the Terraform state and initialized the environment in a new directory structure.
3. **Deployment:** Verified deployment via `terraform plan` and `apply`, followed by successful remote SSH authentication.

### How to Use
1. Initialize the provider: `terraform init`
2. Review the execution plan: `terraform plan`
3. Deploy the stack: `terraform apply`
4. Destroy resources: `terraform destroy`
