# 🪣 S3 Terraform Module

## 📌 Overview
This module creates **Amazon S3 buckets** with optional versioning and encryption.

---

### Architecture Diagram

```text
Root Module
   |
   +--> S3 Module
      |
      +--> S3 Bucket
      +--> Versioning
      +--> Encryption
```

---

## 🧠 What This Module Creates
- S3 Bucket
- Versioning
- Encryption
- Public access block

---

## 🛠 Tech Stack
- Terraform
- AWS S3

---

## 📥 Inputs

| Variable | Description |
|--------|-------------|
| `bucket_name` | Name of the bucket |
| `versioning` | Enable versioning |
| `encryption` | Enable AES256/KMS encryption |
| `environment` | Environment tag |

---

## 📤 Outputs

| Output | Description |
|------|-------------|
| `bucket_name` | S3 bucket name |
| `bucket_id` | S3 bucket ID  |
| `bucket_arn` | S3 bucket ARN |

---

## 🚀 Usage Example

```hcl
module "s3" {
  source      = "./modules/s3"
  bucket_name = "my-terraform-bucket"
}
```

---

## 🏗️ Real-World Use Case

Used for Terraform remote state, backups, logs, artifacts.