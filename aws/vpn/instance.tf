data "aws_ami" "amis" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu*"]
  }
}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.amis.id
  instance_type = "t2.micro"
  #  associate_public_ip_address = true
  network_interface {
    network_interface_id = aws_network_interface.subnet_association.id
    device_index         = 0
  }
  user_data = <<EOF
#!/bin/bash
sudo apt update
sudo apt install apache2 -y
EOF
}

resource "aws_eip" "lb" {
  instance = aws_instance.instance.id
  vpc      = true
}
