resource "aws_subnet" "subnet_public" {
  count                   = length(var.subnet_public)
  vpc_id                  = aws_vpc.lab_vpc.id
  cidr_block              = var.subnet_public[count.index]
  availability_zone       = var.az[count.index]
  map_public_ip_on_launch =  true 
}

resource "aws_subnet" "subnet_private" {
  count                   = length(var.subnet_private)
  vpc_id                  = aws_vpc.lab_vpc.id
  cidr_block              = var.subnet_private[count.index]
  availability_zone       = var.az[count.index]
  map_public_ip_on_launch =  false
}