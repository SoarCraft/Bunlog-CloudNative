terraform {
   required_providers {
      opentelekomcloud = {
         source = "opentelekomcloud/opentelekomcloud"
         version = ">= 1.36.28"
      }
   }
}

variable "swr_org_name" {
  default = "testtesttest"
}

resource "opentelekomcloud_swr_organization_v2" "swr_org" {
  name = var.swr_org_name
}

variable "vpc_id" {
  default = "0bd45fdf-bf78-41e5-bd08-99f1c65e0147"
}

variable "subnet_id" {
  default = "f66e3dc1-ed82-4832-8175-7c1d2e78fcea" 
}

variable "eip" {
  default = "80.158.91.249"
}

resource "opentelekomcloud_cce_cluster_v3" "cluster" {
  name = "test-cluster"
  description = "test-cluster"

  cluster_type = "VirtualMachine"
  flavor_id = "cce.s1.small"
  vpc_id = var.vpc_id
  subnet_id = var.subnet_id
  container_network_type = "overlay_l2"
  authentication_mode = "rbac"
  kube_proxy_mode = "ipvs"
  eip = var.eip

  delete_all_storage = "true"
}
