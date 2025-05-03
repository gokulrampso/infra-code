# Platform Manifests (Kubernetes, Istio, ArgoCD)

This directory contains all manifests and configuration for Kubernetes workloads, Istio service mesh, and ArgoCD GitOps management.

## Structure

- `base/`, `dev/`, `prod/` — Environment overlays for Kubernetes, Istio, and ArgoCD manifests
- `istio/` — Istio CRDs and mesh configuration (can be referenced or included in overlays)
- `argocd/` — ArgoCD Application CRs and related GitOps resources (can be referenced or included in overlays)

## Usage

- Place all Kubernetes, Istio, and ArgoCD manifests in the appropriate environment or subfolder.
- Use overlays to manage environment-specific configuration.
- This structure simplifies deployment and GitOps management by keeping all platform configuration in one place.
