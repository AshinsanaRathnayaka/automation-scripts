variable "environment_name" {
  description = "Name of the environment"
}

variable "environment_type" {
  description = "Type of the environment"
    
  validation {
    condition     = can(regex("^(dev|qa|staging|production|test)$", var.environment_type))
    error_message = "Environment type should be either dev, qa, staging or production."
  }
}

variable "region" {
  description = "Region that the resources will be created"
}

variable "availability_zones" {
  description = "Availability zones that the resources will be created"
}

variable "ssh_public_key" {
  description = "Public key to SSH to nginx server"
}

variable "ec2_ami" {
  description = "AMI ID of the ec2 server"
}

variable "nginx_instance_type" {
  description = "Instance type of the nginx server"
}

