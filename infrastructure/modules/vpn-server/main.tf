data "template_file" "user_data" {
  template = "${file("../../tmpl/user_data.tpl")}"
  vars = {
    test = "test"
  }
}

resource "aws_instance" "vpn-server" {
  ami           = "ami-0b33356b362c56df5"
  instance_type = "t3.micro"

  tags = {
    Name = "vpn-sever"
  }
}

resource "aws_security_group" "wireguard-sg" {
  name        = "wireguard-sg"
  description = "Allow wireguard traffic."
  vpc_id      = var.vpc_id

  ingress {
    description = "UDP"
    from_port   = 0
    to_port     = 0
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "wireguard-sg"
    Terraform = true
  }
}
