## Common Variable
variable "customer_id" {}
variable "region" {}
variable "region_code" {}
variable "environment" {}
variable "managed_by" {}

## VPC Variable
variable "vpc_cidr" {}
variable "resource_1" {}

## Public Subnet Variable
variable "public_subnet_cidr" {}
variable "resource_2" {}
variable "public_availability_zone" {}

## Private Subnet Variable
variable "private_subnet_cidr" {}
variable "resource_3" {}
variable "private_availability_zone" {}

## IGW Variable
variable "resource_4" {}

## EIP Variable
variable "resource_5" {}
variable "eip_count" {}

## NAT Gateway Variable
variable "resource_6" {}
variable "nat_count" {}

## Defining Public Route Table
variable "resource_7" {}

## Defining Public Route Table Association
variable "public_route_table_asso_count" {}

## Defining Private Route Table Association
variable "private_route_table_asso_count" {}

## Defining Private Route Table
variable "resource_8" {}
variable "private_route_table_count" {}

