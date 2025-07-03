### DATA IMPORT
data "aws_ami" "amazon_linux_2023_x86" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"] # O curinga (*) é útil caso o nome exato mude ligeiramente
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  # Opcional: Se você quiser garantir que o kernel seja 6.1
  filter {
    name   = "description"
    values = ["*kernel-6.1*"]
  }
}

data "aws_vpc" "available" {
  tags = var.resource_tags
}

data "aws_subnets" "subnet-public" {
  filter {
    name   = "vpc-id"
    values = ["${data.aws_vpc.available.id}"] # Substitua pelo ID da sua VPC
  }

  tags = {
    type   = "public"
  }
}

# data "aws_route53_zone" "selected" {
#   name         = "${var.host_name}"
#   private_zone = false
# }