provider "aws" {
   region = var.region
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [var.vpc_sg_id]

  # print public ip to local console

  # provisioner "local-exec" {
  #   command = "echo EC2 Public IP: ${self.public_ip}"
  # }

  # write public ip to a file

  # provisioner "local-exec" {
  #   command = "echo ${self.public_ip} > ec2_ip.txt"
  # }

  tags = {
    Name = "ec2-local-provisioner"
  }
}
