terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
  required_version = ">= 0.14.9"

  backend "remote" {
    organization = "hieuhani"

    workspaces {
      name = "cellanalyr-gh-actions"
    }
  }
}
