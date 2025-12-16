locals {
  default_tags = {
    CreatedBy   = "Terraform"
    Environment = "dev"
    Project     = "apex-fitness"
  }
}

# Hosted zone used for app domain
data "aws_route53_zone" "main" {
  name = "bilalyasin.com."
}

# -----------------------------
# Frontend App
# -----------------------------
locals {
  frontend = {
    cloudfront_name    = "apex-fitness-dev"
    origin_bucket_name = "apex-fitness-build-dev"

    domain = "apex-fitness-dev.bilalyasin.com"
    san    = ["www.apex-fitness-dev.bilalyasin.com"]

    price_class = "PriceClass_100"

    restrictions = {
      type      = "whitelist"
      locations = ["GB"]
    }
  }
}

module "app_cloudfront" {
  source = "git::https://github.com/bilalyasin889/cloudfront_s3.git?ref=v1.0.2"

  name        = local.frontend.cloudfront_name
  bucket_name = local.frontend.origin_bucket_name

  domain_name               = local.frontend.domain
  subject_alternative_names = local.frontend.san

  hosted_zone_id = data.aws_route53_zone.main.zone_id

  price_class  = local.frontend.price_class
  restrictions = local.frontend.restrictions

  tags = local.default_tags
}
