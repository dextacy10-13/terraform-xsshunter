/*
1. Setuo ec2 instance
2. Setup DNS
- zone-
- server with *.domain.com cname to domain.com with A record to server
- need an image/server with software installed on it -
 - postfix
 - nginx
 - postgres
 sudo apt-get install git
git clone https://github.com/mandatoryprogrammer/xsshunter
*/
# The default provider configuration
provider "aws" {
  version = "2.59.0"
  region  = var.region
}

# enter a route 53 record for our cdn
resource "aws_route53_record" "status_cdn_alias" {
  zone_id = var.zone_id
  name    = var.bucket_name
  type    = "A"

  alias {
    name = "${aws_cloudfront_distribution.site.domain_name}"
    zone_id = "${aws_cloudfront_distribution.site.hosted_zone_id}"
    evaluate_target_health = false
  }
}