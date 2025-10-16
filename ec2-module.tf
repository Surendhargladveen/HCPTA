module "ec2" {
  source  = "boldlink/ec2/aws"
  version = "2.0.7"
}

// we need to run terraform init to download plugin and module configuration.
// Not all the modules will create resources directly, some modules need some mandatory input. without that input module will not create any resources and it will throw error.
// We can pass that input inside the module block {}