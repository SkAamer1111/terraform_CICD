resource "aws_internet_gateway" "igw_tf" {
  tags = {
    Name = var.igw_name
  }
  vpc_id = aws_vpc.vpc1.id
}

resource "aws_route_table" "route_tf" {
  tags = {
    Name = var.route_table_data.name
  }
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = var.route_table_data.route1_cidr
    gateway_id = aws_internet_gateway.igw_tf.id
  }
  route {
    cidr_block = var.route_table_data.route2.cidr_block
    gateway_id = var.route_table_data.route2.gateway_id
  }
  depends_on = [aws_internet_gateway.igw_tf]
}

data "aws_subnet" "route_sub" {
  filter {
    name   = var.subnet_asco_data.name
    values = [var.subnet_asco_data.values]
  }
  depends_on = [aws_subnet.sub_tf]
}

resource "aws_route_table_association" "asc" {
  route_table_id = aws_route_table.route_tf.id
  subnet_id      = data.aws_subnet.route_sub.id
  depends_on     = [data.aws_subnet.route_sub, aws_route_table.route_tf]

}
