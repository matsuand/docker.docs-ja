%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Dev Environments
keywords: Dev Environments, share, Docker Desktop
title: Distribute your dev environment
@y
description: Dev Environments
keywords: Dev Environments, share, Docker Desktop
title: Distribute your dev environment
@z

@x
{{% include "dev-envs-changing.md" %}}
@y
{{% include "dev-envs-changing.md" %}}
@z

@x
The `compose-dev.yaml` config file makes distributing your dev environment easy so everyone can access the same code and any dependencies.
@y
The `compose-dev.yaml` config file makes distributing your dev environment easy so everyone can access the same code and any dependencies.
@z

@x
### Distribute your dev environment
@y
### Distribute your dev environment
@z

@x
When you are ready to share your environment, simply copy the link to the Github repo where your project is stored, and share the link with your team members. 
@y
When you are ready to share your environment, simply copy the link to the Github repo where your project is stored, and share the link with your team members. 
@z

@x
You can also create a link that automatically starts your dev environment when opened. This can then be placed on a GitHub README or pasted into a Slack channel, for example. 
@y
You can also create a link that automatically starts your dev environment when opened. This can then be placed on a GitHub README or pasted into a Slack channel, for example. 
@z

@x
To create the link simply join the following link with the link to your dev environment's GitHub repository:
@y
To create the link simply join the following link with the link to your dev environment's GitHub repository:
@z

@x
`https://open.docker.com/dashboard/dev-envs?url=`
@y
`https://open.docker.com/dashboard/dev-envs?url=`
@z

@x
The following example opens a [Compose sample](https://github.com/docker/awesome-compose/tree/master/nginx-golang-mysql), a Go server with an Nginx proxy and a MariaDB/MySQL database, in Docker Desktop.
@y
The following example opens a [Compose sample](https://github.com/docker/awesome-compose/tree/master/nginx-golang-mysql), a Go server with an Nginx proxy and a MariaDB/MySQL database, in Docker Desktop.
@z

@x
[https://open.docker.com/dashboard/dev-envs?url=https://github.com/docker/awesome-compose/tree/master/nginx-golang-mysql](https://open.docker.com/dashboard/dev-envs?url=https://github.com/docker/awesome-compose/tree/master/nginx-golang-mysql)
@y
[https://open.docker.com/dashboard/dev-envs?url=https://github.com/docker/awesome-compose/tree/master/nginx-golang-mysql](https://open.docker.com/dashboard/dev-envs?url=https://github.com/docker/awesome-compose/tree/master/nginx-golang-mysql)
@z

@x
### Open a dev environment that has been distributed to you
@y
### Open a dev environment that has been distributed to you
@z

@x
To open a dev environment that has been shared with you, select the **Create** button in the top right-hand corner, select source **Existing Git repo**, and then paste the URL.
@y
To open a dev environment that has been shared with you, select the **Create** button in the top right-hand corner, select source **Existing Git repo**, and then paste the URL.
@z
