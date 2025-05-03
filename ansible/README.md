# Ansible

This directory contains Ansible playbooks, roles, and inventory files for automating configuration and management of infrastructure resources, especially Kubernetes worker nodes.

## Structure

- `install_k8s_worker.yml` — Main playbook to install and configure Kubernetes (kubeadm, kubelet, kubectl) and Docker on all EC2 worker nodes. Contains detailed comments for each step.
- `inventory/` — Inventory files for different environments (e.g., `dev`, `prod`).
  - `dev/hosts` — Example inventory file with comments. Lists worker node IPs/hostnames and SSH connection details.
- `roles/` — Reusable Ansible roles.
  - `k8s_worker/` — Role to install and configure Kubernetes and Docker on worker nodes.
    - `tasks/main.yml` — All tasks for the role, with detailed comments.

## Usage

1. **Configure your inventory:**
   - Edit `inventory/dev/hosts` to list your worker node IPs/hostnames and SSH details.
2. **Run the playbook directly:**
   ```sh
   ansible-playbook -i inventory/dev/hosts install_k8s_worker.yml
   ```
   Or, if using the role:
   ```yaml
   # install_k8s_worker.yml
   ---
   - name: Install Kubernetes on EC2 Worker Nodes
     hosts: workers
     become: yes
     vars:
       kubernetes_version: "1.29.0-00"
     roles:
       - k8s_worker
   ```
3. **(Optional) Customize the role:**
   - Edit `roles/k8s_worker/tasks/main.yml` to add or modify tasks as needed for your environment.

## File Descriptions

- **inventory/dev/hosts** — Lists all worker nodes and SSH connection info. Comments explain each section.
- **install_k8s_worker.yml** — Playbook to install Docker and Kubernetes on all worker nodes. Each task is commented for clarity.
- **roles/k8s_worker/tasks/main.yml** — Role tasks for installing and configuring Kubernetes and Docker, with detailed comments.

This setup ensures all EC2 worker nodes are ready for Kubernetes workloads and can join your cluster as needed.

## Purpose

- Install and configure Kubernetes (kubeadm, kubelet, kubectl) on the 3 EC2 worker nodes provisioned by Terraform.
- Prepare the nodes to join the AWS EKS cluster if required, or set up a standalone Kubernetes cluster if not using EKS control plane.
