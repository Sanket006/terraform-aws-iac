# Ec2 instance
resource "aws_instance" "my_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  user_data              = var.user_data_script
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "${var.env}-ec2-instance"
    env  = var.env
  }
}