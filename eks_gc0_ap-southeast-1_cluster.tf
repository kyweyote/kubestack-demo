module "eks_gc0_ap-southeast-1" {
  providers = {
    aws        = aws.eks_gc0_ap-southeast-1
    kubernetes = kubernetes.eks_gc0_ap-southeast-1
  }

  source = "github.com/kbst/terraform-kubestack//aws/cluster?ref=v0.19.2-beta.0"

  configuration = {
    apps = {
      base_domain                = var.base_domain
      cluster_availability_zones = "ap-southeast-1a,ap-southeast-1b,ap-southeast-1c"
      cluster_desired_capacity   = 3
      cluster_instance_type      = "t3.small"
      cluster_max_size           = 9
      cluster_min_size           = 3
      name_prefix                = "gc0"
      #if this line omits, cluster will be latest version
      #AMI Type AL2_x86_64 is only supported for kubernetes versions 1.32 or earlier error will get
      cluster_version            = "1.32" 
    }
    ops = { # inherit from apps
      
    }
  }
}
