
variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "docker_image" {
  description = "The Docker image to run in the ECS task"
  default     = "nginx:alpine"
}

variable "container_port" {
  description = "The port the container is listening on"
  default     = 80
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "cluster_name" {
  description = "The name of the ECS cluster"
  default     = "nodejs-app-cluster"
}

variable "ecr_repo_name" {
  description = "The name of the ECR repository"
  default     = "nodejs-app-repo"
}

variable "task_cpu" {
  description = "The number of CPU units used by the task"
  default     = "256"
}

variable "task_memory" {
  description = "The amount of memory used by the task (in MiB)"
  default     = "512"
}


variable "service_name" {
  description = "The name of the ECS service"
  default     = "nodejs-app-service"
}

variable "service_desired_count" {
  description = "The desired number of tasks in the service"
  default     = 1
}

variable "health_check_path" {
  description = "Path for the health check endpoint"
  default     = "/"
}
