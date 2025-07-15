terraform {
  required_providers {
    aws = {
      version = "~> 6.2.0"
      source  = "hashicorp/aws"
    }
    ansible = {
      version = "~> 1.3.0"
      source  = "ansible/ansible"
    }
  }
}
