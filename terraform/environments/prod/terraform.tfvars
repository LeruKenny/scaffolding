# ------------------------------------------------------------
# Networking Settings
# ------------------------------------------------------------
aws_region = "us-east-1"
vpc_cidr_block = "10.0.0.0/16"
prod1_subnet_az = "us-east-1a"
prod1_subnet_cidr_block = "10.0.1.0/24"
prod2_subnet_az = "us-east-1b"
prod2_subnet_cidr_block = "10.0.2.0/24"
# ------------------------------------------------------------
# EKS Cluster Settings
# ------------------------------------------------------------
cluster_name = "prod-cluster"
cluster_version = "1.22"
worker_group_name = "prod-worker-group-1"
worker_group_instance_type = [ "t3.medium" ]
autoscaling_group_min_size = 1
autoscaling_group_max_size = 3
autoscaling_group_desired_capacity = 2
# ------------------------------------------------------------
# Jenkins Settings
# ------------------------------------------------------------
jenkins_admin_user = "admin"
jenkins_admin_password = "admin_password"