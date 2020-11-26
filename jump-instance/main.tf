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

resource "aws_vpc" "main3" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main3" {
  vpc_id     = "${aws_vpc.main3.id}"
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "jump_subnet"
  }
}



resource "aws_security_group" "app_allow_tls" {
  name        = "app_allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main3.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jump_allow_tls"
  }
}

resource "aws_instance" "jump_host" {
  ami           = "${data.aws_ami.latest_ecs.id}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.tf_demo2.key_name}"


  tags = {
    Name = "jump_host"
  }
}

