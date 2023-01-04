terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.38.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.37.0"
    }
    google = {
      source = "hashicorp/google"
      version = "4.11.0"
    }
  }
}


provider "azurerm" {
  features {}
}

provider "aws" {
  region  = "us-west-2"
}

provider "google" {
  credentials = file(format("%s/%s/%s",path.module, "gcp_service_account_key", var.gcp_credentials))
  project     = var.project
  region      = var.gcp_region
  zone        = var.gcp_zone
}

####################################
# GCP provider variable definition #
####################################

variable "project" {
  type        = string
  description = "GCP Project ID"
}

variable "gcp_region" {
  type        = string
  description = "GCP region"
}

variable "gcp_zone" {
  type        = string
}

variable "gcp_credentials" {
  type = string
}
