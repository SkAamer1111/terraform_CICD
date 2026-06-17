resource "aws_key_pair" "key" {
  key_name   = var.key_data.name
  public_key = file(var.key_data.public_key)
}

resource "aws_instance" "ec2" {
  tags = {
    Name = var.instance_data.name
  }
  ami                         = var.instance_data.ami
  associate_public_ip_address = true
  instance_type               = var.instance_data.instance_type
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.aws_subnet.route_sub.id
  vpc_security_group_ids      = [aws_security_group.app.id]

}
