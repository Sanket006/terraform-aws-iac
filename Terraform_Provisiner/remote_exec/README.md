## Remote-Exec Provisioner 

### Description

Demonstrates the use of `remote-exec` to **run commands on a remote resource** (like an EC2 instance) after creation.

### Resources Created

* EC2 instance
* Remote commands executed via SSH

### Inputs

| Name            | Description                      | Type         | Default      | Required |
| --------------- | -------------------------------- | ------------ | ------------ | -------- |
| instance_name   | EC2 instance name                | string       | "web-remote" | yes      |
| instance_type   | EC2 instance type                | string       | t2.micro     | no       |
| ami_id          | AMI ID                           | string       | -            | yes      |
| ssh_user        | SSH username                     | string       | ec2-user     | yes      |
| ssh_private_key | Path to SSH private key          | string       | -            | yes      |
| commands        | List of commands to run remotely | list(string) | []           | yes      |

### Usage

```hcl
cd Terraform_Provisioner/remote_exec
terraform init
terraform plan
terraform apply
```

### Architecture Diagram

```text
Terraform CLI
   |
   +--> EC2 Instance Creation
   +--> remote-exec: SSH to instance -> Run commands
```

---