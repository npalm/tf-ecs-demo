output "launch_configuration" {
  value = "${aws_launch_configuration.ecs_instance.id}"
}

output "asg_name" {
  value = "${aws_autoscaling_group.ecs_instance.id}"
}

#
# output "lb_hostname" {
#   value = "${aws_alb.main.dns_name}"
# }

output "cluster_id" {
  value = "${aws_ecs_cluster.main.id}"
}

output "ecs_service_role_name" {
  value = "${aws_iam_role.ecs_service.name}"
}
