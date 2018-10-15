variable "ansible_playbook_path" {
  description = "Path from this module to the playbook"
  default     = "../../ansible/ha_pair_playbook.yml"
}

variable "az_client_id" {
  description = "The id for this Azure client"
}

variable "az_client_secret" {
  description = "The secret for the Azure client given in az_client_id"
}

variable "az_region" {}

variable "az_resource_group" {
  description = "Which Azure resource group to deploy the HANA setup into.  i.e. <myResourceGroup>"
}

variable "az_subscription_id" {
  description = "The id for this Azure subscription"
}

variable "az_tenant_id" {
  description = "The id for this Azure tenant"
}

variable "bastion_username" {
  description = "The username for the bastion host"
}

variable "db_num" {
  description = "which node is currently being created"
}

variable "email_shine" {
  description = "e-mail address for SHINE user"
  default     = "shinedemo@microsoft.com"
}

variable "install_cockpit" {
  description = "Flag that determines whether to install Cockpit on the host"
  default     = false
}

variable "install_shine" {
  description = "Flag that determines whether to install SHINE on the host"
  default     = false
}

variable "install_xsa" {
  description = "Flag that determines whether to install XSA on the host"
  default     = false
}

variable "private_ip_address_db0" {
  default = "10.0.0.6"
}

variable "private_ip_address_db1" {
  default = "10.0.0.7"
}

variable "private_ip_address_iscsi" {
  default = "10.0.0.17"
}

variable "private_ip_address_lb_frontend" {
  default = "10.0.0.13"
}

variable "public_ip_allocation_type" {
  description = "Defines whether the IP address is static or dynamic. Options are Static or Dynamic."
  default     = "Dynamic"
}

variable "pw_bastion" {
  description = "The password for the bastion host"
}

variable "pw_db_system" {
  description = "Password for the database user SYSTEM"
}

variable "pw_hacluster" {
  type        = "string"
  description = "Password for the HA cluster nodes"
}

variable "pw_os_sapadm" {
  description = "Password for the SAP admin, which is an OS user"
}

variable "pw_os_sidadm" {
  description = "Password for this specific sidadm, which is an OS user"
}

variable "pwd_db_shine" {
  description = "Password for SHINE user"
  default     = ""
}

variable "pwd_db_tenant" {
  description = "Password for SYSTEM user (tenant DB)"
  default     = ""
}

variable "pwd_db_xsaadmin" {
  description = "Password for XSAADMIN user"
  default     = ""
}

variable "sap_instancenum" {
  description = "The SAP instance number which is in range 00-99"
}

variable "sap_sid" {
  default = "PV1"
}

variable "sshkey_path_private" {
  description = "The path on the local machine to where the private key is"
}

variable "sshkey_path_public" {
  description = "The path on the local machine to where the public key is"
}

variable "storage_disk_sizes_gb" {
  description = "List disk sizes in GB for all disks this VM will need"
  default     = [512, 512, 512]
}

variable "url_cockpit" {
  description = "URL for HANA Cockpit"
  default     = ""
}

variable "url_di_core" {
  description = "URL for DI Core"
  default     = ""
}

variable "url_portal_services" {
  description = "URL for Portal Services"
  default     = ""
}

variable "url_sap_hdbserver" {
  type        = "string"
  description = "The url that points to the HDB server 122.17 bits"
}

variable "url_sap_sapcar" {
  type        = "string"
  description = "The url that points to the SAPCAR bits"
}

variable "url_sapui5" {
  description = "URL for SAPUI5"
  default     = ""
}

variable "url_shine_xsa" {
  description = "URL for SHINE XSA"
  default     = ""
}

variable "url_xs_services" {
  description = "URL for XS Services"
}

variable "url_xsa_runtime" {
  description = "URL for XSA runtime"
  default     = ""
}

variable "useHana2" {
  description = "A boolean that will choose between HANA 1.0 and 2.0"
  default     = false
}

variable "vm_size" {
  default = "Standard_E8s_v3"
}

variable "vm_user" {
  description = "The username of your HANA database VM."
}

locals {
  # These are the load balancing ports specifically for HANA1 pacemaker. DO NOT ALTER
  hana1_lb_ports = [
    "3${var.sap_instancenum}15",
    "3${var.sap_instancenum}17",
  ]

  # These are the load balancing ports specifically for HANA2 pacemaker. DO NOT ALTER
  hana2_lb_ports = [
    "3${var.sap_instancenum}13",
    "3${var.sap_instancenum}14",
    "3${var.sap_instancenum}40",
    "3${var.sap_instancenum}41",
    "3${var.sap_instancenum}42",
  ]
}
