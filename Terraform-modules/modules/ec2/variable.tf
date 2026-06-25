variable "ami" {
  default = "ami-0cda377a1b884a1bc" # Ubuntu 22.04 LTS in ap-south-1 (Mumbai)
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "my-key-pair"
}

variable "user_data_script" {
  default = <<-EOF
              #!/bin/bash
              apt-update -y
              apt-install nginx -y
              echo "Hello, World from $(hostname)" > /var/www/html/index.html
              systemctl start nginx
              systemctl enable nginx
              EOF
}

variable "env" {
  default = "dev"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to associate with EC2"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where EC2 will be launched"
}
