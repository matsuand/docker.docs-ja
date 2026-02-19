%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
openapi: 3.0.3
info:
  title: Supported registry API for Docker Hub
  description: |
    Docker Hub is an OCI-compliant registry, which means it adheres to the open
    standards defined by the Open Container Initiative (OCI) for distributing
    container images. This ensures compatibility with a wide range of tools and
    platforms in the container ecosystem.
@y
openapi: 3.0.3
info:
  title: Supported registry API for Docker Hub
  description: |
    Docker Hub is an OCI-compliant registry, which means it adheres to the open
    standards defined by the Open Container Initiative (OCI) for distributing
    container images. This ensures compatibility with a wide range of tools and
    platforms in the container ecosystem.
@z

@x
    This reference documents the Docker Hub-supported subset of the Registry HTTP API V2.
    It focuses on pulling, pushing, and deleting images. It does not cover the full OCI Distribution Specification.
@y
    This reference documents the Docker Hub-supported subset of the Registry HTTP API V2.
    It focuses on pulling, pushing, and deleting images. It does not cover the full OCI Distribution Specification.
@z

@x
    For the complete OCI specification, see [OCI Distribution Specification](https://github.com/opencontainers/distribution-spec).
servers:
  - description: Docker Hub registry API
    x-audience: public
    url: https://registry-1.docker.io
@y
    For the complete OCI specification, see [OCI Distribution Specification](https://github.com/opencontainers/distribution-spec).
servers:
  - description: Docker Hub registry API
    x-audience: public
    url: https://registry-1.docker.io
@z

@x
tags:
  - name: overview
    x-displayName: Overview
    description: |
      All endpoints in this API are prefixed by the version and repository name, for example:
@y
tags:
  - name: overview
    x-displayName: Overview
    description: |
      All endpoints in this API are prefixed by the version and repository name, for example:
@z

@x
      ```
      /v2/<name>/
      ```
@y
      ```
      /v2/<name>/
      ```
@z

@x
      This format provides structured access control and URI-based scoping of image operations.
@y
      This format provides structured access control and URI-based scoping of image operations.
@z

@x
      For example, to interact with the `library/ubuntu` repository, use:
@y
      For example, to interact with the `library/ubuntu` repository, use:
@z

@x
      ```
      /v2/library/ubuntu/
      ```
@y
      ```
      /v2/library/ubuntu/
      ```
@z

@x
      Repository names must meet these requirements:
      1. Consist of path components matching `[a-z0-9]+(?:[._-][a-z0-9]+)*`
      2. If more than one component, they must be separated by `/`
      3. Full repository name must be fewer than 256 characters
@y
      Repository names must meet these requirements:
      1. Consist of path components matching `[a-z0-9]+(?:[._-][a-z0-9]+)*`
      2. If more than one component, they must be separated by `/`
      3. Full repository name must be fewer than 256 characters
@z

@x
  - name: authentication
    x-displayName: Authentication
    description: |
      Specifies registry authentication.
    externalDocs:
      description: Detailed authentication workflow and token usage
      url: https://docs.docker.com/reference/api/registry/auth/
@y
  - name: authentication
    x-displayName: Authentication
    description: |
      Specifies registry authentication.
    externalDocs:
      description: Detailed authentication workflow and token usage
      url: https://docs.docker.com/reference/api/registry/auth/
@z

@x
  - name: Manifests
    x-displayName: Manifests
    description: |
      Image manifests are JSON documents that describe an image: its configuration blob, the digests of each layer blob, and metadata such as media‑types and annotations.
@y
  - name: Manifests
    x-displayName: Manifests
    description: |
      Image manifests are JSON documents that describe an image: its configuration blob, the digests of each layer blob, and metadata such as media‑types and annotations.
@z

@x
  - name: Blobs
    x-displayName: Blobs
    description: |
      Blobs are the binary objects referenced from manifests:
      the config JSON and one or more compressed layer tarballs.
@y
  - name: Blobs
    x-displayName: Blobs
    description: |
      Blobs are the binary objects referenced from manifests:
      the config JSON and one or more compressed layer tarballs.
@z

@x
  - name: pull
    x-displayName: Pulling Images
    description: |
      Pulling an image involves retrieving the manifest and downloading each of the image's layer blobs. This section outlines the general steps followed by a working example.
@y
  - name: pull
    x-displayName: Pulling Images
    description: |
      Pulling an image involves retrieving the manifest and downloading each of the image's layer blobs. This section outlines the general steps followed by a working example.
@z

@x
      1. [Get a bearer token for the repository](https://docs.docker.com/reference/api/registry/auth/).
      2. [Get the image manifest](#operation/GetImageManifest).
      3. If the response in the previous step is a multi-architecture manifest list, you must do the following:
         - Parse the `manifests[]` array to locate the digest for your target platform (e.g., `linux/amd64`).
         - [Get the image manifest](#operation/GetImageManifest) using the located digest.
      4. [Check if the blob exists](#operation/CheckBlobExists) before downloading. The client should send a `HEAD` request for each layer digest.
      5. [Download each layer blob](#operation/GetBlob) using the digest obtained from the manifest. The client should send a `GET` request for each layer digest.
@y
      1. [Get a bearer token for the repository](https://docs.docker.com/reference/api/registry/auth/).
      2. [Get the image manifest](#operation/GetImageManifest).
      3. If the response in the previous step is a multi-architecture manifest list, you must do the following:
         - Parse the `manifests[]` array to locate the digest for your target platform (e.g., `linux/amd64`).
         - [Get the image manifest](#operation/GetImageManifest) using the located digest.
      4. [Check if the blob exists](#operation/CheckBlobExists) before downloading. The client should send a `HEAD` request for each layer digest.
      5. [Download each layer blob](#operation/GetBlob) using the digest obtained from the manifest. The client should send a `GET` request for each layer digest.
@z

@x
      The following bash script example pulls `library/ubuntu:latest` from Docker Hub.
@y
      The following bash script example pulls `library/ubuntu:latest` from Docker Hub.
@z

@x
      ```bash
      #!/bin/bash
@y
      ```bash
      #!/bin/bash
@z

@x
      # Step 1: Get a bearer token
      TOKEN=$(curl -s "https://auth.docker.io/token?service=registry.docker.io&scope=repository:library/ubuntu:pull" | jq -r .token)
@y
      # Step 1: Get a bearer token
      TOKEN=$(curl -s "https://auth.docker.io/token?service=registry.docker.io&scope=repository:library/ubuntu:pull" | jq -r .token)
@z

@x
      # Step 2: Get the image manifest. In this example, an image manifest list is returned.
      curl -s -H "Authorization: Bearer $TOKEN" \
           -H "Accept: application/vnd.docker.distribution.manifest.list.v2+json" \
           https://registry-1.docker.io/v2/library/ubuntu/manifests/latest \
           -o manifest-list.json
@y
      # Step 2: Get the image manifest. In this example, an image manifest list is returned.
      curl -s -H "Authorization: Bearer $TOKEN" \
           -H "Accept: application/vnd.docker.distribution.manifest.list.v2+json" \
           https://registry-1.docker.io/v2/library/ubuntu/manifests/latest \
           -o manifest-list.json
@z

@x
      # Step 3a: Parse the `manifests[]` array to locate the digest for your target platform (e.g., `linux/amd64`).
      IMAGE_MANIFEST_DIGEST=$(jq -r '.manifests[] | select(.platform.architecture == "amd64" and .platform.os == "linux") | .digest' manifest-list.json)
@y
      # Step 3a: Parse the `manifests[]` array to locate the digest for your target platform (e.g., `linux/amd64`).
      IMAGE_MANIFEST_DIGEST=$(jq -r '.manifests[] | select(.platform.architecture == "amd64" and .platform.os == "linux") | .digest' manifest-list.json)
@z

@x
      # Step 3b: Get the platform-specific image manifest
      curl -s -H "Authorization: Bearer $TOKEN" \
           -H "Accept: application/vnd.docker.distribution.manifest.v2+json" \
           https://registry-1.docker.io/v2/library/ubuntu/manifests/$IMAGE_MANIFEST_DIGEST \
           -o manifest.json
@y
      # Step 3b: Get the platform-specific image manifest
      curl -s -H "Authorization: Bearer $TOKEN" \
           -H "Accept: application/vnd.docker.distribution.manifest.v2+json" \
           https://registry-1.docker.io/v2/library/ubuntu/manifests/$IMAGE_MANIFEST_DIGEST \
           -o manifest.json
@z

@x
      # Step 4: Send a HEAD request to check if the layer blob exists
      DIGEST=$(jq -r '.layers[0].digest' manifest.json)
      curl -I -H "Authorization: Bearer $TOKEN" \
           https://registry-1.docker.io/v2/library/ubuntu/blobs/$DIGEST
@y
      # Step 4: Send a HEAD request to check if the layer blob exists
      DIGEST=$(jq -r '.layers[0].digest' manifest.json)
      curl -I -H "Authorization: Bearer $TOKEN" \
           https://registry-1.docker.io/v2/library/ubuntu/blobs/$DIGEST
@z

@x
      # Step 5: Download the layer blob
      curl -L -H "Authorization: Bearer $TOKEN" \
           https://registry-1.docker.io/v2/library/ubuntu/blobs/$DIGEST
      ```
@y
      # Step 5: Download the layer blob
      curl -L -H "Authorization: Bearer $TOKEN" \
           https://registry-1.docker.io/v2/library/ubuntu/blobs/$DIGEST
      ```
@z

@x
      This example pulls the manifest and the first layer for the `ubuntu:latest` image on the `linux/amd64` platform. Repeat steps 4 and 5 for each digest in the `.layers[]` array in the manifest.
@y
      This example pulls the manifest and the first layer for the `ubuntu:latest` image on the `linux/amd64` platform. Repeat steps 4 and 5 for each digest in the `.layers[]` array in the manifest.
@z

@x
  - name: push
    x-displayName: Pushing Images
    description: |
      Pushing an image involves uploading any image blobs (such as the config or layers), and then uploading the manifest that references those blobs.
@y
  - name: push
    x-displayName: Pushing Images
    description: |
      Pushing an image involves uploading any image blobs (such as the config or layers), and then uploading the manifest that references those blobs.
@z

@x
      This section outlines the basic steps to push an image using the registry API.
@y
      This section outlines the basic steps to push an image using the registry API.
@z

@x
      1. [Get a bearer token for the repository](https://docs.docker.com/reference/api/registry/auth/)
@y
      1. [Get a bearer token for the repository](https://docs.docker.com/reference/api/registry/auth/)
@z

@x
      2. [Check if the blob exists](#operation/CheckBlobExists) using a `HEAD` request for each blob digest.
@y
      2. [Check if the blob exists](#operation/CheckBlobExists) using a `HEAD` request for each blob digest.
@z

@x
      3. If the blob does not exist, [upload the blob](#operation/CompleteBlobUpload) using a monolithic `PUT` request:
          - First, [initiate the upload](#operation/InitiateBlobUpload) with `POST`.
          - Then [upload and complete](#operation/CompleteBlobUpload) with `PUT`.
@y
      3. If the blob does not exist, [upload the blob](#operation/CompleteBlobUpload) using a monolithic `PUT` request:
          - First, [initiate the upload](#operation/InitiateBlobUpload) with `POST`.
          - Then [upload and complete](#operation/CompleteBlobUpload) with `PUT`.
@z

@x
          **Note**:  Alternatively, you can upload the blob in multiple chunks by using `PATCH` requests to send each chunk, followed by a final `PUT` request to complete the upload. This is known as a [chunked upload](#operation/UploadBlobChunk) and is useful for large blobs or when resuming interrupted uploads.
@y
          **Note**:  Alternatively, you can upload the blob in multiple chunks by using `PATCH` requests to send each chunk, followed by a final `PUT` request to complete the upload. This is known as a [chunked upload](#operation/UploadBlobChunk) and is useful for large blobs or when resuming interrupted uploads.
@z

@x
      4. [Upload the image manifest](#operation/PutImageManifest) using a `PUT` request to associate the config and layers.
@y
      4. [Upload the image manifest](#operation/PutImageManifest) using a `PUT` request to associate the config and layers.
@z

@x
      The following bash script example pushes a dummy config blob and manifest to `yourusername/helloworld:latest` on Docker Hub. You can replace `yourusername` with your Docker Hub username and `dckr_pat` with your Docker Hub personal access token.
@y
      The following bash script example pushes a dummy config blob and manifest to `yourusername/helloworld:latest` on Docker Hub. You can replace `yourusername` with your Docker Hub username and `dckr_pat` with your Docker Hub personal access token.
@z

@x
      ```bash
      #!/bin/bash
@y
      ```bash
      #!/bin/bash
@z

@x
      USERNAME=yourusername
      PASSWORD=dckr_pat
      REPO=yourusername/helloworld
      TAG=latest
      CONFIG=config.json
      MIME_TYPE=application/vnd.docker.container.image.v1+json
@y
      USERNAME=yourusername
      PASSWORD=dckr_pat
      REPO=yourusername/helloworld
      TAG=latest
      CONFIG=config.json
      MIME_TYPE=application/vnd.docker.container.image.v1+json
@z

@x
      # Step 1: Get a bearer token
      TOKEN=$(curl -s -u "$USERNAME:$PASSWORD" \
      "https://auth.docker.io/token?service=registry.docker.io&scope=repository:$REPO:push,pull" \
      | jq -r .token)
@y
      # Step 1: Get a bearer token
      TOKEN=$(curl -s -u "$USERNAME:$PASSWORD" \
      "https://auth.docker.io/token?service=registry.docker.io&scope=repository:$REPO:push,pull" \
      | jq -r .token)
@z

@x
      # Create a dummy config blob and compute its digest
      echo '{"architecture":"amd64","os":"linux","config":{},"rootfs":{"type":"layers","diff_ids":[]}}' > $CONFIG
      DIGEST="sha256:$(sha256sum $CONFIG | awk '{print $1}')"
@y
      # Create a dummy config blob and compute its digest
      echo '{"architecture":"amd64","os":"linux","config":{},"rootfs":{"type":"layers","diff_ids":[]}}' > $CONFIG
      DIGEST="sha256:$(sha256sum $CONFIG | awk '{print $1}')"
@z

@x
      # Step 2: Check if the blob exists
      STATUS=$(curl -s -o /dev/null -w "%{http_code}" -I \
        -H "Authorization: Bearer $TOKEN" \
        https://registry-1.docker.io/v2/$REPO/blobs/$DIGEST)
@y
      # Step 2: Check if the blob exists
      STATUS=$(curl -s -o /dev/null -w "%{http_code}" -I \
        -H "Authorization: Bearer $TOKEN" \
        https://registry-1.docker.io/v2/$REPO/blobs/$DIGEST)
@z

@x
      if [ "$STATUS" != "200" ]; then
        # Step 3: Upload blob using monolithic upload
        LOCATION=$(curl -sI -X POST \
          -H "Authorization: Bearer $TOKEN" \
          https://registry-1.docker.io/v2/$REPO/blobs/uploads/ \
          | grep -i Location | tr -d '\r' | awk '{print $2}')
@y
      if [ "$STATUS" != "200" ]; then
        # Step 3: Upload blob using monolithic upload
        LOCATION=$(curl -sI -X POST \
          -H "Authorization: Bearer $TOKEN" \
          https://registry-1.docker.io/v2/$REPO/blobs/uploads/ \
          | grep -i Location | tr -d '\r' | awk '{print $2}')
@z

@x
        curl -s -X PUT "$LOCATION&digest=$DIGEST" \
          -H "Authorization: Bearer $TOKEN" \
          -H "Content-Type: application/octet-stream" \
          --data-binary @$CONFIG
      fi
@y
        curl -s -X PUT "$LOCATION&digest=$DIGEST" \
          -H "Authorization: Bearer $TOKEN" \
          -H "Content-Type: application/octet-stream" \
          --data-binary @$CONFIG
      fi
@z

@x
      # Step 4: Upload the manifest that references the config blob
      MANIFEST=$(cat <<EOF
      {
        "schemaVersion": 2,
        "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
        "config": {
          "mediaType": "$MIME_TYPE",
          "size": $(stat -c%s $CONFIG),
          "digest": "$DIGEST"
        },
        "layers": []
      }
      EOF
      )
@y
      # Step 4: Upload the manifest that references the config blob
      MANIFEST=$(cat <<EOF
      {
        "schemaVersion": 2,
        "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
        "config": {
          "mediaType": "$MIME_TYPE",
          "size": $(stat -c%s $CONFIG),
          "digest": "$DIGEST"
        },
        "layers": []
      }
      EOF
      )
@z

@x
      curl -s -X PUT \
        -H "Authorization: Bearer $TOKEN" \
        -H "Content-Type: application/vnd.docker.distribution.manifest.v2+json" \
        -d "$MANIFEST" \
        https://registry-1.docker.io/v2/$REPO/manifests/$TAG
@y
      curl -s -X PUT \
        -H "Authorization: Bearer $TOKEN" \
        -H "Content-Type: application/vnd.docker.distribution.manifest.v2+json" \
        -d "$MANIFEST" \
        https://registry-1.docker.io/v2/$REPO/manifests/$TAG
@z

@x
      echo "Pushed image to $REPO:$TAG"
      ```
@y
      echo "Pushed image to $REPO:$TAG"
      ```
@z

@x
      This example pushes a minimal image with no layers. To push a complete image, repeat steps 2–3 for each layer and include the layer digests in the `layers[]` field of the manifest.
@y
      This example pushes a minimal image with no layers. To push a complete image, repeat steps 2–3 for each layer and include the layer digests in the `layers[]` field of the manifest.
@z

@x
  - name: delete
    x-displayName: Deleting Images
    description: |
      Deleting an image involves removing its manifest by digest. You must first retrieve the manifest digest, then issue a `DELETE` request using that digest.
@y
  - name: delete
    x-displayName: Deleting Images
    description: |
      Deleting an image involves removing its manifest by digest. You must first retrieve the manifest digest, then issue a `DELETE` request using that digest.
@z

@x
      Only untagged manifests (or those not referenced by other tags or images) can be deleted. If a manifest is still referenced, the registry returns `403 Forbidden`.
@y
      Only untagged manifests (or those not referenced by other tags or images) can be deleted. If a manifest is still referenced, the registry returns `403 Forbidden`.
@z

@x
      > **Note**
      >
      > Manifest deletion operations may experience latency and could return a `500 Internal Server Error` during deletion. The system automatically retries the deletion in the background, so the manifest will eventually be removed. You do not need to manually retry the request.
@y
      > **Note**
      >
      > Manifest deletion operations may experience latency and could return a `500 Internal Server Error` during deletion. The system automatically retries the deletion in the background, so the manifest will eventually be removed. You do not need to manually retry the request.
@z

@x
      This section outlines the basic steps to delete an image using the registry API.
@y
      This section outlines the basic steps to delete an image using the registry API.
@z

@x
      1. [Get a bearer token for the repository](https://docs.docker.com/reference/api/registry/auth/).
      2. [Get the manifest](#operation/GetImageManifest) using the image's tag.
      3. Retrieve the `Docker-Content-Digest` header from the manifest response. This digest uniquely identifies the manifest.
      4. [Delete the manifest](#operation/DeleteImageManifest) using a `DELETE` request and the digest.
@y
      1. [Get a bearer token for the repository](https://docs.docker.com/reference/api/registry/auth/).
      2. [Get the manifest](#operation/GetImageManifest) using the image's tag.
      3. Retrieve the `Docker-Content-Digest` header from the manifest response. This digest uniquely identifies the manifest.
      4. [Delete the manifest](#operation/DeleteImageManifest) using a `DELETE` request and the digest.
@z

@x
      The following bash script example deletes the `latest` tag from `yourusername/helloworld` on Docker Hub. Replace `yourusername` with your Docker Hub username and `dckr_pat` with your Docker Hub personal access token.
@y
      The following bash script example deletes the `latest` tag from `yourusername/helloworld` on Docker Hub. Replace `yourusername` with your Docker Hub username and `dckr_pat` with your Docker Hub personal access token.
@z

@x
      ```bash
      #!/bin/bash
@y
      ```bash
      #!/bin/bash
@z

@x
      USERNAME=yourusername
      PASSWORD=dckr_pat
      REPO=yourusername/helloworld
      TAG=latest
@y
      USERNAME=yourusername
      PASSWORD=dckr_pat
      REPO=yourusername/helloworld
      TAG=latest
@z

@x
      # Step 1: Get a bearer token
      TOKEN=$(curl -s -u "$USERNAME:$PASSWORD" \
        "https://auth.docker.io/token?service=registry.docker.io&scope=repository:$REPO:pull,push,delete" \
        | jq -r .token)
@y
      # Step 1: Get a bearer token
      TOKEN=$(curl -s -u "$USERNAME:$PASSWORD" \
        "https://auth.docker.io/token?service=registry.docker.io&scope=repository:$REPO:pull,push,delete" \
        | jq -r .token)
@z

@x
      # Step 2 and 3: Get the manifest and extract the digest from response headers
      DIGEST=$(curl -sI -H "Authorization: Bearer $TOKEN" \
        -H "Accept: application/vnd.docker.distribution.manifest.v2+json" \
        https://registry-1.docker.io/v2/$REPO/manifests/$TAG \
        | grep -i Docker-Content-Digest | tr -d '\r' | awk '{print $2}')
@y
      # Step 2 and 3: Get the manifest and extract the digest from response headers
      DIGEST=$(curl -sI -H "Authorization: Bearer $TOKEN" \
        -H "Accept: application/vnd.docker.distribution.manifest.v2+json" \
        https://registry-1.docker.io/v2/$REPO/manifests/$TAG \
        | grep -i Docker-Content-Digest | tr -d '\r' | awk '{print $2}')
@z

@x
      echo "Deleting manifest with digest: $DIGEST"
@y
      echo "Deleting manifest with digest: $DIGEST"
@z

@x
      # Step 4: Delete the manifest by digest
      curl -s -X DELETE \
        -H "Authorization: Bearer $TOKEN" \
        https://registry-1.docker.io/v2/$REPO/manifests/$DIGEST
@y
      # Step 4: Delete the manifest by digest
      curl -s -X DELETE \
        -H "Authorization: Bearer $TOKEN" \
        https://registry-1.docker.io/v2/$REPO/manifests/$DIGEST
@z

@x
      echo "Deleted image: $REPO@$DIGEST"
      ```
@y
      echo "Deleted image: $REPO@$DIGEST"
      ```
@z

@x
      This example deletes the manifest for the `latest` tag. To fully delete all references to an image, ensure no other tags or referrers point to the same manifest digest.
@y
      This example deletes the manifest for the `latest` tag. To fully delete all references to an image, ensure no other tags or referrers point to the same manifest digest.
@z

@x
paths:
  /v2/{name}/manifests/{reference}:
    get:
      tags:
        - Manifests
      x-displayName: Manifests
      summary: Get image manifest
      operationId: GetImageManifest
      description: |
        Fetch the manifest identified by `name` and `reference`, where `reference` can be a tag (e.g., `latest`) or a digest (e.g., `sha256:...`).
@y
paths:
  /v2/{name}/manifests/{reference}:
    get:
      tags:
        - Manifests
      x-displayName: Manifests
      summary: Get image manifest
      operationId: GetImageManifest
      description: |
        Fetch the manifest identified by `name` and `reference`, where `reference` can be a tag (e.g., `latest`) or a digest (e.g., `sha256:...`).
@z

@x
        The manifest contains metadata about the image, including configuration and layer digests. It is required for pulling images from the registry.
@y
        The manifest contains metadata about the image, including configuration and layer digests. It is required for pulling images from the registry.
@z

@x
        This endpoint requires authentication. Use the `Authorization: Bearer <token>` header.
@y
        This endpoint requires authentication. Use the `Authorization: Bearer <token>` header.
@z

@x
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # GET a manifest (by tag or digest)
            curl -H "Authorization: Bearer $TOKEN" \
                 -H "Accept: application/vnd.docker.distribution.manifest.v2+json" \
                 https://registry-1.docker.io/v2/library/ubuntu/manifests/latest
      parameters:
        - name: name
          in: path
          required: true
          description: Name of the target repository
          example: library/ubuntu
          schema:
            type: string
        - name: reference
          in: path
          required: true
          description: Tag or digest of the target manifest
          examples:
            by-tag:
              summary: Tag
              value: latest
            by-digest:
              summary: Digest
              value: sha256:abc123def456...
          schema:
            type: string
        - name: Authorization
          in: header
          required: true
          description: RFC7235-compliant authorization header (e.g., `Bearer <token>`).
          schema:
            type: string
        - name: Accept
          in: header
          required: false
          description: |
            Media type(s) the client supports for the manifest.
@y
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # GET a manifest (by tag or digest)
            curl -H "Authorization: Bearer $TOKEN" \
                 -H "Accept: application/vnd.docker.distribution.manifest.v2+json" \
                 https://registry-1.docker.io/v2/library/ubuntu/manifests/latest
      parameters:
        - name: name
          in: path
          required: true
          description: Name of the target repository
          example: library/ubuntu
          schema:
            type: string
        - name: reference
          in: path
          required: true
          description: Tag or digest of the target manifest
          examples:
            by-tag:
              summary: Tag
              value: latest
            by-digest:
              summary: Digest
              value: sha256:abc123def456...
          schema:
            type: string
        - name: Authorization
          in: header
          required: true
          description: RFC7235-compliant authorization header (e.g., `Bearer <token>`).
          schema:
            type: string
        - name: Accept
          in: header
          required: false
          description: |
            Media type(s) the client supports for the manifest.
@z

@x
            The registry supports the following media types:
            - application/vnd.docker.distribution.manifest.v2+json
            - application/vnd.docker.distribution.manifest.list.v2+json
            - application/vnd.oci.image.manifest.v1+json
            - application/vnd.oci.image.index.v1+json
          schema:
            type: string
@y
            The registry supports the following media types:
            - application/vnd.docker.distribution.manifest.v2+json
            - application/vnd.docker.distribution.manifest.list.v2+json
            - application/vnd.oci.image.manifest.v1+json
            - application/vnd.oci.image.index.v1+json
          schema:
            type: string
@z

@x
      responses:
        "200":
          description: Manifest fetched successfully.
          headers:
            Docker-Content-Digest:
              description: Digest of the returned manifest content.
              schema:
                type: string
            Content-Type:
              description: Media type of the returned manifest.
              schema:
                type: string
          content:
            application/vnd.docker.distribution.manifest.v2+json:
              schema:
                type: object
                required:
                  - schemaVersion
                  - mediaType
                  - config
                  - layers
                properties:
                  schemaVersion:
                    type: integer
                    example: 2
                  mediaType:
                    type: string
                    example: application/vnd.docker.distribution.manifest.v2+json
                  config:
                    type: object
                    properties:
                      mediaType:
                        type: string
                        example: application/vnd.docker.container.image.v1+json
                      size:
                        type: integer
                        example: 7023
                      digest:
                        type: string
                        example: sha256:a3f3e...c1234
                  layers:
                    type: array
                    items:
                      type: object
                      properties:
                        mediaType:
                          type: string
                          example: application/vnd.docker.image.rootfs.diff.tar.gzip
                        size:
                          type: integer
                          example: 32654
                        digest:
                          type: string
                          example: sha256:bcf2...78901
              examples:
                docker-manifest:
                  summary: Docker image manifest (schema v2)
                  value:
                    {
                      "schemaVersion": 2,
                      "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
                      "config": {
                        "mediaType": "application/vnd.docker.container.image.v1+json",
                        "size": 7023,
                        "digest": "sha256:123456abcdef..."
                      },
                      "layers": [
                        {
                          "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
                          "size": 32654,
                          "digest": "sha256:abcdef123456..."
                        },
                        {
                          "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
                          "size": 16724,
                          "digest": "sha256:7890abcdef12..."
                        }
                      ]
                    }
@y
      responses:
        "200":
          description: Manifest fetched successfully.
          headers:
            Docker-Content-Digest:
              description: Digest of the returned manifest content.
              schema:
                type: string
            Content-Type:
              description: Media type of the returned manifest.
              schema:
                type: string
          content:
            application/vnd.docker.distribution.manifest.v2+json:
              schema:
                type: object
                required:
                  - schemaVersion
                  - mediaType
                  - config
                  - layers
                properties:
                  schemaVersion:
                    type: integer
                    example: 2
                  mediaType:
                    type: string
                    example: application/vnd.docker.distribution.manifest.v2+json
                  config:
                    type: object
                    properties:
                      mediaType:
                        type: string
                        example: application/vnd.docker.container.image.v1+json
                      size:
                        type: integer
                        example: 7023
                      digest:
                        type: string
                        example: sha256:a3f3e...c1234
                  layers:
                    type: array
                    items:
                      type: object
                      properties:
                        mediaType:
                          type: string
                          example: application/vnd.docker.image.rootfs.diff.tar.gzip
                        size:
                          type: integer
                          example: 32654
                        digest:
                          type: string
                          example: sha256:bcf2...78901
              examples:
                docker-manifest:
                  summary: Docker image manifest (schema v2)
                  value:
                    {
                      "schemaVersion": 2,
                      "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
                      "config": {
                        "mediaType": "application/vnd.docker.container.image.v1+json",
                        "size": 7023,
                        "digest": "sha256:123456abcdef..."
                      },
                      "layers": [
                        {
                          "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
                          "size": 32654,
                          "digest": "sha256:abcdef123456..."
                        },
                        {
                          "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
                          "size": 16724,
                          "digest": "sha256:7890abcdef12..."
                        }
                      ]
                    }
@z

@x
        "400":
          description: Invalid name or reference.
        "401":
          description: Authentication required.
        "403":
          description: Access denied.
        "404":
          description: Repository or manifest not found.
        "429":
          description: Too many requests.
@y
        "400":
          description: Invalid name or reference.
        "401":
          description: Authentication required.
        "403":
          description: Access denied.
        "404":
          description: Repository or manifest not found.
        "429":
          description: Too many requests.
@z

@x
    put:
      tags:
        - Manifests
      summary: Put image manifest
      operationId: PutImageManifest
      description: |
        Upload an image manifest for a given tag or digest. This operation registers a manifest in a repository, allowing it to be pulled using the specified reference.
@y
    put:
      tags:
        - Manifests
      summary: Put image manifest
      operationId: PutImageManifest
      description: |
        Upload an image manifest for a given tag or digest. This operation registers a manifest in a repository, allowing it to be pulled using the specified reference.
@z

@x
        This endpoint is typically used after all layer and config blobs have been uploaded to the registry.
@y
        This endpoint is typically used after all layer and config blobs have been uploaded to the registry.
@z

@x
        The manifest must conform to the expected schema and media type. For Docker image manifest schema version 2, use:
        `application/vnd.docker.distribution.manifest.v2+json`
@y
        The manifest must conform to the expected schema and media type. For Docker image manifest schema version 2, use:
        `application/vnd.docker.distribution.manifest.v2+json`
@z

@x
        Requires authentication via a bearer token with `push` scope for the target repository.
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # PUT a manifest (tag = latest)
            curl -X PUT \
              -H "Authorization: Bearer $TOKEN" \
              -H "Content-Type: application/vnd.docker.distribution.manifest.v2+json" \
              --data-binary @manifest.json \
              https://registry-1.docker.io/v2/library/ubuntu/manifests/latest
      parameters:
        - name: name
          in: path
          required: true
          description: Name of the target Repository
          example: library/ubuntu
          schema:
            type: string
        - name: reference
          in: path
          required: true
          description: Tag or digest to associate with the uploaded Manifest
          examples:
            by-tag:
              summary: Tag
              value: latest
            by-digest:
              summary: Digest
              value: sha256:abc123def456...
          schema:
            type: string
        - name: Authorization
          in: header
          required: true
          description: RFC7235-compliant authorization header (e.g., `Bearer <token>`).
          schema:
            type: string
        - name: Content-Type
          in: header
          required: true
          description: Media type of the manifest being uploaded.
          schema:
            type: string
            example: application/vnd.docker.distribution.manifest.v2+json
@y
        Requires authentication via a bearer token with `push` scope for the target repository.
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # PUT a manifest (tag = latest)
            curl -X PUT \
              -H "Authorization: Bearer $TOKEN" \
              -H "Content-Type: application/vnd.docker.distribution.manifest.v2+json" \
              --data-binary @manifest.json \
              https://registry-1.docker.io/v2/library/ubuntu/manifests/latest
      parameters:
        - name: name
          in: path
          required: true
          description: Name of the target Repository
          example: library/ubuntu
          schema:
            type: string
        - name: reference
          in: path
          required: true
          description: Tag or digest to associate with the uploaded Manifest
          examples:
            by-tag:
              summary: Tag
              value: latest
            by-digest:
              summary: Digest
              value: sha256:abc123def456...
          schema:
            type: string
        - name: Authorization
          in: header
          required: true
          description: RFC7235-compliant authorization header (e.g., `Bearer <token>`).
          schema:
            type: string
        - name: Content-Type
          in: header
          required: true
          description: Media type of the manifest being uploaded.
          schema:
            type: string
            example: application/vnd.docker.distribution.manifest.v2+json
@z

@x
      requestBody:
        required: true
        content:
          application/vnd.docker.distribution.manifest.v2+json:
            schema:
              type: object
              required:
                - schemaVersion
                - mediaType
                - config
                - layers
              properties:
                schemaVersion:
                  type: integer
                  example: 2
                mediaType:
                  type: string
                  example: application/vnd.docker.distribution.manifest.v2+json
                config:
                  type: object
                  required:
                    - mediaType
                    - size
                    - digest
                  properties:
                    mediaType:
                      type: string
                      example: application/vnd.docker.container.image.v1+json
                    size:
                      type: integer
                      example: 7023
                    digest:
                      type: string
                      example: sha256:123456abcdef...
                layers:
                  type: array
                  items:
                    type: object
                    required:
                      - mediaType
                      - size
                      - digest
                    properties:
                      mediaType:
                        type: string
                        example: application/vnd.docker.image.rootfs.diff.tar.gzip
                      size:
                        type: integer
                        example: 32654
                      digest:
                        type: string
                        example: sha256:abcdef123456...
@y
      requestBody:
        required: true
        content:
          application/vnd.docker.distribution.manifest.v2+json:
            schema:
              type: object
              required:
                - schemaVersion
                - mediaType
                - config
                - layers
              properties:
                schemaVersion:
                  type: integer
                  example: 2
                mediaType:
                  type: string
                  example: application/vnd.docker.distribution.manifest.v2+json
                config:
                  type: object
                  required:
                    - mediaType
                    - size
                    - digest
                  properties:
                    mediaType:
                      type: string
                      example: application/vnd.docker.container.image.v1+json
                    size:
                      type: integer
                      example: 7023
                    digest:
                      type: string
                      example: sha256:123456abcdef...
                layers:
                  type: array
                  items:
                    type: object
                    required:
                      - mediaType
                      - size
                      - digest
                    properties:
                      mediaType:
                        type: string
                        example: application/vnd.docker.image.rootfs.diff.tar.gzip
                      size:
                        type: integer
                        example: 32654
                      digest:
                        type: string
                        example: sha256:abcdef123456...
@z

@x
            examples:
              sample-manifest:
                summary: Sample Docker image manifest (schema v2)
                value:
                  {
                    "schemaVersion": 2,
                    "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
                    "config": {
                      "mediaType": "application/vnd.docker.container.image.v1+json",
                      "size": 7023,
                      "digest": "sha256:123456abcdef..."
                    },
                    "layers": [
                      {
                        "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
                        "size": 32654,
                        "digest": "sha256:abcdef123456..."
                      }
                    ]
                  }
@y
            examples:
              sample-manifest:
                summary: Sample Docker image manifest (schema v2)
                value:
                  {
                    "schemaVersion": 2,
                    "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
                    "config": {
                      "mediaType": "application/vnd.docker.container.image.v1+json",
                      "size": 7023,
                      "digest": "sha256:123456abcdef..."
                    },
                    "layers": [
                      {
                        "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
                        "size": 32654,
                        "digest": "sha256:abcdef123456..."
                      }
                    ]
                  }
@z

@x
      responses:
        "201":
          description: Manifest created successfully.
          headers:
            Docker-Content-Digest:
              description: Digest of the stored manifest.
              schema:
                type: string
              example: sha256:abcdef123456...
            Location:
              description: Canonical location of the uploaded manifest.
              schema:
                type: string
              example: /v2/library/ubuntu/manifests/latest
            Content-Length:
              description: Always zero.
              schema:
                type: integer
              example: 0
        "400":
          description: Invalid name, reference, or manifest.
        "401":
          description: Authentication required.
        "403":
          description: Access denied.
        "404":
          description: Repository not found.
        "405":
          description: Operation not allowed.
        "429":
          description: Too many requests.
    head:
      tags:
        - Manifests
      summary: Check if manifest exists
      operationId: HeadImageManifest
      description: |
        Use this endpoint to verify whether a manifest exists by tag or digest.
@y
      responses:
        "201":
          description: Manifest created successfully.
          headers:
            Docker-Content-Digest:
              description: Digest of the stored manifest.
              schema:
                type: string
              example: sha256:abcdef123456...
            Location:
              description: Canonical location of the uploaded manifest.
              schema:
                type: string
              example: /v2/library/ubuntu/manifests/latest
            Content-Length:
              description: Always zero.
              schema:
                type: integer
              example: 0
        "400":
          description: Invalid name, reference, or manifest.
        "401":
          description: Authentication required.
        "403":
          description: Access denied.
        "404":
          description: Repository not found.
        "405":
          description: Operation not allowed.
        "429":
          description: Too many requests.
    head:
      tags:
        - Manifests
      summary: Check if manifest exists
      operationId: HeadImageManifest
      description: |
        Use this endpoint to verify whether a manifest exists by tag or digest.
@z

@x
        This is a lightweight operation that returns only headers (no body). It is useful for:
        - Checking for the existence of a specific image version
        - Determining the digest or size of a manifest before downloading or deleting
@y
        This is a lightweight operation that returns only headers (no body). It is useful for:
        - Checking for the existence of a specific image version
        - Determining the digest or size of a manifest before downloading or deleting
@z

@x
        This endpoint requires authentication with pull scope.
@y
        This endpoint requires authentication with pull scope.
@z

@x
      parameters:
        - name: name
          in: path
          required: true
          description: Name of the Repository
          example: library/ubuntu
          schema:
            type: string
        - name: reference
          in: path
          required: true
          description: Tag or digest to check
          examples:
            by-tag:
              summary: Tag
              value: latest
            by-digest:
              summary: Digest
              value: sha256:abc123def456...
          schema:
            type: string
        - name: Authorization
          in: header
          required: true
          schema:
            type: string
          description: Bearer token for authentication
        - name: Accept
          in: header
          required: false
          schema:
            type: string
            example: application/vnd.docker.distribution.manifest.v2+json
          description: |
            Media type of the manifest to check. The response will match one of the accepted types.
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # HEAD /v2/{name}/manifests/{reference}
            curl -I \
              -H "Authorization: Bearer $TOKEN" \
              -H "Accept: application/vnd.docker.distribution.manifest.v2+json" \
              https://registry-1.docker.io/v2/library/ubuntu/manifests/latest
      responses:
        "200":
          description: Manifest exists.
          headers:
            Content-Length:
              description: Size of the manifest in bytes
              schema:
                type: integer
              example: 7082
            Docker-Content-Digest:
              description: Digest of the manifest
              schema:
                type: string
              example: sha256:abc123...
            Content-Type:
              description: Media type of the manifest
              schema:
                type: string
              example: application/vnd.docker.distribution.manifest.v2+json
        "404":
          description: Manifest not found.
        "401":
          description: Authentication required.
        "403":
          description: Access denied.
        "429":
          description: Too many requests.
    delete:
      tags:
        - Manifests
      summary: Delete image manifest
      operationId: DeleteImageManifest
      description: |
        Delete an image manifest from a repository by digest.
@y
      parameters:
        - name: name
          in: path
          required: true
          description: Name of the Repository
          example: library/ubuntu
          schema:
            type: string
        - name: reference
          in: path
          required: true
          description: Tag or digest to check
          examples:
            by-tag:
              summary: Tag
              value: latest
            by-digest:
              summary: Digest
              value: sha256:abc123def456...
          schema:
            type: string
        - name: Authorization
          in: header
          required: true
          schema:
            type: string
          description: Bearer token for authentication
        - name: Accept
          in: header
          required: false
          schema:
            type: string
            example: application/vnd.docker.distribution.manifest.v2+json
          description: |
            Media type of the manifest to check. The response will match one of the accepted types.
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # HEAD /v2/{name}/manifests/{reference}
            curl -I \
              -H "Authorization: Bearer $TOKEN" \
              -H "Accept: application/vnd.docker.distribution.manifest.v2+json" \
              https://registry-1.docker.io/v2/library/ubuntu/manifests/latest
      responses:
        "200":
          description: Manifest exists.
          headers:
            Content-Length:
              description: Size of the manifest in bytes
              schema:
                type: integer
              example: 7082
            Docker-Content-Digest:
              description: Digest of the manifest
              schema:
                type: string
              example: sha256:abc123...
            Content-Type:
              description: Media type of the manifest
              schema:
                type: string
              example: application/vnd.docker.distribution.manifest.v2+json
        "404":
          description: Manifest not found.
        "401":
          description: Authentication required.
        "403":
          description: Access denied.
        "429":
          description: Too many requests.
    delete:
      tags:
        - Manifests
      summary: Delete image manifest
      operationId: DeleteImageManifest
      description: |
        Delete an image manifest from a repository by digest.
@z

@x
        Only untagged or unreferenced manifests can be deleted. If the manifest is still referenced by a tag or another image, the registry will return `403 Forbidden`.
@y
        Only untagged or unreferenced manifests can be deleted. If the manifest is still referenced by a tag or another image, the registry will return `403 Forbidden`.
@z

@x
        This operation requires `delete` access to the repository.
@y
        This operation requires `delete` access to the repository.
@z

@x
        > **Note**
        >
        > Manifest deletion operations may take some time and could return a `500 Internal Server Error`. The system automatically retries the deletion in the background. Manual intervention is not required.
@y
        > **Note**
        >
        > Manifest deletion operations may take some time and could return a `500 Internal Server Error`. The system automatically retries the deletion in the background. Manual intervention is not required.
@z

@x
      parameters:
        - name: name
          in: path
          required: true
          description: Name of the repository
          example: yourusername/helloworld
          schema:
            type: string
        - name: reference
          in: path
          required: true
          description: Digest of the manifest to delete (e.g., `sha256:...`)
          example: sha256:abc123def456...
          schema:
            type: string
        - name: Authorization
          in: header
          required: true
          description: Bearer token with `delete` access
          schema:
            type: string
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # DELETE a manifest by digest
            curl -X DELETE \
              -H "Authorization: Bearer $TOKEN" \
              https://registry-1.docker.io/v2/yourusername/helloworld/manifests/sha256:abc123def456...
      responses:
        "202":
          description: Manifest deleted successfully. No content returned.
        "401":
          description: Authentication required.
        "403":
          description: Access denied. The manifest may still be referenced.
        "404":
          description: Manifest or repository not found.
        "405":
          description: Only digest-based deletion is allowed.
        "429":
          description: Too many requests.
  /v2/{name}/blobs/uploads/:
    post:
      tags:
        - Blobs
      summary: Initiate blob upload or attempt cross-repository blob mount
      operationId: InitiateBlobUpload
      description: |
        Initiate an upload session for a blob (layer or config) in a repository.
@y
      parameters:
        - name: name
          in: path
          required: true
          description: Name of the repository
          example: yourusername/helloworld
          schema:
            type: string
        - name: reference
          in: path
          required: true
          description: Digest of the manifest to delete (e.g., `sha256:...`)
          example: sha256:abc123def456...
          schema:
            type: string
        - name: Authorization
          in: header
          required: true
          description: Bearer token with `delete` access
          schema:
            type: string
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # DELETE a manifest by digest
            curl -X DELETE \
              -H "Authorization: Bearer $TOKEN" \
              https://registry-1.docker.io/v2/yourusername/helloworld/manifests/sha256:abc123def456...
      responses:
        "202":
          description: Manifest deleted successfully. No content returned.
        "401":
          description: Authentication required.
        "403":
          description: Access denied. The manifest may still be referenced.
        "404":
          description: Manifest or repository not found.
        "405":
          description: Only digest-based deletion is allowed.
        "429":
          description: Too many requests.
  /v2/{name}/blobs/uploads/:
    post:
      tags:
        - Blobs
      summary: Initiate blob upload or attempt cross-repository blob mount
      operationId: InitiateBlobUpload
      description: |
        Initiate an upload session for a blob (layer or config) in a repository.
@z

@x
        This is the first step in uploading a blob. It returns a `Location` URL where the blob can be uploaded using `PATCH` (chunked) or `PUT` (monolithic).
@y
        This is the first step in uploading a blob. It returns a `Location` URL where the blob can be uploaded using `PATCH` (chunked) or `PUT` (monolithic).
@z

@x
        Instead of uploading a blob, a client may attempt to mount a blob from another repository (if it has read access) by including the `mount` and `from` query parameters.
@y
        Instead of uploading a blob, a client may attempt to mount a blob from another repository (if it has read access) by including the `mount` and `from` query parameters.
@z

@x
        If successful, the registry responds with `201 Created` and the blob is reused without re-upload.
@y
        If successful, the registry responds with `201 Created` and the blob is reused without re-upload.
@z

@x
        If the mount fails, the upload proceeds as usual and returns a `202 Accepted`.
@y
        If the mount fails, the upload proceeds as usual and returns a `202 Accepted`.
@z

@x
        You must authenticate with `push` access to the target repository.
      x-codeSamples:
        - lang: Bash
          label: cURL (Initiate Standard Upload)
          source: |
            # Initiate a standard blob upload session
            curl -i -X POST \
              -H "Authorization: Bearer $TOKEN" \
              https://registry-1.docker.io/v2/library/ubuntu/blobs/uploads/
@y
        You must authenticate with `push` access to the target repository.
      x-codeSamples:
        - lang: Bash
          label: cURL (Initiate Standard Upload)
          source: |
            # Initiate a standard blob upload session
            curl -i -X POST \
              -H "Authorization: Bearer $TOKEN" \
              https://registry-1.docker.io/v2/library/ubuntu/blobs/uploads/
@z

@x
        - lang: Bash
          label: cURL (Cross-Repository Blob Mount)
          source: |
            # Attempt a cross-repository blob mount
            curl -i -X POST \
              -H "Authorization: Bearer $TOKEN" \
              "https://registry-1.docker.io/v2/library/ubuntu/blobs/uploads/?mount=sha256:abc123def456...&from=library/busybox"
@y
        - lang: Bash
          label: cURL (Cross-Repository Blob Mount)
          source: |
            # Attempt a cross-repository blob mount
            curl -i -X POST \
              -H "Authorization: Bearer $TOKEN" \
              "https://registry-1.docker.io/v2/library/ubuntu/blobs/uploads/?mount=sha256:abc123def456...&from=library/busybox"
@z

@x
      parameters:
        - name: name
          in: path
          required: true
          description: Name of the target repository
          example: library/ubuntu
          schema:
            type: string
        - name: mount
          in: query
          required: false
          description: Digest of the blob to mount from another repository
          schema:
            type: string
          example: sha256:abc123def456...
        - name: from
          in: query
          required: false
          description: Source repository to mount the blob from
          schema:
            type: string
          example: library/busybox
        - name: Authorization
          in: header
          required: true
          schema:
            type: string
          description: Bearer token for authentication with `push` scope
@y
      parameters:
        - name: name
          in: path
          required: true
          description: Name of the target repository
          example: library/ubuntu
          schema:
            type: string
        - name: mount
          in: query
          required: false
          description: Digest of the blob to mount from another repository
          schema:
            type: string
          example: sha256:abc123def456...
        - name: from
          in: query
          required: false
          description: Source repository to mount the blob from
          schema:
            type: string
          example: library/busybox
        - name: Authorization
          in: header
          required: true
          schema:
            type: string
          description: Bearer token for authentication with `push` scope
@z

@x
      responses:
        "201":
          description: Blob successfully mounted from another repository.
          headers:
            Location:
              description: URL where the mounted blob is accessible
              schema:
                type: string
              example: /v2/library/ubuntu/blobs/sha256:abc123...
            Docker-Content-Digest:
              description: Canonical digest of the mounted blob
              schema:
                type: string
              example: sha256:abc123...
            Content-Length:
              description: Always zero
              schema:
                type: integer
              example: 0
        "202":
          description: Upload initiated successfully (fallback if mount fails).
          headers:
            Location:
              description: Upload location URL for `PATCH` or `PUT` requests
              schema:
                type: string
              example: /v2/library/ubuntu/blobs/uploads/abc123
            Docker-Upload-UUID:
              description: Server-generated UUID for the upload session
              schema:
                type: string
              example: abc123
            Range:
              description: Current upload byte range (typically `0-0` at init)
              schema:
                type: string
              example: 0-0
            Content-Length:
              description: Always zero
              schema:
                type: integer
              example: 0
        "401":
          description: Authentication required.
        "403":
          description: Access denied.
        "404":
          description: Repository not found.
        "429":
          description: Too many requests.
  /v2/{name}/blobs/{digest}:
    head:
      tags:
        - Blobs
      summary: Check existence of blob
      operationId: CheckBlobExists
      description: |
        Check whether a blob (layer or config) exists in the registry.
@y
      responses:
        "201":
          description: Blob successfully mounted from another repository.
          headers:
            Location:
              description: URL where the mounted blob is accessible
              schema:
                type: string
              example: /v2/library/ubuntu/blobs/sha256:abc123...
            Docker-Content-Digest:
              description: Canonical digest of the mounted blob
              schema:
                type: string
              example: sha256:abc123...
            Content-Length:
              description: Always zero
              schema:
                type: integer
              example: 0
        "202":
          description: Upload initiated successfully (fallback if mount fails).
          headers:
            Location:
              description: Upload location URL for `PATCH` or `PUT` requests
              schema:
                type: string
              example: /v2/library/ubuntu/blobs/uploads/abc123
            Docker-Upload-UUID:
              description: Server-generated UUID for the upload session
              schema:
                type: string
              example: abc123
            Range:
              description: Current upload byte range (typically `0-0` at init)
              schema:
                type: string
              example: 0-0
            Content-Length:
              description: Always zero
              schema:
                type: integer
              example: 0
        "401":
          description: Authentication required.
        "403":
          description: Access denied.
        "404":
          description: Repository not found.
        "429":
          description: Too many requests.
  /v2/{name}/blobs/{digest}:
    head:
      tags:
        - Blobs
      summary: Check existence of blob
      operationId: CheckBlobExists
      description: |
        Check whether a blob (layer or config) exists in the registry.
@z

@x
        This is useful before uploading a blob to avoid duplicates.
@y
        This is useful before uploading a blob to avoid duplicates.
@z

@x
        If the blob is present, the registry returns a `200 OK` response with headers like `Content-Length` and `Docker-Content-Digest`.
@y
        If the blob is present, the registry returns a `200 OK` response with headers like `Content-Length` and `Docker-Content-Digest`.
@z

@x
        If the blob does not exist, the response will be `404 Not Found`.
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # HEAD to check if a blob exists
            curl -I \
              -H "Authorization: Bearer $TOKEN" \
              https://registry-1.docker.io/v2/library/ubuntu/blobs/sha256:abc123...
      parameters:
        - name: name
          in: path
          required: true
          description: Name of the Repository
          example: library/ubuntu
          schema:
            type: string
        - name: digest
          in: path
          required: true
          description: Digest of the blob
          schema:
            type: string
          example: sha256:abc123def4567890...
        - name: Authorization
          in: header
          required: true
          description: Bearer token with pull or push scope
          schema:
            type: string
          example: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6...
@y
        If the blob does not exist, the response will be `404 Not Found`.
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # HEAD to check if a blob exists
            curl -I \
              -H "Authorization: Bearer $TOKEN" \
              https://registry-1.docker.io/v2/library/ubuntu/blobs/sha256:abc123...
      parameters:
        - name: name
          in: path
          required: true
          description: Name of the Repository
          example: library/ubuntu
          schema:
            type: string
        - name: digest
          in: path
          required: true
          description: Digest of the blob
          schema:
            type: string
          example: sha256:abc123def4567890...
        - name: Authorization
          in: header
          required: true
          description: Bearer token with pull or push scope
          schema:
            type: string
          example: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6...
@z

@x
      responses:
        "200":
          description: Blob exists
          headers:
            Content-Length:
              description: Size of the blob in bytes
              schema:
                type: integer
              example: 32654
            Docker-Content-Digest:
              description: Digest of the blob
              schema:
                type: string
              example: sha256:abc123def4567890...
            Content-Type:
              description: MIME type of the blob content
              schema:
                type: string
              example: application/octet-stream
          content:
            application/json:
              examples:
                blob-check-request:
                  summary: Sample request
                  value:
                    method: HEAD
                    url: /v2/library/ubuntu/blobs/sha256:abc123def4567890...
                    headers:
                      Authorization: Bearer <token>
                      Accept: '*/*'
                blob-check-response:
                  summary: Sample 200 response headers
                  value:
                    status: 200 OK
                    headers:
                      Docker-Content-Digest: sha256:abc123def4567890...
                      Content-Length: 32654
                      Content-Type: application/octet-stream
@y
      responses:
        "200":
          description: Blob exists
          headers:
            Content-Length:
              description: Size of the blob in bytes
              schema:
                type: integer
              example: 32654
            Docker-Content-Digest:
              description: Digest of the blob
              schema:
                type: string
              example: sha256:abc123def4567890...
            Content-Type:
              description: MIME type of the blob content
              schema:
                type: string
              example: application/octet-stream
          content:
            application/json:
              examples:
                blob-check-request:
                  summary: Sample request
                  value:
                    method: HEAD
                    url: /v2/library/ubuntu/blobs/sha256:abc123def4567890...
                    headers:
                      Authorization: Bearer <token>
                      Accept: '*/*'
                blob-check-response:
                  summary: Sample 200 response headers
                  value:
                    status: 200 OK
                    headers:
                      Docker-Content-Digest: sha256:abc123def4567890...
                      Content-Length: 32654
                      Content-Type: application/octet-stream
@z

@x
        "404":
          description: Blob not found
        "401":
          description: Authentication required
        "403":
          description: Access denied
        "429":
          description: Too many requests
    get:
      tags:
        - Blobs
      summary: Retrieve blob
      operationId: GetBlob
      description: |
        Download the blob identified by digest from the registry.
@y
        "404":
          description: Blob not found
        "401":
          description: Authentication required
        "403":
          description: Access denied
        "429":
          description: Too many requests
    get:
      tags:
        - Blobs
      summary: Retrieve blob
      operationId: GetBlob
      description: |
        Download the blob identified by digest from the registry.
@z

@x
        Blobs include image layers and configuration objects. Clients must use the digest from the manifest to retrieve a blob.
@y
        Blobs include image layers and configuration objects. Clients must use the digest from the manifest to retrieve a blob.
@z

@x
        This endpoint may return a `307 Temporary Redirect` to a CDN or storage location. Clients must follow the redirect to obtain the actual blob content.
@y
        This endpoint may return a `307 Temporary Redirect` to a CDN or storage location. Clients must follow the redirect to obtain the actual blob content.
@z

@x
        The blob content is typically a gzipped tarball (for layers) or JSON (for configs). The MIME type is usually `application/octet-stream`.
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # GET (download) a blob
            curl -L \
              -H "Authorization: Bearer $TOKEN" \
              https://registry-1.docker.io/v2/library/ubuntu/blobs/sha256:abc123... \
              -o layer.tar.gz
      parameters:
        - name: name
          in: path
          required: true
          description: Repository Name
          example: library/ubuntu
          schema:
            type: string
        - name: digest
          in: path
          required: true
          description: Digest of the Blob
          schema:
            type: string
          example: sha256:abc123def456...
        - name: Authorization
          in: header
          required: true
          schema:
            type: string
          description: Bearer token with pull scope
          example: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6...
@y
        The blob content is typically a gzipped tarball (for layers) or JSON (for configs). The MIME type is usually `application/octet-stream`.
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # GET (download) a blob
            curl -L \
              -H "Authorization: Bearer $TOKEN" \
              https://registry-1.docker.io/v2/library/ubuntu/blobs/sha256:abc123... \
              -o layer.tar.gz
      parameters:
        - name: name
          in: path
          required: true
          description: Repository Name
          example: library/ubuntu
          schema:
            type: string
        - name: digest
          in: path
          required: true
          description: Digest of the Blob
          schema:
            type: string
          example: sha256:abc123def456...
        - name: Authorization
          in: header
          required: true
          schema:
            type: string
          description: Bearer token with pull scope
          example: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6...
@z

@x
      responses:
        "200":
          description: Blob content returned directly
          headers:
            Content-Length:
              description: Size of the blob in bytes
              schema:
                type: integer
              example: 32768
            Content-Type:
              description: MIME type of the blob
              schema:
                type: string
              example: application/octet-stream
            Docker-Content-Digest:
              description: Digest of the returned blob
              schema:
                type: string
              example: sha256:abc123def456...
          content:
            application/octet-stream:
              schema:
                type: string
                format: binary
              examples:
                small-layer:
                  summary: Example binary blob (gzipped tar layer)
                  value: "<binary data not shown>"
@y
      responses:
        "200":
          description: Blob content returned directly
          headers:
            Content-Length:
              description: Size of the blob in bytes
              schema:
                type: integer
              example: 32768
            Content-Type:
              description: MIME type of the blob
              schema:
                type: string
              example: application/octet-stream
            Docker-Content-Digest:
              description: Digest of the returned blob
              schema:
                type: string
              example: sha256:abc123def456...
          content:
            application/octet-stream:
              schema:
                type: string
                format: binary
              examples:
                small-layer:
                  summary: Example binary blob (gzipped tar layer)
                  value: "<binary data not shown>"
@z

@x
        "307":
          description: Temporary redirect to blob location
          headers:
            Location:
              description: Redirect URL for blob download (e.g., S3 or CDN)
              schema:
                type: string
              example: https://cdn.docker.io/blobs/library/ubuntu/abc123...
        "401":
          description: Authentication required
        "403":
          description: Access denied
        "404":
          description: Blob not found
        "429":
          description: Too many requests
  /v2/{name}/blobs/uploads/{uuid}:
    get:
      tags:
        - Blobs
      summary: Get blob upload status
      operationId: GetBlobUploadStatus
      description: |
        Retrieve the current status of an in-progress blob upload.
@y
        "307":
          description: Temporary redirect to blob location
          headers:
            Location:
              description: Redirect URL for blob download (e.g., S3 or CDN)
              schema:
                type: string
              example: https://cdn.docker.io/blobs/library/ubuntu/abc123...
        "401":
          description: Authentication required
        "403":
          description: Access denied
        "404":
          description: Blob not found
        "429":
          description: Too many requests
  /v2/{name}/blobs/uploads/{uuid}:
    get:
      tags:
        - Blobs
      summary: Get blob upload status
      operationId: GetBlobUploadStatus
      description: |
        Retrieve the current status of an in-progress blob upload.
@z

@x
        This is useful for:
        - Resuming an interrupted upload
        - Determining how many bytes have been accepted so far
        - Retrying from the correct offset in chunked uploads
@y
        This is useful for:
        - Resuming an interrupted upload
        - Determining how many bytes have been accepted so far
        - Retrying from the correct offset in chunked uploads
@z

@x
        The response includes the `Range` header indicating the byte range received so far, and a `Docker-Upload-UUID` for identifying the session.
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # GET upload status
            curl -I \
              -H "Authorization: Bearer $TOKEN" \
              https://registry-1.docker.io/v2/library/ubuntu/blobs/uploads/abc123
      parameters:
        - name: name
          in: path
          required: true
          description: Repository Name
          example : library/ubuntu
          schema:
            type: string
        - name: uuid
          in: path
          required: true
          description: Upload session UUID
          schema:
            type: string
          example: abc123
        - name: Authorization
          in: header
          required: true
          schema:
            type: string
          example: Bearer eyJhbGciOi...
@y
        The response includes the `Range` header indicating the byte range received so far, and a `Docker-Upload-UUID` for identifying the session.
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # GET upload status
            curl -I \
              -H "Authorization: Bearer $TOKEN" \
              https://registry-1.docker.io/v2/library/ubuntu/blobs/uploads/abc123
      parameters:
        - name: name
          in: path
          required: true
          description: Repository Name
          example : library/ubuntu
          schema:
            type: string
        - name: uuid
          in: path
          required: true
          description: Upload session UUID
          schema:
            type: string
          example: abc123
        - name: Authorization
          in: header
          required: true
          schema:
            type: string
          example: Bearer eyJhbGciOi...
@z

@x
      responses:
        "204":
          description: Upload in progress. No body is returned.
          headers:
            Range:
              description: Current byte range uploaded (inclusive)
              schema:
                type: string
              example: 0-16383
            Docker-Upload-UUID:
              description: UUID of the upload session
              schema:
                type: string
              example: abc123
            Location:
              description: URL to continue or complete the upload
              schema:
                type: string
              example: /v2/library/ubuntu/blobs/uploads/abc123
        "401":
          description: Authentication required
        "403":
          description: Access denied
        "404":
          description: Upload session not found
        "429":
          description: Too many requests
@y
      responses:
        "204":
          description: Upload in progress. No body is returned.
          headers:
            Range:
              description: Current byte range uploaded (inclusive)
              schema:
                type: string
              example: 0-16383
            Docker-Upload-UUID:
              description: UUID of the upload session
              schema:
                type: string
              example: abc123
            Location:
              description: URL to continue or complete the upload
              schema:
                type: string
              example: /v2/library/ubuntu/blobs/uploads/abc123
        "401":
          description: Authentication required
        "403":
          description: Access denied
        "404":
          description: Upload session not found
        "429":
          description: Too many requests
@z

@x
    put:
      tags:
        - Blobs
      summary: Complete blob upload
      operationId: CompleteBlobUpload
      description: |
        Complete the upload of a blob by finalizing an upload session.
@y
    put:
      tags:
        - Blobs
      summary: Complete blob upload
      operationId: CompleteBlobUpload
      description: |
        Complete the upload of a blob by finalizing an upload session.
@z

@x
        This request must include the `digest` query parameter and optionally the last chunk of data. When the registry receives this request, it verifies the digest and stores the blob.
@y
        This request must include the `digest` query parameter and optionally the last chunk of data. When the registry receives this request, it verifies the digest and stores the blob.
@z

@x
        This endpoint supports:
        - Monolithic uploads (upload entire blob in this request)
        - Finalizing chunked uploads (last chunk plus `digest`)
@y
        This endpoint supports:
        - Monolithic uploads (upload entire blob in this request)
        - Finalizing chunked uploads (last chunk plus `digest`)
@z

@x
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # PUT – complete upload (monolithic or final chunk)
            curl -X PUT \
              -H "Authorization: Bearer $TOKEN" \
              -H "Content-Type: application/octet-stream" \
              --data-binary @layer.tar.gz \
              "https://registry-1.docker.io/v2/library/ubuntu/blobs/uploads/abc123?digest=sha256:abcd1234..."
@y
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # PUT – complete upload (monolithic or final chunk)
            curl -X PUT \
              -H "Authorization: Bearer $TOKEN" \
              -H "Content-Type: application/octet-stream" \
              --data-binary @layer.tar.gz \
              "https://registry-1.docker.io/v2/library/ubuntu/blobs/uploads/abc123?digest=sha256:abcd1234..."
@z

@x
      parameters:
        - name: name
          in: path
          required: true
          description: Repository name
          schema:
            type: string
          example: library/ubuntu
        - name: uuid
          in: path
          required: true
          description: Upload session UUID returned from the POST request
          schema:
            type: string
          example: abc123
        - name: digest
          in: query
          required: true
          description: Digest of the uploaded blob
          schema:
            type: string
          example: sha256:abcd1234...
        - name: Authorization
          in: header
          required: true
          schema:
            type: string
          example: Bearer eyJhbGciOi...
@y
      parameters:
        - name: name
          in: path
          required: true
          description: Repository name
          schema:
            type: string
          example: library/ubuntu
        - name: uuid
          in: path
          required: true
          description: Upload session UUID returned from the POST request
          schema:
            type: string
          example: abc123
        - name: digest
          in: query
          required: true
          description: Digest of the uploaded blob
          schema:
            type: string
          example: sha256:abcd1234...
        - name: Authorization
          in: header
          required: true
          schema:
            type: string
          example: Bearer eyJhbGciOi...
@z

@x
      requestBody:
        required: false
        content:
          application/octet-stream:
            schema:
              type: string
              format: binary
            examples:
              layer-upload:
                summary: Layer tarball blob
                value: "<binary data not shown>"
@y
      requestBody:
        required: false
        content:
          application/octet-stream:
            schema:
              type: string
              format: binary
            examples:
              layer-upload:
                summary: Layer tarball blob
                value: "<binary data not shown>"
@z

@x
      responses:
        "201":
          description: Upload completed successfully
          headers:
            Docker-Content-Digest:
              description: Canonical digest of the stored blob
              schema:
                type: string
              example: sha256:abcd1234...
            Location:
              description: URL where the blob is now accessible
              schema:
                type: string
              example: /v2/library/ubuntu/blobs/sha256:abcd1234...
            Content-Length:
              description: Always zero for completed uploads
              schema:
                type: integer
              example: 0
        "400":
          description: Invalid digest or missing parameters
        "401":
          description: Authentication required
        "403":
          description: Access denied
        "404":
          description: Upload session not found
        "416":
          description: Requested range not satisfiable (if used in chunked mode)
        "429":
          description: Too many requests
@y
      responses:
        "201":
          description: Upload completed successfully
          headers:
            Docker-Content-Digest:
              description: Canonical digest of the stored blob
              schema:
                type: string
              example: sha256:abcd1234...
            Location:
              description: URL where the blob is now accessible
              schema:
                type: string
              example: /v2/library/ubuntu/blobs/sha256:abcd1234...
            Content-Length:
              description: Always zero for completed uploads
              schema:
                type: integer
              example: 0
        "400":
          description: Invalid digest or missing parameters
        "401":
          description: Authentication required
        "403":
          description: Access denied
        "404":
          description: Upload session not found
        "416":
          description: Requested range not satisfiable (if used in chunked mode)
        "429":
          description: Too many requests
@z

@x
    patch:
      tags:
        - Blobs
      summary: Upload blob chunk
      operationId: UploadBlobChunk
      description: |
        Upload a chunk of a blob to an active upload session.
@y
    patch:
      tags:
        - Blobs
      summary: Upload blob chunk
      operationId: UploadBlobChunk
      description: |
        Upload a chunk of a blob to an active upload session.
@z

@x
        Use this method for **chunked uploads**, especially for large blobs or when resuming interrupted uploads.
@y
        Use this method for **chunked uploads**, especially for large blobs or when resuming interrupted uploads.
@z

@x
        The client sends binary data using `PATCH`, optionally including a `Content-Range` header.
@y
        The client sends binary data using `PATCH`, optionally including a `Content-Range` header.
@z

@x
        After each chunk is accepted, the registry returns a `202 Accepted` response with:
        - `Range`: current byte range stored
        - `Docker-Upload-UUID`: identifier for the upload session
        - `Location`: URL to continue the upload or finalize with `PUT`
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # PATCH – upload a chunk (first 64 KiB)
            curl -X PATCH \
              -H "Authorization: Bearer $TOKEN" \
              -H "Content-Type: application/octet-stream" \
              --data-binary @chunk-0.bin \
              "https://registry-1.docker.io/v2/library/ubuntu/blobs/uploads/abc123"
      parameters:
        - name: name
          in: path
          required: true
          description: Repository name
          schema:
            type: string
          example: library/ubuntu
        - name: uuid
          in: path
          required: true
          description: Upload session UUID
          schema:
            type: string
          example: abc123
        - name: Authorization
          in: header
          required: true
          schema:
            type: string
          example: Bearer eyJhbGciOi...
        - name: Content-Range
          in: header
          required: false
          schema:
            type: string
          example: bytes 0-65535
          description: Optional. Byte range of the chunk being sent
@y
        After each chunk is accepted, the registry returns a `202 Accepted` response with:
        - `Range`: current byte range stored
        - `Docker-Upload-UUID`: identifier for the upload session
        - `Location`: URL to continue the upload or finalize with `PUT`
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # PATCH – upload a chunk (first 64 KiB)
            curl -X PATCH \
              -H "Authorization: Bearer $TOKEN" \
              -H "Content-Type: application/octet-stream" \
              --data-binary @chunk-0.bin \
              "https://registry-1.docker.io/v2/library/ubuntu/blobs/uploads/abc123"
      parameters:
        - name: name
          in: path
          required: true
          description: Repository name
          schema:
            type: string
          example: library/ubuntu
        - name: uuid
          in: path
          required: true
          description: Upload session UUID
          schema:
            type: string
          example: abc123
        - name: Authorization
          in: header
          required: true
          schema:
            type: string
          example: Bearer eyJhbGciOi...
        - name: Content-Range
          in: header
          required: false
          schema:
            type: string
          example: bytes 0-65535
          description: Optional. Byte range of the chunk being sent
@z

@x
      requestBody:
        required: true
        content:
          application/octet-stream:
            schema:
              type: string
              format: binary
            examples:
              chunk-0:
                summary: Upload chunk 0 of a blob
                value: "<binary data not shown>"
@y
      requestBody:
        required: true
        content:
          application/octet-stream:
            schema:
              type: string
              format: binary
            examples:
              chunk-0:
                summary: Upload chunk 0 of a blob
                value: "<binary data not shown>"
@z

@x
      responses:
        "202":
          description: Chunk accepted and stored
          headers:
            Location:
              description: URL to continue or finalize the upload
              schema:
                type: string
              example: /v2/library/ubuntu/blobs/uploads/abc123
            Range:
              description: Byte range uploaded so far (inclusive)
              schema:
                type: string
              example: 0-65535
            Docker-Upload-UUID:
              description: Upload session UUID
              schema:
                type: string
              example: abc123
        "400":
          description: Malformed content or range
        "401":
          description: Authentication required
        "403":
          description: Access denied
        "404":
          description: Upload session not found
        "416":
          description: Range error (e.g., chunk out of order)
        "429":
          description: Too many requests
    delete:
      tags:
        - Blobs
      summary: Cancel blob upload
      operationId: CancelBlobUpload
      description: |
        Cancel an in-progress blob upload session.
@y
      responses:
        "202":
          description: Chunk accepted and stored
          headers:
            Location:
              description: URL to continue or finalize the upload
              schema:
                type: string
              example: /v2/library/ubuntu/blobs/uploads/abc123
            Range:
              description: Byte range uploaded so far (inclusive)
              schema:
                type: string
              example: 0-65535
            Docker-Upload-UUID:
              description: Upload session UUID
              schema:
                type: string
              example: abc123
        "400":
          description: Malformed content or range
        "401":
          description: Authentication required
        "403":
          description: Access denied
        "404":
          description: Upload session not found
        "416":
          description: Range error (e.g., chunk out of order)
        "429":
          description: Too many requests
    delete:
      tags:
        - Blobs
      summary: Cancel blob upload
      operationId: CancelBlobUpload
      description: |
        Cancel an in-progress blob upload session.
@z

@x
        This operation discards any data that has been uploaded and invalidates the upload session.
@y
        This operation discards any data that has been uploaded and invalidates the upload session.
@z

@x
        Use this when:
        - An upload fails or is aborted mid-process
        - The client wants to clean up unused upload sessions
@y
        Use this when:
        - An upload fails or is aborted mid-process
        - The client wants to clean up unused upload sessions
@z

@x
        After cancellation, the UUID is no longer valid and a new `POST` must be issued to restart the upload.
@y
        After cancellation, the UUID is no longer valid and a new `POST` must be issued to restart the upload.
@z

@x
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # DELETE – cancel an upload session
            curl -X DELETE \
              -H "Authorization: Bearer $TOKEN" \
              https://registry-1.docker.io/v2/library/ubuntu/blobs/uploads/abc123`
@y
      x-codeSamples:
        - lang: Bash
          label: cURL
          source: |
            # DELETE – cancel an upload session
            curl -X DELETE \
              -H "Authorization: Bearer $TOKEN" \
              https://registry-1.docker.io/v2/library/ubuntu/blobs/uploads/abc123`
@z

@x
      parameters:
        - name: name
          in: path
          required: true
          description: Name of the repository
          schema:
            type: string
          example: library/ubuntu
        - name: uuid
          in: path
          required: true
          description: Upload session UUID
          schema:
            type: string
          example: abc123
        - name: Authorization
          in: header
          required: true
          schema:
            type: string
          example: Bearer eyJhbGciOi...
@y
      parameters:
        - name: name
          in: path
          required: true
          description: Name of the repository
          schema:
            type: string
          example: library/ubuntu
        - name: uuid
          in: path
          required: true
          description: Upload session UUID
          schema:
            type: string
          example: abc123
        - name: Authorization
          in: header
          required: true
          schema:
            type: string
          example: Bearer eyJhbGciOi...
@z

@x
      responses:
        "204":
          description: Upload session cancelled successfully. No body is returned.
          headers:
            Content-Length:
              description: Always zero
              schema:
                type: integer
              example: 0
        "401":
          description: Authentication required
        "403":
          description: Access denied
        "404":
          description: Upload session not found
        "429":
          description: Too many requests
@y
      responses:
        "204":
          description: Upload session cancelled successfully. No body is returned.
          headers:
            Content-Length:
              description: Always zero
              schema:
                type: integer
              example: 0
        "401":
          description: Authentication required
        "403":
          description: Access denied
        "404":
          description: Upload session not found
        "429":
          description: Too many requests
@z

@x
x-tagGroups:
  - name: General
    tags:
      - overview
      - authentication
      - pull
      - push
      - delete
  - name: API
    tags:
      - Manifests
      - Blobs
@y
x-tagGroups:
  - name: General
    tags:
      - overview
      - authentication
      - pull
      - push
      - delete
  - name: API
    tags:
      - Manifests
      - Blobs
@z
