%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# Image Attestation Storage
@y
# Image Attestation Storage
@z

@x
Buildkit supports creating and attaching attestations to build artifacts. These
attestations can provide valuable information from the build process,
including, but not limited to: [SBOMs](https://en.wikipedia.org/wiki/Software_supply_chain),
[SLSA Provenance](https://slsa.dev/provenance), build logs, etc.
@y
Buildkit supports creating and attaching attestations to build artifacts. These
attestations can provide valuable information from the build process,
including, but not limited to: [SBOMs](https://en.wikipedia.org/wiki/Software_supply_chain),
[SLSA Provenance](https://slsa.dev/provenance), build logs, etc.
@z

@x
This document describes the current custom format used to store attestations,
which is designed to be compatible with current registry implementations today.
In the future, we may support exporting attestations in additional formats.
@y
This document describes the current custom format used to store attestations,
which is designed to be compatible with current registry implementations today.
In the future, we may support exporting attestations in additional formats.
@z

@x
Attestations are stored as manifest objects in the image index, similar in
style to OCI artifacts.
@y
Attestations are stored as manifest objects in the image index, similar in
style to OCI artifacts.
@z

@x
## Properties
@y
## Properties
@z

@x
### Attestation Manifest
@y
### Attestation Manifest
@z

@x
Attestation manifests are attached to the root image index object, under a
separate [OCI image manifest](https://github.com/opencontainers/image-spec/blob/main/manifest.md).
Each attestation manifest can contain multiple [attestation blobs](#attestation-blob),
with all the of the attestations in a manifest applying to a single platform
manifest. All properties of standard OCI and Docker manifests continue to
apply.
@y
Attestation manifests are attached to the root image index object, under a
separate [OCI image manifest](https://github.com/opencontainers/image-spec/blob/main/manifest.md).
Each attestation manifest can contain multiple [attestation blobs](#attestation-blob),
with all the of the attestations in a manifest applying to a single platform
manifest. All properties of standard OCI and Docker manifests continue to
apply.
@z

@x
The image `config` descriptor will point to a valid [image config](https://github.com/opencontainers/image-spec/blob/main/config.md),
however, it will not contain attestation-specific details, and should be
ignored as it is only included for compatibility purposes.
@y
The image `config` descriptor will point to a valid [image config](https://github.com/opencontainers/image-spec/blob/main/config.md),
however, it will not contain attestation-specific details, and should be
ignored as it is only included for compatibility purposes.
@z

@x
Each image layer in `layers` will contain a descriptor for a single
[attestation blob](#attestation-blob). The `mediaType` of each layer will be
set in accordance to its contents, one of:
@y
Each image layer in `layers` will contain a descriptor for a single
[attestation blob](#attestation-blob). The `mediaType` of each layer will be
set in accordance to its contents, one of:
@z

@x
- `application/vnd.in-toto+json` (currently, the only supported option)
@y
- `application/vnd.in-toto+json` (currently, the only supported option)
@z

@x
  Indicates an in-toto attestation blob
@y
  Indicates an in-toto attestation blob
@z

@x
Any unknown `mediaType`s should be ignored.
@y
Any unknown `mediaType`s should be ignored.
@z

@x
To assist attestation traversal, the following annotations may be set on each
layer descriptor:
@y
To assist attestation traversal, the following annotations may be set on each
layer descriptor:
@z

@x
- `in-toto.io/predicate-type`
@y
- `in-toto.io/predicate-type`
@z

@x
  This annotation will be set if the enclosed attestation is an in-toto
  attestation (currently, the only supported option). The annotation will
  be set to contain the same value as the `predicateType` property present
  inside the attestation.
@y
  This annotation will be set if the enclosed attestation is an in-toto
  attestation (currently, the only supported option). The annotation will
  be set to contain the same value as the `predicateType` property present
  inside the attestation.
@z

@x
  When present, this annotation may be used to find the specific attestation(s)
  they are looking for to avoid pulling the contents of the others.
@y
  When present, this annotation may be used to find the specific attestation(s)
  they are looking for to avoid pulling the contents of the others.
@z

@x
### Attestation Blob
@y
### Attestation Blob
@z

@x
The contents of each layer will be a blob dependent on its `mediaType`.
@y
The contents of each layer will be a blob dependent on its `mediaType`.
@z

@x
- `application/vnd.in-toto+json`
@y
- `application/vnd.in-toto+json`
@z

@x
  The blob contents will contain a full [in-toto attestation statement](https://github.com/in-toto/attestation/blob/main/spec/README.md#statement):
@y
  The blob contents will contain a full [in-toto attestation statement](https://github.com/in-toto/attestation/blob/main/spec/README.md#statement):
@z

@x
  ```json
  {
    "_type": "https://in-toto.io/Statement/v0.1",
    "subject": [
      {
        "name": "<NAME>",
        "digest": {"<ALGORITHM>": "<HEX_VALUE>"}
      },
      ...
    ],
    "predicateType": "<URI>",
    "predicate": { ... }
  }
  ```
@y
  ```json
  {
    "_type": "https://in-toto.io/Statement/v0.1",
    "subject": [
      {
        "name": "<NAME>",
        "digest": {"<ALGORITHM>": "<HEX_VALUE>"}
      },
      ...
    ],
    "predicateType": "<URI>",
    "predicate": { ... }
  }
  ```
@z

@x
  The subject of the attestation should be set to be the same digest as the
  target manifest described in the [Attestation Manifest Descriptor](#attestation-manifest-descriptor),
  or some object within.
@y
  The subject of the attestation should be set to be the same digest as the
  target manifest described in the [Attestation Manifest Descriptor](#attestation-manifest-descriptor),
  or some object within.
@z

@x
### Attestation Manifest Descriptor
@y
### Attestation Manifest Descriptor
@z

@x
Attestation manifests are attached to the root [image index](https://github.com/opencontainers/image-spec/blob/main/image-index.md),
in the `manifests` key, after all the original runnable manifests. All
properties of standard OCI and Docker manifest descriptors continue to apply.
@y
Attestation manifests are attached to the root [image index](https://github.com/opencontainers/image-spec/blob/main/image-index.md),
in the `manifests` key, after all the original runnable manifests. All
properties of standard OCI and Docker manifest descriptors continue to apply.
@z

@x
To prevent container runtimes from accidentally pulling or running the image
described in the manifest, the `platform` property of the attestation manifest
will be set to `unknown/unknown`, as follows:
@y
To prevent container runtimes from accidentally pulling or running the image
described in the manifest, the `platform` property of the attestation manifest
will be set to `unknown/unknown`, as follows:
@z

@x
```json
"platform": {
  "architecture": "unknown",
  "os": "unknown"
}
```
@y
```json
"platform": {
  "architecture": "unknown",
  "os": "unknown"
}
```
@z

@x
To assist index traversal, the following annotations will be set on the
manifest descriptor descriptor:
@y
To assist index traversal, the following annotations will be set on the
manifest descriptor descriptor:
@z

@x
- `vnd.docker.reference.type`
@y
- `vnd.docker.reference.type`
@z

@x
  This annotation describes the type of the artifact, and will be set
  to `attestation-manifest`. If any other value is specified, the entire
  manifest should be ignored.
@y
  This annotation describes the type of the artifact, and will be set
  to `attestation-manifest`. If any other value is specified, the entire
  manifest should be ignored.
@z

@x
- `vnd.docker.reference.digest`
@y
- `vnd.docker.reference.digest`
@z

@x
  This annotation will contain the digest of the object in the image index that
  the attestation manifest refers to.
@y
  This annotation will contain the digest of the object in the image index that
  the attestation manifest refers to.
@z

@x
  When present, this annotation can be used to find the matching attestation
  manifest for a selected image manifest.
@y
  When present, this annotation can be used to find the matching attestation
  manifest for a selected image manifest.
@z

@x
## Examples
@y
## Examples
@z

@x
*Example showing an SBOM attestation attached to a `linux/amd64` image*
@y
*Example showing an SBOM attestation attached to a `linux/amd64` image*
@z

@x
#### Image index (`sha256:94acc2ca70c40f3f6291681f37ce9c767e3d251ce01c7e4e9b98ccf148c26260`):
@y
#### Image index (`sha256:94acc2ca70c40f3f6291681f37ce9c767e3d251ce01c7e4e9b98ccf148c26260`):
@z

@x
This image index defines two descriptors: an AMD64 image `sha256:23678f31..` and an attestation manifest `sha256:02cb9aa7..` for that image.
@y
This image index defines two descriptors: an AMD64 image `sha256:23678f31..` and an attestation manifest `sha256:02cb9aa7..` for that image.
@z

@x
```json
{
  "mediaType": "application/vnd.oci.image.index.v1+json",
  "schemaVersion": 2,
  "manifests": [
    {
      "mediaType": "application/vnd.oci.image.manifest.v1+json",
      "digest": "sha256:23678f31b3b3586c4fb318aecfe64a96a1f0916ba8faf9b2be2abee63fa9e827",
      "size": 1234,
      "platform": {
        "architecture": "amd64",
        "os": "linux"
      }
    },
    {
      "mediaType": "application/vnd.oci.image.manifest.v1+json",
      "digest": "sha256:02cb9aa7600e73fcf41ee9f0f19cc03122b2d8be43d41ce4b21335118f5dd943",
      "size": 1234,
      "annotations": {
        "vnd.docker.reference.digest": "sha256:23678f31b3b3586c4fb318aecfe64a96a1f0916ba8faf9b2be2abee63fa9e827",
        "vnd.docker.reference.type": "attestation-manifest"
      },
      "platform": {
         "architecture": "unknown",
         "os": "unknown"
      }
    }
  ]
}
```
@y
```json
{
  "mediaType": "application/vnd.oci.image.index.v1+json",
  "schemaVersion": 2,
  "manifests": [
    {
      "mediaType": "application/vnd.oci.image.manifest.v1+json",
      "digest": "sha256:23678f31b3b3586c4fb318aecfe64a96a1f0916ba8faf9b2be2abee63fa9e827",
      "size": 1234,
      "platform": {
        "architecture": "amd64",
        "os": "linux"
      }
    },
    {
      "mediaType": "application/vnd.oci.image.manifest.v1+json",
      "digest": "sha256:02cb9aa7600e73fcf41ee9f0f19cc03122b2d8be43d41ce4b21335118f5dd943",
      "size": 1234,
      "annotations": {
        "vnd.docker.reference.digest": "sha256:23678f31b3b3586c4fb318aecfe64a96a1f0916ba8faf9b2be2abee63fa9e827",
        "vnd.docker.reference.type": "attestation-manifest"
      },
      "platform": {
         "architecture": "unknown",
         "os": "unknown"
      }
    }
  ]
}
```
@z

@x
#### Attestation manifest (`sha256:02cb9aa7600e73fcf41ee9f0f19cc03122b2d8be43d41ce4b21335118f5dd943`):
@y
#### Attestation manifest (`sha256:02cb9aa7600e73fcf41ee9f0f19cc03122b2d8be43d41ce4b21335118f5dd943`):
@z

@x
This attestation manifest contains one attestation that is an in-toto attestation that contains a "https://spdx.dev/Document" predicate, signifying that it is defining a SBOM for the image.
@y
This attestation manifest contains one attestation that is an in-toto attestation that contains a "https://spdx.dev/Document" predicate, signifying that it is defining a SBOM for the image.
@z

@x
```json
{
  "mediaType": "application/vnd.oci.image.manifest.v1+json",
  "schemaVersion": 2,
  "config": {
    "mediaType": "application/vnd.oci.image.config.v1+json",
    "digest": "sha256:a781560066f20ec9c28f2115a95a886e5e71c7c7aa9d8fd680678498b82f3ea3",
    "size": 123
  },
  "layers": [
    {
      "mediaType": "application/vnd.in-toto+json",
      "digest": "sha256:133ae3f9bcc385295b66c2d83b28c25a9f294ce20954d5cf922dda860429734a",
      "size": 1234,
      "annotations": {
        "in-toto.io/predicate-type": "https://spdx.dev/Document"
      }
    }
  ]
}
```
@y
```json
{
  "mediaType": "application/vnd.oci.image.manifest.v1+json",
  "schemaVersion": 2,
  "config": {
    "mediaType": "application/vnd.oci.image.config.v1+json",
    "digest": "sha256:a781560066f20ec9c28f2115a95a886e5e71c7c7aa9d8fd680678498b82f3ea3",
    "size": 123
  },
  "layers": [
    {
      "mediaType": "application/vnd.in-toto+json",
      "digest": "sha256:133ae3f9bcc385295b66c2d83b28c25a9f294ce20954d5cf922dda860429734a",
      "size": 1234,
      "annotations": {
        "in-toto.io/predicate-type": "https://spdx.dev/Document"
      }
    }
  ]
}
```
@z

@x
#### Image config (`sha256:a781560066f20ec9c28f2115a95a886e5e71c7c7aa9d8fd680678498b82f3ea3`):
@y
#### Image config (`sha256:a781560066f20ec9c28f2115a95a886e5e71c7c7aa9d8fd680678498b82f3ea3`):
@z

@x
```json
{
  "architecture": "unknown",
  "os": "unknown",
  "config": {},
  "rootfs": {
    "type": "layers",
    "diff_ids": [
      "sha256:133ae3f9bcc385295b66c2d83b28c25a9f294ce20954d5cf922dda860429734a"
    ]
  }
}
```
@y
```json
{
  "architecture": "unknown",
  "os": "unknown",
  "config": {},
  "rootfs": {
    "type": "layers",
    "diff_ids": [
      "sha256:133ae3f9bcc385295b66c2d83b28c25a9f294ce20954d5cf922dda860429734a"
    ]
  }
}
```
@z

@x
#### Layer content (`sha256:1ea07d5e55eb47ad0e6bbfa2ec180fb580974411e623814e519064c88f022f5c`):
@y
#### Layer content (`sha256:1ea07d5e55eb47ad0e6bbfa2ec180fb580974411e623814e519064c88f022f5c`):
@z

@x
Attestation body containing the SBOM data listing the packages used during the build in SPDX format.
@y
Attestation body containing the SBOM data listing the packages used during the build in SPDX format.
@z

@x
```json
{
  "_type": "https://in-toto.io/Statement/v0.1",
  "predicateType": "https://spdx.dev/Document",
  "subject": [
    {
      "name": "_",
      "digest": {
        "sha256": "23678f31b3b3586c4fb318aecfe64a96a1f0916ba8faf9b2be2abee63fa9e827"
      }
    }
  ],
  "predicate": {
    "SPDXID": "SPDXRef-DOCUMENT",
    "spdxVersion": "SPDX-2.2",
    ...
```
@y
```json
{
  "_type": "https://in-toto.io/Statement/v0.1",
  "predicateType": "https://spdx.dev/Document",
  "subject": [
    {
      "name": "_",
      "digest": {
        "sha256": "23678f31b3b3586c4fb318aecfe64a96a1f0916ba8faf9b2be2abee63fa9e827"
      }
    }
  ],
  "predicate": {
    "SPDXID": "SPDXRef-DOCUMENT",
    "spdxVersion": "SPDX-2.2",
    ...
```
@z
