provider "aws" {
  region = "us-east-1"
}

# Make a server
resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro" # Free tier

  # Start the server and run this script
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              service docker start
              # Download the image form DockerHub
              docker run -d -p 80:80 --rm -e ENV_COLOR=${var.env_color} your_dockerhub_username/my-flask-app:${var.docker_image_tag}
              EOF

  tags = {
    Name  = "WebServer-${var.env_color}"
  }
}
