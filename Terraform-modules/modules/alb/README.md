# ⚖️ Application Load Balancer (ALB) Terraform Module

## 📌 Overview
This module provisions an **AWS Application Load Balancer (ALB)** to distribute traffic across multiple targets in a highly available manner.

---

## Architecture Diagram

```text
Root Module
   |
   +--> ALB Module
      |
      +--> Listeners
      +--> Target Groups
      +--> Security Groups
```

---

## 🧠 What This Module Creates
- Application Load Balancer
- Target Group
- Listener (HTTP / HTTPS)
- Health Checks

---

## 🛠 Tech Stack
- Terraform
- AWS ALB
- Networking

---

## 📥 Inputs

| Variable | Description |
|--------|-------------|
| `alb_name` | ALB name |
| `vpc_id` | VPC ID |
| `subnet_ids` | Subnets for ALB |
| `security_group_id` | ALB security group |
| `target_port` | Application port |

---

## 📤 Outputs

| Output | Description |
|------|-------------|
| `alb_arn`  | ALB ARN  |
| `alb_dns_name` | ALB DNS endpoint |

---

## 🚀 Usage Example

```hcl
module "alb" {
  source = "./modules/alb"

  alb_name = "my-alb"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
}
```

---

## 🏗️ Real-World Use Case

Used for web apps, microservices, and Kubernetes ingress traffic.