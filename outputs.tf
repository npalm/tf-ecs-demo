output "bastion_public_ip" {
  value = "${module.bastion.public_ip}"
}

output "graphql_url" {
  value = "${lower(module.graphql.service_url)}"
}

output "aws_url" {
  value = "${lower(module.aws.service_url)}"
}

output "blow_url" {
  value = "${lower(module.blog.service_url)}"
}
