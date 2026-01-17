## IAM Examples 

### Description

Contains Terraform scripts to provision **IAM roles, policies, and users**.

### Resources Created

* IAM Roles
* IAM Policies
* IAM Users

### Usage

```bash
cd AWS_resources_tf_files/iam
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
IAM Roles + IAM Policies + IAM Users
```

---
