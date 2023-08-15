# resource "aws_instance" "jupyter" {
#   count           = 2
#   ami             = data.aws_ami.amazon-linux-2.id
#   instance_type   = "t2.micro"
#   security_groups = [aws_security_group.vuln_sg.id]
#   subnet_id       = aws_subnet.public[0].id
#   user_data       = file("user_data/jupyter-user-data.sh")
#   key_name        = var.key_name

#   tags = {
#     Name = "jupyter notebook"
#   }
# }
