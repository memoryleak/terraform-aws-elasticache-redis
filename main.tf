resource "aws_security_group" "redis" {
  vpc_id = "${var.vpc_id}"

  tags = "${var.tags}"
}

resource "aws_elasticache_subnet_group" "default" {
  name        = "${var.name}-SG"
  description = "Private subnets for the ElastiCache instances: ${var.name}"
  subnet_ids  = ["${split(",", var.private_subnet_ids)}"]
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "${lower(var.cluster_id)}"
  engine               = "redis"
  engine_version       = "${var.engine_version}"
  maintenance_window   = "${var.maintenance_window}"
  node_type            = "${var.instance_type}"
  num_cache_nodes      = "1"
  parameter_group_name = "${var.parameter_group_name}"
  port                 = "${var.port}"
  subnet_group_name    = "${aws_elasticache_subnet_group.default.name}"
  security_group_ids   = ["${aws_security_group.redis.id}"]

  tags = "${var.tags}"
}
