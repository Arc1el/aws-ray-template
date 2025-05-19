variable "vpc_id" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
  default = "t3.small"
}
variable "key_name" {
  type = string
} 