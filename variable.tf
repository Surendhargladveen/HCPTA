// list

# variable "instance_size" {
#     type = list(string)
#     default = ["t2.medium","t2.micro","t2.small"]
# }


// map

variable "instance_size" {
  type = map(string)
  default = {
    "us" = "t2.micro",
    "uk" = "t2.small",
    "in" = "t2.medium"
  }
}