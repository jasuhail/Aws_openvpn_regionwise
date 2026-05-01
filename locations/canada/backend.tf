terraform {
  backend "s3" {
    bucket         = "jasland-state-files"
    key            = "openvpn-ireland/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    use_lockfile   = true
  }
}