##################
# AWS POSTGRESQL #
##################
variable "aws_pg_db_name" {
  type        = string
  default = "admindb"
}

variable "aws_pg_allocated_storage" {
  type        = number
  default = 20
}

variable "aws_pg_engine" {
    type = string
    default = "postgres"
}

variable "aws_pg_engine_version" {
    type = string
    default = "14.4"
}

variable "aws_pg_instance_class" {
    type = string
    default = "db.t3.micro"
}

variable "aws_pg_username"{
    type = string
    default = "demouser"
}

variable "aws_pg_password" {
  type = string
  default= "Democloud123"
}

variable "aws_pg_parameter_group_name" {
  type = string
  default = "postgres-logical-decoding-new"
}

variable "aws_pg_parameter_group_family" {
  type = string
  default = "postgres14"
}

variable "aws_pg_parameter_settings_name" {
  type = string
  default = "rds.logical_replication"
}

variable "aws_pg_parameter_settings_value" {
  type = string
  default = "1"
}

variable "aws_pg_parameter_settings_apply_method" {
  type = string
  default = "pending-reboot"
}

##################
# GCP POSTGRESQL #
##################
variable "gcp_pg_name" {
  type = string
  default = "pg-instance"
}

variable "gcp_pg_name_timestamp" {
  type = string
  default = ""
}

variable "gcp_pg_database_version" {
  type = string
  default = "POSTGRES_14"
}

variable "gcp_pg_region" {
  type = string
  default = "us-central1"
}

variable "gcp_pg_tier" {
  type = string
  default = "db-f1-micro"
}

variable "gcp_pg_db_flag_name" {
  type = string
  default = "cloudsql.logical_decoding"
}

variable "gcp_pg_db_flag_value" {
  type = string
  default = "on"
}
####################
# AZURE POSTGRESQL #
####################
variable "azure_pg_resource_group_name" {
  type = string
  default = "demo_resource_group_terraform"
}

variable "azure_pg_location" {
  type = string
  default = "West US"
}

variable "azure_pg_name" {
  type = string
  default = "pg-azure-demo"
}

variable "azure_pg_sku_name" {
  type = string
  default = "B_Gen5_2"
}

variable "azure_pg_storage_mb" {
  type = number
  default = 5120
}

variable "azure_pg_backup_retention_days" {
  type = number
  default = 7
}

variable "azure_pg_admin_login" {
  type = string
  default = "psqladmin"
}

variable "azure_pg_admin_login_password" {
  type = string
  default = "Democloud123"
}

variable "azure_pg_version" {
  type = string
  default = "11"
}


