
# 🚀 AWS 3-Tier Application Deployment (EKS + CI/CD)

## 📌 Project Overview

This project demonstrates a **production-ready 3-tier web application** deployed on **AWS using Kubernetes (EKS)** with a **secure CI/CD pipeline** powered by **GitHub Actions**.

The application follows a classic **Web → Application → Database** architecture and includes:

* Containerized services (Docker)
* Kubernetes orchestration (EKS)
* Infrastructure as Code (Terraform)
* Secure CI/CD with vulnerability scanning (Trivy)
* Manual approval before production deployment

---

## 🏗️ Architecture

```
User
 │
 ▼
AWS ALB (Ingress)
 │
 ▼
Web Tier (Nginx + React)
 │
 ▼
App Tier (Node.js / Express API)
 │
 ▼
Amazon RDS (MySQL)
```

### Key AWS Components

* **VPC** with public & private subnets
* **EKS Cluster** (private worker nodes)
* **Application Load Balancer (ALB Ingress)**
* **Amazon RDS (MySQL)**
* **Amazon ECR** for container images
* **IAM** for secure access

---

## 📂 Repository Structure

```
AWS-3-Tier-Application-Deployment/
│
├── application-code/
│   ├── app-tier/              # Node.js backend
│   └── web-tier/              # React + Nginx frontend
│
├── k8s/
│   ├── app-tier/              # App deployments & services
│   ├── web-tier/              # Web deployments & services
│   ├── ingress/               # ALB ingress manifests
│   └── hpa/                   # Horizontal Pod Autoscaler
│
├── terraform/
│   ├── vpc/                   # VPC & networking
│   ├── eks/                   # EKS cluster
│   ├── rds/                   # RDS MySQL
│   └── iam/                   # IAM roles & policies
│
├── .github/
│   └── workflows/
│       └── deploy.yml         # CI/CD pipeline
│
├── docker-compose.yml         # Local testing
├── .gitignore
└── README.md
```

---

## 🐳 Containerization

* **Docker** used for both app-tier and web-tier
* Multi-stage builds for optimized images
* Images pushed to **Amazon ECR**

---

## ☸️ Kubernetes (EKS)

### Deployed Resources

* Deployments for app-tier & web-tier
* ClusterIP services for internal communication
* ALB Ingress for external access
* ConfigMaps & Secrets for configuration
* HPA for autoscaling based on CPU usage

---

## 🔄 CI/CD Pipeline (GitHub Actions)

### Pipeline Stages

```
Push to main
   ↓
Build app-tier image
   ↓
Push app-tier to ECR
   ↓
Build web-tier image
   ↓
Push web-tier to ECR
   ↓
Trivy vulnerability scan
   ↓
Manual approval (production)
   ↓
Deploy to EKS
```

### Key Features

* Secure AWS authentication using GitHub Secrets
* Trivy scans block deployment on HIGH/CRITICAL vulnerabilities
* Manual approval gate using GitHub Environments
* Rolling updates with zero downtime

---

## 🔐 Security

* IAM least-privilege access
* Secrets managed via Kubernetes Secrets
* Trivy image scanning
* Private EKS worker nodes
* No credentials committed to Git

---

## 🚀 Deployment Flow

1. Developer pushes code to `main`
2. GitHub Actions pipeline triggers
3. Docker images built & pushed to ECR
4. Images scanned using Trivy
5. Manual approval required
6. Kubernetes deployments updated
7. ALB serves traffic to updated pods

---

## 🧪 Local Development

### Prerequisites

* Docker
* Docker Compose

### Run Locally

```bash
docker-compose up --build
```

Access:

* Frontend: `http://localhost`
* Backend API: `http://localhost:4000`

---

## 🧰 Prerequisites (Cloud)

* AWS Account
* Terraform
* kubectl
* AWS CLI
* GitHub Account

---

## 📊 Autoscaling

* Horizontal Pod Autoscaler configured
* Automatically scales pods based on CPU utilization

---

## 📈 Future Enhancements

* Canary deployments
* Git SHA–based image tagging
* Slack notifications
* Blue-green deployment strategy
* Observability (Prometheus + Grafana)
* WAF integration

---

## 🧠 Key Learnings

* Designing real-world cloud architectures
* End-to-end CI/CD automation
* Secure containerized workloads
* Kubernetes production best practices
* Infrastructure as Code with Terraform

---

## 👨‍💻 Author

**Ayush Srivastava**
Cloud & DevOps Engineer
🔗 GitHub: [https://github.com/AYUSH-1406](https://github.com/AYUSH-1406)


