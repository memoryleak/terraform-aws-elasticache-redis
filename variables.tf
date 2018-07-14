variable "cluster_id" {}

variable "vpc_id" {}

variable "private_subnet_ids" {}

variable "engine_version" {
  default = "2.8.24"
}

variable "parameter_group_name" {
  default = "default.redis2.8"
}

variable "instance_type" {
  default = "cache.m3.medium"
}

variable "maintenance_window" {
  # SUN 01:00AM-02:00AM ET
  default = "sun:05:00-sun:06:00"
}

# tags
variable "tags" {
  description = "A mapping of tags to assign to all resources"
  default     = {}
}

variable "name" {
  description = "Name for the Redis instance"
}

variable "port" {
  default = "6379"
}
