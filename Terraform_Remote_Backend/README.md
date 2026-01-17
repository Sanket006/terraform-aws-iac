# Terraform Remote Backend README

This README provides guidance for using **Terraform Remote Backend** to manage state files remotely, ensuring safe collaboration and environment consistency.

---

## Description

A remote backend stores the **Terraform state file** outside of your local machine, typically in **AWS S3** along with a **DynamoDB table for state locking**. This setup enables multiple users to safely manage the same infrastructure.

### Features

* Centralized Terraform state management
* State locking to prevent concurrent modifications (using DynamoDB)
* Environment separation for dev, test, prod
* Supports S3 versioning

---

## Resources Created

* S3 bucket (for storing state files)
* DynamoDB table (for state locking)
* Terraform workspace configuration (optional)

---

## Backend Configuration Example

```hcl
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "project_name/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
```

### Notes

* `bucket` → Name of the S3 bucket storing state.
* `key` → Path in the bucket for this project’s state file.
* `dynamodb_table` → Table for state locking.
* `encrypt` → Enables server-side encryption on S3.

---

## Usage

```bash
cd Terraform_Remote_Backend
terraform init
terraform plan
terraform apply
```

### Architecture Diagram

```text
Terraform CLI
   |
   +--> Remote Backend (S3)
        |
        +--> Terraform State File
        +--> DynamoDB (State Locking)
```

---

## Best Practices

* Enable **versioning** on the S3 bucket.
* Enable **state locking** with DynamoDB.
* Separate **state files per environment** using folders or workspaces.
* Avoid storing sensitive data in the state file without encryption.


### Terraform Remote Backend

This folder demonstrates how to configure **remote state management**.

#### ☁️ Remote Backend Architecture

```
+-------------+
| Terraform   |
| CLI         |
+------+------+ 
       |
       v
+-------------+
| S3 Backend  |
| (State)    |
+------+------+ 
       |
       v
+-------------+
| DynamoDB   |
| Lock Table |
+-------------+
```

#### Backend Features

* S3 for state storage
* DynamoDB for state locking

#### Benefits

* Team collaboration
* State locking
* Secure state storage

---