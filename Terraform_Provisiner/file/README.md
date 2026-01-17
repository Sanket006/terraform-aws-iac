## File Provisioner 

### Description

Demonstrates the `file` provisioner to **copy files from local machine to remote resource** (like EC2).

### Resources Created

* EC2 instance
* File copied to remote instance

### Inputs

| Name             | Description                | Type   | Default         | Required |
| ---------------- | -------------------------- | ------ | --------------- | -------- |
| instance_name    | EC2 instance name          | string | "web-file"      | yes      |
| instance_type    | EC2 instance type          | string | t2.micro        | no       |
| ami_id           | AMI ID                     | string | -               | yes      |
| source_file      | Local path of file to copy | string | -               | yes      |
| destination_path | Remote path to copy file   | string | /home/ec2-user/ | yes      |
| ssh_user         | SSH username               | string | ec2-user        | yes      |
| ssh_private_key  | Path to SSH private key    | string | -               | yes      |

### Usage

```hcl
cd Terraform_Provisioner/file
terraform init
terraform plan
terraform apply
```

### Architecture Diagram

```text
Terraform CLI
   |
   +--> EC2 Instance Creation
   +--> file provisioner: Copy local file -> Remote instance
```

---