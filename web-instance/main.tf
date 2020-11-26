data "aws_ami" "latest_ecs" {
  most_recent = true

  filter {
    name   = "name"
    values = ["*amazon-ecs-optimized"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["591542846629"] # AWS
}

resource "aws_key_pair" "tf_demo2" {
  key_name   = "tf_demo2"
  public_key = "${file("tf_demo2.pub")}"
}

resource "aws_vpc" "main1" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main1" {
  vpc_id     = "${aws_vpc.main1.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "web_subnet"
  }
}



resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main1.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.latest_ecs.id}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.tf_demo2.key_name}"
  user_data     = <<-EOF
                  #!/bin/bash
                  sudo su
                  yum -y install httpd
                  echo "<p> My Instance! </p>" >> /var/www/html/index.html
                  sudo service  httpd enable
                  sudo service  httpd start
                  sudo yum -y install curl
                  EOF

  tags = {
    Name = "web_instance"
  }
}
