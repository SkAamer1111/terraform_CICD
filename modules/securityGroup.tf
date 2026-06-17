# web security group crating
resource "aws_security_group" "web" {
  tags = {
    Name = var.web_sec_data.name
  }
  description = var.web_sec_data.description
  vpc_id      = aws_vpc.vpc1.id

  depends_on = [aws_vpc.vpc1]
}

# giving inbound 80, 22 and outbound rule  all to web security group

resource "aws_security_group_rule" "web_rule" {

  count             = length(var.web_sec_data.rule)
  type              = var.web_sec_data.rule[count.index].type
  from_port         = var.web_sec_data.rule[count.index].from_port
  to_port           = var.web_sec_data.rule[count.index].to_port
  protocol          = var.web_sec_data.rule[count.index].protocol
  cidr_blocks       = [var.web_sec_data.rule[count.index].cidr_blocks]
  security_group_id = aws_security_group.web.id
  depends_on        = [aws_security_group.web]
}



# app security group crating
resource "aws_security_group" "app" {
  tags = {
    Name = var.app_sec_data.name
  }
  description = var.app_sec_data.description
  vpc_id      = aws_vpc.vpc1.id

  depends_on = [aws_vpc.vpc1]
}

# giving inbound 80, 22 and outbound rule  all to web security group

resource "aws_security_group_rule" "app_rule" {

  count             = length(var.app_sec_data.rule)
  type              = var.app_sec_data.rule[count.index].type
  from_port         = var.app_sec_data.rule[count.index].from_port
  to_port           = var.app_sec_data.rule[count.index].to_port
  protocol          = var.app_sec_data.rule[count.index].protocol
  cidr_blocks       = [var.app_sec_data.rule[count.index].cidr_blocks]
  security_group_id = aws_security_group.app.id
  depends_on        = [aws_security_group.app]
}



# web security group crating
resource "aws_security_group" "db" {
  tags = {
    Name = var.db_sec_data.name
  }
  description = var.db_sec_data.description
  vpc_id      = aws_vpc.vpc1.id

  depends_on = [aws_vpc.vpc1]
}

# giving inbound 80, 22 and outbound rule  all to web security group

resource "aws_security_group_rule" "db_rule" {

  count             = length(var.db_sec_data.rule)
  type              = var.db_sec_data.rule[count.index].type
  from_port         = var.db_sec_data.rule[count.index].from_port
  to_port           = var.db_sec_data.rule[count.index].to_port
  protocol          = var.db_sec_data.rule[count.index].protocol
  cidr_blocks       = [var.db_sec_data.rule[count.index].cidr_blocks]
  security_group_id = aws_security_group.db.id
  depends_on        = [aws_security_group.db]
}