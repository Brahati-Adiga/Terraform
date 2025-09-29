resource "aws_s3_bucket" "s3-bucket" {
  bucket              = var.bucket_name # Replace with a globally unique bucket name
  object_lock_enabled = var.object_lock_enabled

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform_locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "terraform_locks"
  }
}
