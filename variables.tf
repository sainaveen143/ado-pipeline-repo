variable "project_id" {
  type        = string
  description = "(Required) ID of the project to which the compute instance belongs"
}

variable "instance_name" {
  type        = string
  description = "(Required) Name of the compute instance"
}

variable "machine_type" {
  type        = string
  description = "(Required) Machine type to use"
}

variable "allow_stopping_for_update" {
  type        = bool
  description = "(Optional) If instances are allowed to stop for an update"
  default     = true
}

variable "attached_disk" {
  type        = list(map(string))
  default     = []
  description = "(Optional) Cofiguration for additional disks to be attached to the instance"
}

variable "zone_name" {
  type        = string
  description = "(Requierd) Zone for the compute instance"
}

variable "network_interface" {
  type = list(object({
    network_name       = string
    subnetwork_name    = string
    network_ip         = string
    external_ip_needed = bool
    access_config      = map(string)
    alias_ip_range     = list(map(string))
  }))
  default = [{
    network_name       = null
    subnetwork_name    = null
    network_ip         = null
    external_ip_needed = false
    access_config      = {}
    alias_ip_range     = []
  }]
  description = "(Required) Configurations for the network interfaces to be attached to the instance"
}

variable "tags" {
  type        = list(string)
  description = "(Optional) List of network tags"
  default     = []
}

variable "boot_disk" {
  type        = map(string)
  description = "(Requierd) Boot disk configuration for the instance"
}


variable "description" {
  type        = string
  description = "(Optional) Description for the compute instance"
  default     = ""
}

variable "labels" {
  description = "(Optional) Key/value label pairs for the instance"
  type        = map(string)
  default     = {}
}

variable "metadata_list" {
  description = "(Optional) Metadata key/value pairs to make available from within the instance"
  type        = map(string)
  default     = {}
}

variable "can_ip_forward" {
  type        = bool
  description = "(Optional) Whether to allow sending and receiving of packets with non-matching source or destination IPs"
  default     = false
}

variable "deletion_protection" {
  type        = bool
  description = "(Optional) To enable or disable deletion protection"
  default     = true
}

variable "shielded_instance_config" {
  type        = map(string)
  default     = {}
  description = "(Optional) Configuration to enable shielded VM on the instance"
}

variable "service_account" {
  type = object({
    email  = string
    scopes = list(string)
  })
  default = {
    email  = null
    scopes = null
  }
  description = "(Optional)Service account with scopes, to attach to the instance"
}

variable "snapshot_policy_name" {
  type        = string
  description = "(optional) The resource policy to be attached to the disk for scheduling snapshot creation. Do not specify the self link."
  default     = ""
}
variable "metadata_startup_script" {
  default = ""
}
