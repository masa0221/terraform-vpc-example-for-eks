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
    }
  }
}

output "gateways" {
  value = {
    igw : {
      id : aws_internet_gateway.public.id
    }
  }
}

output "security_groups" {
  value = {
    cluster_shared_node : {
      id : aws_security_group.cluster_shared_node.id
    }
  }
}

