variable "instance_type" {
  type        = string
  description = "Type of EC2 instance to create"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = null
}