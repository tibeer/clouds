# Quickly spawn VMs for day-to-day use

requires ed25519 ssh-keys

## Landscape overview

```mermaid
flowchart LR

tf_cloud((Terraform Cloud))
tf{Terraform}
oc_prod[Oracle Cloud Prod VM]
oc_beta[Oracle Cloud Beta VM]
google[Google Cloud VM]
aws([AWS DNS Records])
hetzner[Hetzner]
equinix[Equinix]
openstack[OpenStack]
azure[Azure]

tf_cloud ---|Only state storage| tf
tf --> oc_prod
tf --> oc_beta
tf --> google
oc_prod --> aws
oc_beta --> aws
google --> aws
tf -.->|not in use| hetzner
tf -.->|not in use| equinix
tf -.->|not in use| openstack
tf -.->|hah, lol| azure
```

## rDNS/PTR with Google Cloud

In order to run your own mailserver, you need to add a PTR DNS record.
Assuming your Domain ist bought by some different entity than google, you have
to add the domain to the google search engine and verify the ownership.
But this is not enough, you also have to add a user account to the domain ownership:

Go into the IAM console in the web-ui and search for the participal, that is tied
to the _Compute Engine default service account_. Copy the mail address and go back
to the search console and add this user as __OWNER__. Everything else will not work
with terraform.
