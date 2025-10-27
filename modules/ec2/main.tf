# modules/ec2/main.tf
resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip
  user_data                   = var.user_data

  tags = merge(
    {
      Name = "${var.project}-${var.env}-${var.instance_name}"
    },
    var.extra_tags
  )
}
