module "ec2" {
  source  = "boldlink/ec2/aws"
  version = "2.0.7"
}

// we need to run terraform init to download plugin and module configuration.