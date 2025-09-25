%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Use a Docker Hardened Image in Kubernetes
linktitle: Use an image in Kubernetes
description: Learn how to use Docker Hardened Images in Kubernetes deployments.
keywords: use hardened image, kubernetes, k8s
@y
title: Use a Docker Hardened Image in Kubernetes
linktitle: Use an image in Kubernetes
description: Learn how to use Docker Hardened Images in Kubernetes deployments.
keywords: use hardened image, kubernetes, k8s
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
## Authentication
@y
## Authentication
@z

@x
To be able to use Docker Hardened Images in Kubernetes, you need to create a 
Kubernetes secret for pulling images from your mirror or internal registry.
@y
To be able to use Docker Hardened Images in Kubernetes, you need to create a 
Kubernetes secret for pulling images from your mirror or internal registry.
@z

@x
> [!NOTE]
>
> You need to create this secret in each Kubernetes namespace that uses a DHI.
@y
> [!NOTE]
>
> You need to create this secret in each Kubernetes namespace that uses a DHI.
@z

@x
Create a secret using a Personal Access Token (PAT). Ensure the token has at least
read-only access to private repositories. For Docker Hub replace `<registry server>`
with `docker.io`.
@y
Create a secret using a Personal Access Token (PAT). Ensure the token has at least
read-only access to private repositories. For Docker Hub replace `<registry server>`
with `docker.io`.
@z

% snip command...

@x
To tests the secrets use the following command:
@y
To tests the secrets use the following command:
@z

% snip command...

@x
Get the status of the pod by running:
@y
Get the status of the pod by running:
@z

% snip command...

@x
The command should return the following result:
@y
The command should return the following result:
@z

% snip output...

@x
If instead, the result is the following, there might be an issue with your secret.
@y
If instead, the result is the following, there might be an issue with your secret.
@z

% snip output...

@x
Verify the output of the pod by running, which should return `Hello from DHI in Kubernetes!`
@y
Verify the output of the pod by running, which should return `Hello from DHI in Kubernetes!`
@z

% snip command...

@x
After a successful test, the test pod can be deleted with the following command:
@y
After a successful test, the test pod can be deleted with the following command:
@z

% snip command...
