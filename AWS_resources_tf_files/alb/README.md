## ALB Examples 

### Description

Contains Terraform scripts to provision **Application Load Balancers** with listeners and target groups.

### Resources Created

* ALB
* Listeners
* Target Groups
* Security Groups

### Usage

```bash
cd AWS_resources_tf_files/alb
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
ALB -> Listeners -> Target Groups -> Security Groups
```

---