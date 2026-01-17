# Multi-Environment Terraform Setup

This folder shows how to manage **multiple environments** like `dev`, `test`, and `prod`.

## 🏗️ Environment Architecture

```
        Shared Modules
              |
   --------------------------
   |            |           |
  DEV          TEST        PROD
```

## Approaches Used

* Separate directories per environment
* Shared modules
* Environment-specific variables

## Benefits

* Environment isolation
* Safer deployments
* Scalable infrastructure management

---

## 1️⃣ Dev Environment 

### Description

Terraform scripts for deploying infrastructure in the **development environment**.

### Resources

* EC2 instances
* VPC, subnets
* Security groups
* S3 buckets (if applicable)
* IAM roles

### Usage

```bash
cd Terraform_Multi_Env
terraform init
terraform plan -var-file=env/dev.tfvars
terraform apply -var-file=env/dev.tfvars
```

### Architecture Diagram

```text
Shared Modules
      |
      v
Dev Environment
   |
   +--> VPC
   +--> EC2 Instances
   +--> Security Groups
   +--> S3 / IAM Resources
```

---

## 2️⃣ Test Environment 

### Description

Terraform scripts for deploying infrastructure in the **testing environment**.

### Resources

* EC2 instances
* VPC, subnets
* Security groups
* S3 buckets (if applicable)
* IAM roles

### Usage

```bash
cd Terraform_Multi_Env
terraform init
terraform plan -var-file=env/test.tfvars
terraform apply -var-file=env/test.tfvars
```

### Architecture Diagram

```text
Shared Modules
      |
      v
Test Environment
   |
   +--> VPC
   +--> EC2 Instances
   +--> Security Groups
   +--> S3 / IAM Resources
```

---

## 3️⃣ Prod Environment 

### Description

Terraform scripts for deploying infrastructure in the **production environment**.

### Resources

* EC2 instances
* VPC, subnets
* Security groups
* S3 buckets (if applicable)
* IAM roles
* ALB + ASG (if applicable)

### Usage

```bash
cd Terraform_Multi_Env
terraform init
terraform plan -var-file=env/prod.tfvars
terraform apply -var-file=env/prod.tfvars
```

### Architecture Diagram

```text
Shared Modules
      |
      v
Prod Environment
   |
   +--> VPC
   +--> EC2 Instances
   +--> Security Groups
   +--> S3 / IAM / ALB / ASG
```

---

## Notes

* Each environment uses **shared modules** from `Terraform-modules` to maintain consistency.
* Environment-specific variables are managed in `*.tfvars` files.
* Supports safe isolation between environments.
