resource "aws_dynamodb_table" "my_dynamo" {
  name = "my_dunamo"
  hash_key = "Employee-ID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "Employee-ID"
    type = "N"
  }
}