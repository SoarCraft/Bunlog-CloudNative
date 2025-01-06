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

resource "opentelekomcloud_swr_repository_v2" "web" {
  organization = opentelekomcloud_swr_organization_v2.swr_org.name
  name = "web"
  is_public = false
}

resource "opentelekomcloud_swr_repository_v2" "pg" {
  organization = opentelekomcloud_swr_organization_v2.swr_org.name
  name = "pgdb"
  is_public = false
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
  kube_proxy_mode = "iptables"
  eip = var.eip

  delete_all_storage = "true"
}

variable "availability_zone" {
  default = "eu-de-03"
}

variable "key_pair" {
  default = "KeyPair-Aloento"
}

resource "opentelekomcloud_cce_node_v3" "node" {
  name = "test-node"
  cluster_id = opentelekomcloud_cce_cluster_v3.cluster.id
  availability_zone = var.availability_zone

  flavor_id = "s2.large.2"
  key_pair = var.key_pair

  root_volume {
    size = 40
    volumetype = "SATA"
  }

  data_volumes {
    size = 100
    volumetype = "SATA"
  }
}
