variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "name" {
  type = string
}
variable "account_tier" {
  type = string
}
variable "account_replication_type" {
  type = string
}
variable "public_network_access_enabled" {
  type = bool
}
variable "private_endpoint_subnet_id" {
  type    = string
  default = "0"
}
variable "pe_blob" {
  type    = bool
  default = false
}
variable "pe_file" {
  type    = bool
  default = false
}
variable "pe_queue" {
  type    = bool
  default = false
}
variable "pe_table" {
  type    = bool
  default = false
}
variable "pe_dfs" {
  type    = bool
  default = false
}
variable "containers" {
  type = list(string)
  default = []
}
variable "queues" {
  type = list(string)
  default = []
}
variable "tables" {
  type = list(string)
  default = []
}
