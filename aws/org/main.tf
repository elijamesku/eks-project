resource "aws_organizations_organization" "org" {
  feature_set = "ALL"
}

# Creating workload accounts 
resource "aws_organizations_account" "dev" {
  name  = "dev"
  email = var.dev_email

}

resource "aws_organizations_account" "staging" {
  name  = "staging"
  email = var.staging_email

}

resource "aws_organizations_account" "prod" {
  name  = "prod"
  email = var.prod_email

}

variable "dev_email" {
  type        = string
  description = "Email for the staging AWS account"
  default     = "elijahjames133@gmail.com"
}

variable "staging_email" {
  type        = string
  description = "Email for the staging AWS account"
  default     = "ejames@lead.bank"

}

variable "prod_email" {
  type        = string
  description = "Email for the prod AWS account"
  default     = "elijames@ku.edu"
}