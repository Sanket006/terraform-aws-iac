# Terraform Loops & Iterations

This directory demonstrates how to create multiple resources using **loops**.

## 🔄 Flow Diagram

```
Input Variable (list/map)
        |
        v
+------------------+
| count / for_each |
+--------+---------+
         |
         v
+------------------+
| Multiple AWS     |
| Resources        |
+------------------+
```

## Concepts Covered

* `count`
* `for_each`
* Dynamic resource creation
* `for_loop`

## Example

```hcl
resource "aws_instance" "example" {
  count = 2
}
```

---

## 1️⃣ Count Example 

### Description

Using the `count` meta-argument to create **multiple identical resources**.

### Resources Created

* Multiple EC2 instances
* Security groups (optional)

### Inputs

| Name           | Description             | Type   | Default  | Required |
| -------------- | ----------------------- | ------ | -------- | -------- |
| instance_count | Number of EC2 instances | number | 2        | yes      |
| instance_type  | EC2 instance type       | string | t2.micro | no       |
| ami_id         | AMI ID                  | string | -        | yes      |

### Usage

```hcl
cd Terraform_Loops/count
terraform init
terraform plan -var='instance_count=3'
terraform apply -var='instance_count=3'
```

### Architecture Diagram

```text
Root Module
   |
   +--> count Loop
        |
        +--> EC2 Instance 1
        +--> EC2 Instance 2
        +--> EC2 Instance N
```

---

## 2️⃣ For_Each Example 

### Description

Using `for_each` to create **resources from a map or set of objects**.

### Resources Created

* EC2 instances per key in a map
* Security groups (optional)

### Inputs

| Name          | Description                    | Type        | Default  | Required |
| ------------- | ------------------------------ | ----------- | -------- | -------- |
| instance_map  | Map of instance names and AMIs | map(string) | {}       | yes      |
| instance_type | EC2 instance type              | string      | t2.micro | no       |

### Usage

```hcl
cd Terraform_Loops/for_each
terraform init
terraform plan -var='instance_map={"web1":"ami-123","web2":"ami-456"}'
terraform apply -var='instance_map={"web1":"ami-123","web2":"ami-456"}'
```

### Architecture Diagram

```text
Root Module
   |
   +--> for_each Loop
        |
        +--> EC2 Instance for web1
        +--> EC2 Instance for web2
        +--> EC2 Instance for N
```

---

## 3️⃣ Dynamic Blocks Example 
### Description

Using **dynamic blocks** to generate **nested repeated blocks** dynamically (e.g., ingress rules in Security Groups).

### Resources Created

* Security groups with multiple ingress/egress rules
* EC2 instances (optional)

### Inputs

| Name          | Description                  | Type         | Default | Required |
| ------------- | ---------------------------- | ------------ | ------- | -------- |
| ingress_rules | List of ingress rule objects | list(object) | []      | yes      |
| egress_rules  | List of egress rule objects  | list(object) | []      | no       |

### Usage

```hcl
cd Terraform_Loops/dynamic
terraform init
terraform plan -var='ingress_rules=[{from_port=80,to_port=80,protocol="tcp",cidr_blocks=["0.0.0.0/0"]}]'
terraform apply -var='ingress_rules=[{from_port=80,to_port=80,protocol="tcp",cidr_blocks=["0.0.0.0/0"]}]'
```

### Architecture Diagram

```text
Root Module
   |
   +--> Dynamic Block
        |
        +--> Security Group
             |
             +--> Ingress Rule 1
             +--> Ingress Rule 2
             +--> Egress Rule N
```

---

## 4️⃣ For Loop Example 

### Description

Using **for expressions** in Terraform to generate **lists, maps, or objects dynamically** based on other variables.

### Resources Created

* Lists or maps of computed values
* Can be used to create multiple resources indirectly

### Inputs

| Name           | Description            | Type         | Default | Required |
| -------------- | ---------------------- | ------------ | ------- | -------- |
| instance_names | List of instance names | list(string) | []      | yes      |
| ami_id         | AMI ID to use          | string       | -       | yes      |

### Usage

```hcl
cd Terraform_Loops/for_loop
variable "instance_names" {
  default = ["web1", "web2", "web3"]
}

output "ami_map" {
  value = { for name in var.instance_names : name => "ami-12345678" }
}
```

### Architecture Diagram

```text
Root Module
   |
   +--> for Expression
        |
        +--> Resource / Value for web1
        +--> Resource / Value for web2
        +--> Resource / Value for webN
```

---

## Notes

* **count** → for identical resources.
* **for_each** → for keyed resources.
* **dynamic blocks** → for nested repeated blocks.
* **for loops / expressions** → for generating lists, maps, or objects dynamically.

✅ All Terraform_Loops folders now have **README.md templates including count, for_each, dynamic, and for loops**.
