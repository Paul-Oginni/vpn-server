data "template_file" "user_data" {
	template = "${file("../../user_data.tpl")}"
}

resource "aws_instance" "vpn-server" {
  ami           = "ami-0b33356b362c56df5"
  instance_type = "t3.micro"
  key_name = "vpn-dev"

  tags = {
    Name = "wireguard-2"
  }
}


