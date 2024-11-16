%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Docker Build Cloud
@y
title: Docker Build Cloud
@z

@x
description: Find documentation on Docker Build Cloud to help you build your container images faster, both locally and in CI
keywords: build, cloud, cloud build, remote builder
@y
description: Find documentation on Docker Build Cloud to help you build your container images faster, both locally and in CI
keywords: build, cloud, cloud build, remote builder
@z

@x
Docker Build Cloud is a service that lets you build your container images
faster, both locally and in CI. Builds run on cloud infrastructure optimally
dimensioned for your workloads, no configuration required. The service uses a
remote build cache, ensuring fast builds anywhere and for all team members.
@y
Docker Build Cloud is a service that lets you build your container images
faster, both locally and in CI. Builds run on cloud infrastructure optimally
dimensioned for your workloads, no configuration required. The service uses a
remote build cache, ensuring fast builds anywhere and for all team members.
@z

@x
## How Docker Build Cloud works
@y
## Docker Build Cloud はどのように動作するか {#how-docker-build-cloud-works}
@z

@x
Using Docker Build Cloud is no different from running a regular build. You invoke a
build the same way you normally would, using `docker buildx build`. The
difference is in where and how that build gets executed.
@y
Using Docker Build Cloud is no different from running a regular build. You invoke a
build the same way you normally would, using `docker buildx build`. The
difference is in where and how that build gets executed.
@z

@x
By default when you invoke a build command, the build runs on a local instance
of BuildKit, bundled with the Docker daemon. With Docker Build Cloud, you send
the build request to a BuildKit instance running remotely, in the cloud.
All data is encrypted in transit.
@y
By default when you invoke a build command, the build runs on a local instance
of BuildKit, bundled with the Docker daemon. With Docker Build Cloud, you send
the build request to a BuildKit instance running remotely, in the cloud.
All data is encrypted in transit.
@z

@x
The remote builder executes the build steps, and sends the resulting build
output to the destination that you specify. For example, back to your local
Docker Engine image store, or to an image registry.
@y
The remote builder executes the build steps, and sends the resulting build
output to the destination that you specify. For example, back to your local
Docker Engine image store, or to an image registry.
@z

@x
Docker Build Cloud provides several benefits over local builds:
@y
Docker Build Cloud provides several benefits over local builds:
@z

@x
- Improved build speed
- Shared build cache
- Native multi-platform builds
@y
- Improved build speed
- Shared build cache
- Native multi-platform builds
@z

@x
And the best part: you don't need to worry about managing builders or
infrastructure. Just connect to your builders, and start building.
Each cloud builder provisioned to an organization is completely
isolated to a single Amazon EC2 instance, with a dedicated EBS volume for build
cache, and encryption in transit. That means there are no shared processes or
data between cloud builders.
@y
And the best part: you don't need to worry about managing builders or
infrastructure. Just connect to your builders, and start building.
Each cloud builder provisioned to an organization is completely
isolated to a single Amazon EC2 instance, with a dedicated EBS volume for build
cache, and encryption in transit. That means there are no shared processes or
data between cloud builders.
@z

@x
> [!NOTE]
>
> Docker Build Cloud is currently only available in the US East region. Users
> in Europe and Asia may experience increased latency compared to users based
> in North America.
>
> Support for multi-region builders is on the roadmap.
@y
> [!NOTE]
>
> Docker Build Cloud is currently only available in the US East region. Users
> in Europe and Asia may experience increased latency compared to users based
> in North America.
>
> Support for multi-region builders is on the roadmap.
@z

@x
## Get Docker Build Cloud
@y
## Get Docker Build Cloud
@z

@x
To get started with Docker Build Cloud,
[create a Docker account](/accounts/create-account/)
and sign up for the starter plan on the
[Docker Build Cloud Dashboard](https://app.docker.com/build/).
@y
To get started with Docker Build Cloud,
[create a Docker account](/accounts/create-account/)
and sign up for the starter plan on the
[Docker Build Cloud Dashboard](https://app.docker.com/build/).
@z

@x
If your organization isn't already on a paid Docker subscription, you will
need to provide a payment method to sign up for Docker Build Cloud. If you
select the starter plan, there will be no charges on the provided payment
method, it's only required for verification purposes.
@y
If your organization isn't already on a paid Docker subscription, you will
need to provide a payment method to sign up for Docker Build Cloud. If you
select the starter plan, there will be no charges on the provided payment
method, it's only required for verification purposes.
@z

@x
Once you've signed up and created a builder, continue by
[setting up the builder in your local environment](./setup.md).
@y
Once you've signed up and created a builder, continue by
[setting up the builder in your local environment](./setup.md).
@z

@x
For more information about the available subscription plans, see
[Docker Build Cloud subscriptions and features](/manuals/subscription/build-cloud/build-details.md).
For information about roles and permissions related to Docker Build Cloud, see
[Roles and Permissions](/manuals/security/for-admins/roles-and-permissions.md#docker-build-cloud).
@y
For more information about the available subscription plans, see
[Docker Build Cloud subscriptions and features](manuals/subscription/build-cloud/build-details.md).
For information about roles and permissions related to Docker Build Cloud, see
[Roles and Permissions](manuals/security/for-admins/roles-and-permissions.md#docker-build-cloud).
@z
