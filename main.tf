module "ec2" {
  source = "./modules"
  # defininf vpc data

  vpc_data = {
    name       = "vpc_tf"
    cidr_block = "10.10.0.0/16"
  }

  # defining subnet data

  sub_data = {
    sub_names = ["public", "private"]
    sub_cidr  = ["10.10.0.0/24", "10.10.1.0/24"]
  }

  # defininf web security group

  web_sec_data = {
    name        = "web"
    description = "web security group"
    rule = [{
      type        = "ingress"
      from_port   = 22
      to_port     = 22
      protocol    = "TCP"
      cidr_blocks = "0.0.0.0/0"
      },
      {
        type        = "ingress"
        from_port   = 80
        to_port     = 80
        protocol    = "TCP"
        cidr_blocks = "0.0.0.0/0"
      },
      {
        type        = "egress"
        from_port   = 65536
        to_port     = 65536
        protocol    = "-1"
        cidr_blocks = "0.0.0.0/0"
    }]
  }



  app_sec_data = {
    name        = "app"
    description = "app security group"
    rule = [{
      type        = "ingress"
      from_port   = 22
      to_port     = 22
      protocol    = "TCP"
      cidr_blocks = "0.0.0.0/0"
      },
      {
        type        = "ingress"
        from_port   = 8080
        to_port     = 8080
        protocol    = "TCP"
        cidr_blocks = "0.0.0.0/0"
      },
      {
        type        = "egress"
        from_port   = 65536
        to_port     = 65536
        protocol    = "-1"
        cidr_blocks = "0.0.0.0/0"
    }]

  }

  db_sec_data = {
    name        = "db"
    description = "db security group"
    rule = [{
      type        = "ingress"
      from_port   = 3306
      to_port     = 3306
      protocol    = "TCP"
      cidr_blocks = "0.0.0.0/0"
      },
      {
        type        = "egress"
        from_port   = 65536
        to_port     = 65536
        protocol    = "-1"
        cidr_blocks = "0.0.0.0/0"
    }]

  }


  igw_name = "igw_tf"

  route_table_data = {
    name        = "route_tf"
    route1_cidr = "0.0.0.0/0"
    route2 = {
      cidr_block = "10.10.0.0/16"
      gateway_id = "local"
    }
  }

  subnet_asco_data = {
    name   = "tag:Name"
    values = "public"
  }

  key_data = {
    name       = "key_tf"
    public_key = "~/keys/id_rsa.pub"
  }

  instance_data = {
    name          = "ec2-tf"
    ami           = "ami-06259b63260eddc13"
    instance_type = "t3.micro"
  }



}
