variable "project" {
  description = "Project Build Server"
  default = "Build-Server"
}

//variable "subnet_id" {
//  description = "The VPC Subnet ID to launch in."
//}
//
//variable "ssh_key" {
//  description = "The key name of the Key Pair to use for the instance."
//}
//
//variable "allowed_hosts" {
//  description = "CIDR blocks of trusted networks"
//  type        = list(string)
//  default     = ["0.0.0.0/0"]
//}
//
//variable "instance_type" {
//  description = "The type of instance to start."
//  default     = "t3.micro"
//}
//
//variable "disk_size" {
//  description = "The size of the root volume in gigabytes."
//  default     = 10
//}
//
//variable "internal_networks" {
//  type        = list(string)
//  description = "Internal network CIDR blocks."
//}
//
//data "aws_ami" "ubuntu" {
//  most_recent = true
//
//  filter {
//    name   = "name"
//    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20210430"]
//  }
//
//  owners = ["099720109477"]
//}
//
//data "aws_subnet" "public" {
//  id = local.subnet_id
//}
//
//locals {
//  vpc_id        = data.aws_subnet.public.vpc_id
//  project       = var.project
//  ami_id        = data.aws_ami.centos.id
//  disk_size     = var.disk_size
//  subnet_id     = var.subnet_id
//  ssh_key       = var.ssh_key
//  instance_type = var.instance_type
//}
