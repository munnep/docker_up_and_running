terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "eu-north-1"
}

resource "aws_ecs_cluster" "foo" {
  name = "fargate-testing"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "service" {
  family = "service"
  container_definitions = jsonencode([
            {
            "name": "web-game",
            "image": "spkane/quantum-game",
            "cpu": 0,
            "memory": 512,
            "portMappings": [
                {
                    "containerPort": 8080,
                    "hostPort": 8080,
                    "protocol": "tcp"
                }
            ],
            "essential": true,
            "environment": [],
            "mountPoints": [],
            "volumesFrom": []
        }
  ])

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  }
}

resource "aws_ecs_service" "game" {
  name            = "game"
  cluster         = aws_ecs_cluster.foo.id
  task_definition = aws_ecs_task_definition.service.arn
  desired_count   = 3
#   iam_role        = aws_iam_role.foo.arn
#   depends_on      = [aws_iam_role_policy.foo]

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

#   load_balancer {
#     target_group_arn = aws_lb_target_group.foo.arn
#     container_name   = "mongo"
#     container_port   = 8080
#   }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [eu-north-1a, eu-north-1b]"
  }
}