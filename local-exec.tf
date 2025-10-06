resource "aws_instance" "example" {
  ami           = "ami-0a7d80731ae1b2435"
  instance_type = "t2.micro"
  key_name = "gladveen"

   provisioner "local-exec" {
    # when = destroy // Execute this provisioner during resource destruction. It will store the data in log.txt file while instance in destroying state.
     command = "echo ${self.arn} - Created at ${timestamp()} >> instance_log.txt"
   }

  tags = {
    Name = "Surendhar"
  }
}

// I'm executing the cmd locally from my machine. 
// we created a ec2, now we are destroying the ec2 instance. Then instance_log.txt will remains in the local machine.
// We can absolutely use Bash built-in commands or functions inside the local-exec provisioner.