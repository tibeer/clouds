resource "equinix_metal_organization" "org" {
  name = var.name
  address {
    address  = var.address
    city     = var.city
    country  = var.country
    zip_code = var.zip_code
  }
}
