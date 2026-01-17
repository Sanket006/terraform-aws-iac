# 🌐 VPC Terraform Module

## 📌 Overview
This Terraform module creates a **Virtual Private Cloud (VPC)** on AWS with networking components required for secure and scalable infrastructure.

It is designed to be **reusable, configurable, and production-ready**.

---

## Architecture Diagram

```text
Root Module
   |
   +--> VPC Module
      |
      +--> Subnets
      +--> Route Tables
      +--> Internet Gateway
      +--> Security Groups
```

---

## 🧠 What This Module Creates
- VPC
- Public & Private Subnets
- Internet Gateway
- Route Tables & Associations
- Optional NAT Gateway

---

## 🛠 Tech Stack
- Terraform
- AWS VPC
- HCL

---

## 📥 Inputs

| Variable | Description |
|--------|-------------|
| `vpc_cidr` | CIDR block for the VPC |
| `public_subnets` | List of public subnet CIDRs |
| `private_subnets` | List of private subnet CIDRs |
| `region` | AWS region |

---

## 📤 Outputs

| Output | Description |
|------|-------------|
| `vpc_id` | ID of the VPC |
| `public_subnet_ids` | Public subnet IDs |
| `private_subnet_ids` | Private subnet IDs |

---

## 🚀 Usage Example

```hcl
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr       = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24"]
  private_subnets = ["10.0.2.0/24"]
}
```

---

## 🏗️ Real-World Use Case

Used as the network foundation for EC2, EKS, RDS, and Load Balancers in production environments.