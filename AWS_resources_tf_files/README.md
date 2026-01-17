# AWS Resources – Terraform Examples

This directory contains Terraform configuration files for provisioning **core AWS resources**.

## 🧩 Architecture Diagram

```
+-------------------+
|   Terraform CLI   |
+---------+---------+
          |
          v
+-------------------+
|   AWS Provider    |
+---------+---------+
          |
          v
+-------------------+
| AWS Resources     |
|(EC2, SG, IAM, etc)|
+-------------------+
```

## What You’ll Learn

* Creating AWS resources using Terraform
* Understanding providers and resource blocks
* Managing infrastructure lifecycle

## Common Resources

* EC2 Instances
* Security Groups
* IAM Roles & Policies
* VPC / Subnets (if applicable)

## How to Use

```bash
terraform init
terraform plan
terraform apply
```

---