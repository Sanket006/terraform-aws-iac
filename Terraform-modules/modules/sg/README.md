# 🔐 Security Group Terraform Module

## 📌 Overview
This module creates **AWS Security Groups** to control inbound and outbound traffic for cloud resources.

It follows the **principle of least privilege**.

---

## Architecture Diagram

```text
Root Module
   |
   +--> Security Group Module
      |
      +--> Ingress Rules
      +--> Egress Rules
      +--> Attach to EC2 or Load Balancer
```

---

## 🧠 What This Module Creates
- Security Group
- Ingress rules
- Egress rules

---

## 🛠 Tech Stack
- Terraform
- AWS Security Groups

---

## 📥 Inputs

| Variable | Description |
|--------|-------------|
| `sg_name` | Security group name | 
| `vpc_id` | VPC ID |
| `ingress_rules` | List of ingress rules |
| `egress_rules` | List of egress rules |

---

## 📤 Outputs

| Output | Description |
|------|-------------|
| `security_group_id` | Security Group ID |

---

## 🚀 Usage Example

```hcl
module "sg" {
  source        = "../Terraform-modules/security_group"
  sg_name       = "web-sg"
  vpc_id        = module.vpc.vpc_id
  ingress_rules = [{ from_port=80, to_port=80, protocol="tcp", cidr_blocks=["0.0.0.0/0"] }]
}
```

---

## 🏗️ Real-World Use Case

Used to secure EC2, EKS nodes, Load Balancers, and databases.