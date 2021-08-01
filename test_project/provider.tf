variable "do_token" {}
variable "pub_key" {}
variable "pvt_key" {}
variable "ssh_fingerprint" {}

provider "digitalocean" {
    token = var.do_token
}

data "digitalocean_project" "test-project" {
    name = "Test project Infrastructure"
}

data "digitalocean_vpc" "backend_vpc" {
    name = "fra1-vpc-01"
}

resource "digitalocean_project_resources" "test-project-resources" {
    project = data.digitalocean_project.test-project.id
    resources = [
        digitalocean_droplet.backend-server-1.urn,
        digitalocean_droplet.reverse-proxy.urn,
        digitalocean_droplet.analytics-server.urn
        digitalocean_droplet.vault-server.urn
    ]
}