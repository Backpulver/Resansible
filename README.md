# Resansible Project

## Introduction

Resansible is a comprehensive solution designed for efficient backup and restoration management in Linux developer environments, leveraging the power of Ansible. This project automates the backup process, provides options for restoration, and ensures high availability and scalability through Kubernetes orchestration.

## Repository Structure

- `resansible.sh`: The main script for initiating backups and restorations.
- `Ansible/`: Directory containing Ansible playbooks for various operations.
- `Dockerfile`: Defines the Docker image for the Resansible application.
- `docker-compose.yml`: Docker Compose file for local deployment and testing.
- Kubernetes manifests: YAML files for deploying the application in a Kubernetes cluster.
- CI/CD pipeline files: GitHub Actions workflows for automated testing, building, and deployment.

## Resansible Script (`resansible.sh`)

The `resansible.sh` script is the entry point for executing backup and restoration tasks. It orchestrates the process, ensuring that backups are created at scheduled intervals and restoration can be performed as needed.

### Usage

#### Manual
Through the command line interface
```bash
./resansible.sh
```

#### Automatic
With the provided arguments
```bash
./resansible.sh -b(ackup)|-r(estore)
```

## Ansible Playbooks

Located in the `Ansible/` directory, these playbooks provide the automation logic for backup and restoration tasks.

- `linux_backup.yml`: Manages the backup process.
- `linux_restore_latest.yml`: Restores the latest backup.
- `linux_restore_manual.yml`: Allows for manual selection of backup for restoration.

## Dockerfile

Defines the Docker image for the Resansible application. The image is built on a lightweight Linux base image and includes necessary dependencies and Ansible.

## Docker Compose (`docker-compose.yml`)

Used for local deployment and testing, this Docker Compose file sets up the Resansible service, defining volume mounts for SSH keys and backup directories.

## Kubernetes Resources

The Kubernetes manifests deploy the Resansible application in a Kubernetes environment, ensuring scalability and high availability.

- Deployment: Manages the deployment of the Resansible containers.
- Service: Exposes the Resansible application within the Kubernetes cluster.
- PersistentVolumeClaims: Handle persistent storage for SSH keys and backups.

## CI/CD Process

The CI/CD pipeline, implemented using GitHub Actions, automates the process of testing, building, and deploying the Resansible application.

### Steps

1. **Linting**: Validates the syntax and style of code and configuration files.
2. **Security Scans**: Uses tools like SonarCloud, Checkov, and others for security analysis.
3. **Build and Publish**: Builds the Docker image and pushes it to DockerHub.
4. **Deployment**: Depending on the branch, deploys the application using either Docker Compose or Kubernetes.

### Manual Triggers

- For the main branch: Triggers a Kubernetes deployment.
- For other branches: Triggers a Docker Compose deployment.
