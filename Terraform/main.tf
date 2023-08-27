provider "aws" {
  region = "ap-southeast-2" # Change to your desired AWS region
}

resource "aws_instance" "instance-app" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID for your desired region
  instance_type = "t2.micro"
  tags = {
    Name = "instance-app"
  }
}

resource "aws_instance" "instance-proxy" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID for your desired region
  instance_type = "t2.micro"
  tags = {
    Name = "instance-proxy"
  }
}