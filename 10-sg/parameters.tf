resource "aws_ssm_parameter" "sg_id" {
    count = length(var.sg_names)
    name = "/${local.common_name_suffix}/${var.sg_names[count.index]}-sg-id"
    type = "String"
    value = module.sg[count.index].sg_id
}