variable "project" {
  description = "GCP project id"
  type        = string
}

variable "credentials" {
  description = "Provide your gcp credentials file name"
  type        = string
  validation {
    condition     = length(var.credentials) <= 8
    error_message = "The credentials name must be no more than 8 characters , and only contain small and capital alphabetes and dot."
  }
}

variable "region" {
  description = "Provide region"
  type        = string
  default     = "us-central1"
}
variable "zone" {
  description = "Provide zone"
  type        = string
  default     = "us-central1-c"
}

variable "machine_type" {
  description = "Provide VM instance type"
  type        = string
  default     = "e2-micro"
}

variable "source_ranges" {
  description = "Provide IP range to reach VM instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "image" {
  description = "Provide your VM instance image"
  type        = string
  default     = "debian-cloud/debian-9"
}

variable "tags" {
  description = "Instance and source tags"
  type        = map(list(string))
  default = {
    tags = ["web", "dev"]
  }
}
variable "gke_initial_node_count" {
  description = "Initial GKE node count"
  type        = number
  default     = 1
}

variable "gke_remove_default_node_pool" {
  description = "Remove GKE default node pool"
  type        = bool
  default     = true
}

variable "gke_node_count" {
  description = "Provide GKE node count(No of worker nodes)"
  type        = number
  default     = 2
}

variable "gke_master_version" {
  description = "GKE Control pannel version"
  type        = string
  default     = "1.191.15-gke.1801"
}


