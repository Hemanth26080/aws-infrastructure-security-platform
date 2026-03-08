module "sg" {
  count        = length(var.sg_names)
  source       = "git::https://github.com/Hemanth26080/terraform.git//terraform-aws-sg-module?ref=main"
  project_name = var.project_name
  environment  = var.environment
  sg_name      = var.sg_names[count.index]
  sg_description = "Security Group for ${var.sg_names[count.index]}"
  vpc_id       = local.vpc_id
}
