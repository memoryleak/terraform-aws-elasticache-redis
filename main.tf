resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "${lower(var.cluster_id)}"
  engine               = "redis"
  engine_version       = "${var.engine_version}"
  maintenance_window   = "${var.maintenance_window}"
  node_type            = "${var.instance_type}"
  num_cache_nodes      = "1"
  parameter_group_name = "${var.parameter_group_name}"
  port                 = "${var.port}"
  subnet_group_name    = "${var.subnet_group_name}"
  security_group_ids   = ["${var.security_group_ids}"]

  tags = "${var.tags}"
}
