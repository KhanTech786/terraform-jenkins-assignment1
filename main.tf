provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my-terraforms-server" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"

  tags = {
    Name = "Jenkins-Assignment"
    CreatedBy = "Terraform/Jenkins"
  }
}

terraform {
  backend "s3" {
    bucket = "khans-terraform-state-files/jenkins-tf-assignment1/"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-lock"
  }
}

# data "aws_instance" "mytfvpc" {
#    filter {
#     name   = "tag:Name"
#     values = ["Jenkins-Maven-Server"]
#   }
# }

# output "jenkins_instance" {
#   description = "intance value"
#   value = data.aws_instance.mytfvpc.arn
# }