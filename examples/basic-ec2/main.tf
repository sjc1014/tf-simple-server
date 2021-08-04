

//resource "aws_instance" "server" {
//  ami                         = local.ami_id
//  instance_type               = local.instance_type
//  key_name                    = local.ssh_key
//  subnet_id                   = local.subnet_id
//  vpc_security_group_ids      = [aws_security_group.bastion.id]
//  associate_public_ip_address = true
//
//  root_block_device {
//    volume_size           = local.disk_size
//    delete_on_termination = true
//  }
//
//  lifecycle {
//    ignore_changes = [ami]
//  }
//
//  tags = {
//    Name    = "Bastion host"
//    Project = local.project
//  }
//}

resource "aws_default_vpc" "default" {}



resource "aws_instance" "bastion" {
  ami                         = "ami-09e67e426f25ce0d7"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name = "Steve-MBA"

  user_data = <<-EOF
    #!/bin/bash
    apt update
    apt install default-jdk -y
    apt install maven -y
    mkdir ~ubuntu/dev
    cd ~/dev
    chown ubuntu:ubuntu ~ubuntu/dev
    git clone https://github.com/sjc1014/HelloWorld.git
    apt install unzip
    echo "hello" > /tmp/steve.txt
  EOF

  tags = {
    Name    = "Bastion host"
    Project = var.project
  }
}

output "bastion_public_ip" {
  value = "${aws_instance.bastion.public_ip}"
}