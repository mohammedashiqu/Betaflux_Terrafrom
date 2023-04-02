
resource "aws_dynamodb_table" "terraform-lock-dynamo" {
  name = "lock-db"
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}