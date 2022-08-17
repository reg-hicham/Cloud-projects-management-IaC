resource "google_compute_address" "lb-address-iac" {
  name = "lb-address-iac"
}

resource "google_compute_firewall" "hicham-iac-firewall" {
  name    = "hicham-iac-firewall"
  direction = "INGRESS"
  network = google_compute_network.vpc-hicham-iac.id
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
  source_ranges = [google_compute_subnetwork.subnet-hicham-iac.ip_cidr_range, google_compute_address.lb-address-iac.address]
  
}

resource "google_compute_firewall" "hicham-iac-firewall-outbound" {
      name    = "hicham-iac-firewall-outbound"
      direction = "EGRESS"
      network = google_compute_network.vpc-hicham-iac.id
      allow {
        protocol = "tcp"
        ports    = ["80", "443"]
      }
      destination_ranges = ["0.0.0.0/0"]
  }