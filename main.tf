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

provider "aws" {
  region                  = "us-east-2"
//  shared_credentials_file = "/home/mborodia/.aws/credentials"
//  profile                 = "terraform"
  access_key = "AKIASZZINMS6SZLQJZLY"
  secret_key = "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"
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
  ami           = "var.amis[var.ami_type]"
  instance_type = "${var.instance}"
  count         = "${var.group_size}"
}

resource "aws_instance" "vmttest_single" {
  ami           = "var.amis[var.ami_type]"
  instance_type = "var.instance_single"
}
