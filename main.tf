#proveedor
provider "google" {
  credentials = file("./imagen/account.json")
  project     = "prueba-278019"
  region      = var . main_region
}

#creacion de claves privadas para ssh
resource "tls_private_key" "example" {
  algorithm = "ECDSA"
}

#creacion de instancia
resource "google_compute_instance" "default" {
  name         = "nginx"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  tags = ["foo", "bar"]
  boot_disk {
    initialize_params {
      image = "nginx"
    }
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
}


  
