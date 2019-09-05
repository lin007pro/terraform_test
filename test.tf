terraform {
  required_version = "~> 0.12.0"

  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Turbonomic"

    workspaces {
      name = "terraform_test"
    }
  }
}

variable "aws-access-key" {
  type = "string"
}

variable "aws-secret-key" {
  type = "string"
}

provider "aws" {
  region = "us-east-2"
  access_key = "${var.aws-access-key}"
  secret_key = "${var.aws-secret-key}"
}

variable "instance" {
  type = "string"
}

variable "instance_single" {
  type = "string"
}

variable "group_size" {
  type = "string"
}

variable "ami_type" {
  type = "string"
}

variable "amis" {
  type = "map"
}

variable "amis_test" {
  type = "map"
  default = {
    key1 = "value1"
    key2 = 5
  }
}

variable "test_list_size" {
  type = "list"
}

variable "test_map" {
  type = "map"
}

resource "aws_instance" "vmttest" {
  ami           = lookup("${var.amis}", "${var.ami_type}", "none")
  instance_type = "${var.instance}"
  count         = "${var.group_size}"
}

resource "aws_instance" "vmttest_single" {
  ami           = lookup("${var.amis}", "${var.ami_type}", "none")
  instance_type = "${var.instance_single}"
}
