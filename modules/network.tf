resource "aws_vpc" "vpc1" {
  tags = {
    Name = var.vpc_data.name
  }
  cidr_block = var.vpc_data.cidr_block
}

resource "aws_subnet" "sub_tf" {
  count = length(var.sub_data.sub_names)
  tags = {
    Name = var.sub_data.sub_names[count.index]
  }
  cidr_block = var.sub_data.sub_cidr[count.index]
  vpc_id     = aws_vpc.vpc1.id
}

