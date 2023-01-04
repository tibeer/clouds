# get all tenancy entries from the oci config file in ordner
# to avoid hard coding the tenancy_id in terraform
locals {
  oci_tenant_ids = [
    for line in split("\n", file(pathexpand("~/.oci/config"))):
      split("=", line)[1] if can(regex("tenancy=", line))
  ]
}
