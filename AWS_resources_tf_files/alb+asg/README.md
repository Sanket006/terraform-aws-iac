## ALB + ASG Examples 

### Description

Provision an **Application Load Balancer** and **Auto Scaling Group** together to handle traffic scaling.

### Resources Created

* ALB
* Listeners
* Target Groups
* Security Groups
* Auto Scaling Group
* Launch Template / Configuration
* Scaling Policies

### Usage

```bash
cd AWS_resources_tf_files/alb_asg
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
ALB -> Listeners -> Target Groups -> Security Groups -> ASG -> EC2 Instances
```

---