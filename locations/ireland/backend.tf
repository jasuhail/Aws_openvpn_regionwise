terraform {
  backend "s3" {
    bucket       = "jas-tfstate-ir"
    key          = "openvpn-ireland/terraform.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}