resource "aws_security_group" "allow_tfe" {
  name        = "allow tfe"
  description = "Allow TLS inbound traffic and all outbound traffic"
  tags = {
    Name = "allow tfe"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "server" {
  ami                     = "ami-09c813fb71547fc4f"
  instance_type           = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tfe.id]

  tags = {
    name = "adarsh"
  }
}
