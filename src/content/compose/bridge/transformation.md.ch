%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Compose Bridge default transformation
description: Learn about the Compose Bridge default transformation
keywords: compose, bridge, kubernetes
---
@y
---
title: Compose Bridge default transformation
description: Learn about the Compose Bridge default transformation
keywords: compose, bridge, kubernetes
---
@z

@x
{{< include "compose-bridge-early-access.md" >}}
@y
{{< include "compose-bridge-early-access.md" >}}
@z

@x
Compose Bridge produces Kubernetes manifests so you can deploy
your Compose application to Kubernetes that is enabled on Docker Desktop.
@y
Compose Bridge produces Kubernetes manifests so you can deploy
your Compose application to Kubernetes that is enabled on Docker Desktop.
@z

@x
Based on an arbitrary `compose.yaml` project, Compose Bridge will produce:
@y
Based on an arbitrary `compose.yaml` project, Compose Bridge will produce:
@z

@x
- A [Namespace](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/) so all your resources are isolated and don't colide with another deployment
- A [ConfigMap](https://kubernetes.io/docs/concepts/configuration/configmap/) with an entry for each and every config resource in your Compose model
- [Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) for application services 
- [Services](https://kubernetes.io/docs/concepts/services-networking/service/) for ports exposed by your services, used for service-to-service communication
- [Services](https://kubernetes.io/docs/concepts/services-networking/service/) for ports published by your services, with type `LoadBalancer` so that Docker Desktop will also expose same port on host
- [Network policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/) to replicate the networking topology expressed in Compose
- [PersistentVolumeClaims](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) for your volumes, using `hostpath` storage class so that Docker Desktop manages volume creation
- [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/) with your secret encoded - this is designed for local use in a testing environment
@y
- A [Namespace](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/) so all your resources are isolated and don't colide with another deployment
- A [ConfigMap](https://kubernetes.io/docs/concepts/configuration/configmap/) with an entry for each and every config resource in your Compose model
- [Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) for application services 
- [Services](https://kubernetes.io/docs/concepts/services-networking/service/) for ports exposed by your services, used for service-to-service communication
- [Services](https://kubernetes.io/docs/concepts/services-networking/service/) for ports published by your services, with type `LoadBalancer` so that Docker Desktop will also expose same port on host
- [Network policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/) to replicate the networking topology expressed in Compose
- [PersistentVolumeClaims](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) for your volumes, using `hostpath` storage class so that Docker Desktop manages volume creation
- [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/) with your secret encoded - this is designed for local use in a testing environment
@z

@x
And a Kustomize overlay dedicated to Docker Desktop with:
 - Loadbalancer for services which need to expose ports on host
 - A PersistentVolumeClaim to use the Docker Desktop storage provisioner `desktop-storage-provisioner`
 - A Kustomize file to link the all those resources together
@y
And a Kustomize overlay dedicated to Docker Desktop with:
 - Loadbalancer for services which need to expose ports on host
 - A PersistentVolumeClaim to use the Docker Desktop storage provisioner `desktop-storage-provisioner`
 - A Kustomize file to link the all those resources together
@z
