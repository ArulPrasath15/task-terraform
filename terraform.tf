terraform {
  backend "s3" {
    bucket = "arul-remote-tfstate"
    key    = "assign5/tf-state"
    region = "us-east-1"
    # dynamodb_table = "arul-tf-lock-assign5"  
  }
}