resource "aws_instance" "server" {
    ami = "ami-0a7d80731ae1b2435"
    instance_type = "t2.micro"
    key_name = "gladveen"
    depends_on = [ aws_s3_bucket.logs ]

    lifecycle {
        ignore_changes = [ tags ]
    }
}

resource "aws_s3_bucket" "logs" {
    bucket = "my-app-logs-bucket-sep28th-2026"
}

// ec2 instance is depends_on s3 bucket. once the s3 bucket is created after that only ec2 instance will be created.

// explicit : depends_on - used for resources which are not directly related to each other.
// implicit : attribute reference - when one resource attribute is used in another resource attribute. It will detect the relationship between them automatically. 