# 💻 EC2 Terraform Module

## 📌 Overview
This module provisions **EC2 instances** on AWS with configurable instance type, AMI, key pair, and security groups.

Designed for **web servers, backend services, and application workloads**.

---

## Architecture Diagram

```text
Root Module
   |
   +--> EC2 Module
      |
      +--> EC2 Instances
      +--> Security Groups
      +--> Key Pair
```

---

## 🧠 What This Module Creates
- EC2 Instance
- Key Pair association
- Security Group attachment
- Optional User Data

---

## 🛠 Tech Stack
- Terraform
- AWS EC2
- Linux

---

## 📥 Inputs

| Variable | Description |
|--------|-------------|
| `ami_id` | AMI ID |
| `instance_type` | EC2 instance type |
| `key_name` | SSH key name |
| `subnet_id` | Subnet ID |
| `security_group_ids` | Security group IDs |

---

## 📤 Outputs

| Output | Description |
|------|-------------|
| `instance_id` | EC2 instance ID |
| `public_ip` | Public IP address |

---

## 🚀 Usage Example

```hcl
module "ec2" {
  source = "./modules/ec2"

  ami_id        = "ami-0abcdef123"
  instance_type = "t2.micro"
  key_name      = "my-key"
  subnet_id     = module.vpc.public_subnet_ids[0]
}
```

## 🏗️ Real-World Use Case

Used to deploy web servers, backend APIs, Jenkins servers, or bastion hosts.

