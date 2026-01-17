## S3 Examples 

### Description

Contains Terraform scripts to provision **S3 buckets** with versioning, encryption, and lifecycle rules.

### Resources Created

* S3 Buckets
* Versioning
* Encryption Settings

### Usage

```bash
cd AWS_resources_tf_files/s3
terraform init
terraform plan
terraform apply
```

### Architecture Diagram

```text
Terraform CLI
   |
   v
AWS Provider
   |
   v
S3 Bucket + Versioning + Encryption
```

---
