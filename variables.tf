variable "resource_group_location" {
  type        = string
  default     = "australiasoutheast"
  description = "Location for all resources."
}
variable "lab_name" {
  type        = string
  description = "The name of the new lab instance to be created"
  default     = "lab-jaseblenner"
}