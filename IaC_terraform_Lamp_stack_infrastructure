# Configure the Google Cloud provider to deploy the LAMP Stack  using Iac (Terraform)
provider "google" {
  project = var.project_id
  region  = var.region
}

# Create a VPC Network
resource "google_compute_network" "vpc_network" {
  name = "lamp-vpc"
}

# Create a Subnetwork
resource "google_compute_subnetwork" "subnet" {
  name          = "lamp-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.name
}

# Create a Firewall Rule for HTTP, SSH, and MySQL access
resource "google_compute_firewall" "default" {
  name    = "allow-http-ssh-mysql"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "22", "3306"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Create a VM instance for the LAMP stack
resource "google_compute_instance" "lamp_vm" {
  name         = "lamp-vm"
  machine_type = "n1-standard-1"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.subnet.name

    access_config {
      # Include this to give the instance a public IP address
    }
  }

  metadata_startup_script = file("lamp.sh")

  tags = ["lamp"]
}

# Output the VM's public IP address
output "lamp_vm_ip" {
  value = google_compute_instance.lamp_vm.network_interface.0.access_config.0.nat_ip
}
