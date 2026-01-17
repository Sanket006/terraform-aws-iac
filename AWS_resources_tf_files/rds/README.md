## RDS Examples 

### Description

Contains Terraform scripts to provision **RDS databases** (MySQL/Postgres).

### Resources Created

* RDS Instances
* Subnet Groups
* Security Groups

### Usage

```bash
cd AWS_resources_tf_files/rds
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
RDS Instance + Subnet Group + Security Group
```

---