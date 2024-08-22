output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet" {
  value = {
    public : { for k, v in aws_subnet.public : k => v.id },
    private : { for k, v in aws_subnet.private : k => v.id }
  }
}

output "route_tables" {
  value = {
    public : {
      id : aws_route_table.public.id
      # route : aws_route_table.public.route
    },
    private : {
      for k, v in aws_route_table.private : k => {
        id : v.id,
        # route : v.route
      }
    }
  }
}

output "gateways" {
  value = {
    igw : {
      id : aws_internet_gateway.public.id,
    },
    # nat : {
    #   id : aws_nat_gateway.private.id,
    #   allocation_id : aws_nat_gateway.private.allocation_id,
    #   eip : aws_eip.for_nat.public_ip,
    #   subnet_id : aws_nat_gateway.private.subnet_id,
    # }
  }
}

output "security-groups" {
  value = {
    cluster_shared_node : {
      id : aws_security_group.cluster_shared_node.id
    },
    rds : {
      id : aws_security_group.rds.id
    },
  }
}
