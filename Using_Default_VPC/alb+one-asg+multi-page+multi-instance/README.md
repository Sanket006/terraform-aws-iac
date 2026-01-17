## 5️⃣ ALB + One ASG + Multi-Page + Multi-Instance 

### Description

Deploy **ALB** with a **single ASG** managing multiple **pages** and multiple **instances per page**.

### Resources Created

* ALB
* Listeners/Rules per page
* Target Groups per page
* Security Groups
* Single ASG handling all instances
* EC2 instances per page

### Usage

```bash
cd Using_Default_VPC/alb_one_asg_multi_page_multi_instance
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
             +--> Listener/Rule Page 1 -> Target Group -> Single ASG -> EC2 Instances
             +--> Listener/Rule Page 2 -> Target Group -> Single ASG -> EC2 Instances
```

---