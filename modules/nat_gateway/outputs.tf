output "gateways" {
  value = {
    nat : {
      id : aws_nat_gateway.private.id,
      allocation_id : aws_nat_gateway.private.allocation_id,
      eip : aws_eip.natip.public_ip,
      subnet_id : aws_nat_gateway.private.subnet_id
    }
  }
}

output "route_tables" {
  value = {
    private : {
      for k, v in aws_route_table.private : k => {
        id : v.id,
        # route : v.route
      }
    }
  }
}

