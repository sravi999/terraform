resource "aws_vpc" "vpc" {
cidr_block=var.vpc_cidr
tags = merge(
{
"Name" = format("%s", var.name)
},
var.vpc_tags
)
}
