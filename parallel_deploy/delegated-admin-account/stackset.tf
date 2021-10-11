resource "aws_cloudformation_stack_set" "example" {
  name                    = "demosd-for-multiple-deploy"
  parameters ={
    CrossAccountEventBusArn=aws_cloudwatch_event_bus.messenger.arn
  }

  auto_deployment {
    enabled                          = true
    retain_stacks_on_account_removal = false
  }

  capabilities=["CAPABILITY_NAMED_IAM"]
  permission_model="SERVICE_MANAGED"
  template_body = file("${path.module}/create_cloudwatch_rule.yml")
}

resource "aws_cloudformation_stack_set_instance" "example" {

  deployment_targets {
    organizational_unit_ids = ["r-ltxy"]
  }

  region         = "us-east-1"
  stack_set_name = aws_cloudformation_stack_set.example.name
}
