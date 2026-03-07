variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "project_name" {
  type    = string
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "vpc_tags" {
  default = {
    Purpose    = "roboshop_vpc"
    DontDelete = "true"

  }
}

variable "public_subnet_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr" {
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "data_subnet_cidr" {
  default = ["10.0.21.0/24", "10.0.22.0/24"]
}
