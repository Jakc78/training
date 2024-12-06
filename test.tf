terraform { 
  required_version = "1.10.1"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.80.0"
    }
  }
  cloud { 
    
    organization = "onepoint-formation" 

    workspaces { 
      name = "tfc" 
    } 
  } 
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "Gop_training_pako"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "allow_tls_pako"
  }
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "sg_name" {
  type = string
}

variable "region" {
  type = string
}