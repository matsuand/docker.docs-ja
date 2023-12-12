%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Integrate JFrog Artifactory and JFrog Container Registry with Docker Scout
keywords: docker scout, jfrog, artifactory, jcr, integration, image analysis, security, cves
title: Artifactory integration
aliases:
  - /scout/artifactory/
---
@y
---
description: Integrate JFrog Artifactory and JFrog Container Registry with Docker Scout
keywords: docker scout, jfrog, artifactory, jcr, integration, image analysis, security, cves
title: Artifactory integration
aliases:
  - /scout/artifactory/
---
@z

@x
Integrating Docker Scout with JFrog Artifactory lets you run image analysis
automatically on images in Artifactory registries.
@y
Integrating Docker Scout with JFrog Artifactory lets you run image analysis
automatically on images in Artifactory registries.
@z

@x
## Local image analysis
@y
## Local image analysis
@z

@x
You can analyze Artifactory images for vulnerabilities locally using Docker Desktop or the Docker CLI. You first need to authenticate with JFrog Artifactory using the [`docker login`](/engine/reference/commandline/login/) command. For example:
@y
You can analyze Artifactory images for vulnerabilities locally using Docker Desktop or the Docker CLI. You first need to authenticate with JFrog Artifactory using the [`docker login`](/engine/reference/commandline/login/) command. For example:
@z

@x
```bash
docker login {URL}
```
@y
```bash
docker login {URL}
```
@z

@x
> **Tip**
>
> For cloud-hosted Artifactory you can find the credentials for your Artifactory repository by
> selecting it in the Artifactory UI and then the **Set Me Up** button.
{ .tip }
@y
> **Tip**
>
> For cloud-hosted Artifactory you can find the credentials for your Artifactory repository by
> selecting it in the Artifactory UI and then the **Set Me Up** button.
{ .tip }
@z

@x
## Remote image analysis
@y
## Remote image analysis
@z

@x
To automatically analyze images running in remote environments you need to deploy the Docker Scout Artifactory agent. The agent is a
standalone service that analyzes images and uploads the result to Docker Scout.
You can view the results using the
[Docker Scout Dashboard](https://scout.docker.com/).
@y
To automatically analyze images running in remote environments you need to deploy the Docker Scout Artifactory agent. The agent is a
standalone service that analyzes images and uploads the result to Docker Scout.
You can view the results using the
[Docker Scout Dashboard](https://scout.docker.com/).
@z

@x
### How the agent works
@y
### How the agent works
@z

@x
The Docker Scout Artifactory agent is available as an
[image on Docker Hub](https://hub.docker.com/r/docker/artifactory-agent). The agent works by continuously polling
Artifactory for new images. When it finds a new image, it performs the following
steps:
@y
The Docker Scout Artifactory agent is available as an
[image on Docker Hub](https://hub.docker.com/r/docker/artifactory-agent). The agent works by continuously polling
Artifactory for new images. When it finds a new image, it performs the following
steps:
@z

@x
1. Pull the image from Artifactory
2. Analyze the image
3. Upload the analysis result to Docker Scout
@y
1. Pull the image from Artifactory
2. Analyze the image
3. Upload the analysis result to Docker Scout
@z

@x
The agent records the Software Bill of Materials (SBOM) for the image, and the
SBOMs for all of its base images. The recorded SBOMs include both Operating
System (OS)-level and application-level programs or dependencies that the image
contains.
@y
The agent records the Software Bill of Materials (SBOM) for the image, and the
SBOMs for all of its base images. The recorded SBOMs include both Operating
System (OS)-level and application-level programs or dependencies that the image
contains.
@z

@x
Additionally, the agent sends the following metadata about the image to Docker Scout:
@y
Additionally, the agent sends the following metadata about the image to Docker Scout:
@z

@x
- The source repository URL and commit SHA for the image
- Build instructions
- Build date
- Tags and digest
- Target platforms
- Layer sizes
@y
- The source repository URL and commit SHA for the image
- Build instructions
- Build date
- Tags and digest
- Target platforms
- Layer sizes
@z

@x
The agent never transacts the image
itself, nor any data inside the image, such as code, binaries, and layer blobs.
@y
The agent never transacts the image
itself, nor any data inside the image, such as code, binaries, and layer blobs.
@z

@x
The agent doesn't detect and analyze pre-existing images. It only analyzes
images that appear in the registry while the agent is running.
@y
The agent doesn't detect and analyze pre-existing images. It only analyzes
images that appear in the registry while the agent is running.
@z

@x
### Deploy the agent
@y
### Deploy the agent
@z

@x
This section describes the steps for deploying the Artifactory agent.
@y
This section describes the steps for deploying the Artifactory agent.
@z

@x
#### Prerequisites
@y
#### Prerequisites
@z

@x
Before you deploy the agent, ensure that you meet the prerequisites:
@y
Before you deploy the agent, ensure that you meet the prerequisites:
@z

@x
- The server where you host the agent can access the following resources over
  the network:
  - Your JFrog Artifactory instance
  - `hub.docker.com`, port 443, for authenticating with Docker
  - `api.dso.docker.com`, port 443, for transacting data to Docker Scout
- The server isn't behind a proxy
- The registries are Docker V2 registries. V1 registries aren't supported.
@y
- The server where you host the agent can access the following resources over
  the network:
  - Your JFrog Artifactory instance
  - `hub.docker.com`, port 443, for authenticating with Docker
  - `api.dso.docker.com`, port 443, for transacting data to Docker Scout
- The server isn't behind a proxy
- The registries are Docker V2 registries. V1 registries aren't supported.
@z

@x
The agent supports all versions of JFrog Artifactory and JFrog Container
Registry.
@y
The agent supports all versions of JFrog Artifactory and JFrog Container
Registry.
@z

@x
#### Create the configuration file
@y
#### Create the configuration file
@z

@x
You configure the agent using a JSON file. The agent expects the configuration
file to be in `/opt/artifactory-agent/data/config.json` on startup.
@y
You configure the agent using a JSON file. The agent expects the configuration
file to be in `/opt/artifactory-agent/data/config.json` on startup.
@z

@x
The configuration file includes the following properties:
@y
The configuration file includes the following properties:
@z

@x
| Property                    | Description                                                                     |
| --------------------------- | ------------------------------------------------------------------------------- |
| `agent_id`                  | Unique identifier for the agent.                                                |
| `docker.organization_name`  | Name of the Docker organization.                                                |
| `docker.username`           | Username of the admin user in the Docker organization.                          |
| `docker.pat`                | Personal access token of the admin user with read and write permissions.        |
| `artifactory.base_url`      | Base URL of the Artifactory instance.                                           |
| `artifactory.username`      | Username of the Artifactory user with read permissions that the agent will use. |
| `artifactory.password`      | Password or API token for the Artifactory user.                                 |
| `artifactory.image_filters` | Optional: List of repositories and images to analyze.                           |
@y
| Property                    | Description                                                                     |
| --------------------------- | ------------------------------------------------------------------------------- |
| `agent_id`                  | Unique identifier for the agent.                                                |
| `docker.organization_name`  | Name of the Docker organization.                                                |
| `docker.username`           | Username of the admin user in the Docker organization.                          |
| `docker.pat`                | Personal access token of the admin user with read and write permissions.        |
| `artifactory.base_url`      | Base URL of the Artifactory instance.                                           |
| `artifactory.username`      | Username of the Artifactory user with read permissions that the agent will use. |
| `artifactory.password`      | Password or API token for the Artifactory user.                                 |
| `artifactory.image_filters` | Optional: List of repositories and images to analyze.                           |
@z

@x
If you don't specify any repositories in `artifactory.image_filters`, the agent
runs image analysis on all images in your Artifactory instance.
@y
If you don't specify any repositories in `artifactory.image_filters`, the agent
runs image analysis on all images in your Artifactory instance.
@z

@x
The following snippet shows a sample configuration:
@y
The following snippet shows a sample configuration:
@z

@x
```json
{
  "agent_id": "acme-prod-agent",
  "docker": {
    "organization_name": "acme",
    "username": "mobythewhale",
    "pat": "dckr_pat__dsaCAs_xL3kNyupAa7dwO1alwg"
  },
  "artifactory": [
    {
      "base_url": "https://acme.jfrog.io",
      "username": "acmeagent",
      "password": "hayKMvFKkFp42RAwKz2K",
      "image_filters": [
        {
          "repository": "dev-local",
          "images": ["internal/repo1", "internal/repo2"]
        },
        {
          "repository": "prod-local",
          "images": ["staging/repo1", "prod/repo1"]
        }
      ]
    }
  ]
}
```
@y
```json
{
  "agent_id": "acme-prod-agent",
  "docker": {
    "organization_name": "acme",
    "username": "mobythewhale",
    "pat": "dckr_pat__dsaCAs_xL3kNyupAa7dwO1alwg"
  },
  "artifactory": [
    {
      "base_url": "https://acme.jfrog.io",
      "username": "acmeagent",
      "password": "hayKMvFKkFp42RAwKz2K",
      "image_filters": [
        {
          "repository": "dev-local",
          "images": ["internal/repo1", "internal/repo2"]
        },
        {
          "repository": "prod-local",
          "images": ["staging/repo1", "prod/repo1"]
        }
      ]
    }
  ]
}
```
@z

@x
Create a configuration file and save it somewhere on the server where you plan
to run the agent. For example, `/var/opt/artifactory-agent/config.json`.
@y
Create a configuration file and save it somewhere on the server where you plan
to run the agent. For example, `/var/opt/artifactory-agent/config.json`.
@z

@x
#### Run the agent
@y
#### Run the agent
@z

@x
The following example shows how to run the Docker Scout Artifactory agent using
`docker run`. This command creates a bind mount for the directory containing the
JSON configuration file created earlier at `/opt/artifactory-agent/data` inside
the container. Make sure the mount path you use is the directory containing the
`config.json` file.
@y
The following example shows how to run the Docker Scout Artifactory agent using
`docker run`. This command creates a bind mount for the directory containing the
JSON configuration file created earlier at `/opt/artifactory-agent/data` inside
the container. Make sure the mount path you use is the directory containing the
`config.json` file.
@z

@x
<!-- prettier-ignore -->
> **Important**
>
> Use the `v1` tag of the Artifactory agent image. Don't use the `latest` tag as
> doing so may incur breaking changes.
{ .important }
@y
<!-- prettier-ignore -->
> **Important**
>
> Use the `v1` tag of the Artifactory agent image. Don't use the `latest` tag as
> doing so may incur breaking changes.
{ .important }
@z

@x
```console
$ docker run \
  --mount type=bind,src=/var/opt/artifactory-agent,target=/opt/artifactory-agent/data \
  docker/artifactory-agent:v1
```
@y
```console
$ docker run \
  --mount type=bind,src=/var/opt/artifactory-agent,target=/opt/artifactory-agent/data \
  docker/artifactory-agent:v1
```
@z

@x
#### Analyzing pre-existing data
@y
#### Analyzing pre-existing data
@z

@x
By default the agent detects and analyzes images as they're created and
updated. If you want to use the agent to analyze pre-existing images, you
can use backfill mode. Use the `--backfill-from=TIME` command line option,
where `TIME` is an ISO 8601 formatted time, to run the agent in backfill mode.
If you use this option, the agent analyzes all images pushed between that
time and the current time when the agent starts, then exits.
@y
By default the agent detects and analyzes images as they're created and
updated. If you want to use the agent to analyze pre-existing images, you
can use backfill mode. Use the `--backfill-from=TIME` command line option,
where `TIME` is an ISO 8601 formatted time, to run the agent in backfill mode.
If you use this option, the agent analyzes all images pushed between that
time and the current time when the agent starts, then exits.
@z

@x
For example:
@y
For example:
@z

@x
```console
$ docker run \
  --mount type=bind,src=/var/opt/artifactory-agent,target=/opt/artifactory-agent/data \
  docker/artifactory-agent:v1 --backfill-from=2022-04-10T10:00:00Z
```
@y
```console
$ docker run \
  --mount type=bind,src=/var/opt/artifactory-agent,target=/opt/artifactory-agent/data \
  docker/artifactory-agent:v1 --backfill-from=2022-04-10T10:00:00Z
```
@z

@x
When running a backfill multiple times, the agent won't analyze images that
it's already analyzed. To force re-analysis, provide the `--force` command
line flag.
@y
When running a backfill multiple times, the agent won't analyze images that
it's already analyzed. To force re-analysis, provide the `--force` command
line flag.
@z

@x
### View analysis results
@y
### View analysis results
@z

@x
You can view the image analysis results in the Docker Scout Dashboard.
@y
You can view the image analysis results in the Docker Scout Dashboard.
@z

@x
1. Go to [Docker Scout Dashboard](https://scout.docker.com).
2. Sign in using your Docker ID.
@y
1. Go to [Docker Scout Dashboard](https://scout.docker.com).
2. Sign in using your Docker ID.
@z

@x
   Once signed in, you're taken to the **Images** page. This page displays the
   repositories in your organization connected to Docker Scout.
@y
   Once signed in, you're taken to the **Images** page. This page displays the
   repositories in your organization connected to Docker Scout.
@z

@x
3. Select the image in the list.
4. Select the tag.
@y
3. Select the image in the list.
4. Select the tag.
@z

@x
When you have selected a tag, you're taken to the vulnerability report for that
tag. Here, you can select if you want to view all vulnerabilities in the image,
or vulnerabilities introduced in a specific layer. You can also filter
vulnerabilities by severity, and whether or not there's a fix version available.
@y
When you have selected a tag, you're taken to the vulnerability report for that
tag. Here, you can select if you want to view all vulnerabilities in the image,
or vulnerabilities introduced in a specific layer. You can also filter
vulnerabilities by severity, and whether or not there's a fix version available.
@z
