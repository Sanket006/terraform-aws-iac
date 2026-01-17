## 2️⃣ VPC Examples (AWS_resources_tf_files/vpc/README.md)

### Description

Contains Terraform scripts to provision **VPC, subnets, route tables, IGW, and security groups**.

### Resources Created

* VPC
* Public / Private Subnets
* Route Tables
* Internet Gateway
* Security Groups

### Usage

```bash
cd AWS_resources_tf_files/vpc
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
VPC -> Subnets -> Route Tables -> IGW -> Security Groups
```

---