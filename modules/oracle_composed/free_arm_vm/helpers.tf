data "oci_identity_availability_domains" "domains" {
  compartment_id = var.tenant_id
}

data "oci_core_vcns" "vcns" {
  compartment_id = var.tenant_id
}

data "oci_core_subnets" "subnets" {
  compartment_id = var.tenant_id
}

data "oci_core_images" "images" {
  compartment_id = var.tenant_id

  operating_system         = "Canonical Ubuntu"
  operating_system_version = "22.04"

}

locals {
  arm_image = [
    for image in data.oci_core_images.images.images[*]:
      image.id if can(regex("aarch", image.display_name))
  ]
}

resource "random_integer" "random" {
  min = 0
  max = length(data.oci_identity_availability_domains.domains.availability_domains)-1
}
