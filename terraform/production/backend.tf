terraform {
  backend "s3" {
    bucket         = "alex-premo-terraform-state"
    key            = "alex_premo_prod/alex-premo-terraform-state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "alexpremoProdDB"
  }
}