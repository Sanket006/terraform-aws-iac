variable "region" {
  default = "ap-south-1"
}

variable "ami" {
  default = "ami-02b8269d5e85954ef"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "ajaymumbaikey"
}

variable "vpc_sg_id" {
  default = "sg-07ea7dfd0be4bbffc"
}