provider "aws" {
  #profile = "myaws"
  region = var.region

}

resource "aws_instance" "apache-server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "enter"
  vpc_security_group_ids = ["${aws_security_group.firewall.id}"]
  user_data              = file("apache.sh")





  tags = {
    Name = "apache_server1"
  }

}