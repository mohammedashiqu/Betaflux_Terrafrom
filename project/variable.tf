## Common Variable
variable "customer_id" {
  description = "Project Customer ID"
  type        = string
  default     = ""
}
variable "region" {
  description = "Project Region Name"
  type        = string
  default     = ""
}
variable "region_code" {
  description = "Project Region Code"
  type        = string
  default     = ""
}
variable "environment" {
  description = "Project Environment"
  type        = string
  default     = ""
}
variable "managed_by" {
  description = "Project Managed Organaization"
  type        = string
  default     = ""
}

## VPC Variable
variable "vpc_cidr" {
  description = "VPC CIDR ID"
  type        = string
  default     = ""
}
variable "resource_1" {
  description = "Resource 1 Name"
  type        = string
  default     = ""
}

## Public Subnet Variable
variable "public_subnet_cidr" {
  description = "Public subnet CIDR Range"
  type        = list(string)
  default     = [""]
}
variable "resource_2" {
  description = "Resource 2 Name"
  type        = string
  default     = ""
}
variable "public_availability_zone" {
  description = "Public Subnet Availability Zone"
  type        = list(string)
  default     = [""]
}

## Private Subnet Variable
variable "private_subnet_cidr" {
  description = "Priavte Subnet CIDR Range"
  type        = list(string)
  default     = [""]
}
variable "resource_3" {
  description = "Resource 3 Name"
  type        = string
  default     = "PVTSUB"
}
variable "private_availability_zone" {
  description = "Private Subnet Availability Zone"
  type        = list(string)
  default     = [""]
}

## IGW Variable
variable "resource_4" {
  description = "Resource 4 Name"
  type        = string
  default     = ""
}

## EIP Variable
variable "resource_5" {
  description = "Resource 5 Name"
  type        = string
  default     = ""
}
variable "eip_count" {
  description = "Count of EIP"
  type        = number
  default     = 3
}

## NAT Gateway Variable
variable "resource_6" {
  description = "Resource 6 Name"
  type        = string
  default     = ""
}

variable "nat_count" {
  description = "NAT Count"
  type        = number
  default     = 3
}

## Public Route Table variable
variable "resource_7" {
  description = "Public Route Table"
  type        = string
  default     = ""
}
## Defining Public Route Table Association
variable "public_route_table_asso_count" {
  description = "Public Route Table Asso"
  type        = number
  default     = 3
}

## Private Route Table Variable
variable "resource_8" {
  description = "Resource Name"
  type        = string
  default     = ""
}

## Defining Private Route Table Association
variable "private_route_table_asso_count" {
  description = "Private Route Table Asso"
  type        = number
  default     = 3
}

variable "private_route_table_count" {
  description = "Private Route Table Count"
  type        = number
  default     = 3
}

