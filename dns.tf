module "tibeerde" {
  source = "./modules/aws_composed/dns_zone"

  zone    = "tibeer.de"
  records = {
    "oracle" = ["130.61.179.205"]
  }
}

module "terraformbuchde" {
  source = "./modules/aws_composed/dns_zone"

  zone    = "terraformbuch.de"
  records = {}
}
