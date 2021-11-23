resource "google_container_cluster" "my_cluster" {
  name                     = "gke-my-cluster"
  location                 = var.region
  remove_default_node_pool = var.gke_remove_default_node_pool
  initial_node_count       = var.gke_initial_node_count
  #  master_version           = "1.191.15-gke.1801"
  network        = google_compute_network.vpc_network.name
  node_locations = ["us-central1-c"]
  #  node_version             = var.gke_master_version
}

resource "google_container_node_pool" "my_node_pool" {
  name           = "${google_container_cluster.my_cluster.name}-node-pool"
  location       = var.region
  cluster        = google_container_cluster.my_cluster.name
  node_count     = var.gke_node_count
  node_locations = ["us-central1-c"]
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project
    }

    # preemptible  = true
    machine_type = "n1-standard-2"
    image_type   = "ubuntu"
    tags         = ["gke-node", "${var.project}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
