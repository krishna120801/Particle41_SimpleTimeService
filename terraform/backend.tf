terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-5378"
    key            = "particle/terraform.tfstate"
    region         = "us-west-2"                 
    dynamodb_table = "particle-terraform-locks"
    encrypt        = true
  }
}
