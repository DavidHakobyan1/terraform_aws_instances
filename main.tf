terraform {
  cloud {
    organization = "David_Hakobyan"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

locals {
  cloud_providers_name = "${var.cloud_providers_name}"
}

provider "aws" {
  region = var.region
}

data "aws_ami" "latest_ubuntu" {
  owners      = var.owners
  most_recent = var.most_recent
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "my_ubuntu" {
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = var.instance_type
  provisioner "local-exec" {
    command = "echo ${local.cloud_providers_name} Instance Creations!"
  }
  tags = merge(var.tags, {Name = "My Ubuntu server"})
}

output "server_instance_id" {
  value = (aws_instance.my_ubuntu.id)
}

output "server_instance_name" {
  value = (aws_instance.my_ubuntu.name)
}
