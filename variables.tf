variable "vpcid" {
  description = "VPC ID of the existing security group"
  type        = string
  sensitive   = true
}

variable "cidr_block" {
  description = "The CIDR block for security group"
  type        = string
  sensitive   = true
}