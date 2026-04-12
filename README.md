# AWS Infrastructure Lab: VPC & EC2 Deployment

A collection of AWS cloud infrastructure labs and projects.

## Project Overview
This project demonstrates the deployment of a foundational AWS networking environment and compute instance using Infrastructure as Code (IaC). It serves as a professional-grade template for building scalable and secure cloud environments.

## Technical Stack
* **Cloud Provider:** AWS
* **Infrastructure as Code:** Terraform
* **Authentication:** SSH Key-Pair
* **Version Control:** GitHub

## Architecture Details
* **Custom VPC:** Isolated network environment.
* **Public Subnet:** Hosted within the VPC for external access.
* **Internet Gateway:** Enables communication between the VPC and the internet.
* **Security Groups:** Configured for SSH access (Port 22).
* **EC2 Instance:** Amazon Linux 2 t2.micro instance.

## Workflow & Migration
This project represents a complete migration of infrastructure code into a modular sub-directory structure to support a multi-lab portfolio.

## How to Deploy
1. **Initialize:** `terraform init`
2. **Plan:** `terraform plan`
3. **Apply:** `terraform apply`
4. **Destroy:** `terraform destroy`
