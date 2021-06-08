variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "namespace" {
  type        = string
  default     = ""
  description = "Namespace for labels"
}


variable "name" {
  description = "Name  (e.g. `app` or `cluster`)"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "cloudflare_email" {
  description = "Cloudflare email"
  type        = string
}


variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
  type        = string
}

variable "aws_public_key" {
  description = "AWS Public Key"
  type        = string
}
