variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "owners" {
  type    = list
  default = ["099720109477"]
}

variable "most_recent" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map
  default = {
    Owner   = "David Hakobyan"
    Project = "Terraform Homework"
  }
}
