module "iap_bastion" {
  source = "terraform-google-modules/bastion-host/google"

  project = "yassir-devops-lab"
  zone    = "europe-west2-a"
  network = google_compute_network.vpc-hicham-iac.id
  subnet  = google_compute_subnetwork.subnet-hicham-iac.id
}