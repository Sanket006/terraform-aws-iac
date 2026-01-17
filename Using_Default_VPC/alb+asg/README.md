## 2️⃣ ALB + ASG 

### Description

Provision an **ALB** with **Auto Scaling Group (ASG)** in the default VPC.

### Resources Created

* ALB
* Listener
* Target Group
* Security Groups
* ASG
* Launch Template / Configuration

### Usage

```bash
cd Using_Default_VPC/alb_asg
terraform init
terraform plan
terraform apply
```

### Architecture Diagram

```text
Terraform CLI
   |
   +--> AWS Default VPC
        |
        +--> ALB -> Listener -> Target Group -> ASG -> EC2 Instances
```

---