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
variable "static_website" {
  type = list(object({
    index_document     = string
  }))
  default = []
}
