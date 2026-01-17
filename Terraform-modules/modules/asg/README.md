# 📈 Auto Scaling Group Terraform Module

## 📌 Overview
This module provisions an **Auto Scaling Group (ASG)** to automatically scale EC2 instances based on demand.

---

## Architecture Diagram

```text
Root Module
   |
   +--> ASG Module
      |
      +--> Launch Template
      +--> Auto Scaling Group
      +--> Scaling Policies
```

---

## 🧠 What This Module Creates
- Launch Template
- Auto Scaling Group
- Scaling Policies

---

## 🛠 Tech Stack
- Terraform
- AWS Auto Scaling
- EC2

---

## 📥 Inputs

| Variable | Description |
|--------|-------------|
| `asg_name` | ASG name |
| `launch_template_id` | Launch template ID |
| `desired_capacity` | Desired instance count |
| `min_size` | Minimum instances |
| `max_size` | Minimum instances |
| `subnet_ids` | Subnets |

---

## 📤 Outputs

| Output | Description |
|------|-------------|
| `asg_name` | Auto Scaling Group name |
| `asg_id` | Auto Scaling Group ID |

---

## 🚀 Usage Example

```hcl
module "asg" {
  source = "../Terraform-modules/asg"

  asg_name = "my-asg"
  launch_template_id = module.ec2.launch_template_id
}
```

---

## 🏗️ Real-World Use Case

Used for high-availability web and backend services.