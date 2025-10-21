%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Use the default Compose Bridge transformation
linkTitle: Usage
@y
title: Use the default Compose Bridge transformation
linkTitle: Usage
@z

@x
description: Learn how to use the default Compose Bridge transformation to convert Compose files into Kubernetes manifests
keywords: docker compose bridge, compose kubernetes transform, kubernetes from compose, compose bridge convert, compose.yaml to kubernetes
@y
description: Learn how to use the default Compose Bridge transformation to convert Compose files into Kubernetes manifests
keywords: docker compose bridge, compose kubernetes transform, kubernetes from compose, compose bridge convert, compose.yaml to kubernetes
@z

@x
{{< summary-bar feature_name="Compose bridge" >}}
@y
{{< summary-bar feature_name="Compose bridge" >}}
@z

@x
Compose Bridge includes a built-in transformation that automatically converts your Compose configuration into a set of Kubernetes manifests.
@y
Compose Bridge includes a built-in transformation that automatically converts your Compose configuration into a set of Kubernetes manifests.
@z

@x
Based on your `compose.yaml` file, it produces:
@y
Based on your `compose.yaml` file, it produces:
@z

@x
- A [Namespace](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/) so all your resources are isolated and don't conflict with resources from other deployments.
- A [ConfigMap](https://kubernetes.io/docs/concepts/configuration/configmap/) with an entry for each and every [config](/reference/compose-file/configs.md) resource in your Compose application.
- [Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) for application services. This ensures that the specified number of instances of your application are maintained in the Kubernetes cluster.
- [Services](https://kubernetes.io/docs/concepts/services-networking/service/) for ports exposed by your services, used for service-to-service communication.
- [Services](https://kubernetes.io/docs/concepts/services-networking/service/) for ports published by your services, with type `LoadBalancer` so that Docker Desktop will also expose the same port on the host.
- [Network policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/) to replicate the networking topology defined in your `compose.yaml` file. 
- [PersistentVolumeClaims](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) for your volumes, using `hostpath` storage class so that Docker Desktop manages volume creation.
- [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/) with your secret encoded. This is designed for local use in a testing environment.
@y
- A [Namespace](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/) so all your resources are isolated and don't conflict with resources from other deployments.
- A [ConfigMap](https://kubernetes.io/docs/concepts/configuration/configmap/) with an entry for each and every [config](reference/compose-file/configs.md) resource in your Compose application.
- [Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) for application services. This ensures that the specified number of instances of your application are maintained in the Kubernetes cluster.
- [Services](https://kubernetes.io/docs/concepts/services-networking/service/) for ports exposed by your services, used for service-to-service communication.
- [Services](https://kubernetes.io/docs/concepts/services-networking/service/) for ports published by your services, with type `LoadBalancer` so that Docker Desktop will also expose the same port on the host.
- [Network policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/) to replicate the networking topology defined in your `compose.yaml` file. 
- [PersistentVolumeClaims](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) for your volumes, using `hostpath` storage class so that Docker Desktop manages volume creation.
- [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/) with your secret encoded. This is designed for local use in a testing environment.
@z

@x
It also supplies a Kustomize overlay dedicated to Docker Desktop with:
 - `Loadbalancer` for services which need to expose ports on host.
 - A `PersistentVolumeClaim` to use the Docker Desktop storage provisioner `desktop-storage-provisioner` to handle volume provisioning more effectively.
 - A `Kustomization.yaml` file to link all the resources together.
@y
It also supplies a Kustomize overlay dedicated to Docker Desktop with:
 - `Loadbalancer` for services which need to expose ports on host.
 - A `PersistentVolumeClaim` to use the Docker Desktop storage provisioner `desktop-storage-provisioner` to handle volume provisioning more effectively.
 - A `Kustomization.yaml` file to link all the resources together.
@z

@x
If your Compose file defines a `models` section for a service, Compose Bridge automatically configures your deployment so your service can locate and use its models via Docker Model Runner.
@y
If your Compose file defines a `models` section for a service, Compose Bridge automatically configures your deployment so your service can locate and use its models via Docker Model Runner.
@z

@x
For each declared model, the transformation injects two environment variables:
@y
For each declared model, the transformation injects two environment variables:
@z

@x
- `<MODELNAME>_URL`: The endpoint for Docker Model Runner serving that model  
- `<MODELNAME>_MODEL`: The model’s name or identifier
@y
- `<MODELNAME>_URL`: The endpoint for Docker Model Runner serving that model  
- `<MODELNAME>_MODEL`: The model’s name or identifier
@z

@x
You can optionally customize these variable names using `endpoint_var` and `model_var`.
@y
You can optionally customize these variable names using `endpoint_var` and `model_var`.
@z

@x
The default transformation generates two different overlays - one for Docker Desktop whilst using a local instance of Docker Model Runner, and a `model-runner` overlay with all the relevant Kubernetes resources to deploy Docker Model Runner in a pod. 
@y
The default transformation generates two different overlays - one for Docker Desktop whilst using a local instance of Docker Model Runner, and a `model-runner` overlay with all the relevant Kubernetes resources to deploy Docker Model Runner in a pod. 
@z

@x
| Environment    | Endpoint                                        |
| -------------- | ----------------------------------------------- |
| Docker Desktop | `http://host.docker.internal:12434/engines/v1/` |
| Kubernetes     | `http://model-runner/engines/v1/`               |
@y
| Environment    | Endpoint                                        |
| -------------- | ----------------------------------------------- |
| Docker Desktop | `http://host.docker.internal:12434/engines/v1/` |
| Kubernetes     | `http://model-runner/engines/v1/`               |
@z

@x
For more details, see [Use Model Runner](use-model-runner.md).
@y
For more details, see [Use Model Runner](use-model-runner.md).
@z

@x
## Use the default Compose Bridge transformation
@y
## Use the default Compose Bridge transformation
@z

@x
To convert your Compose file using the default transformation:
@y
To convert your Compose file using the default transformation:
@z

% snip command...

@x
Compose looks for a `compose.yaml` file inside the current directory and generates Kubernetes manifests.
@y
Compose looks for a `compose.yaml` file inside the current directory and generates Kubernetes manifests.
@z

@x
Example output:
@y
Example output:
@z

% snip command...

@x
All generated files are stored in the `/out` directory in your project.
@y
All generated files are stored in the `/out` directory in your project.
@z

@x
## Deploy the generated manifests
@y
## Deploy the generated manifests
@z

@x
> [!IMPORTANT]
>
> Before you deploy your Compose Bridge transformations, make sure you have [enabled Kubernetes](/manuals/desktop/settings-and-maintenance/settings.md#kubernetes) in Docker Desktop.
@y
> [!IMPORTANT]
>
> Before you deploy your Compose Bridge transformations, make sure you have [enabled Kubernetes](manuals/desktop/settings-and-maintenance/settings.md#kubernetes) in Docker Desktop.
@z

@x
Once the manifests are generated, deploy them to your local Kubernetes cluster:
@y
Once the manifests are generated, deploy them to your local Kubernetes cluster:
@z

% snip command...

@x
> [!TIP]
>
> You can convert and deploy your Compose project to a Kubernetes cluster from the Compose file viewer.
> 
> Make sure you are signed in to your Docker account, navigate to your container in the **Containers** view, and in the top-right corner select **View configurations** and then **Convert and Deploy to Kubernetes**. 
@y
> [!TIP]
>
> You can convert and deploy your Compose project to a Kubernetes cluster from the Compose file viewer.
> 
> Make sure you are signed in to your Docker account, navigate to your container in the **Containers** view, and in the top-right corner select **View configurations** and then **Convert and Deploy to Kubernetes**. 
@z

@x
## Additional commands
@y
## Additional commands
@z

@x
Convert a `compose.yaml` file located in another directory:
@y
Convert a `compose.yaml` file located in another directory:
@z

% snip command...

@x
To see all available flags, run:
@y
To see all available flags, run:
@z

% snip command...

@x
## What's next?
@y
## What's next?
@z

@x
- [Explore how you can customize Compose Bridge](customize.md)
- [Use Model Runner](use-model-runner.md).
@y
- [Explore how you can customize Compose Bridge](customize.md)
- [Use Model Runner](use-model-runner.md).
@z
