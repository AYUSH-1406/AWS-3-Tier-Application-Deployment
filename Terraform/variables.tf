variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "azs" {
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "db_name" {
  default = "transactions"
}

variable "db_username" {
  default = "appuser"
}

variable "db_password" {
  description = "RDS DB password"
  sensitive   = true
}

variable "db_instance_class" {
  default = "db.t3.micro"
}

variable "cluster_name" {
  default = "three-tier-eks"
}

variable "eks_version" {
  default = "1.32"
}

variable "node_instance_type" {
  default = "m7i-flex.large"
}

variable "node_desired_size" {
  default = 2
}

variable "node_min_size" {
  default = 1
}

variable "node_max_size" {
  default = 3
}
