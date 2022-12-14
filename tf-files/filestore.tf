resource "google_filestore_instance" "filestore-hicham-iac" {
  name = "filestore-hicham-iac"
  location = "europe-west2-a"
  tier = "PREMIUM"

  file_shares {
    capacity_gb = 2660
    name        = "share1"
  }

  networks {
    network = google_compute_network.vpc-hicham-iac.name
    modes   = ["MODE_IPV4"]
  }
}


resource "google_filestore_instance" "filestore-hicham-iac-omnidb" {
  name = "filestore-hicham-iac-omnidb"
  location = "europe-west2-a"
  tier = "STANDARD"

  file_shares {
    capacity_gb = 1024
    name        = "share2"
  }

  networks {
    network = google_compute_network.vpc-hicham-iac.name
    modes   = ["MODE_IPV4"]
  }
}