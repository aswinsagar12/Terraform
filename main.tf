provider "aws" {
  region = "us-west-1"
}

resource "aws_security_group" "instance_sg" {
  name_prefix = "allow-ssh-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch an EC2 instance
resource "aws_instance" "web_server" {
  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  # Attach the security group
  security_groups = [aws_security_group.instance_sg.name]

  # Add a tag
  tags = {
    Name = "MyWebServer"
  }
}
