## 3️⃣ ALB + Multi-Page + Multi-Instance 

### Description

Deploy **ALB** routing traffic to multiple **pages/applications** across multiple EC2 instances.

### Resources Created

* ALB
* Multiple Listeners/Rules
* Target Groups per page
* Security Groups
* ASGs per page
* EC2 instances per ASG

### Usage

```bash
cd Using_Default_VPC/alb_multi_page_multi_instance
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
             +--> Listener/Rule for Page 1 -> Target Group -> ASG -> EC2 Instances
             +--> Listener/Rule for Page 2 -> Target Group -> ASG -> EC2 Instances
```

---