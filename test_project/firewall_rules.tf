resource "digitalocean_firewall" "backend-rules" {
	name = "backend-api-server-rules"

	droplet_ids = [digitalocean_droplet.backend-server-1.id]

	inbound_rule {
		protocol = "tcp"
		port_range = "22"
		source_addresses = ["10.114.0.0/24"]
	}

	inbound_rule {
		protocol = "tcp"
		port_range = "80"
		source_addresses = ["10.114.0.0/24"]
	}

	inbound_rule {
		protocol = "tcp"
		port_range = "443"
		source_addresses = ["10.114.0.0/24"]
	}

	outbound_rule {
		protocol = "tcp"
		port_range = "1-65535"
		destination_addresses = ["0.0.0.0/0", "::/0"]
	}

	outbound_rule {
		protocol = "udp"
		port_range = "1-65535"
		destination_addresses = ["0.0.0.0/0", "::/0"]
	}

}

resource "digitalocean_firewall" "reverse-proxy-rules" {
	name = "reverse-proxy-firewall-rules"
	
	droplet_ids = [digitalocean_droplet.reverse-proxy.id]

	inbound_rule {
		protocol = "tcp"
		port_range = "22"
		source_addresses = ["10.114.0.0/24"]
	}

	inbound_rule {
		protocol = "tcp"
		port_range = "80"
		source_addresses = ["0.0.0.0/0", "::/0"]
	}

	inbound_rule {
		protocol = "tcp"
		port_range = "443"
		source_addresses = ["0.0.0.0/0", "::/0"]
	}

	outbound_rule {
		protocol = "tcp"
		port_range = "1-65535"
		destination_addresses = ["0.0.0.0/0", "::/0"]
	}

	outbound_rule {
		protocol = "udp"
		port_range = "1-65535"
		destination_addresses = ["0.0.0.0/0", "::/0"]
	}
}

resource "digitalocean_firewall" "analytics-server-firewall-rules" {
	name = "analytics-server-firewall-rules"

	droplet_ids = digitalocean_droplet.analytics-server.id

	inbound_rule {
		protocol = "tcp"
		port_range = "22"
		source_addresses = ["10.114.0.0/24"]
	}

	inbound_rule {
		protocol = "tcp"
		port_range = "80"
		source_addresses = ["10.114.0.0/24"]
	}

	inbound_rule {
		protocol = "tcp"
		port_range = "443"
		source_addresses = ["10.114.0.0/24"]
	}

	inbound_rule {
		protocol = "tcp"
		port_range = "5432"
		source_addresses = ["10.114.0.0/24"]
	}

	outbound_rule {
		protocol = "tcp"
		port_range = "1-65535"
		destination_addresses = ["0.0.0.0/0", "::/0"]
	}

	outbound_rule {
		protocol = "udp"
		port_range = "1-65535"
		destination_addresses = ["0.0.0.0/0", "::/0"]
	}
}


resource "digitalocean_firewall" "vault-server-firewall-rules" {
	name = "vault-server-firewall-rules"

	droplet_ids = digitalocean_droplet.vault-server.id

	inbound_rule {
		protocol = "tcp"
		port_range = "22"
		source_addresses = ["10.114.0.0/24"]
	}

	inbound_rule {
		protocol = "tcp"
		port_range = "80"
		source_addresses = ["10.114.0.0/24"]
	}

	inbound_rule {
		protocol = "tcp"
		port_range = "443"
		source_addresses = ["10.114.0.0/24"]
	}

	outbound_rule {
		protocol = "tcp"
		port_range = "1-65535"
		destination_addresses = ["0.0.0.0/0", "::/0"]
	}

	outbound_rule {
		protocol = "udp"
		port_range = "1-65535"
		destination_addresses = ["0.0.0.0/0", "::/0"]
	}
}