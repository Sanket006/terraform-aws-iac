## 1️⃣ ALB Only 

### Description

Provision an **Application Load Balancer (ALB)** in the default VPC without any auto scaling or backend instances.

### Resources Created

* ALB
* Listener
* Target groups (optional)
* Security group

### Usage

```bash
cd Using_Default_VPC/alb
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
        +--> ALB
             +--> Listener
             +--> Target Group (optional)
```

---