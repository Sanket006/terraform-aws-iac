# ☸️ EKS Terraform Module

## 📌 Overview
This module provisions an **Amazon EKS (Elastic Kubernetes Service)** cluster using Terraform.

It follows **production-ready best practices** for Kubernetes infrastructure.

---

## Architecture Diagram

```text
Root Module
   |
   +--> EKS Module
      |
      +--> EKS Cluster
      +--> Worker Nodes
      +--> Security Groups
      +--> Subnets
```

---


## 🧠 What This Module Creates
- EKS Cluster
- Node Group
- IAM Roles & Policies
- Networking integration with VPC

---

## 🛠 Tech Stack
- Terraform
- AWS EKS
- Kubernetes
- IAM

---

## 📥 Inputs

| Variable | Description |
|--------|-------------|
| `cluster_name` | Name of EKS cluster |
| `vpc_id` | VPC ID |
| `subnet_ids` | Subnet IDs |
| `node_instance_type` | Worker node type |
| `desired_capacity` | Desired node count |

---

## 📤 Outputs

| Output | Description |
|------|-------------|
| `cluster_id` | EKS cluster ID |
| `cluster_endpoint` | EKS API endpoint |
| `cluster_name` | EKS cluster name |
| `node_group_ids` | List of node group IDs |

---

## 🚀 Usage Example

```hcl
module "eks" {
  source = "./modules/eks"

  cluster_name = "dev-eks"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnet_ids
}
```

---

## 🏗️ Real-World Use Case

Used to run containerized microservices, CI/CD workloads, and cloud-native applications.