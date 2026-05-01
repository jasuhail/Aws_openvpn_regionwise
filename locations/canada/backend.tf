terraform {
  backend "s3" {
    bucket         = "jasland-state-files"
    key            = "openvpn-canada/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true
  }
}