provider "aws" {
  region = "ap-southeast-1" # Change to your desired AWS region
  access_key = "acces-key"
  secret_key = "secret-key"
}

resource "aws_instance" "instance-a" {
  ami           = "ami-002843b0a9e09324a"  # Canonical, Ubuntu, 20.04 LTS, amd64 focal image build on 2023-05-17
  instance_type = "t2.micro"
  key_name = "key-name"
  vpc_security_group_ids = ["${aws_security_group.ingress-all-test.id}"]
  tags = {
    Name = "instance-a"
  }
}

resource "aws_instance" "instance-b" {
  ami           = "ami-002843b0a9e09324a"  # Canonical, Ubuntu, 20.04 LTS, amd64 focal image build on 2023-05-17
  instance_type = "t2.micro"
  key_name = "key-name"
  vpc_security_group_ids = ["${aws_security_group.ingress-all-test.id}"]
  tags = {
    Name = "instance-b"
  }
}

resource "aws_security_group" "ingress-all-test" {
name = "allow-all-sg"
ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
from_port = 22
    to_port = 22
    protocol = "tcp"
  }
// Terraform removes the default rule
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}