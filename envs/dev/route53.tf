# Hosted zone used for app domain
data "aws_route53_zone" "main" {
  name = "bilalyasin.com."
}
