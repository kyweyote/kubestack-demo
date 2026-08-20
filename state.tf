terraform {
  backend "s3" {
    bucket = "terraform-state-kubestack-8d50999"
    region = "ap-southeast-1"
    key    = "tfstate"
  }
}
