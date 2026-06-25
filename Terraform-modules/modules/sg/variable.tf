variable "sg_name" {
  default = "my-sg"
}

variable "sg_description" {
  default = "Security group for my application"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where security group will be created"
}
