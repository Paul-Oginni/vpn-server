data "template_file" "user_data" {
	template = "${file("../../user_data.tpl")}"
}

resource "aws_instance" "vpn-server" {
  ami           = "ami-0b33356b362c56df5"
  instance_type = "t3.micro"
  key_name = "wireguard-2"

  tags = {
    Name = "wireguard-2"
  }

	security_groups = [aws_security_group.allow_ssh.name]
	user_data = base64encode(data.template_file.user_data.rendered)
}

resource "aws_security_group" "allow_ssh" {
  name        = "ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-6cb25608"

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
