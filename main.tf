provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  # Attach the security group
  security_groups = [aws_security_group.instance_sg.name]

  # Add a tag
  tags = {
    Name = "WebServer"
  }
}
