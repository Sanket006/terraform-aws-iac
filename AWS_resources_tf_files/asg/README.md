## ASG Examples 

### Description

Contains Terraform scripts to provision **Auto Scaling Groups** with launch templates and scaling policies.

### Resources Created

* Auto Scaling Groups
* Launch Templates
* Scaling Policies

### Usage

```bash
cd AWS_resources_tf_files/asg
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
Launch Template -> Auto Scaling Group -> Scaling Policies
```

---