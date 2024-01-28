# Define the ECS Cluster
resource "aws_ecs_cluster" "cluster" {
  name = var.project_name
}

# Define the ECR Repository (if not already created)
resource "aws_ecr_repository" "repository" {
  name = var.project_name
}

# Define the Task Definition
resource "aws_ecs_task_definition" "task" {
  family                   = var.project_name
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"  # Adjust based on your needs
  memory                   = "512"  # Adjust based on your needs
  container_definitions    = file("${path.module}/container_definitions.json")
}

