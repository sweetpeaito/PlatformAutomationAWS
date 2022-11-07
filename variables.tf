variable repo_name {
  type        = string
  default     = "platformautomationecr"
  description = "ECR repository to store a Docker images"
}

variable "subnet_id_1" {
  type = string
  default = "subnet-0abef74ea738096f0"
}

variable "subnet_id_2" {
  type = string
  default = "subnet-098c01d668353d82b"
}
