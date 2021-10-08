provider "aws" {
  region = "us-east-1"
}

resource "aws_organizations_delegated_administrator" "cloudformation_delegated_admin" {
  account_id        = "251999700057"
  service_principal = "member.org.stacksets.cloudformation.amazonaws.com"
}
