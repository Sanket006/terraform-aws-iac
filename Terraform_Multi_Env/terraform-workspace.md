# Terraform Workspaces – Multi-Environment Setup

This repository demonstrates how to use **Terraform Workspaces** to manage **multiple environments** (`dev`, `test`, `prod`) using the **same Terraform configuration**.

Terraform workspaces allow you to maintain separate **state files** for each environment while reusing infrastructure code efficiently.

The setup is designed to follow a **simple, real-world Terraform repository structure** commonly used by DevOps engineers.
---

## 📌 What Are Terraform Workspaces?

Terraform workspaces enable you to:

* Use **one codebase** for multiple environments
* Maintain **separate state files** per environment
* Reduce code duplication
* Safely manage environment-specific infrastructure

Each workspace has its **own state**, but shares the same `.tf` files.

---

## 🌍 Environments Using Terraform Workspaces

| Workspace | Environment     |
| --------- | --------------- |
| default   | Local / Testing |
| dev       | Development     |
| test      | Staging         |
| prod      | Production      |

Each workspace maintains its **own Terraform state** while reusing the same configuration files.
---

## ⚙️ How Workspaces Are Used in This Repo

Terraform exposes the active workspace via:

```
terraform.workspace
```

This value is used to:

* Control resource sizing
* Apply environment-specific values
* Uniquely name resources per environment

---

## 🧠 Example Configuration (main.tf)

```hcl
resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = lookup(var.instance_type, terraform.workspace)

  tags = {
    Name        = "app-${terraform.workspace}"
    Environment = terraform.workspace
  }
}
```

---

## 🧩 variables.tf

```hcl
variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type per environment"
  type        = map(string)
  default = {
    dev     = "t2.micro"
    test = "t2.small"
    prod    = "t2.medium"
  }
}
```

---

## 📦 terraform.tfvars

```hcl
ami_id = "ami-xxxxxxxx"
```

This file provides **common values** shared across environments.

---

## 🚀 Terraform Workflow (Per Environment)

### Initialize Terraform

```bash
terraform init
```

### Create Workspaces

```bash
terraform workspace new dev
terraform workspace new test
terraform workspace new prod
```

### Switch Workspace

```bash
terraform workspace select dev
```

### Verify Workspace

```bash
terraform workspace show
```

---

## 🔄 Plan & Apply

```bash
terraform plan
terraform apply
```

Terraform automatically uses the **state file** associated with the selected workspace.

---

## 📁 State File Layout (Local Backend)

```
terraform.tfstate.d/
├── dev/terraform.tfstate
├── test/terraform.tfstate
├── prod/terraform.tfstate
```

---

## ☁️ Remote Backend (S3) – Optional

```hcl
terraform {
  backend "s3" {
    bucket = "my-terraform-states"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
```

Terraform automatically stores states as:

```
env:/dev/terraform.tfstate
env:/test/terraform.tfstate
env:/prod/terraform.tfstate
```

---

## ⚠️ Best Practices Followed

✔ Same infra, multiple environments
✔ Environment-aware naming
✔ Workspace validation before apply
✔ Ready for S3 + DynamoDB locking
✔ Clean, minimal repo structure

---

## ❌ When NOT to Use Workspaces

Avoid workspaces if:

* Environments differ significantly
* Strict isolation is required
* Multiple teams manage environments

Use **separate directories or repositories** instead.

---

## 🎯 Summary

This repository demonstrates:

* A **production-style Terraform structure**
* Safe **multi-environment deployments**
* Clean state separation using workspaces

Ideal for **learning, interviews, and real-world DevOps usage**.

---

Happy Terraforming 🚀
