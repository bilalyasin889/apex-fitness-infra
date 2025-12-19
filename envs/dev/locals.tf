locals {
  default_tags = {
    CreatedBy   = "Terraform"
    Environment = "dev"
    Project     = "apex-fitness"
  }

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