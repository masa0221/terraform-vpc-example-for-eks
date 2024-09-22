output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet" {
  value = module.vpc.subnet
}

output "security_groups" {
  value = module.vpc.security_groups
}

output "route_tables" {
  value = {
    public : module.vpc.route_tables.public,
    private : module.nat_gateway.route_tables.private
  }
}

output "gateways_public" {
  value = module.vpc.gateways
}

output "gateways_private" {
  value = module.nat_gateway.gateways
}

