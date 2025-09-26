provider "aws" {
  region = "us-east-1"
}

# यह एक सर्वर बनाएगा
resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro" # Free tier

  # सर्वर स्टार्ट होते ही यह स्क्रिप्ट चलेगी
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              service docker start
              # Docker Hub से हमारी इमेज डाउनलोड करके चलाओ
              docker run -d -p 80:80 --rm -e ENV_COLOR=${var.env_color} your_dockerhub_username/my-flask-app:${var.docker_image_tag}
              EOF

  tags = {
    Name  = "WebServer-${var.env_color}"
  }
}