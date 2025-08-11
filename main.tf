
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# Connect to local Docker
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pull Nginx image
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# Create container from Nginx image
resource "docker_container" "nginx_container" {
  name  = "nginx-server"
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = 9090
  }
}

