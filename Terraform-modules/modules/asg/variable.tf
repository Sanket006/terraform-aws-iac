variable "launch_template_name" {
  default = "asg-launch-template"
}

variable "ami_id" {
  default = "ami-0cda377a1b884a1bc" # Ubuntu 22.04 LTS in ap-south-1
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
              apt update -y
              apt install -y nginx
              echo "<h1>Welcome to Auto Scaling Group $(hostname)</h1>" > /var/www/html/index.html
              systemctl start nginx
              systemctl enable nginx
    EOF
}

variable "env" {
  default = "dev"
}

variable "desired_capacity" {
  default = 2
}

variable "max_size" {
  default = 3
}

variable "min_size" {
  default = 1
}

variable "policy_name" {
  default = "cpu-scaling-policy"
}

variable "policy_type" {
  default = "TargetTrackingScaling"
}

variable "predefined_metric_type" {
  default = "ASGAverageCPUUtilization"
}

variable "target_value" {
  default = 50.0
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to associate with the launch template"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnets to associate with the Auto Scaling Group"
}

variable "target_group_arns" {
  type        = list(string)
  description = "List of target group ARNs to associate with the Auto Scaling Group"
  default     = []
}