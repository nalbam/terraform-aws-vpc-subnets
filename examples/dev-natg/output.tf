# output

output "vpc_id" {
  value = module.subnets.vpc_id
}

output "public_subnet_ids" {
  value = module.subnets.public_subnet_ids
}

output "public_subnet_cidr" {
  value = module.subnets.public_subnet_cidr
}

output "public_subnet_azs" {
  value = module.subnets.public_subnet_azs
}

output "public_route_table_ids" {
  value = module.subnets.public_route_table_ids
}

output "private_subnet_ids" {
  value = module.subnets.private_subnet_ids
}

output "private_subnet_cidr" {
  value = module.subnets.private_subnet_cidr
}

output "private_subnet_azs" {
  value = module.subnets.private_subnet_azs
}

output "private_route_table_ids" {
  value = module.subnets.private_route_table_ids
}
