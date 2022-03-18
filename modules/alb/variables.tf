variable "owner" {
    type = string
    default = "arul"
    description = "Name of the owner"
}
variable "env" {
    type = string
    default = "training"
    description = "Environment type"
}

variable "ownermail" {
    type = string
    description = "Mail ID of the owner"
}

variable "public_subnet_ids" {
    type = list
    default = []
    description = "public subnet ids"
}
variable "vpc_id" {
    type = string
    description = "VPC id"
}

