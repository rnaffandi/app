provider "aws" {
  region = "ap-southeast-2" # Change to your desired AWS region
}

resource "aws_instance" "instance-app" {
  ami           = "ami-002843b0a9e09324a"  # Canonical, Ubuntu, 20.04 LTS, amd64 focal image build on 2023-05-17

  instance_type = "t2.micro"
  tags = {
    Name = "instance-app"
  }
}

resource "aws_instance" "instance-proxy" {
  ami           = "ami-002843b0a9e09324a"  # Canonical, Ubuntu, 20.04 LTS, amd64 focal image build on 2023-05-17
  instance_type = "t2.micro"
  tags = {
    Name = "instance-proxy"
  }
}