// The lifecycle block with ignore_changes prevents Terraform from updating the instance if only the instance_type change.
resource "aws_instance" "VMs" {
  ami           = "ami-0a7d80731ae1b2435"
  instance_type = "t2.medium"
  key_name      = "gladveen"

  lifecycle {
    ignore_changes = [ instance_type ]
  }
}


// prevent_destroy will not allow the instance to be destroyed unless this line is removed or set to false.
# resource "aws_instance" "VMs" {
#   ami           = "ami-0a7d80731ae1b2435"
#   instance_type = "t2.medium"
#   key_name      = "gladveen"

#     tags = {
#     Name = "Terraform-VM"
#     }

#   lifecycle {
#     prevent_destroy = true
#   }
# }


// create_before_destroy will create a new instance before destroying the old one when changes are made that require replacement.
# resource "aws_instance" "VMs" {
#   ami           = "ami-06528c11a66cef7a8"  // now am changing the ami to force replacement. once the new ec2 created then only old one will be destroyed.
#   instance_type = "t2.micro"
#   key_name      = "gladveen"

#   lifecycle {
#     create_before_destroy = true
#   }
# }

