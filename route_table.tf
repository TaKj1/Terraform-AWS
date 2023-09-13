resource "aws_route_table" "rt_jenkins" {
  vpc_id = aws_vpc.jenkins_vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gt_jenkins.id


  }
  tags = {
    "Name" = "rt_jenkins"
  }
}