/**
  * control-tower.tf
  *
  *  In the control-tower.tf file, we will configure the controle tower in the organization
  *  reference: https://docs.aws.amazon.com/controltower/latest/userguide/terminology.html
  *  aws git example: https://github.com/aws-samples/aws-control-tower-controls-terraform
  */

locals {

    # `guardrails_list` is a flattened list of maps representing the associations between
    # AWS Control Tower guardrails and their respective organizational units. Each map
    # contains the ARN of the control and the corresponding organizational unit ID.
    # This list is used to dynamically configure the `aws_controltower_control` resource.

  guardrails_list = flatten([
    for i in range(0, length(var.control_tower_config)) : [
      for pair in setproduct(element(var.control_tower_config, i).control_names, element(var.control_tower_config, i).organizational_unit_ids) :
      { "arn:aws:controltower:${data.aws_region.current.name}::control/${pair[0]}" = pair[1] }
    ]
  ])


//TODO: In the future, implement more depth levels
    //List Ou information
  ous_depth_1_for_control_tower = [for x in data.aws_organizations_organizational_units.root.children : x]
  // This will change the structure, where in the previus command we generate something like this:
  //    id      = "xxxx", 
  //     arn    = "yyyy"
  // so this code convert it to:
  //    "xxx"   = "yyyy",
   ous_id_to_arn_map = { for ou in local.ous_depth_1_for_control_tower :
    ou.id => ou.arn
  }

}


resource "aws_controltower_control" "guardrails" {

  for_each = { for control in local.guardrails_list : join(":", [keys(control)[0], values(control)[0]]) => [keys(control)[0], values(control)[0]] }

  control_identifier = each.value[0]

  target_identifier = local.ous_id_to_arn_map[[for ou in aws_organizations_organizational_unit.ou : ou.id if ou.name == each.value[1]][0]]

}



// Obs: we used the code in the aws repo almost the same, we touch the logic was a little complex, but we did it anyway.