variable "repo" {}       
variable "role_name" {}
variable "environment" { 
    default = null 
    }  
variable "policy_json" { 
    default = null 
    } 

# Create the GitHub OIDC IdP once per account
resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"] # GitHub’s current root
}

# iam policy document
data "aws_iam_policy_document" "trust" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals { 
        type = "Federated" 
        identifiers = [aws_iam_openid_connect_provider.github.arn] 
        }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    # branch OR environment trust
    dynamic "condition" {
      for_each = var.environment == null ? [] : [1]
      content {
        test     = "StringLike"
        variable = "token.actions.githubusercontent.com:sub"
        values   = ["repo:${var.repo}:environment:${var.environment}"]
      }
    }
  }
}

# iam role 
resource "aws_iam_role" "gha" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.trust.json
}

# Attach inline policy (start simple; tighten later)
resource "aws_iam_role_policy" "inline" {
  role   = aws_iam_role.gha.id
  policy = coalesce(var.policy_json, jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = ["eks:*","ec2:*","elasticloadbalancing:*","iam:PassRole",
                  "rds:*","secretsmanager:*","logs:*","autoscaling:*","s3:*"],
      Resource = "*"
    }]
  }))
}

#output
output "role_arn" { 
    value = aws_iam_role.gha.arn 
    }
