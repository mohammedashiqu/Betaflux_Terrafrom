## Common Variable
customer_id = "KN"
region      = "us-east-2"
region_code = "NV"
environment = "PROD"
managed_by  = "BETAFLUX"

## VPC Variable
vpc_cidr   = "10.0.0.0/16"
resource_1 = "VPC"

## Public Subnet Variable
public_subnet_cidr       = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24"]
resource_2               = "PUBSUB"
public_availability_zone = ["us-east-2a","us-east-2b","us-east-2c"]

## Private Subnet Variable
private_subnet_cidr       = ["10.0.3.0/24","10.0.4.0/24","10.0.5.0/24"]
resource_3                = "PVTSUB"
private_availability_zone = ["us-east-2a","us-east-2b","us-east-2c"]

## IGW Variable
resource_4 = "IGW"

## EIP Variable
resource_5 = "EIP"
eip_count = 3

## NAT Gateway Variable
resource_6 = "NAT"
nat_count = 3

## Public Route Table variable
resource_7 = "PUBRT"

## Defining Public Route Table Association
public_route_table_asso_count = 3

## Private Route Table Variable
resource_8 = "PVTRT"
private_route_table_count = 3

## Defining Public Route Table Association
private_route_table_asso_count = 3