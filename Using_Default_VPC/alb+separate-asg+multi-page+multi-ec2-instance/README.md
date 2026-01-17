## 6️⃣ ALB + Separate ASG + Multi-Page + Multi-EC2 Instance

### Description

Deploy **ALB** with **separate ASGs** per page, each managing multiple EC2 instances for high isolation and scaling.

### Resources Created

* ALB
* Listeners/Rules per page
* Target Groups per page
* Security Groups
* Separate ASGs per page
* EC2 instances per ASG

### Usage

```bash
cd Using_Default_VPC/alb_separate_asg_multi_page_multi_instance
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
             +--> Listener/Rule Page 1 -> Target Group -> ASG 1 -> EC2 Instances
             +--> Listener/Rule Page 2 -> Target Group -> ASG 2 -> EC2 Instances
```

---