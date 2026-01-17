## VPC + SG + EC2 Examples 

### Description

Provision a **VPC with subnets**, **security groups**, and **EC2 instances** deployed inside the VPC.

### Resources Created

* VPC
* Public / Private Subnets
* Security Groups
* EC2 Instances
* Route Tables / IGW

### Usage

```bash
cd AWS_resources_tf_files/vpc_sg_ec2
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
VPC -> Subnets -> Security Groups -> EC2 Instances
```

---