# variable

variable "region" {
  description = "The region to deploy the cluster in, e.g: us-east-1"
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  # default     = ""
}

variable "vpc_id" {
  description = "The VPC ID."
  type        = string
  # default     = ""
}

variable "single_route_table" {
  description = "Should be true if you want to provision a single shared Route Table across all of your public networks"
  type        = bool
  default     = false
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

variable "create_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = false
}

variable "nat_gateway_ids" {
  type    = list(string)
  default = []
}

variable "public_subnets" {
  type = list(object({
    suffix = string
    zone   = string
    cidr   = string
    tags   = list(string)
  }))
  default = []
}

variable "private_subnets" {
  type = list(object({
    suffix = string
    zone   = string
    cidr   = string
    tags   = list(string)
  }))
  default = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}
