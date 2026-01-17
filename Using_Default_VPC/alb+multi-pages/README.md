## 4️⃣ ALB + Multi-Pages

### Description

Deploy **ALB** with multiple **pages/applications**, single instance per page in the default VPC.

### Resources Created

* ALB
* Multiple Listeners/Rules
* Target Groups per page
* Security Groups
* EC2 instances per page

### Usage

```bash
cd Using_Default_VPC/alb_multi_pages
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
             +--> Listener/Rule for Page 1 -> Target Group -> EC2 Instance
             +--> Listener/Rule for Page 2 -> Target Group -> EC2 Instance
```

---
