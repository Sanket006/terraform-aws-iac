# 🗄 RDS Terraform Module

## 📌 Overview
This module provisions an **AWS RDS database instance** with configurable engine, instance size, and storage.

---

## Architecture Diagram

```text
Root Module
   |
   +--> RDS Module
      |
      +--> DB Instance
      +--> Subnet Group
      +--> Security Group
```

---

## 🧠 What This Module Creates
- RDS Instance
- Subnet Group
- Security Group
- Parameter Group (optional)

---

## 🛠 Tech Stack
- Terraform
- AWS RDS
- MySQL / PostgreSQL

---

## 📥 Inputs

| Variable | Description |
|--------|-------------|
| `db_name` | Database name |
| `engine` | DB engine |
| `instance_class` | RDS instance type |
| `username` | DB username |
| `password` | DB password |
| `subnet_ids` | DB subnets |
| `allocated_storage` | Storage in GB |

---

## 📤 Outputs

| Output | Description |
|------|-------------|
| `db_instance_id` | RDS instance ID |
| `db_endpoint` | Database endpoint |

---

## 🚀 Usage Example

```hcl
module "rds" {
  source = "./modules/rds"

  db_name = "appdb"
  engine  = "mysql"
}
```

---

## 🏗️ Real-World Use Case

Used for backend databases in production workloads.