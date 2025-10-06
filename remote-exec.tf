resource "aws_instance" "remote" {
  ami           = "ami-0a7d80731ae1b2435"
  instance_type = "t2.micro"
  key_name      = "gladveen"

  connection {
    type        = "ssh" // here we have to mention the connection type SSH or WinRM.
    user        = "ubuntu"
    private_key = file("~/Downloads/gladveen.pem") // Key path.
    host        = self.public_ip
  } // We should use connection first to connect with the instance, afterwards only we can use remote-exec.

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install apache2 -y",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2",
      "sudo echo '<h1> Deployed via Terraform </h1>' | sudo tee /var/www/html/index.html",
    ]
  } // Here we are using inline to run multiple commands. We can also use script to run a single script file.

  tags = {
    Name = "Surendhar"
  }
}

output "instance_ip" {
  value = "http://${aws_instance.remote.public_ip}:80"
}