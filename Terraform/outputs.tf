output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_app_subnets" {
  value = aws_subnet.private_app[*].id
}

output "private_db_subnets" {
  value = aws_subnet.private_db[*].id
}

output "rds_endpoint" {
  value = aws_db_instance.mysql.endpoint
}

output "rds_db_name" {
  value = aws_db_instance.mysql.db_name
}
output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}
