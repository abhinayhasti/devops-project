provider "aws" {
  region = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"  
}

# Fetch latest Amazon Linux 2023 AMI (x86_64)
data "aws_ssm_parameter" "al2023_x86_64" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}
resource "aws_security_group" "web-server" {
  name        = "web-server"
  description = "Allow incoming HTTP Connections"

  ingress {
    from_port   = 80
    to_port     = 80
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

resource "aws_instance" "web-server" {
  ami = data.aws_ssm_parameter.al2023_x86_64.value
  instance_type          = "t2.micro"
  security_groups        = [aws_security_group.web-server.name]

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<html><h1> Welcome to Whizlabs. Happy Learning... </h1></html>" >> /var/www/html/index.html
              EOF
}

resource "aws_eip" "lb" {
  instance = aws_instance.web-server.id
  domain   = "vpc"

  depends_on = [aws_instance.web-server]
}

