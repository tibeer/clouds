# get all tenancy entries from the oci config file in ordner
# to avoid hard coding the tenancy_id in terraform

data "config_ini" "cfg_oracle_prod" {
  ini     = file(pathexpand("~/.oci/config"))
  section = "PROD"
}

data "config_ini" "cfg_oracle_beta" {
  ini     = file(pathexpand("~/.oci/config"))
  section = "BETA"
}
