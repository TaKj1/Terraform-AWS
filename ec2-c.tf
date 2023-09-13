resource "aws_instance" "ec2_c" {
    ami = "ami-04e601abe3e1a910f" # ubuntu server 22.04
    instance_type = "t2.medium"
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.sg_jenkins.id]
    key_name = "aws-ubuntu1"

    tags = {
      "Name" = "ec2_c"
    }


}