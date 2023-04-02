resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_dynamodb_table" "dynamo" {
  name = "ashiqummathoor"
}