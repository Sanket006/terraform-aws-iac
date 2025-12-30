provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [var.vpc_sg_id]

  # inline commands

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install apache2 -y",
      "echo '<h1>Hello from Terraform</h1>' | sudo tee /var/www/html/index.html",
      "sudo systemctl restart apache2"
    ]
  }

  # executing script file

  # provisioner "remote-exec" {
  # script = "install.sh"
  # }


  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/Lenovo/Downloads/ajaymumbaikey.pem")
    host        = self.public_ip
  }

  tags = {
    Name = "ec2-remote-provisioner"
  }
}
