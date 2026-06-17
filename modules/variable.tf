# vpc input data declaration

variable "vpc_data" {
  type = object({
    name       = string
    cidr_block = string
  })
}

# subnet data declaration

variable "sub_data" {
  type = object({
    sub_names = list(string)
    sub_cidr  = list(string)
  })
}


# security group data

variable "web_sec_data" {
  type = object({
    name        = string
    description = string
    rule = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = string
    }))
  })
}


variable "app_sec_data" {
  type = object({
    name        = string
    description = string
    rule = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = string
    }))
  })
}



variable "db_sec_data" {
  type = object({
    name        = string
    description = string
    rule = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = string
    }))
  })
}




variable "igw_name" {
  type = string
}

variable "route_table_data" {
  type = object({
    name        = string
    route1_cidr = string
    route2 = object({
      cidr_block = string
      gateway_id = string

    })

  })
}


variable "subnet_asco_data" {
  type = object({
    name   = string
    values = string
  })
}


variable "key_data" {
  type = object({
    name       = string
    public_key = string
  })
}

variable "instance_data" {
  type = object({
    name          = string
    ami           = string
    instance_type = string
  })
}
