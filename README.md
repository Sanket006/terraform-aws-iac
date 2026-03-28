# ☁️ terraform-aws-iac

<div align="center">

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)
![HCL](https://img.shields.io/badge/HCL-blueviolet?style=for-the-badge)

*Comprehensive Terraform IaC collection for AWS — standalone resource examples, reusable modules, loops, multi-environment setups, provisioners, remote state, and real-world ALB/ASG patterns*

</div>

---

## 📌 Overview

A structured collection of **Terraform Infrastructure as Code** examples built on AWS (`ap-south-1`). Each folder is independently runnable and covers a specific Terraform concept — from basic resource provisioning all the way to reusable modules, `for_each` loops, S3 remote state backends, all three provisioner types, and six progressively complex ALB + ASG patterns.

---

## 📁 Repository Structure

```
terraform-aws-iac/
│
├── AWS_resources_tf_files/          # Standalone AWS resource examples
│   ├── ec2/                         # EC2 + Security Group + user data (Nginx)
│   ├── vpc/                         # Full VPC — subnets, IGW, NAT, route tables
│   ├── vpc+sg+ec2/                  # Complete VPC + SG + EC2 in one config
│   ├── sg/                          # Security Group — SSH + HTTP ingress rules
│   ├── alb/                         # ALB + Target Group + Listener + EC2 attachment
│   ├── asg/                         # ASG + Launch Template + CloudWatch alarms
│   ├── alb+asg/                     # ALB wired to ASG — CPU target tracking policy
│   ├── iam/                         # IAM Role + Policy + Instance Profile on EC2
│   ├── rds/                         # RDS MySQL 8.0 + Subnet Group + Security Group
│   ├── s3/                          # S3 bucket + versioning + AES256 encryption
│   ├── eks/                         # EKS cluster + node group (c7i-flex.large)
│   └── practice.tf                  # ASG + S3 quick practice file
│
├── Terraform-modules/               # Reusable module composition
│   ├── main.tf                      # Root — calls vpc, sg, ec2, alb, asg, rds, eks
│   ├── variable.tf                  # region = "ap-south-1"
│   ├── output.tf                    # eks_cluster_name, eks_cluster_endpoint
│   └── modules/
│       ├── vpc/                     # VPC + public/private subnets + IGW + NAT GW
│       ├── sg/                      # Security Group (SSH :22, HTTP :80)
│       ├── ec2/                     # EC2 instance + user data script variable
│       ├── alb/                     # ALB + Target Group + Listener
│       ├── asg/                     # ASG + Launch Template + CPU tracking policy
│       ├── rds/                     # RDS MySQL 8.0 + Subnet Group + SG
│       ├── s3/                      # S3 bucket + versioning + public access block
│       └── eks/                     # EKS cluster + node group + VPC + subnets
│
├── Terraform_Loops/                 # for_each loop — 3 environments, 3 instance types
│   ├── main.tf
│   ├── variable.tf                  # dev=t3.micro, test=t3.small, prod=c7i-flex.large
│   └── output.tf
│
├── Terraform_Multi_Env/             # Multi-environment with tfvars + Workspaces docs
│   ├── main.tf
│   ├── provider.tf                  # ap-south-1
│   ├── variable.tf / output.tf
│   ├── env/
│   │   ├── dev.tfvars               # t3.micro
│   │   ├── test.tfvars              # c7i-flex.large
│   │   └── prod.tfvars              # t3.small
│   └── terraform-workspace.md       # Terraform Workspaces guide
│
├── Terraform_Provisiner/            # All 3 provisioner types + complete example
│   ├── local_exec/                  # local-exec: print/write EC2 IP locally
│   ├── remote_exec/                 # remote-exec: SSH + install Apache2 inline
│   ├── file/                        # file: upload index.html to EC2 via SSH
│   │   └── chirsmas_piano_template/ # Full HTML/CSS/JS website deployed via file provisioner
│   └── complete_example_of_all_provisiners/  # file + remote-exec + local-exec combined
│
├── Terraform_Remote_Backend/        # S3 remote state + DynamoDB locking
│   ├── backend/
│   │   └── main.tf                  # Creates S3 bucket + versioning for state
│   ├── main.tf                      # EC2 with S3 backend configured
│   ├── var.tf / output.tf
│   └── Terraform_Remote_Backend-for-multi-env.md  # Per-env backend guide
│
└── Using_Default_VPC/               # 6 real-world ALB variants (default VPC)
    ├── alb/                         # ALB + EC2 only
    ├── alb+asg/                     # ALB + Auto Scaling Group
    ├── alb+multi-pages/             # ALB + path routing to 3 EC2s (home/products/cart)
    ├── alb+multi-page+mutli-instance/  # ALB + path routing + 2 instances per page
    ├── alb+one-asg+multi-page+multi-instance/  # ALB + single ASG serving all pages
    └── alb+separate-asg+multi-page+multi-ec2-instance/  # ALB + dedicated ASG per page
```

---

## 📂 Section Deep-Dives

---

### 1️⃣ AWS Resources (`AWS_resources_tf_files/`)

Standalone, independently runnable `.tf` files for each AWS service. Use these to learn individual resource blocks.

| Folder | Key Resources | Highlights |
|---|---|---|
| `ec2/` | EC2, Security Group | Nginx user data, tag-based naming, variable-driven |
| `vpc/` | VPC, subnets, IGW, NAT GW, EIP, route tables | Full networking stack — public + private subnets |
| `vpc+sg+ec2/` | VPC + SG + EC2 | All-in-one with `10.0.0.0/16`, `ap-south-1a`, public subnet |
| `sg/` | Security Group | SSH (:22) + HTTP (:80) ingress, open egress |
| `alb/` | ALB, Target Group, Listener, EC2 attachment | `ap-south-1`, HTTP:80 forwarding, health check `/` |
| `asg/` | Launch Template, ASG, CloudWatch alarms | CPU target 50%, scale-up at 70%, scale-down at 30% |
| `alb+asg/` | ALB + ASG combined | ALB security group → EC2 security group chain |
| `iam/` | IAM Role, Policy Attachment, Instance Profile | `ec2_role` with `AmazonS3ReadOnlyAccess` attached to EC2 |
| `rds/` | RDS MySQL 8.0, Subnet Group, Security Group | `db.t3.micro`, `gp2`, 20 GB, port `3306`, `publicly_accessible = false` |
| `s3/` | S3 bucket, versioning, SSE-AES256 | All public access blocked, `for_each` file upload |
| `eks/` | EKS cluster, IAM roles, node group | `c7i-flex.large` × 2 nodes, Terraform `>= 1.5.0`, `AWS ~> 5.0` |

---

### 2️⃣ Reusable Modules (`Terraform-modules/`)

The root `main.tf` composes **7 modules** in a single deployment. Each module follows the `main.tf` / `variable.tf` / `output.tf` standard structure.

```hcl
# Terraform-modules/main.tf
module "vpc" { source = "./modules/vpc" }
module "sg"  { source = "./modules/sg"  }
module "ec2" { source = "./modules/ec2" }
module "alb" { source = "./modules/alb" }
module "asg" { source = "./modules/asg" }
module "rds" { source = "./modules/rds" }

module "eks" {
  source        = "./modules/eks"
  region        = var.region
  cluster_name  = "demo-eks-cluster"
  vpc_cidr      = "10.0.0.0/16"
  subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  instance_type = "c7i-flex.large"
  desired_size  = 2
  min_size      = 1
  max_size      = 3
}
```

**EKS module** (`modules/eks/`) creates its own VPC + subnets (not the default VPC), uses `aws_availability_zones` data source, and names all resources with `${var.cluster_name}-*` prefix — making it fully parameterized for any environment.

**Outputs** exposed from root module:
```hcl
output "eks_cluster_name"     { value = module.eks.cluster_name }
output "eks_cluster_endpoint" { value = module.eks.cluster_endpoint }
```

---

### 3️⃣ Loops (`Terraform_Loops/`)

Demonstrates `for_each` over a map to create **3 EC2 instances** — one per environment — each with a different instance type:

```hcl
# variable.tf
variable "instance_types" {
  default = {
    "dev"  = "t3.micro"
    "prod" = "c7i-flex.large"
    "test" = "t3.small"
  }
}

# main.tf
resource "aws_instance" "my_instance" {
  ami           = var.ami_id           # ami-02b8269d5e85954ef (Mumbai)
  for_each      = var.instance_types
  instance_type = each.value

  tags = {
    Name = "Instance-${each.key}"
    Env  = each.key
  }
}

# output.tf — collects all public IPs into a list
output "instance_public_ips" {
  value = [for n in aws_instance.my_instance : n.public_ip]
}
```

---

### 4️⃣ Multi-Environment (`Terraform_Multi_Env/`)

Two approaches documented:

**Approach A — `.tfvars` files per environment**

```bash
terraform plan  -var-file=env/dev.tfvars
terraform apply -var-file=env/prod.tfvars
```

| File | `instance_type` | `env` |
|---|---|---|
| `dev.tfvars` | `t3.micro` | `dev` |
| `test.tfvars` | `c7i-flex.large` | `test` |
| `prod.tfvars` | `t3.small` | `prod` |

**Approach B — Terraform Workspaces** (documented in `terraform-workspace.md`)

```bash
terraform workspace new dev
terraform workspace new test
terraform workspace new prod
terraform workspace select dev
terraform apply
```

Each workspace maintains its own state file. Workspace name exposed via `terraform.workspace` for dynamic resource naming and instance type selection via `lookup()`.

---

### 5️⃣ Provisioners (`Terraform_Provisiner/`)

All three Terraform provisioner types — each in its own folder, plus a complete combined example.

#### `local_exec/` — runs on the Terraform machine

```hcl
provisioner "local-exec" {
  command = "echo EC2 Public IP: ${self.public_ip}"
  # or: command = "echo ${self.public_ip} > ec2_ip.txt"
}
```

#### `remote_exec/` — SSH into EC2, run commands inline

```hcl
provisioner "remote-exec" {
  inline = [
    "sudo apt update -y",
    "sudo apt install apache2 -y",
    "echo '<h1>Hello from Terraform</h1>' | sudo tee /var/www/html/index.html",
    "sudo systemctl restart apache2"
  ]
}
connection {
  type        = "ssh"
  user        = "ubuntu"
  private_key = file("~/your-key.pem")
  host        = self.public_ip
}
```

Or run a script file (`install.sh` — installs Nginx):
```hcl
provisioner "remote-exec" { script = "install.sh" }
```

#### `file/` — upload a file from local to EC2

```hcl
provisioner "file" {
  source      = "index.html"
  destination = "/home/ubuntu/index.html"
}
# Upload a directory:
# provisioner "file" {
#   source      = "chirsmas_piano_template/"
#   destination = "/home/ubuntu"
# }
```

Includes a full **Christmas Piano HTML/CSS/JS website** (`chirsmas_piano_template/`) that can be deployed to an EC2 Apache instance using the file provisioner.

#### `complete_example_of_all_provisiners/` — all three combined

Runs on EC2 (`t3.micro`, `ap-south-1`, key `ajaymumbaikey`):
1. `file` provisioner → uploads `index.html` to `/home/ubuntu/`
2. `remote-exec` → installs Apache2, moves `index.html` to `/var/www/html/`, restarts Apache
3. `local-exec` → prints the public IP to the local console

---

### 6️⃣ Remote State Backend (`Terraform_Remote_Backend/`)

**Step 1 — Create the S3 bucket for state storage** (`backend/main.tf`):
```hcl
resource "aws_s3_bucket" "my_bucket" {
  bucket = "amazon-s3-bucket-backend-tfstate"
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration { status = "Enabled" }
}
```

**Step 2 — Configure backend in root `main.tf`**:
```hcl
terraform {
  backend "s3" {
    bucket = "amazon-s3-bucket-backend-tfstate"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
```

Per-environment backend configs documented in `Terraform_Remote_Backend-for-multi-env.md`:
```hcl
# dev
backend "s3" {
  bucket         = "my-terraform-state-bucket-dev"
  key            = "dev/project_name/terraform.tfstate"
  dynamodb_table = "terraform-state-lock-dev"
  encrypt        = true
}
```

---

### 7️⃣ Default VPC Patterns (`Using_Default_VPC/`)

Six progressively complex ALB configurations — all use `aws_default_vpc` + `aws_default_subnet` in `ap-south-1` (AZs: a, b, c). All use `ami-0cda377a1b884a1bc` (Ubuntu 22.04 Mumbai).

| # | Folder | Pattern | Instances |
|---|---|---|---|
| 1 | `alb/` | ALB + single EC2 | 1 EC2, 1 TG |
| 2 | `alb+asg/` | ALB + Auto Scaling Group | 2 desired (max 3), CPU 50% target tracking |
| 3 | `alb+multi-pages/` | ALB + path routing → 3 EC2s | 1 EC2 each: home/products/cart |
| 4 | `alb+multi-page+mutli-instance/` | ALB + path routing → 2 EC2s per page | 6 total EC2s via `count = 2` |
| 5 | `alb+one-asg+multi-page+multi-instance/` | ALB + single ASG serving all pages | 2 desired (max 4), 4 page routes via Nginx dirs |
| 6 | `alb+separate-asg+multi-page+multi-ec2-instance/` | ALB + dedicated ASG per page | 4 ASGs (home, electronics, fashion, grocery), 2 desired each |

Pattern 6 (`alb+separate-asg`) is the most production-realistic — each microservice route (home `/`, electronics `/electronics/*`, fashion `/fashion/*`, grocery `/grocery/*`) has its own Launch Template, ASG, and Target Group, enabling independent scaling per service.

All patterns output `alb_dns` — the DNS name to access the application.

---

## 🚀 Getting Started

### Prerequisites
- [Terraform CLI](https://developer.hashicorp.com/terraform/install) (v1.0+)
- AWS CLI configured (`aws configure`)
- IAM permissions: `EC2`, `EKS`, `RDS`, `S3`, `IAM`, `ALB`, `ASG`

### Standard Workflow

```bash
# Navigate to any example folder
cd AWS_resources_tf_files/vpc+sg+ec2/

# Initialise providers
terraform init

# Preview changes
terraform plan

# Apply
terraform apply

# Destroy when done
terraform destroy
```

### Run with Environment Variables

```bash
# Multi-environment
cd Terraform_Multi_Env/
terraform apply -var-file=env/prod.tfvars

# Loops
cd Terraform_Loops/
terraform apply    # Creates dev, test, prod instances simultaneously
```

### Set Up Remote State First

```bash
# 1. Create the state bucket
cd Terraform_Remote_Backend/backend/
terraform init && terraform apply

# 2. Then use the backend in your project
cd ../
terraform init     # Downloads providers + configures S3 backend
terraform apply
```

---

## ⚠️ Security Notes

| Issue | Location | Fix |
|---|---|---|
| Hardcoded DB password `redhat@123` | `Terraform-modules/modules/rds/variable.tf`, `AWS_resources_tf_files/rds/variable.tf` | Pass via `TF_VAR_password` env variable or AWS Secrets Manager |
| Hardcoded SSH key path (`C:/Users/Lenovo/Downloads/...`) | `Terraform_Provisiner/` `main.tf` files | Replace with `~/your-key.pem` or a variable |
| Hardcoded security group ID in provisioner variables | `Terraform_Provisiner/*/variable.tf` | Use `aws_security_group` resource reference instead |
| No DynamoDB state locking in remote backend | `Terraform_Remote_Backend/main.tf` | Add `dynamodb_table` to backend config for team safety |
| RDS `publicly_accessible = false` ✅ | `rds/main.tf` | Already correctly set — good practice |

---

## 📚 Concepts Covered

| Concept | Where |
|---|---|
| Provider + resource blocks | `AWS_resources_tf_files/` (all folders) |
| Variables, outputs, locals | Every folder |
| `count` meta-argument | `Using_Default_VPC/alb+multi-page+mutli-instance/` |
| `for_each` over a map | `Terraform_Loops/main.tf` |
| `for` expression in output | `Terraform_Loops/output.tf` |
| Dynamic resource naming | `Terraform-modules/modules/eks/main.tf` |
| Reusable modules | `Terraform-modules/modules/` |
| Multi-env with tfvars | `Terraform_Multi_Env/env/` |
| Terraform Workspaces | `Terraform_Multi_Env/terraform-workspace.md` |
| `local-exec` provisioner | `Terraform_Provisiner/local_exec/` |
| `remote-exec` provisioner | `Terraform_Provisiner/remote_exec/` |
| `file` provisioner | `Terraform_Provisiner/file/` |
| All 3 provisioners combined | `Terraform_Provisiner/complete_example_of_all_provisiners/` |
| S3 remote state backend | `Terraform_Remote_Backend/` |
| DynamoDB state locking | `Terraform_Remote_Backend/Terraform_Remote_Backend-for-multi-env.md` |
| ALB + EC2 | `Using_Default_VPC/alb/` |
| ALB + ASG + CPU scaling | `Using_Default_VPC/alb+asg/` |
| ALB path-based routing | `Using_Default_VPC/alb+multi-pages/` |
| Dedicated ASG per service | `Using_Default_VPC/alb+separate-asg+*/` |
| EKS cluster provisioning | `AWS_resources_tf_files/eks/` + `Terraform-modules/modules/eks/` |

---

## 🔗 Related Projects

| Repo | Description |
|---|---|
| [jenkins-cicd-pipelines](https://github.com/Sanket006/jenkins-cicd-pipelines) | `Terraform_EKS_pipeline` uses this repo's EKS Terraform config to provision the cluster |
| [flight-reservation-aws-infra](https://github.com/Sanket006/flight-reservation-aws-infra) | Production Terraform IaC for EKS + RDS + S3 using the module patterns from this repo |

---

## 👨‍💻 Author

**Sanket Ajay Chopade** — DevOps Engineer

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/sanketchopade07)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/Sanket006)
