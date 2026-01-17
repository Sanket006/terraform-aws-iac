## Security Group Examples 

### Description

Provision **AWS Security Groups** with configurable ingress and egress rules.

### Resources Created

* Security Groups
* Ingress Rules
* Egress Rules

### Usage

```bash
cd AWS_resources_tf_files/sg
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
Security Group -> Ingress / Egress Rules -> Attach to EC2 or ALB
```

---