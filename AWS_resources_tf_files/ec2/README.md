## EC2 Examples 

### Description

Contains Terraform scripts to provision **EC2 instances** in AWS with configurable options like instance type, AMI, key pair, and security groups.

### Resources Created

* EC2 Instances
* Security Groups
* Key Pair Associations

### Usage

```bash
cd AWS_resources_tf_files/ec2
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
EC2 Instances + Security Groups + Key Pair
```

---