output "alb_endpoint" {
  value = module.alb.alb_endpoint
}

output "mysql_endpoint" {
  value = module.rds.mysql_endpoint_dns
}

# output "vpc_id" {
#   value = data.aws_vpc.vpc.id
# }

# output "public_subnet_ids" {
#   value = data.aws_subnet_ids.public.ids
# }

# output "private_subnet_ids" {
#   value = data.aws_subnet_ids.private.ids
# }

