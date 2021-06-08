provider "aws" {
  region = var.aws_region
}

provider "cloudflare" {
  email     = var.cloudflare_email
  api_token = var.cloudflare_api_token
}

# AWS EC2
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.aws_public_key
}


resource "aws_instance" "main_server" {
  ami           = "ami-043d06ddf964074fd"
  instance_type = "t2.nano"
  key_name      = "deployer-key"
  tags = {
    Name = "CellanalyrServerInstance"
  }
}

output "instance_ip" {
  description = "The public ip for ssh access"
  value       = aws_instance.main_server.public_ip
}

# Cloudflare
resource "cloudflare_record" "www" {
  zone_id = var.cloudflare_zone_id
  name    = "cellanlyr"
  value   = aws_instance.main_server.public_ip
  type    = "A"
  proxied = true
}
