resource "google_container_cluster" "hicham-gke-iac" {
  name     = "hicham-gke-iac"
  location = "europe-west2"
  network = google_compute_network.vpc-hicham-iac.id
  subnetwork = google_compute_subnetwork.subnet-hicham-iac.id
  initial_node_count = 1
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.16/28"
  }
  master_authorized_networks_config {
  	cidr_blocks {
		cidr_block = google_compute_subnetwork.subnet-hicham-iac.ip_cidr_range
	}
  }
}

resource "google_container_node_pool" "hicham-gke-iac-node-pool" {
  name           = "hicham-gke-iac-node-pool"
  location       = google_container_cluster.hicham-gke-iac.location
  node_locations = ["europe-west2-a","europe-west2-b","europe-west2-c"]
  cluster        = google_container_cluster.hicham-gke-iac.name
  node_count     = 3
  autoscaling {
    max_node_count = 9
    min_node_count = 3
  }
  
}