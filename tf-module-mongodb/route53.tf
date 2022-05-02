resource "aws_route53_record" "record" {
  zone_id = data.terraform_remote_state.vpc.outputs.HOSTEDZONE_PRIVATE_ID
  name    = "mongodb-${var.ENV}.${data.terraform_remote_state.vpc.outputs.HOSTEDZONE_PRIVATE_ZONE}"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_docdb_cluster.docdb.endpoint]
}
