provider "aws" {
  region = "us-east-1"
}

resource "aws_cloudwatch_event_bus" "messenger" {
  name = "security_hub_event_bus"
}

output "event_bus_arn"{
  value = aws_cloudwatch_event_bus.messenger.arn
}
