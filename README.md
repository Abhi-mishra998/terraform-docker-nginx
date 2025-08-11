# Terraform Docker Nginx Deployment

## 📌 Task Overview
This task provisions a local **Docker container** running **Nginx** using **Terraform**.  
The objective was to practice Infrastructure as Code (IaC) by deploying a service without manual container commands.


## 🛠️ Steps Performed

1. **Installed Terraform**  
   Downloaded and installed Terraform on Kali Linux.

2. **Created `main.tf`**  
   Wrote a Terraform configuration to:
   - Use the Docker provider
   - Pull the `nginx:latest` image
   - Run the container on port `8080`

   **main.tf**
   ```hcl
   terraform {
     required_providers {
       docker = {
         source  = "kreuzwerker/docker"
         version = "~> 3.0.1"
       }
     }
   }

   provider "docker" {}

   resource "docker_image" "nginx" {
     name = "nginx:latest"
   }

   resource "docker_container" "nginx_container" {
     name  = "nginx-server"
     image = docker_image.nginx.latest
     ports {
       internal = 80
       external = 8080
     }
   }
   ```

3. **Initialized Terraform**
   ```bash
   terraform init
   ```

4. **Applied the Configuration**
   ```bash
   terraform apply
   ```
   Confirmed with `yes` when prompted.

5. **Accessed the Nginx Welcome Page**  
   Opened a browser and visited:
   ```
   http://localhost:8080
   ```
   Saw the "Welcome to Nginx!" page, confirming successful deployment.


## 📷 Screenshot
*(Add your screenshot showing the Nginx welcome page here)*



## 🧹 Cleanup
To remove the container and image:
```bash
terraform destroy
```

## 📂 Files in Repository
```
main.tf
terraform.tfstate
terraform.tfstate.backup
README.md
```

## ✅ Outcome
- Successfully deployed an Nginx web server using Terraform & Docker.
- Learned how to use Terraform providers to manage local Docker resources.

## 🔗 References
- [Terraform Docker Provider Docs](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs)
- [Nginx Official Site](https://nginx.org)
