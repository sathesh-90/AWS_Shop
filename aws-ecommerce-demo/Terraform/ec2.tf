# Launch an Ubuntu EC2 instance for the application server.
resource "aws_instance" "app" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web.id]
  associate_public_ip_address = true

  tags = {
    Name = "aws-ecommerce-demo-app"
  }
}
