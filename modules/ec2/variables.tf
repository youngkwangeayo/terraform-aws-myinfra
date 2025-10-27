# modules/ec2/variables.tf
variable "ami_id" {
  type        = string
  description = "AMI ID to use for EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type (e.g., t3.micro, t3.medium)"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where EC2 instance will be launched"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to attach to the instance"
  default     = []
}

variable "key_name" {
  type        = string
  description = "EC2 key pair name for SSH access"
}

variable "associate_public_ip" {
  type        = bool
  default     = true
  description = "Whether to assign a public IP address"
}

variable "user_data" {
  type        = string
  default     = ""
  description = "User data script for instance initialization"
}

variable "instance_name" {
  type        = string
  description = "Logical name for the EC2 instance"
}

variable "project" {
  type        = string
  description = "Project name prefix"
}

variable "env" {
  type        = string
  description = "Deployment environment (prod, stage, dev)"
}

variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Additional custom tags"
}
