## EKS Examples 

### Description

Contains Terraform scripts to provision **EKS clusters** with worker nodes, security groups, and networking.

### Resources Created

* EKS Cluster
* Worker Nodes
* Security Groups
* Subnets

### Usage

```bash
cd AWS_resources_tf_files/eks
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
EKS Cluster -> Worker Nodes -> Security Groups -> Subnets
```

---