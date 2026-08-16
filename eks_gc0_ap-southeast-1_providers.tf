provider "aws" {
  alias = "eks_gc0_ap-southeast-1"

  region = "ap-southeast-1"
}

provider "kustomization" {
  alias = "eks_gc0_ap-southeast-1"

  kubeconfig_raw = module.eks_gc0_ap-southeast-1.kubeconfig
}

locals {
  eks_gc0_ap-southeast-1_kubeconfig = yamldecode(module.eks_gc0_ap-southeast-1.kubeconfig)
}

provider "kubernetes" {
  alias = "eks_gc0_ap-southeast-1"

  host                   = local.eks_gc0_ap-southeast-1_kubeconfig["clusters"][0]["cluster"]["server"]
  cluster_ca_certificate = base64decode(local.eks_gc0_ap-southeast-1_kubeconfig["clusters"][0]["cluster"]["certificate-authority-data"])
  token                  = local.eks_gc0_ap-southeast-1_kubeconfig["users"][0]["user"]["token"]
}
