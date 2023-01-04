#######
# AWS #
#######
resource "aws_db_instance" "aws_rds_postgres" {
  allocated_storage    = var.aws_pg_allocated_storage
  db_name              = var.aws_pg_db_name
  engine               = var.aws_pg_engine
  engine_version       = var.aws_pg_engine_version
  instance_class       = var.aws_pg_instance_class
  username             = var.aws_pg_username
  password             = var.aws_pg_password

  skip_final_snapshot  = true
  apply_immediately = true
  publicly_accessible = true


}


#######
# GCP #
#######
locals {
  gcp_pg_name_timestamp = "${var.gcp_pg_name}-${timestamp()}"
}

resource "google_sql_database_instance" "gcp_sql_postgres" {
  name             = var.gcp_pg_name_timestamp
  database_version = var.gcp_pg_database_version
  region           = var.gcp_pg_region
  deletion_protection=false

  settings {
    tier = var.gcp_pg_tier

    database_flags {
      name  = var.gcp_pg_db_flag_name
      value = var.gcp_pg_db_flag_value
    }
  }
  
  timeouts {
    create = "60m"
  }
}

#########
# AZURE #
#########
resource "azurerm_resource_group" "azure_pg_resource_group" {
  name     = var.azure_pg_resource_group_name
  location = var.azure_pg_location
}

resource "azurerm_postgresql_server" "azure_db_postgres" {
  name                = var.azure_pg_name
  location            = azurerm_resource_group.azure_pg_resource_group.location
  resource_group_name = azurerm_resource_group.azure_pg_resource_group.name

  sku_name = var.azure_pg_sku_name

  storage_mb                   = var.azure_pg_storage_mb
  backup_retention_days        = var.azure_pg_backup_retention_days
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = var.azure_pg_admin_login
  administrator_login_password = var.azure_pg_admin_login_password
  version                      = var.azure_pg_version
  ssl_enforcement_enabled      = true
}
