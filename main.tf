terraform {
  cloud {
    organization = "David_Hakobyan"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name  = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "my_ubuntu" {
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name    = "My Ubuntu server"
    Owner   = "David Hakobyan"
    Project = "Terraform Homework"
  }
}
