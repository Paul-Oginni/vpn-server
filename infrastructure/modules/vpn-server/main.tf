resource "aws_instance" "vpn-server" {
  ami           = "ami-0b33356b362c56df5"
  instance_type = "t3.micro"
  key_name = "vpn-dev"

  tags = {
    Name = "vpn-sever"
  }
}


