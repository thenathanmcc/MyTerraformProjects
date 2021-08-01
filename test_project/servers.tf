resource "digitalocean_droplet" "backend-server-1" {
    image = "ubuntu-20-04-x64"
    name = "backend-server-1"
    region = "fra1"
    size = "s-1vcpu-1gb"
    vpc_uuid = data.digitalocean_vpc.backend_vpc.id
    private_networking = true
    ssh_keys = [
        var.ssh_fingerprint
    ]

    provisioner "remote-exec" {
        inline = ["echo Server Up"]

        connection {
            host = self.ipv4_address_private
            user = "root"
            type = "ssh"
            private_key = file(var.pvt_key)
            timeout = "2m"
        }
    }

    provisioner "local-exec" {
        command = "yes | ansible-playbook -i '${self.ipv4_address_private},' --private-key ${var.pvt_key} ~/ansible_playbooks/setup_backend_server.yml"
    }
}


resource "digitalocean_droplet" "reverse_proxy" {
    image = "ubuntu-20-04-x64"
    name = "reverse-proxy"
    region = "fra1"
    size = "s-1vpcu-1gb"
    vpc_uuid = data.digitalocean_vpc.backend_vpc.id
    private_networking = true
    ssh_keys = [
        var.ssh_fingerprint
    ]

    provisioner "remote-exec" {
        inline = ["echo Server Up"]

        connection {
            host = self.ipv4_address_private
            user = "root"
            type = "ssh"
            private_key = file(var.pvt_key)
            timeout = "2m"
        }
    }

    provisioner "local-exec" {
        command = "yes | ansible-playbook -i '${self.ipv4_address_private},' --private-key ${var.pvt_key} ~/ansible_playbooks/setup_reverse_proxy.yml"
    }
}

resource "digitalocean_droplet" "backup-reverse_proxy" {
    image = "ubuntu-20-04-x64"
    name = "reverse-proxy"
    region = "fra1"
    size = "s-1vpcu-1gb"
    vpc_uuid = data.digitalocean_vpc.backend_vpc.id
    private_networking = true
    ssh_keys = [
        var.ssh_fingerprint
    ]

    provisioner "remote-exec" {
        inline = ["echo Server Up"]

        connection {
            host = self.ipv4_address_private
            user = "root"
            type = "ssh"
            private_key = file(var.pvt_key)
            timeout = "2m"
        }
    }

    provisioner "local-exec" {
        command = "yes | ansible_playbooks -i '${self.ipv4_address_private},' --private-key ${var.pvt_key} ~/ansible_playbooks/setup_backup_reverse_proxy.yml"
    }
}

resource "digitalocean_droplet" "vault-server" {
    image = "ubuntu-20-04-x64"
    name = "vault-server"
    region = "fra1"
    size = "s-1vcpu-1gb"
    vpc_uuid = data.digitalocean_vpc.backend_vpc.id
    private_networking = true
    ssh_keys = [
        var.ssh_fingerprint
    ]
}

resource "digitalocean_droplet" "analytics-server" {
    image = "ubuntu-20-04-x64"
    name = "analytics-server"
    region = "fra1"
    size = "s-1vcpu-1gb"
    vpc_uuid = data.digitalocean_vpc.backend_vpc.id
    private_networking = true
    ssh_keys = [
        var.ssh_fingerprint
    ]
}