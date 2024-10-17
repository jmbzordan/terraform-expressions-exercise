terraform {
  required_version  = ">= 1.3.0"
  required_providers {
    aws = {
        version     = ">= 5.67.0"
        source      = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket          = "johnz-remote-state"
    key             = "expression-exercise/terraform.tfstate"
    region          = "sa-east-1"
  }
}