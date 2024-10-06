%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Common challenges and questions
description: Explore common challenges and questions related to Docker Build Cloud.
weight: 40
---
@y
---
title: Common challenges and questions
description: Explore common challenges and questions related to Docker Build Cloud.
weight: 40
---
@z

@x
### Is Docker Build Cloud a standalone product or a part of Docker Desktop?
@y
### Is Docker Build Cloud a standalone product or a part of Docker Desktop?
@z

@x
Docker Build Cloud is a service that can be used both with Docker Desktop and
standalone. It lets you build your container images faster, both locally and in
CI, with builds running on cloud infrastructure. The service uses a remote
build cache, ensuring fast builds anywhere and for all team members.
@y
Docker Build Cloud is a service that can be used both with Docker Desktop and
standalone. It lets you build your container images faster, both locally and in
CI, with builds running on cloud infrastructure. The service uses a remote
build cache, ensuring fast builds anywhere and for all team members.
@z

@x
When used with Docker Desktop, the [Builds view](/desktop/use-desktop/builds/)
works with Docker Build Cloud out-of-the-box. It shows information about your
builds and those initiated by your team members using the same builder,
enabling collaborative troubleshooting.
@y
When used with Docker Desktop, the [Builds view](/desktop/use-desktop/builds/)
works with Docker Build Cloud out-of-the-box. It shows information about your
builds and those initiated by your team members using the same builder,
enabling collaborative troubleshooting.
@z

@x
To use Docker Build Cloud without Docker Desktop, you must
[download and install](/build-cloud/setup/#use-docker-build-cloud-without-docker-desktop)
a version of Buildx with support for Docker Build Cloud (the `cloud` driver).
If you plan on building with Docker Build Cloud using the `docker compose
build` command, you also need a version of Docker Compose that supports Docker
Build Cloud.
@y
To use Docker Build Cloud without Docker Desktop, you must
[download and install](/build-cloud/setup/#use-docker-build-cloud-without-docker-desktop)
a version of Buildx with support for Docker Build Cloud (the `cloud` driver).
If you plan on building with Docker Build Cloud using the `docker compose
build` command, you also need a version of Docker Compose that supports Docker
Build Cloud.
@z

@x
### How does Docker Build Cloud work with Docker Compose?
@y
### How does Docker Build Cloud work with Docker Compose?
@z

@x
Docker Compose works out of the box with Docker Build Cloud. Install the Docker
Build Cloud-compatible client (buildx) and it works with both commands.
@y
Docker Compose works out of the box with Docker Build Cloud. Install the Docker
Build Cloud-compatible client (buildx) and it works with both commands.
@z

@x
### How many minutes are included in Docker Build Cloud Team plans?
@y
### How many minutes are included in Docker Build Cloud Team plans?
@z

@x
You receive 200 minutes per month per purchased seat. If you are also a Docker
subscriber (Personal, Pro, Team, Business), you will also receive your included
build minutes from that plan.
@y
You receive 200 minutes per month per purchased seat. If you are also a Docker
subscriber (Personal, Pro, Team, Business), you will also receive your included
build minutes from that plan.
@z

@x
For example, if a Docker Team customer purchases 5 Build Cloud Team seats, they
will have 400 minutes from their Docker Team plan plus 1000 minutes (200 min/mo * 5 seats) 
for a total of 1400 minutes per month.
@y
For example, if a Docker Team customer purchases 5 Build Cloud Team seats, they
will have 400 minutes from their Docker Team plan plus 1000 minutes (200 min/mo * 5 seats) 
for a total of 1400 minutes per month.
@z

@x
### I’m a Docker personal user. Can I try Docker Build Cloud?
@y
### I’m a Docker personal user. Can I try Docker Build Cloud?
@z

@x
Docker subscribers (Pro, Team, Business) receive a set number of minutes each
month, shared across the account, to use Build Cloud.
@y
Docker subscribers (Pro, Team, Business) receive a set number of minutes each
month, shared across the account, to use Build Cloud.
@z

@x
If you do not have a Docker subscription, you may sign up for a free Personal
account and get 50 minutes per month. Personal accounts are limited to a single
user.
@y
If you do not have a Docker subscription, you may sign up for a free Personal
account and get 50 minutes per month. Personal accounts are limited to a single
user.
@z

@x
For teams to receive the shared cache benefit, they must either be on a Docker
Team, Docker Business, or paid Build Cloud Team plan. You may buy a month of
Build Cloud Team for the number of seats testing.
@y
For teams to receive the shared cache benefit, they must either be on a Docker
Team, Docker Business, or paid Build Cloud Team plan. You may buy a month of
Build Cloud Team for the number of seats testing.
@z

@x
### Does Docker Build Cloud support CI platforms? Does it work with GitHub Actions?
@y
### Does Docker Build Cloud support CI platforms? Does it work with GitHub Actions?
@z

@x
Yes, Docker Build Cloud can be used with various CI platforms including GitHub
Actions, CircleCI, Jenkins, and others. It can speed up your build pipelines,
which means less time spent waiting and context switching.
@y
Yes, Docker Build Cloud can be used with various CI platforms including GitHub
Actions, CircleCI, Jenkins, and others. It can speed up your build pipelines,
which means less time spent waiting and context switching.
@z

@x
Docker Build Cloud can be used with GitHub Actions to automate your build,
test, and deployment pipeline. Docker provides a set of official GitHub Actions
that you can use in your workflows.
@y
Docker Build Cloud can be used with GitHub Actions to automate your build,
test, and deployment pipeline. Docker provides a set of official GitHub Actions
that you can use in your workflows.
@z

@x
Using GitHub Actions with Docker Build Cloud is straightforward. With a
one-line change in your GitHub Actions configuration, everything else stays the
same. You don't need to create new pipelines. Learn more in the [CI
documentation](/build-cloud/ci/) for Docker Build Cloud.
@y
Using GitHub Actions with Docker Build Cloud is straightforward. With a
one-line change in your GitHub Actions configuration, everything else stays the
same. You don't need to create new pipelines. Learn more in the [CI
documentation](/build-cloud/ci/) for Docker Build Cloud.
@z

@x
<div id="dbc-lp-survey-anchor"></div>
@y
<div id="dbc-lp-survey-anchor"></div>
@z
