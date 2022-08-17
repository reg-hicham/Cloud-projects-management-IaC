resource "google_compute_network" "vpc-hicham-iac" {
  name = "vpc-hicham-iac"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet-hicham-iac" {
  name          = "subnet-hicham-iac"
  ip_cidr_range = "10.1.0.0/16"
  region        = "europe-west2"
  network       = google_compute_network.vpc-hicham-iac.id
}


resource "google_compute_router" "hicham-router" {
  name    = "hicham-router"
  region  = google_compute_subnetwork.subnet-hicham-iac.region
  network = google_compute_network.vpc-hicham-iac.id
}

resource "google_compute_router_nat" "hicham-nat" {
  name                               = "hicham-nat"
  router                             = google_compute_router.hicham-router.name
  region                             = google_compute_router.hicham-router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}