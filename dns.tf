module "tibeerde" {
  source = "./modules/aws_composed/dns_zone"

  zone = "tibeer.de"
  a_records = {
    "oracle" = [
      for host in module.oracle[*]:
        host.public_ip
    ]
  }
  aaaa_records = {
    "ipv6test" = [
      "2a01:4f8:c012:bab0::1"
    ]
  }
}

module "terraformbuchde" {
  source = "./modules/aws_composed/dns_zone"

  zone = "terraformbuch.de"
  a_records = {
    "" = [
      "185.199.108.153",
      "185.199.109.153",
      "185.199.110.153",
      "185.199.111.153",
    ]
  }
  aaaa_records = {
    "" = [
      "2606:50c0:8000::153",
      "2606:50c0:8001::153",
      "2606:50c0:8002::153",
      "2606:50c0:8003::153",
    ]
  }
  cname_records = {
    "www" = ["terraformbuch.github.io"]
  }
}
