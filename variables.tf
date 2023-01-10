variable "example" {
  type = string
  default = "yes"
}

variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "instance_type" {
  type    = map
  default = {
    "prod"    = "t2.large"
    "staging" = "t2.medium"
    "dev"     = "t2.micro"
  }
}

variable "cloud_providers_name" {
  type    = string
  default = "AWS"
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
