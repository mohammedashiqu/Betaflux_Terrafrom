module "vpc_subnet_module" {
  source = "../modules/vpc_subnet_module"

  ## Common Variable
  customer_id = var.customer_id
  region      = var.region
  region_code = var.region_code
  environment = var.environment
  managed_by  = var.managed_by

  ## VPC Variable
  vpc_cidr   = var.vpc_cidr
  resource_1 = var.resource_1

  ## Public Subnet Variable
  public_subnet_cidr       = var.public_subnet_cidr
  resource_2               = var.resource_2
  public_availability_zone = var.public_availability_zone

  ## Private Subnet Variable
  private_subnet_cidr       = var.private_subnet_cidr
  resource_3                = var.resource_3
  private_availability_zone = var.private_availability_zone

  ## IGW Variable
  resource_4 = var.resource_4

  ## EIP Variable
  resource_5 = var.resource_5
  eip_count = var.eip_count

  ## NAT Gateway Variable
  resource_6 = var.resource_6
  nat_count = var.nat_count

  ## Public Route Table variable
  resource_7 = var.resource_7

  ## Defining Public Route Table Association
  public_route_table_asso_count = var.public_route_table_asso_count

  ## Private Route Table Variable
  resource_8 = var.resource_8
  private_route_table_count = var.private_route_table_count

  ## Defining Public Route Table Association
  private_route_table_asso_count = var.private_route_table_asso_count

}