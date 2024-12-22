variable "aws_region" {
  default = "us-east-2"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "db_name" {
  type = string
  default = "homework-production"
}