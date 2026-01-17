# 📦 Terraform Modules

## 📌 Overview

This directory contains **reusable Terraform modules** that are used to provision and manage AWS infrastructure in a **modular, scalable, and maintainable** way.

Each module represents a **single responsibility** (for example: VPC, EC2, EKS, IAM) and can be reused across multiple environments such as **dev, test, and prod**.

This structure follows **industry-standard Infrastructure as Code (IaC) best practices**.

---

## 🧠 Why Use Terraform Modules?

Terraform modules help to:

- ♻️ Reuse infrastructure code
- 🧩 Maintain clean and readable Terraform projects
- 🔁 Avoid duplication
- 📈 Scale infrastructure efficiently
- 🛠 Manage changes safely

In real-world DevOps teams, **almost all Terraform code is written using modules**.

---

## 🧩 Module Architecture

```
Root Module
   |
   +--> EC2 Module
   |
   +--> VPC Module
   |
   +--> IAM Module
```

## Key Concepts

* Module structure (`main.tf`, `variables.tf`, `outputs.tf`)
* Passing input variables
* Reusing modules across environments

## Usage Example

```hcl
module "ec2" {
  source = "../Terraform-modules/ec2"
}
```

---