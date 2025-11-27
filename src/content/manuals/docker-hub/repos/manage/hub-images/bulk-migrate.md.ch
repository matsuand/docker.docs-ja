%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Bulk migrate Docker images
description: Learn how to migrate multiple Docker images and tags between organizations using scripts and automation.
keywords: docker hub, migration, bulk, images, tags, multi-arch, buildx
@y
title: Bulk migrate Docker images
description: Learn how to migrate multiple Docker images and tags between organizations using scripts and automation.
keywords: docker hub, migration, bulk, images, tags, multi-arch, buildx
@z

@x
This guide shows you how to migrate Docker images in bulk between Docker Hub
organizations or namespaces. Whether you're consolidating repositories,
changing organization structure, or moving images to a new account, these
techniques help you migrate efficiently while preserving image integrity.
@y
This guide shows you how to migrate Docker images in bulk between Docker Hub
organizations or namespaces. Whether you're consolidating repositories,
changing organization structure, or moving images to a new account, these
techniques help you migrate efficiently while preserving image integrity.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you begin, ensure you have:
@y
Before you begin, ensure you have:
@z

@x
- Docker CLI version 20.10 or later installed
- Docker Buildx (optional but recommended for multi-architecture images)
- Push access to both source and destination organizations
- `jq` installed for JSON parsing in scripts
- `curl` for API calls
@y
- Docker CLI version 20.10 or later installed
- Docker Buildx (optional but recommended for multi-architecture images)
- Push access to both source and destination organizations
- `jq` installed for JSON parsing in scripts
- `curl` for API calls
@z

@x
## Authenticate to Docker Hub
@y
## Authenticate to Docker Hub
@z

@x
Sign in to Docker Hub to authenticate your session:
@y
Sign in to Docker Hub to authenticate your session:
@z

@x
```console
$ docker login
```
@y
```console
$ docker login
```
@z

@x
Enter your credentials when prompted. This authentication persists for your
session and prevents rate limiting issues.
@y
Enter your credentials when prompted. This authentication persists for your
session and prevents rate limiting issues.
@z

@x
## Migrate a single image tag
@y
## Migrate a single image tag
@z

@x
The basic workflow for migrating a single image tag involves three steps: pull,
tag, and push.
@y
The basic workflow for migrating a single image tag involves three steps: pull,
tag, and push.
@z

@x
1. Set your source and destination variables:
@y
1. Set your source and destination variables:
@z

@x
   ```bash
   SRC_ORG=oldorg
   DEST_ORG=neworg
   REPO=myapp
   TAG=1.2.3
   ```
@y
   ```bash
   SRC_ORG=oldorg
   DEST_ORG=neworg
   REPO=myapp
   TAG=1.2.3
   ```
@z

@x
2. Pull the image from the source organization:
@y
2. Pull the image from the source organization:
@z

@x
   ```console
   $ docker pull ${SRC_ORG}/${REPO}:${TAG}
   ```
@y
   ```console
   $ docker pull ${SRC_ORG}/${REPO}:${TAG}
   ```
@z

@x
3. Tag the image for the destination organization:
@y
3. Tag the image for the destination organization:
@z

@x
   ```console
   $ docker tag ${SRC_ORG}/${REPO}:${TAG} ${DEST_ORG}/${REPO}:${TAG}
   ```
@y
   ```console
   $ docker tag ${SRC_ORG}/${REPO}:${TAG} ${DEST_ORG}/${REPO}:${TAG}
   ```
@z

@x
4. Push the image to the destination organization:
@y
4. Push the image to the destination organization:
@z

@x
   ```console
   $ docker push ${DEST_ORG}/${REPO}:${TAG}
   ```
@y
   ```console
   $ docker push ${DEST_ORG}/${REPO}:${TAG}
   ```
@z

@x
Repeat these steps for any additional tags you need to migrate, including
`latest` if applicable.
@y
Repeat these steps for any additional tags you need to migrate, including
`latest` if applicable.
@z

@x
## Migrate all tags for a repository
@y
## Migrate all tags for a repository
@z

@x
To migrate all tags from a single repository, use this script that queries the
Docker Hub API and processes each tag:
@y
To migrate all tags from a single repository, use this script that queries the
Docker Hub API and processes each tag:
@z

@x
```bash
#!/usr/bin/env bash
set -euo pipefail
@y
```bash
#!/usr/bin/env bash
set -euo pipefail
@z

@x
SRC_ORG="oldorg"
DEST_ORG="neworg"
REPO="myapp"
@y
SRC_ORG="oldorg"
DEST_ORG="neworg"
REPO="myapp"
@z

@x
# Paginate through tags
TAGS_URL="https://hub.docker.com/v2/repositories/${SRC_ORG}/${REPO}/tags?page_size=100"
while [[ -n "${TAGS_URL}" && "${TAGS_URL}" != "null" ]]; do
  RESP=$(curl -fsSL "${TAGS_URL}")
  echo "${RESP}" | jq -r '.results[].name' | while read -r TAG; do
    echo "==> Migrating ${SRC_ORG}/${REPO}:${TAG} → ${DEST_ORG}/${REPO}:${TAG}"
    docker pull "${SRC_ORG}/${REPO}:${TAG}"
    docker tag  "${SRC_ORG}/${REPO}:${TAG}" "${DEST_ORG}/${REPO}:${TAG}"
    docker push "${DEST_ORG}/${REPO}:${TAG}"
  done
  TAGS_URL=$(echo "${RESP}" | jq -r '.next')
done
```
@y
# Paginate through tags
TAGS_URL="https://hub.docker.com/v2/repositories/${SRC_ORG}/${REPO}/tags?page_size=100"
while [[ -n "${TAGS_URL}" && "${TAGS_URL}" != "null" ]]; do
  RESP=$(curl -fsSL "${TAGS_URL}")
  echo "${RESP}" | jq -r '.results[].name' | while read -r TAG; do
    echo "==> Migrating ${SRC_ORG}/${REPO}:${TAG} → ${DEST_ORG}/${REPO}:${TAG}"
    docker pull "${SRC_ORG}/${REPO}:${TAG}"
    docker tag  "${SRC_ORG}/${REPO}:${TAG}" "${DEST_ORG}/${REPO}:${TAG}"
    docker push "${DEST_ORG}/${REPO}:${TAG}"
  done
  TAGS_URL=$(echo "${RESP}" | jq -r '.next')
done
```
@z

@x
This script automatically handles pagination when a repository has more than
100 tags.
@y
This script automatically handles pagination when a repository has more than
100 tags.
@z

@x
> [!NOTE]
>
> Docker Hub automatically creates the destination repository on first push if
> your account has the necessary permissions.
@y
> [!NOTE]
>
> Docker Hub automatically creates the destination repository on first push if
> your account has the necessary permissions.
@z

@x
### Migrate private repository tags
@y
### Migrate private repository tags
@z

@x
For private repositories, authenticate your API calls with a Docker Hub access
token:
@y
For private repositories, authenticate your API calls with a Docker Hub access
token:
@z

@x
1. Create a personal access token in your
   [Docker Hub account settings](https://hub.docker.com/settings/security).
@y
1. Create a personal access token in your
   [Docker Hub account settings](https://hub.docker.com/settings/security).
@z

@x
2. Set your credentials as variables:
@y
2. Set your credentials as variables:
@z

@x
   ```bash
   HUB_USER="your-username"
   HUB_TOKEN="your-access-token"
   ```
@y
   ```bash
   HUB_USER="your-username"
   HUB_TOKEN="your-access-token"
   ```
@z

@x
3. Modify the `curl` command in the script to include authentication:
@y
3. Modify the `curl` command in the script to include authentication:
@z

@x
   ```bash
   RESP=$(curl -fsSL -u "${HUB_USER}:${HUB_TOKEN}" "${TAGS_URL}")
   ```
@y
   ```bash
   RESP=$(curl -fsSL -u "${HUB_USER}:${HUB_TOKEN}" "${TAGS_URL}")
   ```
@z

@x
> [!IMPORTANT]
>
> If you encounter pull rate or throughput limits, keep `docker login` active
> to avoid anonymous pulls. Consider adding throttling or careful parallelization
> if migrating large numbers of images.
@y
> [!IMPORTANT]
>
> If you encounter pull rate or throughput limits, keep `docker login` active
> to avoid anonymous pulls. Consider adding throttling or careful parallelization
> if migrating large numbers of images.
@z

@x
## Migrate multiple repositories
@y
## Migrate multiple repositories
@z

@x
To migrate multiple repositories at once, create a list of repository names
and process them in a loop.
@y
To migrate multiple repositories at once, create a list of repository names
and process them in a loop.
@z

@x
1. Create a file named `repos.txt` with one repository name per line:
@y
1. Create a file named `repos.txt` with one repository name per line:
@z

@x
   ```text
   api
   web
   worker
   database
   ```
@y
   ```text
   api
   web
   worker
   database
   ```
@z

@x
2. Save the single-repository script from the previous section as
   `migrate-single-repo.sh` and make it executable.
@y
2. Save the single-repository script from the previous section as
   `migrate-single-repo.sh` and make it executable.
@z

@x
3. Use this wrapper script to process all repositories:
@y
3. Use this wrapper script to process all repositories:
@z

@x
   ```bash
   #!/usr/bin/env bash
   set -euo pipefail
@y
   ```bash
   #!/usr/bin/env bash
   set -euo pipefail
@z

@x
   SRC_ORG="oldorg"
   DEST_ORG="neworg"
@y
   SRC_ORG="oldorg"
   DEST_ORG="neworg"
@z

@x
   while read -r REPO; do
     [[ -z "${REPO}" ]] && continue
     echo "==== Migrating repo: ${REPO}"
     export REPO
     ./migrate-single-repo.sh
   done < repos.txt
   ```
@y
   while read -r REPO; do
     [[ -z "${REPO}" ]] && continue
     echo "==== Migrating repo: ${REPO}"
     export REPO
     ./migrate-single-repo.sh
   done < repos.txt
   ```
@z

@x
## Preserve multi-architecture images
@y
## Preserve multi-architecture images
@z

@x
Standard `docker pull` only retrieves the image for your current platform.
For multi-architecture images, this approach loses other platform variants.
@y
Standard `docker pull` only retrieves the image for your current platform.
For multi-architecture images, this approach loses other platform variants.
@z

@x
### Use Buildx imagetools (recommended)
@y
### Use Buildx imagetools (recommended)
@z

@x
The recommended approach uses Buildx to copy the complete manifest without
pulling images locally:
@y
The recommended approach uses Buildx to copy the complete manifest without
pulling images locally:
@z

@x
```console
$ docker buildx imagetools create \
  -t ${DEST_ORG}/${REPO}:${TAG} \
     ${SRC_ORG}/${REPO}:${TAG}
```
@y
```console
$ docker buildx imagetools create \
  -t ${DEST_ORG}/${REPO}:${TAG} \
     ${SRC_ORG}/${REPO}:${TAG}
```
@z

@x
This command copies the source manifest with all platforms directly to the
destination tag.
@y
This command copies the source manifest with all platforms directly to the
destination tag.
@z

@x
Verify the migration by inspecting both manifests:
@y
Verify the migration by inspecting both manifests:
@z

@x
```console
$ docker buildx imagetools inspect ${SRC_ORG}/${REPO}:${TAG}
$ docker buildx imagetools inspect ${DEST_ORG}/${REPO}:${TAG}
```
@y
```console
$ docker buildx imagetools inspect ${SRC_ORG}/${REPO}:${TAG}
$ docker buildx imagetools inspect ${DEST_ORG}/${REPO}:${TAG}
```
@z

@x
Compare the platforms and digests in the output to confirm they match.
@y
Compare the platforms and digests in the output to confirm they match.
@z

@x
### Manual manifest creation
@y
### Manual manifest creation
@z

@x
If you need to use the pull/tag/push workflow for multi-architecture images,
you must pull each platform variant and recreate the manifest using
`docker manifest create` and `docker manifest push`. This approach is slower
and more error-prone than using Buildx imagetools.
@y
If you need to use the pull/tag/push workflow for multi-architecture images,
you must pull each platform variant and recreate the manifest using
`docker manifest create` and `docker manifest push`. This approach is slower
and more error-prone than using Buildx imagetools.
@z

@x
## Verify migration integrity
@y
## Verify migration integrity
@z

@x
After migrating images, verify that they transferred correctly.
@y
After migrating images, verify that they transferred correctly.
@z

@x
### Single-architecture images
@y
### Single-architecture images
@z

@x
Compare image digests between source and destination:
@y
Compare image digests between source and destination:
@z

@x
```console
$ docker pull ${SRC_ORG}/${REPO}:${TAG}
$ docker inspect --format='{{index .RepoDigests 0}}' ${SRC_ORG}/${REPO}:${TAG}
@y
```console
$ docker pull ${SRC_ORG}/${REPO}:${TAG}
$ docker inspect --format='{{index .RepoDigests 0}}' ${SRC_ORG}/${REPO}:${TAG}
@z

@x
$ docker pull ${DEST_ORG}/${REPO}:${TAG}
$ docker inspect --format='{{index .RepoDigests 0}}' ${DEST_ORG}/${REPO}:${TAG}
```
@y
$ docker pull ${DEST_ORG}/${REPO}:${TAG}
$ docker inspect --format='{{index .RepoDigests 0}}' ${DEST_ORG}/${REPO}:${TAG}
```
@z

@x
The SHA256 digests should match if the migration succeeded.
@y
The SHA256 digests should match if the migration succeeded.
@z

@x
### Multi-architecture images
@y
### Multi-architecture images
@z

@x
For multi-arch images, compare the output from Buildx imagetools:
@y
For multi-arch images, compare the output from Buildx imagetools:
@z

@x
```console
$ docker buildx imagetools inspect ${SRC_ORG}/${REPO}:${TAG}
$ docker buildx imagetools inspect ${DEST_ORG}/${REPO}:${TAG}
```
@y
```console
$ docker buildx imagetools inspect ${SRC_ORG}/${REPO}:${TAG}
$ docker buildx imagetools inspect ${DEST_ORG}/${REPO}:${TAG}
```
@z

@x
Verify that the platforms and manifest digest match between source and
destination.
@y
Verify that the platforms and manifest digest match between source and
destination.
@z

@x
## Complete the migration
@y
## Complete the migration
@z

@x
After migrating your images, complete these additional steps:
@y
After migrating your images, complete these additional steps:
@z

@x
1. Copy repository metadata in the Docker Hub UI or via API:
@y
1. Copy repository metadata in the Docker Hub UI or via API:
@z

@x
   - README content
   - Repository description
   - Topics and tags
@y
   - README content
   - Repository description
   - Topics and tags
@z

@x
2. Configure repository settings to match the source:
@y
2. Configure repository settings to match the source:
@z

@x
   - Visibility (public or private)
   - Team permissions and access controls
@y
   - Visibility (public or private)
   - Team permissions and access controls
@z

@x
3. Reconfigure integrations in the destination organization:
@y
3. Reconfigure integrations in the destination organization:
@z

@x
   - Webhooks
   - Automated builds
   - Security scanners
@y
   - Webhooks
   - Automated builds
   - Security scanners
@z

@x
4. Update image references in your projects:
@y
4. Update image references in your projects:
@z

@x
   - Change `FROM oldorg/repo:tag` to `FROM neworg/repo:tag` in Dockerfiles
   - Update deployment configurations
   - Update documentation
@y
   - Change `FROM oldorg/repo:tag` to `FROM neworg/repo:tag` in Dockerfiles
   - Update deployment configurations
   - Update documentation
@z

@x
5. Deprecate the old location:
   - Update the source repository description to point to the new location
   - Consider adding a grace period before making the old repository private or
     read-only
@y
5. Deprecate the old location:
   - Update the source repository description to point to the new location
   - Consider adding a grace period before making the old repository private or
     read-only
@z
