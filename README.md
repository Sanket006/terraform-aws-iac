# Terraform Learning & Practice Repository

This repository contains **Terraform Infrastructure as Code (IaC)** examples created while learning and practicing Terraform with **AWS** and core Terraform concepts. It is designed for beginners to intermediate DevOps learners who want **hands‑on experience** with real‑world Terraform use cases such as modules, loops, provisioners, remote backends, and multi‑environment setups.

---

## 📌 Table of Contents

* 🚀 Overview
* 📁 Repository Structure
* 💡 Concepts Covered
* ⚙️ Getting Started
* 🛠️ Usage
* 📚 Best Practices
* 🤝 Contributing
* 📄 License

---

## 🚀 Overview

The purpose of this repository is to provide **practical Terraform examples** that demonstrate how infrastructure can be provisioned, managed, and scaled using code. Each folder focuses on a specific Terraform concept and can be practiced independently.

---

## 📁 Repository Structure

```
Terraform/
│
├── AWS_resources_tf_files/    # Terraform files for provisioning AWS resources
├── Terraform-modules/         # Reusable Terraform modules
├── Terraform_Loops/           # Loop examples using count and for_each
├── Terraform_Multi_Env/       # Multi-environment (dev/test/prod) setups
├── Terraform_Provisiner/      # Provisioner examples (local-exec, remote-exec)
├── Terraform_Remote_Backend/  # Remote backend configuration (S3, DynamoDB)
├── Using_Default_VPC/         # Examples using AWS default VPC
└── README.md                  # Project documentation
```

---

## 💡 Concepts Covered

This repository covers the following Terraform concepts:

* Terraform installation and CLI workflow
* Providers and AWS resource creation
* Variables, outputs, and locals
* Terraform modules and reusability
* Looping constructs (`count`, `for_each`)
* Provisioners (`local-exec`, `remote-exec`, `file`)
* Remote state management
* Multi-environment infrastructure design
* Best practices for IaC projects

---

## ⚙️ Getting Started

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/Sanket006/Terraform.git
cd Terraform
```

### 2️⃣ Install Terraform

Download Terraform from the official website:

[https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)

Verify installation:

```bash
terraform --version
```

### 3️⃣ Initialize Terraform

Navigate to any example directory and run:

```bash
terraform init
```

---

## 🛠️ Usage

A typical Terraform workflow looks like this:

```bash
terraform validate
terraform plan
terraform apply
```

To destroy resources:

```bash
terraform destroy
```

⚠️ **Always review the plan output before applying changes.**

---

## 📚 Best Practices

* Use remote backends to store Terraform state securely
* Do not commit `.tfstate` files to Git
* Keep configurations modular and reusable
* Use variables instead of hard-coded values
* Separate environments using directories or workspaces

---

## 🤝 Contributing

Contributions are welcome! 🚀

Steps to contribute:

1. Fork the repository
2. Create a new feature branch
3. Add or improve Terraform examples
4. Submit a Pull Request

---

## 📄 License

This project is open-source. You may add an **MIT** or **Apache 2.0** license depending on your preference.

---

### ⭐ If this repository helps you learn Terraform, consider giving it a star on GitHub!
