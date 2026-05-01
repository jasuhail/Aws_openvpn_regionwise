terraform {
  backend "s3" {
    bucket         = "jasland-state-files"
    key            = "openvpn-ireland/terraform.tfstate"
    region         = "ca-central-1"
    encrypt        = true
    use_lockfile   = true
  }
}