provider "aws" {
  version = "~> 3.0"
  region  = "us-west-1"
}

terraform {
  backend "s3" {
    bucket = "poginni-tf-state-dev"
    key    = "vpn-server/terraform.tfstate"
    region = "us-west-1"
  }
}

module "vpn-server" {
  source = "../../modules/vpn-server"

}
