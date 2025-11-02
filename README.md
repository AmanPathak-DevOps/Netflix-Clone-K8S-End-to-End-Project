# 🎬 Netflix Clone - DevSecOps Project
[![LinkedIn](https://img.shields.io/badge/Connect%20with%20me%20on-LinkedIn-blue.svg)](https://www.linkedin.com/in/aman-devops/)
[![Discord](https://img.shields.io/badge/Discord-7289DA?style=for-the-badge&logo=discord&logoColor=white)](https://discord.com/invite/jdzF8kTtw2)
[![Medium](https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/@amanpathakdevops)
[![GitHub](https://img.shields.io/github/stars/AmanPathak-DevOps.svg?style=social)](https://github.com/AmanPathak-DevOps)
[![AWS](https://img.shields.io/badge/AWS-%F0%9F%9B%A1-orange)](https://aws.amazon.com)
[![Terraform](https://img.shields.io/badge/Terraform-%E2%9C%A8-lightgrey)](https://www.terraform.io)

![Architecture Diagram](assets/arch-diag.gif)


A **complete end-to-end DevSecOps project** showcasing how to automate, secure, and monitor infrastructure and applications using modern tools — from **Terraform to Kubernetes**, **Jenkins to Trivy**, and everything in between.  

Built to demonstrate **real-world DevSecOps workflows** for CI/CD, cloud automation, security integration, and observability — all in one Netflix-themed application. 🍿  

---

## 🚀 Project Overview

This project simulates a real enterprise-grade setup where a **React-based Netflix Clone** is deployed and managed through a **secure, automated DevOps pipeline**.

### 🌐 Key Features
- **Infrastructure as Code** with Terraform (AWS provisioning)
- **State management** using Terraform Cloud  
- **CI/CD automation** with GitHub Actions and Jenkins  
- **Security Scanning** with Trivy & OWASP Dependency Check  
- **Containerization** with Docker  
- **Kubernetes Deployment** (unmanaged cluster setup)  
- **Monitoring Stack** for Jenkins, Kubernetes, and the app itself  

---

## 🧩 Directory Structure
```bash
.
├── Application-Code        # Frontend Netflix Clone app built with React + Vite
│   ├── Dockerfile           # Docker image build instructions
│   ├── package.json         # Dependencies and scripts
│   ├── src/                 # Main source code
│   └── public/              # Static assets
│
├── Jenkins
│   └── Jenkinsfile          # CI/CD pipeline configuration (build → test → deploy)
│
├── Kubernetes
│   ├── deployment.yml       # App deployment manifest
│   └── service.yml          # K8s service exposure
│
└── Terraform
    ├── main.tf              # AWS resource definitions
    ├── backend.tf           # Terraform Cloud backend configuration
    ├── iam.tf               # IAM roles and policies
    ├── vpc.tf               # Network setup
    ├── variables.tf         # Input variables
    ├── dev.auto.tfvars      # Environment variables
    └── gather.tf            # Data sources and dependencies
```

## 🛠️ Tech Stack

| Category | Tools / Technologies |
|-----------|----------------------|
| **Infrastructure** | Terraform, AWS EC2, Terraform Cloud |
| **CI/CD** | Jenkins, GitHub Actions |
| **Security** | Trivy, SonarQube, OWASP Dependency Check |
| **Containerization** | Docker |
| **Orchestration** | Kubernetes (Unmanaged Cluster) |
| **Monitoring** | Node Exporter, Prometheus, Kube State Metrics |
| **Frontend** | React, Vite, TMDB API |

---

## 🎯 Objectives

1. Automate the entire infrastructure and application deployment lifecycle  
2. Integrate security and quality checks early in the pipeline  
3. Establish a fully observable, monitored system for reliability  
4. Showcase end-to-end DevSecOps workflow — ideal for portfolio and interviews  

---

## 📽️ How to do this Project?

> This project is documented through a **5-Part YouTube Series**, each building upon the previous one.

| Part | Title | Description |
|------|--------|-------------|
| 🧩 **Part 1** | *Terraform + GitHub Actions + AWS Setup* | Infrastructure setup & automation |
| ⚙️ **Part 2** | *Jenkins, Docker, SonarQube, Trivy Setup* | Core CI/CD pipeline foundations |
| 🧠 **Part 3** | *SonarQube + Trivy + TMDB + Pipeline Run* | Running secure pipelines |
| ☸️ **Part 4** | *Kubernetes Cluster Setup + Deployment* | Full app deployment in K8s |
| 📊 **Part 5** | *Monitoring Setup* | End-to-end observability |

📺 **Watch here:** [YT Playlist Link](https://youtube.com/playlist?list=PLyJzBek6WsDpKcOxL-F8rAl7FgliN9x6M&si=toDUa6Qx05LYHtbu)  
🧾 **Read on Medium:** [Medium Blog Series Link](https://blog.stackademic.com/building-a-complete-devsecops-project-part-1-automating-aws-infrastructure-with-terraform-cloud-a51e98b95783)

---

## 🔔 Bonus Tip

If you’re following along, don’t forget to:
- 🎥 **Watch the video version** for step-by-step guidance  
- 💼 **Tag [@Aman Pathak](https://www.linkedin.com/in/aman-devops/)** on LinkedIn when you post your progress — showcasing your DevOps achievements helps you grow professionally!

---

## 🧑‍💻 Author

**Connect with Me**  
DevOps & Cloud Engineer 
🔗 [LinkedIn](https://www.linkedin.com/in/aman-devops/) • [YouTube](https://www.youtube.com/@aman-pathak) • [Medium](https://medium.com/@amanpathakdevops)

## Contributing
We welcome contributions! If you have ideas for enhancements or find any issues, please open a pull request or file an issue.

## License
This project is licensed under the [MIT License](LICENSE).

Happy Coding! 🚀
