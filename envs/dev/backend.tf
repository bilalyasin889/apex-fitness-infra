terraform {
  backend "s3" {
    bucket  = "apex-fitness-tf-state-dev"
    key     = "terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
    use_lockfile = true
  }
}
