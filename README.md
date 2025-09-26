# Multi-Cloud Zero-Downtime Deployment Project

This project demonstrates a fully automated CI/CD pipeline for deploying a containerized web application to both AWS and Google Cloud Platform (GCP) using a Blue-Green deployment strategy to ensure zero downtime.

## 🚀 Technologies Used
- **Cloud Providers:** AWS, Google Cloud
- **IaC:** Terraform
- **CI/CD:** GitHub Actions
- **Containerization:** Docker
- **Application:** Python Flask

## 🏛️ Architecture
*(Insert the architecture diagram or a link to it here)*

The pipeline is triggered on a push to the `main` branch. It builds a Docker image, pushes it to Docker Hub, and then deploys it to the inactive environment (Blue or Green) on both clouds. Finally, traffic is switched to the newly deployed version.

## ⚙️ How It Works

1.  **CI:** The `build-and-push` job containerizes the application.
2.  **CD:** The `deploy` job runs in parallel for AWS and GCP.
    - It determines the target environment (e.g., if Blue is live, it deploys to Green).
    - `terraform apply` provisions the infrastructure with the new Docker image.
    - A final step (simulated here) updates the load balancer to switch live traffic.

## 🔧 Getting Started
To run this project yourself:
1. Fork this repository.
2. Create accounts on AWS, GCP, and Docker Hub.
3. Add the following secrets to your GitHub repository:
   - `DOCKERHUB_USERNAME`
   - `DOCKERHUB_TOKEN`
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `GCP_SA_KEY` (base64 encoded JSON key)
4. Update the Terraform files in `terraform/aws` and `terraform/gcp` with your specific configurations (e.g., VPC ID, project ID).
5. Push a change to the `main` branch to trigger the workflow!
