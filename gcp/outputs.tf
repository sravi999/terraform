output "ip" {
  description = "Nat gateway ip"
  value       = "http://${google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip}"
}

output "ports" {
  description = "Ports"
  sensitive   = true
  value       = google_compute_firewall.web.name
}

output "gke_name" {
  description = "Name of the GKE cluster"
  value       = google_container_cluster.my_cluster.name
}

output "gke_id" {
  description = "gke id"
  value       = google_container_cluster.my_cluster.id
}

output "gke_endpoint" {
  description = "GKE endpoint"
  value       = google_container_cluster.my_cluster.endpoint
}

output "gke_master_version" {
  description = "GKE version"
  value       = google_container_cluster.my_cluster.master_version
}
