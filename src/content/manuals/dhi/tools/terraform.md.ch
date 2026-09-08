%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Use the DHI Terraform provider
linktitle: Terraform
description: Use the DHI Terraform provider to manage mirrors and customizations as infrastructure as code.
@y
title: Use the DHI Terraform provider
linktitle: Terraform
description: Use the DHI Terraform provider to manage mirrors and customizations as infrastructure as code.
@z

@x
keywords: dhi terraform, docker hardened images terraform, infrastructure as code, dhi mirror terraform, dhi provider
@y
keywords: dhi terraform, docker hardened images terraform, infrastructure as code, dhi mirror terraform, dhi provider
@z

@x
The [DHI Terraform provider](https://registry.terraform.io/providers/docker-hardened-images/dhi/latest/docs)
lets you manage Docker Hardened Image mirrors and customizations as
infrastructure as code.
@y
The [DHI Terraform provider](https://registry.terraform.io/providers/docker-hardened-images/dhi/latest/docs)
lets you manage Docker Hardened Image mirrors and customizations as
infrastructure as code.
@z

@x
## Install and configure the provider
@y
## Install and configure the provider
@z

@x
Add the provider to your Terraform configuration:
@y
Add the provider to your Terraform configuration:
@z

@x
```hcl
terraform {
  required_providers {
    dhi = {
      source = "docker-hardened-images/dhi"
    }
  }
}
@y
```hcl
terraform {
  required_providers {
    dhi = {
      source = "docker-hardened-images/dhi"
    }
  }
}
@z

@x
provider "dhi" {
  docker_hub_username = var.docker_username
  docker_hub_password = var.docker_password
  organization        = var.org_name
}
```
@y
provider "dhi" {
  docker_hub_username = var.docker_username
  docker_hub_password = var.docker_password
  organization        = var.org_name
}
```
@z

@x
Instead of specifying credentials in the provider block, you can set environment
variables:
@y
Instead of specifying credentials in the provider block, you can set environment
variables:
@z

@x
| Variable | Description |
|----------|-------------|
| `DOCKER_USERNAME` | Docker Hub username or organization namespace |
| `DOCKER_PASSWORD` | Docker Hub password or personal/organization access token |
| `DHI_ORG` | Target organization namespace |
@y
| Variable | Description |
|----------|-------------|
| `DOCKER_USERNAME` | Docker Hub username or organization namespace |
| `DOCKER_PASSWORD` | Docker Hub password or personal/organization access token |
| `DHI_ORG` | Target organization namespace |
@z

@x
You can authenticate using a personal access token (PAT) or an organization
access token (OAT) in place of a password. When using an OAT, permission scopes
apply:
@y
You can authenticate using a personal access token (PAT) or an organization
access token (OAT) in place of a password. When using an OAT, permission scopes
apply:
@z

@x
- Read (pull) access is required to list mirrors.
- Push access is required to create or delete mirrors.
@y
- Read (pull) access is required to list mirrors.
- Push access is required to create or delete mirrors.
@z

@x
## Resources
@y
## Resources
@z

@x
### `dhi_mirror`
@y
### `dhi_mirror`
@z

@x
Manages a mirrored DHI repository in your organization. See [Mirror a Docker
Hardened Image repository](/dhi/how-to/mirror/) for task-based examples.
@y
Manages a mirrored DHI repository in your organization. See [Mirror a Docker
Hardened Image repository](__SUBDIR__/dhi/how-to/mirror/) for task-based examples.
@z

@x
For the full list of resource attributes, see the [Terraform Registry
documentation](https://registry.terraform.io/providers/docker-hardened-images/dhi/latest/docs/resources/mirror).
@y
For the full list of resource attributes, see the [Terraform Registry
documentation](https://registry.terraform.io/providers/docker-hardened-images/dhi/latest/docs/resources/mirror).
@z

@x
### `dhi_customization`
@y
### `dhi_customization`
@z

@x
Manages image customizations applied to a mirrored repository. See [Customize a
Docker Hardened Image](/dhi/how-to/customize/) for task-based examples.
@y
Manages image customizations applied to a mirrored repository. See [Customize a
Docker Hardened Image](__SUBDIR__/dhi/how-to/customize/) for task-based examples.
@z

@x
For the full list of resource attributes, see the [Terraform Registry
documentation](https://registry.terraform.io/providers/docker-hardened-images/dhi/latest/docs/resources/customization).
@y
For the full list of resource attributes, see the [Terraform Registry
documentation](https://registry.terraform.io/providers/docker-hardened-images/dhi/latest/docs/resources/customization).
@z
