resource "aws_internet_gateway" "gt_jenkins" {
  vpc_id = aws_vpc.jenkins_vpc.id
  tags ={
    "Name" = "ig_jenkins"
  }

}