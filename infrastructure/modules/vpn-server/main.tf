data "template_file" "wg0_conf" {
  template = "${file("../../tmpl/configs/wg0.conf.tmpl")}"
  vars = {
    test = "test"
  }
}

data "template_file" "wireguard_setup_shellscript" {
  template = "${file("../../tmpl/shellscripts/setup-openvpn.sh.tmpl")}"
  vars = {
    test = "test"
  }
}

data "template_cloudinit_config" "wg_userdata" {
  gzip          = true
  base64_encode = true

  # Wireguard conf file
  part {
    filename     = "wg0.conf"
    content_type = "text/cloud-config"
    content      = "${data.template_file.wg0_conf.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.wireguard_setup_shellscript.rendered}"
  }
}

resource "aws_instance" "vpn-server" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name = var.key_name
  user_data_base64 = "${data.template_cloudinit_config.wg_userdata.rendered}"

  tags = {
    Name = var.server_name
    Terraform = "true"
  }
}

resource "aws_security_group" "wireguard_sg" {
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
