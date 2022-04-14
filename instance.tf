resource "aws_instance" "TechEC2Instance" {
    ami = var.image_id
    instance_type = var.instance_type
    key_name = "ubuntu"
    subnet_id = aws_subnet.TechVPC_Pub_SN.id
    vpc_security_group_ids = ["${aws_security_group.TechVPC_SG.id}"]
    tags = {
    Name = "NginxWeb"
  }
  user_data = "${file("nginx.sh")}"
}