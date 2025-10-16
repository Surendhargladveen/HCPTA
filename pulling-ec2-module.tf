module "ec2" {
  source = "./modules/ec2"
  instance_name = "Surendhar's-EC2"  // Overriding the default value
}

// I'm just pulling my modules from my local.