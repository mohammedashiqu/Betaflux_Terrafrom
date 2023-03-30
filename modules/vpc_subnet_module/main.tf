## Defining local variable
locals {
  prefix = "BF-${var.customer_id}-${var.environment}-${var.region_code}"
}

## Defining VPC
resource "aws_vpc" "vpc" {
  cidr_block   = var.vpc_cidr
  tags = {
    Name       = "${local.prefix}-${var.resource_1}-1"
    Region     = var.region
    Env        = var.environment
    Created_on = timestamp()
    Managed_by = var.managed_by
    Resource   = var.resource_1
  }
}

## Defining Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  count                   = length(var.public_subnet_cidr)
  cidr_block              = var.public_subnet_cidr[count.index]
  map_public_ip_on_launch = true
  availability_zone       = var.public_availability_zone[count.index]
  tags = {
    Name       = "${local.prefix}-${var.resource_2}-${count.index + 1}"
    Region     = var.region
    Env        = var.environment
    Created_on = timestamp()
    Managed_by = var.managed_by
    Resource   = var.resource_2
  }
}

## Defining Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  count                   = length(var.private_subnet_cidr)
  cidr_block              = var.private_subnet_cidr[count.index]
  map_public_ip_on_launch = true
  availability_zone       = var.private_availability_zone[count.index]
  tags = {
    Name       = "${local.prefix}-${var.resource_3}-${count.index + 1}"
    Region     = var.region
    Env        = var.environment
    Created_on = timestamp()
    Managed_by = var.managed_by
    Resource   = var.resource_3
  }
}

## Defining Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name       = "${local.prefix}-${var.resource_4}-1"
    Region     = var.region
    Env        = var.environment
    Created_on = timestamp()
    Managed_by = var.managed_by
    Resource   = var.resource_4
  }
}

## Defining Elastic IP
resource "aws_eip" "eip" {
  count = var.eip_count
  vpc   = true
  tags = {
    Name       = "${local.prefix}-${var.resource_5}-${count.index + 1}"
    Region     = var.region
    Env        = var.environment
    Created_on = timestamp()
    Managed_by = var.managed_by
    Resource   = var.resource_5
  }
}

## Defining NAT Gateway
resource "aws_nat_gateway" "ngw" {
  count         = var.nat_count
  subnet_id     = aws_subnet.public_subnet[count.index].id
  allocation_id = aws_eip.eip[count.index].id
  tags = {
    Name       = "${local.prefix}-${var.resource_6}-${count.index + 1}"
    Region     = var.region
    Env        = var.environment
    Created_on = timestamp()
    Managed_by = var.managed_by
    Resource   = var.resource_6
  }
}

## Defining Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name       = "${local.prefix}-${var.resource_7}-1"
    Region     = var.region
    Env        = var.environment
    Created_on = timestamp()
    Managed_by = var.managed_by
    Resource   = var.resource_7
  }
}
## Defining Public Route Table Association
resource "aws_route_table_association" "pub_sub_pub_rt_asso" {
  count          = var.public_route_table_asso_count
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet[count.index].id
}

## Defining Private Route Table
resource "aws_route_table" "private_route_table" {
  count  = var.private_route_table_count
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name       = "${local.prefix}-${var.resource_8}-${count.index + 1}"
    Region     = var.region
    Env        = var.environment
    Created_on = timestamp()
    Managed_by = var.managed_by
    Resource   = var.resource_8
  }
}

## Defining Private Route Table Association
resource "aws_route_table_association" "pvt_sub_pvt_rt_asso" {
  count          = var.private_route_table_asso_count
  route_table_id = aws_route_table.private_route_table[count.index].id
  subnet_id      = aws_subnet.private_subnet[count.index].id
}

## Definfing public subnet route to igw
resource "aws_route" "pub_subnet_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

## Defining private subnet route to igw
resource "aws_route" "pvt_subnet_route" {
  count = 3
  route_table_id         = aws_route_table.private_route_table[count.index].id
  nat_gateway_id         = aws_nat_gateway.ngw[count.index].id
  destination_cidr_block = "0.0.0.0/0"
}