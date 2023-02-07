# Store the state file in Terraform Cloud for Security Groups
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "aws-noora-terraform"

    workspaces {
      name = "02-lab7-sg"
    }
  }
}

# Restore the VPC and Subnet state files from Terraform Cloud
data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "aws-noora-terraform"

    workspaces = {
      name = "01-lab7-vpc"
    }
  }
}
