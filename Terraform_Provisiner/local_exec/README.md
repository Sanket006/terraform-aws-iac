## Local-Exec Provisioner 

### Description

Demonstrates the use of the `local-exec` provisioner to run **commands on the machine where Terraform is executed**.

### Resources Created

* EC2 instance (example)
* Executes local commands like shell scripts or CLI tools

### Inputs

| Name          | Description                | Type   | Default      | Required |
| ------------- | -------------------------- | ------ | ------------ | -------- |
| instance_name | Name of the EC2 instance   | string | "web-local"  | yes      |
| instance_type | EC2 instance type          | string | t2.micro     | no       |
| ami_id        | AMI ID                     | string | -            | yes      |
| command       | Command to execute locally | string | "echo Hello" | no       |

### Usage

```hcl
cd Terraform_Provisioner/local_exec
terraform init
terraform plan
terraform apply
```

### Architecture Diagram

```text
Terraform CLI
   |
   +--> EC2 Instance Creation
   +--> local-exec: Run command on local machine
```

---