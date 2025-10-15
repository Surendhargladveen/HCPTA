module "ec2" {
  source  = "boldlink/ec2/aws"
  version = "2.0.7"
}

// we need to terraform init to download plugin and module configuration.