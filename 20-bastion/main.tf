resource "aws_instance" "bastion" {
  ami                    = local.ami_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id              = local.public_subnet_ids
  iam_instance_profile   = aws_iam_instance_profile.bastion.name

  # Root Block Device Configuration 
  root_block_device {
    volume_size = 50
    volume_type = "gp2"
  }

  user_data = file("bastion.sh")

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-bastion"
    }
  )
}

resource "aws_iam_instance_profile" "bastion" {
  name = "bastion"
  role = "BastionTerraformAdmin"
}

resource "aws_ssm_parameter" "bastion_public_ip" {
  name  = "/${var.project_name}/${var.environment}/bastion-public-ip"
  type  = "String"
  value = aws_instance.bastion.public_ip
}
