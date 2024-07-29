# GKE Terraform Terragrunt

This repository contains Terraform and Terragrunt configurations for deploying a Google Kubernetes Engine (GKE) cluster. The infrastructure is managed using Terraform modules, and the deployment process is streamlined using Terragrunt. The documentation of each module generated using github action with Terraform-Docs.

## Project Structure

```bash
├── live
│ ├── dev
│ │─├── gke
│ │ └── terragrunt.hcl
│ │─├── vpc
│ │ └── terragrunt.hcl
├── terragrunt.hcl
│
├── modules
│ ├── gke
│ │ ├── main.tf
│ │ ├── outputs.tf
│ │ ├── README.md
│ │ └── variables.tf
│ └── vpc
│ ├── main.tf
│ ├── outputs.tf
│ ├── README.md
│ └── variables.tf
└── README.md
```


## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.0.0 or later
- [Terragrunt](https://terragrunt.gruntwork.io/) v0.28.0 or later
- [Terraform-Docs](https://github.com/terraform-docs/terraform-docs)
- Google Cloud SDK configured and authenticated
- A Google Cloud project with billing enabled

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/JeremyArc/gke-terraform-terragrunt.git
cd gke-terraform-terragrunt
```

### 2. Initialize and apply Terraform configuration

```bash
cd live/dev/
terragrunt run-all init
terragrunt run-al apply
```
