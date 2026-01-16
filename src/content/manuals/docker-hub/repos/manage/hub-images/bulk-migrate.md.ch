%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Bulk migrate images
description: Learn how to migrate multiple Docker images and tags between organizations using scripts and automation.
keywords: docker hub, migration, bulk, images, tags, multi-arch
@y
title: Bulk migrate images
description: Learn how to migrate multiple Docker images and tags between organizations using scripts and automation.
keywords: docker hub, migration, bulk, images, tags, multi-arch
@z

@x
This guide shows you how to migrate Docker images in bulk between Docker Hub
organizations or namespaces. Whether you're consolidating repositories, changing
organization structure, or moving images to a new account, these techniques help
you migrate efficiently while preserving image integrity.
@y
This guide shows you how to migrate Docker images in bulk between Docker Hub
organizations or namespaces. Whether you're consolidating repositories, changing
organization structure, or moving images to a new account, these techniques help
you migrate efficiently while preserving image integrity.
@z

@x
The topic is structured to build up in scale:
@y
The topic is structured to build up in scale:
@z

@x
1. [Migrate a single image tag](#migrate-a-single-image-tag)
2. [Migrate all tags for a repository](#migrate-all-tags-for-a-repository)
3. [Migrate multiple repositories](#migrate-multiple-repositories)
@y
1. [Migrate a single image tag](#migrate-a-single-image-tag)
2. [Migrate all tags for a repository](#migrate-all-tags-for-a-repository)
3. [Migrate multiple repositories](#migrate-multiple-repositories)
@z

@x
The recommended tool for this workflow is `crane`. An equivalent alternative
using `regctl` is also shown. Both tools perform registry-to-registry copies
without pulling images locally and preserve multi-architecture images.
@y
The recommended tool for this workflow is `crane`. An equivalent alternative
using `regctl` is also shown. Both tools perform registry-to-registry copies
without pulling images locally and preserve multi-architecture images.
@z

@x
`crane` is recommended for its simplicity and focused image-copying workflow.
`regctl` is also a good choice, particularly if you already use it for broader
registry management tasks beyond image copying.
@y
`crane` is recommended for its simplicity and focused image-copying workflow.
`regctl` is also a good choice, particularly if you already use it for broader
registry management tasks beyond image copying.
@z

@x
> [!NOTE]
>
> The main workflows in this topic operate on tagged images only. Untagged
> manifests or content no longer reachable from tags are not migrated. In
> practice, these are usually unused artifacts, but be aware of this limitation
> before migration. While you can migrate specific untagged manifests using
> [digest references](#migrate-by-digest), there is no API to enumerate untagged
> manifests in a repository.
@y
> [!NOTE]
>
> The main workflows in this topic operate on tagged images only. Untagged
> manifests or content no longer reachable from tags are not migrated. In
> practice, these are usually unused artifacts, but be aware of this limitation
> before migration. While you can migrate specific untagged manifests using
> [digest references](#migrate-by-digest), there is no API to enumerate untagged
> manifests in a repository.
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
- One of the following installed and available in your `$PATH`:
  - [`crane`](https://github.com/google/go-containerregistry)
  - [`regctl`](https://regclient.org/usage/regctl/)
- Push access to both the source and destination organizations
- Registry authentication configured for your chosen tool
@y
- One of the following installed and available in your `$PATH`:
  - [`crane`](https://github.com/google/go-containerregistry)
  - [`regctl`](https://regclient.org/usage/regctl/)
- Push access to both the source and destination organizations
- Registry authentication configured for your chosen tool
@z

@x
## Authenticate to registries
@y
## Authenticate to registries
@z

@x
Both tools authenticate directly against registries:
@y
Both tools authenticate directly against registries:
@z

@x
- `crane` uses Docker credential helpers and `~/.docker/config.json`. See the
  [crane documentation](https://github.com/google/go-containerregistry/tree/main/cmd/crane/doc).
- `regctl` uses its own configuration file and can import Docker credentials.
  See the [regctl documentation](https://github.com/regclient/regclient/tree/main/docs).
@y
- `crane` uses Docker credential helpers and `~/.docker/config.json`. See the
  [crane documentation](https://github.com/google/go-containerregistry/tree/main/cmd/crane/doc).
- `regctl` uses its own configuration file and can import Docker credentials.
  See the [regctl documentation](https://github.com/regclient/regclient/tree/main/docs).
@z

@x
Follow the authentication instructions for your registry and tool of choice.
@y
Follow the authentication instructions for your registry and tool of choice.
@z

@x
## Migrate a single image tag
@y
## Migrate a single image tag
@z

@x
This is the simplest and most common migration scenario.
@y
This is the simplest and most common migration scenario.
@z

@x
The following example script copies the image manifest directly between
registries and preserves multi-architecture images when present. Repeat this
process for each tag you want to migrate. Replace the environment variable
values with your source and destination organization names, repository name, and
tag.
@y
The following example script copies the image manifest directly between
registries and preserves multi-architecture images when present. Repeat this
process for each tag you want to migrate. Replace the environment variable
values with your source and destination organization names, repository name, and
tag.
@z

@x within code
# Using crane (recommended)
@y
# Using crane (recommended)
@z
@x
# Using regctl (alternative)
@y
# Using regctl (alternative)
@z

@x
### Migrate by digest
@y
### Migrate by digest
@z

@x
To migrate a specific image by digest instead of tag, use the digest in the
source reference. This is useful when you need to migrate an exact image
version, even if the tag has been updated. Replace the environment variable
values with your source and destination organization names, repository name,
digest, and tag. You can choose between `crane` and `regctl` for the copy
operation.
@y
To migrate a specific image by digest instead of tag, use the digest in the
source reference. This is useful when you need to migrate an exact image
version, even if the tag has been updated. Replace the environment variable
values with your source and destination organization names, repository name,
digest, and tag. You can choose between `crane` and `regctl` for the copy
operation.
@z

@x within code
# Using crane
@y
# Using crane
@z
@x
# Using regctl
@y
# Using regctl
@z

@x
## Migrate all tags for a repository
@y
## Migrate all tags for a repository
@z

@x
To migrate every tagged image in a repository, use the Docker Hub API to
enumerate tags and copy each one. The following example script retrieves all
tags for a given repository and migrates them in a loop. This approach scales to
repositories with many tags without overwhelming local resources. Note that
there is a rate limit on Docker Hub requests, so you may need to add delays or
pagination handling for large repositories.
@y
To migrate every tagged image in a repository, use the Docker Hub API to
enumerate tags and copy each one. The following example script retrieves all
tags for a given repository and migrates them in a loop. This approach scales to
repositories with many tags without overwhelming local resources. Note that
there is a rate limit on Docker Hub requests, so you may need to add delays or
pagination handling for large repositories.
@z

@x
Replace the environment variable values with your source and destination
organization names and repository name. If your source repository is private,
also set `HUB_USER` and `HUB_TOKEN` with credentials that have pull access. You
can also choose between `crane` and `regctl` for the copy operation.
@y
Replace the environment variable values with your source and destination
organization names and repository name. If your source repository is private,
also set `HUB_USER` and `HUB_TOKEN` with credentials that have pull access. You
can also choose between `crane` and `regctl` for the copy operation.
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
# Use environment variables if set, otherwise use defaults
SRC_ORG="${SRC_ORG:-oldorg}"
DEST_ORG="${DEST_ORG:-neworg}"
REPO="${REPO:-myapp}"
@y
# Use environment variables if set, otherwise use defaults
SRC_ORG="${SRC_ORG:-oldorg}"
DEST_ORG="${DEST_ORG:-neworg}"
REPO="${REPO:-myapp}"
@z

@x
# Optional: for private repositories
# HUB_USER="your-username"
# HUB_TOKEN="your-access-token"
# AUTH="-u ${HUB_USER}:${HUB_TOKEN}"
AUTH=""
@y
# Optional: for private repositories
# HUB_USER="your-username"
# HUB_TOKEN="your-access-token"
# AUTH="-u ${HUB_USER}:${HUB_TOKEN}"
AUTH=""
@z

@x
TOOL="crane"   # or: TOOL="regctl"
@y
TOOL="crane"   # or: TOOL="regctl"
@z

@x
TAGS_URL="https://hub.docker.com/v2/repositories/${SRC_ORG}/${REPO}/tags?page_size=100"
@y
TAGS_URL="https://hub.docker.com/v2/repositories/${SRC_ORG}/${REPO}/tags?page_size=100"
@z

@x
while [[ -n "${TAGS_URL}" && "${TAGS_URL}" != "null" ]]; do
  RESP=$(curl -fsSL ${AUTH} "${TAGS_URL}")
@y
while [[ -n "${TAGS_URL}" && "${TAGS_URL}" != "null" ]]; do
  RESP=$(curl -fsSL ${AUTH} "${TAGS_URL}")
@z

@x
  echo "${RESP}" | jq -r '.results[].name' | while read -r TAG; do
    [[ -z "${TAG}" ]] && continue
@y
  echo "${RESP}" | jq -r '.results[].name' | while read -r TAG; do
    [[ -z "${TAG}" ]] && continue
@z

@x
    SRC_IMAGE="${SRC_ORG}/${REPO}:${TAG}"
    DEST_IMAGE="${DEST_ORG}/${REPO}:${TAG}"
@y
    SRC_IMAGE="${SRC_ORG}/${REPO}:${TAG}"
    DEST_IMAGE="${DEST_ORG}/${REPO}:${TAG}"
@z

@x
    echo "Migrating ${SRC_IMAGE} → ${DEST_IMAGE}"
@y
    echo "Migrating ${SRC_IMAGE} → ${DEST_IMAGE}"
@z

@x
    case "${TOOL}" in
      crane)
        crane cp "${SRC_IMAGE}" "${DEST_IMAGE}"
        ;;
      regctl)
        regctl image copy "${SRC_IMAGE}" "${DEST_IMAGE}"
        ;;
    esac
  done
@y
    case "${TOOL}" in
      crane)
        crane cp "${SRC_IMAGE}" "${DEST_IMAGE}"
        ;;
      regctl)
        regctl image copy "${SRC_IMAGE}" "${DEST_IMAGE}"
        ;;
    esac
  done
@z

@x
  TAGS_URL=$(echo "${RESP}" | jq -r '.next')
done
```
@y
  TAGS_URL=$(echo "${RESP}" | jq -r '.next')
done
```
@z

@x
> [!NOTE]
>
> Docker Hub automatically creates the destination repository on first push if
> your account has permission.
@y
> [!NOTE]
>
> Docker Hub automatically creates the destination repository on first push if
> your account has permission.
@z

@x
## Migrate multiple repositories
@y
## Migrate multiple repositories
@z

@x
To migrate several repositories, create a list and run the single-repository
script for each one.
@y
To migrate several repositories, create a list and run the single-repository
script for each one.
@z

@x
For example, create a `repos.txt` file with repository names:
@y
For example, create a `repos.txt` file with repository names:
@z

@x
```text
api
web
worker
```
@y
```text
api
web
worker
```
@z

@x
Save the script from the previous section as `migrate-single-repo.sh`. Then, run
the following example script that processes each repository in the file. Replace
the environment variable values with your source and destination organization
names.
@y
Save the script from the previous section as `migrate-single-repo.sh`. Then, run
the following example script that processes each repository in the file. Replace
the environment variable values with your source and destination organization
names.
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
  SRC_ORG="${SRC_ORG}" DEST_ORG="${DEST_ORG}" REPO="${REPO}" ./migrate-single-repo.sh
done < repos.txt
```
@y
while read -r REPO; do
  [[ -z "${REPO}" ]] && continue
  echo "==== Migrating repo: ${REPO}"
  SRC_ORG="${SRC_ORG}" DEST_ORG="${DEST_ORG}" REPO="${REPO}" ./migrate-single-repo.sh
done < repos.txt
```
@z

@x
## Verify migration integrity
@y
## Verify migration integrity
@z

@x
After copying, verify that source and destination match by comparing digests.
@y
After copying, verify that source and destination match by comparing digests.
@z

@x
### Basic digest verification
@y
### Basic digest verification
@z

@x
The following example script retrieves the image digest for a specific tag from
both source and destination and compares them. If the digests match, the
migration is successful. Replace the environment variable values with your
source and destination organization names, repository name, and tag. You can
choose between `crane` and `regctl` for retrieving digests.
@y
The following example script retrieves the image digest for a specific tag from
both source and destination and compares them. If the digests match, the
migration is successful. Replace the environment variable values with your
source and destination organization names, repository name, and tag. You can
choose between `crane` and `regctl` for retrieving digests.
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
TAG="1.2.3"
@y
SRC_ORG="oldorg"
DEST_ORG="neworg"
REPO="myapp"
TAG="1.2.3"
@z

@x
SRC_IMAGE="${SRC_ORG}/${REPO}:${TAG}"
DEST_IMAGE="${DEST_ORG}/${REPO}:${TAG}"
@y
SRC_IMAGE="${SRC_ORG}/${REPO}:${TAG}"
DEST_IMAGE="${DEST_ORG}/${REPO}:${TAG}"
@z

@x
# Using crane
SRC_DIGEST=$(crane digest "${SRC_IMAGE}")
DEST_DIGEST=$(crane digest "${DEST_IMAGE}")
@y
# Using crane
SRC_DIGEST=$(crane digest "${SRC_IMAGE}")
DEST_DIGEST=$(crane digest "${DEST_IMAGE}")
@z

@x
# Using regctl (alternative)
# SRC_DIGEST=$(regctl image digest "${SRC_IMAGE}")
# DEST_DIGEST=$(regctl image digest "${DEST_IMAGE}")
@y
# Using regctl (alternative)
# SRC_DIGEST=$(regctl image digest "${SRC_IMAGE}")
# DEST_DIGEST=$(regctl image digest "${DEST_IMAGE}")
@z

@x
echo "Source:      ${SRC_DIGEST}"
echo "Destination: ${DEST_DIGEST}"
@y
echo "Source:      ${SRC_DIGEST}"
echo "Destination: ${DEST_DIGEST}"
@z

@x
if [[ "${SRC_DIGEST}" == "${DEST_DIGEST}" ]]; then
  echo "✓ Migration verified: digests match"
else
  echo "✗ Migration failed: digests do not match"
  exit 1
fi
```
@y
if [[ "${SRC_DIGEST}" == "${DEST_DIGEST}" ]]; then
  echo "✓ Migration verified: digests match"
else
  echo "✗ Migration failed: digests do not match"
  exit 1
fi
```
@z

@x
### Multi-arch verification
@y
### Multi-arch verification
@z

@x
For multi-architecture images, also verify the manifest list to ensure all
platforms were copied correctly. Replace the environment variable values with
your source and destination organization names, repository name, and tag. You
can choose between `crane` and `regctl` for retrieving manifests.
@y
For multi-architecture images, also verify the manifest list to ensure all
platforms were copied correctly. Replace the environment variable values with
your source and destination organization names, repository name, and tag. You
can choose between `crane` and `regctl` for retrieving manifests.
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
TAG="1.2.3"
@y
SRC_ORG="oldorg"
DEST_ORG="neworg"
REPO="myapp"
TAG="1.2.3"
@z

@x
SRC_IMAGE="${SRC_ORG}/${REPO}:${TAG}"
DEST_IMAGE="${DEST_ORG}/${REPO}:${TAG}"
@y
SRC_IMAGE="${SRC_ORG}/${REPO}:${TAG}"
DEST_IMAGE="${DEST_ORG}/${REPO}:${TAG}"
@z

@x
# Using crane
SRC_MANIFEST=$(crane manifest "${SRC_IMAGE}")
DEST_MANIFEST=$(crane manifest "${DEST_IMAGE}")
@y
# Using crane
SRC_MANIFEST=$(crane manifest "${SRC_IMAGE}")
DEST_MANIFEST=$(crane manifest "${DEST_IMAGE}")
@z

@x
# Using regctl (alternative)
# SRC_MANIFEST=$(regctl image manifest --format raw-body "${SRC_IMAGE}")
# DEST_MANIFEST=$(regctl image manifest --format raw-body "${DEST_IMAGE}")
@y
# Using regctl (alternative)
# SRC_MANIFEST=$(regctl image manifest --format raw-body "${SRC_IMAGE}")
# DEST_MANIFEST=$(regctl image manifest --format raw-body "${DEST_IMAGE}")
@z

@x
# Check if it's a manifest list (multi-arch)
if echo "${SRC_MANIFEST}" | jq -e '.manifests' > /dev/null 2>&1; then
  echo "Multi-arch image detected"
@y
# Check if it's a manifest list (multi-arch)
if echo "${SRC_MANIFEST}" | jq -e '.manifests' > /dev/null 2>&1; then
  echo "Multi-arch image detected"
@z

@x
  # Compare platform list
  SRC_PLATFORMS=$(echo "${SRC_MANIFEST}" | jq -r '.manifests[] | "\(.platform.os)/\(.platform.architecture)"' | sort)
  DEST_PLATFORMS=$(echo "${DEST_MANIFEST}" | jq -r '.manifests[] | "\(.platform.os)/\(.platform.architecture)"' | sort)
@y
  # Compare platform list
  SRC_PLATFORMS=$(echo "${SRC_MANIFEST}" | jq -r '.manifests[] | "\(.platform.os)/\(.platform.architecture)"' | sort)
  DEST_PLATFORMS=$(echo "${DEST_MANIFEST}" | jq -r '.manifests[] | "\(.platform.os)/\(.platform.architecture)"' | sort)
@z

@x
  if [[ "${SRC_PLATFORMS}" == "${DEST_PLATFORMS}" ]]; then
    echo "✓ Platform list matches:"
    echo "${SRC_PLATFORMS}"
  else
    echo "✗ Platform lists do not match"
    echo "Source platforms:"
    echo "${SRC_PLATFORMS}"
    echo "Destination platforms:"
    echo "${DEST_PLATFORMS}"
    exit 1
  fi
else
  echo "Single-arch image"
fi
```
@y
  if [[ "${SRC_PLATFORMS}" == "${DEST_PLATFORMS}" ]]; then
    echo "✓ Platform list matches:"
    echo "${SRC_PLATFORMS}"
  else
    echo "✗ Platform lists do not match"
    echo "Source platforms:"
    echo "${SRC_PLATFORMS}"
    echo "Destination platforms:"
    echo "${DEST_PLATFORMS}"
    exit 1
  fi
else
  echo "Single-arch image"
fi
```
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
