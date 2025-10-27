provider "aws" {
  region = "us-east-1"
  alias  = "USA"
}

provider "aws" {
  region = "ap-south-1"
  alias  = "INDIA"
}

resource "aws_instance" "VMs" {
  provider      = aws.USA
  ami           = "ami-0a7d80731ae1b2435"
  instance_type = "t2.medium"
  key_name      = "gladveen"

  tags = {
    Name = "Surendhar"
  }
}

resource "aws_s3_bucket" "bucket" {
  provider = aws.INDIA
  bucket   = "surendhar-terraform-bucket-12345"
}

// Using alias we can pass multiple providers, multiple regions and mulitple accounts in a single configuration file.