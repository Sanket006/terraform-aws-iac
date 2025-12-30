provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [var.vpc_sg_id]

  # file provisioner to uplaod a file

  provisioner "file" {
    source      = "index.html"
    destination = "/home/ubuntu/index.html"
  }

  # file provisioner to create a file with content  **before running this code you have to run remote-exec to create a file message.txt** 

  # provisioner "file" {
  # content     = "Hello from Terraform"
  # destination = "/home/ubuntu/message.txt"
  # }

  # file provisioner to uplaod a directory
  
  # provisioner "file" {
  # source      = "chirsmas_piano_template/"
  # destination = "/home/ubuntu"
  # }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/Lenovo/Downloads/ajaymumbaikey.pem")
    host        = self.public_ip
  }


  tags = {
    Name = "ec2-file-provisioner"
  }
}
