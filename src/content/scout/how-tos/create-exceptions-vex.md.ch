%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リン クへの (no slash) 対応

@x
title: Create an exception using the VEX
description: Create an exception for a vulnerability in an image using VEX documents.
keywords: Docker, vulnerability, exception, create, VEX
@y
title: Create an exception using the VEX
description: Create an exception for a vulnerability in an image using VEX documents.
keywords: Docker, vulnerability, exception, create, VEX
@z

@x
Vulnerability Exploitability eXchange (VEX) is a standard format for
documenting vulnerabilities in the context of a software package or product.
Docker Scout supports VEX documents to create
[exceptions](/scout/explore/exceptions.md) for vulnerabilities in images.
@y
Vulnerability Exploitability eXchange (VEX) is a standard format for
documenting vulnerabilities in the context of a software package or product.
Docker Scout supports VEX documents to create
[exceptions](scout/explore/exceptions.md) for vulnerabilities in images.
@z

@x
> [!NOTE]
> You can also create exceptions using the Docker Scout Dashboard or Docker
> Desktop. The GUI provides a user-friendly interface for creating exceptions,
> and it's easy to manage exceptions for multiple images. It also lets you
> create exceptions for multiple images, or your entire organization, all at
> once. For more information, see [Create an exception using the GUI](/scout/how-tos/create-exceptions-gui.md).
@y
> [!NOTE]
> You can also create exceptions using the Docker Scout Dashboard or Docker
> Desktop. The GUI provides a user-friendly interface for creating exceptions,
> and it's easy to manage exceptions for multiple images. It also lets you
> create exceptions for multiple images, or your entire organization, all at
> once. For more information, see [Create an exception using the GUI](scout/how-tos/create-exceptions-gui.md).
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To create exceptions using OpenVEX documents, you need:
@y
To create exceptions using OpenVEX documents, you need:
@z

@x
- The latest version of Docker Desktop or the Docker Scout CLI plugin
- The [`vexctl`](https://github.com/openvex/vexctl) command line tool.
- The [containerd image store](../../desktop/containerd.md) must be enabled
- Write permissions to the registry repository where the image is stored
@y
- The latest version of Docker Desktop or the Docker Scout CLI plugin
- The [`vexctl`](https://github.com/openvex/vexctl) command line tool.
- The [containerd image store](../../desktop/containerd.md) must be enabled
- Write permissions to the registry repository where the image is stored
@z

@x
## Introduction to VEX
@y
## Introduction to VEX
@z

@x
The VEX standard is defined by a working group by the United States
Cybersecurity and Infrastructure Security Agency (CISA). At the core of VEX are
exploitability assessments. These assessments describe the status of a given
CVE for a product. The possible vulnerability statuses in VEX are:
@y
The VEX standard is defined by a working group by the United States
Cybersecurity and Infrastructure Security Agency (CISA). At the core of VEX are
exploitability assessments. These assessments describe the status of a given
CVE for a product. The possible vulnerability statuses in VEX are:
@z

@x
- Not affected: No remediation is required regarding this vulnerability.
- Affected: Actions are recommended to remediate or address this vulnerability.
- Fixed: These product versions contain a fix for the vulnerability.
- Under investigation: It is not yet known whether these product versions are affected by the vulnerability. An update will be provided in a later release.
@y
- Not affected: No remediation is required regarding this vulnerability.
- Affected: Actions are recommended to remediate or address this vulnerability.
- Fixed: These product versions contain a fix for the vulnerability.
- Under investigation: It is not yet known whether these product versions are affected by the vulnerability. An update will be provided in a later release.
@z

@x
There are multiple implementations and formats of VEX. Docker Scout supports
the [OpenVex](https://github.com/openvex/spec) implementation. Regardless of
the specific implementation, the core idea is the same: to provide a framework
for describing the impact of vulnerabilities. Key components of VEX regardless
of implementation includes:
@y
There are multiple implementations and formats of VEX. Docker Scout supports
the [OpenVex](https://github.com/openvex/spec) implementation. Regardless of
the specific implementation, the core idea is the same: to provide a framework
for describing the impact of vulnerabilities. Key components of VEX regardless
of implementation includes:
@z

@x
VEX document
: A type of security advisory for storing VEX statements.
  The format of the document depends on the specific implementation.
@y
VEX document
: A type of security advisory for storing VEX statements.
  The format of the document depends on the specific implementation.
@z

@x
VEX statement
: Describes the status of a vulnerability in a product,
  whether it's exploitable, and whether there are ways to remediate the issue.
@y
VEX statement
: Describes the status of a vulnerability in a product,
  whether it's exploitable, and whether there are ways to remediate the issue.
@z

@x
Justification and impact
: Depending on the vulnerability status, statements include a justification
  or impact statement describing why a product is or isn't affected.
@y
Justification and impact
: Depending on the vulnerability status, statements include a justification
  or impact statement describing why a product is or isn't affected.
@z

@x
Action statements
: Describe how to remediate or mitigate the vulnerability.
@y
Action statements
: Describe how to remediate or mitigate the vulnerability.
@z

@x
## `vexctl` example
@y
## `vexctl` example
@z

@x
The following example command creates a VEX document stating that:
@y
The following example command creates a VEX document stating that:
@z

@x
- The software product described by this VEX document is the Docker image
  `example/app:v1`
- The image contains the npm package `express@4.17.1`
- The npm package is affected by a known vulnerability: `CVE-2022-24999`
- The image is unaffected by the CVE, because the vulnerable code is never
  executed in containers that run this image
@y
- The software product described by this VEX document is the Docker image
  `example/app:v1`
- The image contains the npm package `express@4.17.1`
- The npm package is affected by a known vulnerability: `CVE-2022-24999`
- The image is unaffected by the CVE, because the vulnerable code is never
  executed in containers that run this image
@z

@x
```console
$ vexctl create \
  --author="author@example.com" \
  --product="pkg:docker/example/app@v1" \
  --subcomponents="pkg:npm/express@4.17.1" \
  --vuln="CVE-2022-24999" \
  --status="not_affected" \
  --justification="vulnerable_code_not_in_execute_path" \
  --file="CVE-2022-24999.vex.json"
```
@y
```console
$ vexctl create \
  --author="author@example.com" \
  --product="pkg:docker/example/app@v1" \
  --subcomponents="pkg:npm/express@4.17.1" \
  --vuln="CVE-2022-24999" \
  --status="not_affected" \
  --justification="vulnerable_code_not_in_execute_path" \
  --file="CVE-2022-24999.vex.json"
```
@z

@x
Here's a description of the options in this example:
@y
Here's a description of the options in this example:
@z

@x
`--author`
: The email of the author of the VEX document.
@y
`--author`
: The email of the author of the VEX document.
@z

@x
`--product`
: Package URL (PURL) of the Docker image. A PURL is an identifier
  for the image in a standardized format, defined in the PURL
  [specification](https://github.com/package-url/purl-spec/blob/master/PURL-TYPES.rst#docker).
@y
`--product`
: Package URL (PURL) of the Docker image. A PURL is an identifier
  for the image in a standardized format, defined in the PURL
  [specification](https://github.com/package-url/purl-spec/blob/master/PURL-TYPES.rst#docker).
@z

@x
  Docker image PURL strings begin with a `pkg:docker` type prefix, followed by
  the image repository and version (the image tag or SHA256 digest). Unlike
  image tags, where the version is specified like `example/app:v1`, in PURL the
  image repository and version are separated by an `@`.
@y
  Docker image PURL strings begin with a `pkg:docker` type prefix, followed by
  the image repository and version (the image tag or SHA256 digest). Unlike
  image tags, where the version is specified like `example/app:v1`, in PURL the
  image repository and version are separated by an `@`.
@z

@x
`--subcomponents`
: PURL of the vulnerable package in the image. In this example, the
  vulnerability exists in an npm package, so the `--subcomponents` PURL is the
  identifier for the npm package name and version (`pkg:npm/express@4.17.1`).
@y
`--subcomponents`
: PURL of the vulnerable package in the image. In this example, the
  vulnerability exists in an npm package, so the `--subcomponents` PURL is the
  identifier for the npm package name and version (`pkg:npm/express@4.17.1`).
@z

@x
  If the same vulnerability exists in multiple packages, `vexctl` lets you
  specify the `--subcomponents` flag multiple times for a single `create`
  command.
@y
  If the same vulnerability exists in multiple packages, `vexctl` lets you
  specify the `--subcomponents` flag multiple times for a single `create`
  command.
@z

@x
  You can also omit `--subcomponents`, in which case the VEX statement applies
  to the entire image.
@y
  You can also omit `--subcomponents`, in which case the VEX statement applies
  to the entire image.
@z

@x
`--vuln`
: ID of the CVE that the VEX statement addresses.
@y
`--vuln`
: ID of the CVE that the VEX statement addresses.
@z

@x
`--status`
: This is the status label of the vulnerability. This describes the
  relationship between the software (`--product`) and the CVE (`--vuln`).
  The possible values for the status label in OpenVEX are:
@y
`--status`
: This is the status label of the vulnerability. This describes the
  relationship between the software (`--product`) and the CVE (`--vuln`).
  The possible values for the status label in OpenVEX are:
@z

@x
  - `not_affected`
  - `affected`
  - `fixed`
  - `under_investigation`
@y
  - `not_affected`
  - `affected`
  - `fixed`
  - `under_investigation`
@z

@x
  In this example, the VEX statement asserts that the Docker image is
  `not_affected` by the vulnerability. The `not_affected` status is the only
  status that results in CVE suppression, where the CVE is filtered out of the
  analysis results. The other statuses are useful for documentation purposes,
  but they do not work for creating exceptions. For more information about all
  the possible status labels, see [Status Labels](https://github.com/openvex/spec/blob/main/OPENVEX-SPEC.md#status-labels)
  in the OpenVEX specification.
@y
  In this example, the VEX statement asserts that the Docker image is
  `not_affected` by the vulnerability. The `not_affected` status is the only
  status that results in CVE suppression, where the CVE is filtered out of the
  analysis results. The other statuses are useful for documentation purposes,
  but they do not work for creating exceptions. For more information about all
  the possible status labels, see [Status Labels](https://github.com/openvex/spec/blob/main/OPENVEX-SPEC.md#status-labels)
  in the OpenVEX specification.
@z

@x
`--justification`
: Justifies the `not_affected` status label, informing why the product is not
  affected by the vulnerability. In this case, the justification given is
  `vulnerable_code_not_in_execute_path`, signalling that the vulnerability
  can't be executed as used by the product.
@y
`--justification`
: Justifies the `not_affected` status label, informing why the product is not
  affected by the vulnerability. In this case, the justification given is
  `vulnerable_code_not_in_execute_path`, signalling that the vulnerability
  can't be executed as used by the product.
@z

@x
  In OpenVEX, status justifications can have one of the five possible values:
@y
  In OpenVEX, status justifications can have one of the five possible values:
@z

@x
  - `component_not_present`
  - `vulnerable_code_not_present`
  - `vulnerable_code_not_in_execute_path`
  - `vulnerable_code_cannot_be_controlled_by_adversary`
  - `inline_mitigations_already_exist`
@y
  - `component_not_present`
  - `vulnerable_code_not_present`
  - `vulnerable_code_not_in_execute_path`
  - `vulnerable_code_cannot_be_controlled_by_adversary`
  - `inline_mitigations_already_exist`
@z

@x
  For more information about these values and their definitions, see
  [Status Justifications](https://github.com/openvex/spec/blob/main/OPENVEX-SPEC.md#status-justifications)
  in the OpenVEX specification.
@y
  For more information about these values and their definitions, see
  [Status Justifications](https://github.com/openvex/spec/blob/main/OPENVEX-SPEC.md#status-justifications)
  in the OpenVEX specification.
@z

@x
`--file`
: Filename of the VEX document output
@y
`--file`
: Filename of the VEX document output
@z

@x
## Example JSON document
@y
## Example JSON document
@z

@x
Here's the OpenVEX JSON generated by this command:
@y
Here's the OpenVEX JSON generated by this command:
@z

@x
```json
{
  "@context": "https://openvex.dev/ns/v0.2.0",
  "@id": "https://openvex.dev/docs/public/vex-749f79b50f5f2f0f07747c2de9f1239b37c2bda663579f87a35e5f0fdfc13de5",
  "author": "author@example.com",
  "timestamp": "2024-05-27T13:20:22.395824+02:00",
  "version": 1,
  "statements": [
    {
      "vulnerability": {
        "name": "CVE-2022-24999"
      },
      "timestamp": "2024-05-27T13:20:22.395829+02:00",
      "products": [
        {
          "@id": "pkg:docker/example/app@v1",
          "subcomponents": [
            {
              "@id": "pkg:npm/express@4.17.1"
            }
          ]
        }
      ],
      "status": "not_affected",
      "justification": "vulnerable_code_not_in_execute_path"
    }
  ]
}
```
@y
```json
{
  "@context": "https://openvex.dev/ns/v0.2.0",
  "@id": "https://openvex.dev/docs/public/vex-749f79b50f5f2f0f07747c2de9f1239b37c2bda663579f87a35e5f0fdfc13de5",
  "author": "author@example.com",
  "timestamp": "2024-05-27T13:20:22.395824+02:00",
  "version": 1,
  "statements": [
    {
      "vulnerability": {
        "name": "CVE-2022-24999"
      },
      "timestamp": "2024-05-27T13:20:22.395829+02:00",
      "products": [
        {
          "@id": "pkg:docker/example/app@v1",
          "subcomponents": [
            {
              "@id": "pkg:npm/express@4.17.1"
            }
          ]
        }
      ],
      "status": "not_affected",
      "justification": "vulnerable_code_not_in_execute_path"
    }
  ]
}
```
@z

@x
Understanding how VEX documents are supposed to be structured can be a bit of a
mouthful. The [OpenVEX specification](https://github.com/openvex/spec)
describes the format and all the possible properties of documents and
statements. For the full details, refer to the specification to learn more
about the available fields and how to create a well-formed OpenVEX document.
@y
Understanding how VEX documents are supposed to be structured can be a bit of a
mouthful. The [OpenVEX specification](https://github.com/openvex/spec)
describes the format and all the possible properties of documents and
statements. For the full details, refer to the specification to learn more
about the available fields and how to create a well-formed OpenVEX document.
@z

@x
To learn more about the available flags and syntax of the `vexctl` CLI tool and
how to install it, refer to the [`vexctl` GitHub repository](https://github.com/openvex/vexctl).
@y
To learn more about the available flags and syntax of the `vexctl` CLI tool and
how to install it, refer to the [`vexctl` GitHub repository](https://github.com/openvex/vexctl).
@z

@x
## Verifying VEX documents
@y
## Verifying VEX documents
@z

@x
To test whether the VEX documents you create are well-formed and produce the
expected results, use the `docker scout cves` command with the `--vex-location`
flag to apply a VEX document to a local image analysis using the CLI.
@y
To test whether the VEX documents you create are well-formed and produce the
expected results, use the `docker scout cves` command with the `--vex-location`
flag to apply a VEX document to a local image analysis using the CLI.
@z

@x
The following command invokes a local image analysis that incorporates all VEX
documents in the specified location, using the `--vex-location` flag. In this
example, the CLI is instructed to look for VEX documents in the current working
directory.
@y
The following command invokes a local image analysis that incorporates all VEX
documents in the specified location, using the `--vex-location` flag. In this
example, the CLI is instructed to look for VEX documents in the current working
directory.
@z

@x
```console
$ docker scout cves <IMAGE> --vex-location .
```
@y
```console
$ docker scout cves <IMAGE> --vex-location .
```
@z

@x
The output of the `docker scout cves` command displays the results with any VEX
statements found in under the `--vex-location` location factored into the
results. For example, CVEs assigned a status of `not_affected` are filtered out
from the results. If the output doesn't seem to take the VEX statements into
account, that's an indication that the VEX documents might be invalid in some
way.
@y
The output of the `docker scout cves` command displays the results with any VEX
statements found in under the `--vex-location` location factored into the
results. For example, CVEs assigned a status of `not_affected` are filtered out
from the results. If the output doesn't seem to take the VEX statements into
account, that's an indication that the VEX documents might be invalid in some
way.
@z

@x
Things to look out for include:
@y
Things to look out for include:
@z

@x
- The PURL of a Docker image must begin with `pkg:docker/` followed by the image name.
- In a Docker image PURL, the image name and version is separated by `@`.
  An image named `example/myapp:1.0` has the following PURL: `pkg:docker/example/myapp@1.0`.
- Remember to specify an `author` (it's a mandatory field in OpenVEX)
- The [OpenVEX specification](https://github.com/openvex/spec) describes how
  and when to use `justification`, `impact_statement`, and other fields in the
  VEX documents. Specifying these in an incorrect way results in an invalid
  document. Make sure your VEX documents comply with the OpenVEX specification.
@y
- The PURL of a Docker image must begin with `pkg:docker/` followed by the image name.
- In a Docker image PURL, the image name and version is separated by `@`.
  An image named `example/myapp:1.0` has the following PURL: `pkg:docker/example/myapp@1.0`.
- Remember to specify an `author` (it's a mandatory field in OpenVEX)
- The [OpenVEX specification](https://github.com/openvex/spec) describes how
  and when to use `justification`, `impact_statement`, and other fields in the
  VEX documents. Specifying these in an incorrect way results in an invalid
  document. Make sure your VEX documents comply with the OpenVEX specification.
@z

@x
## Attach VEX documents to images
@y
## Attach VEX documents to images
@z

@x
When you've created a VEX document,
you can attach it to your image in the following ways:
@y
When you've created a VEX document,
you can attach it to your image in the following ways:
@z

@x
- Attach the document as an [attestation](#attestation)
- Embed the document in the [image filesystem](#image-filesystem)
@y
- Attach the document as an [attestation](#attestation)
- Embed the document in the [image filesystem](#image-filesystem)
@z

@x
You can't remove a VEX document from an image once it's been added. For
documents attached as attestations, you can create a new VEX document and
attach it to the image again. Doing so will overwrite the previous VEX document
(but it won't remove the attestation). For images where the VEX document has
been embedded in the image's filesystem, you need to rebuild the image to
change the VEX document.
@y
You can't remove a VEX document from an image once it's been added. For
documents attached as attestations, you can create a new VEX document and
attach it to the image again. Doing so will overwrite the previous VEX document
(but it won't remove the attestation). For images where the VEX document has
been embedded in the image's filesystem, you need to rebuild the image to
change the VEX document.
@z

@x
### Attestation
@y
### Attestation
@z

@x
To attach VEX documents as an attestation, you can use the `docker scout
attestation add` CLI command. Using attestations is the recommended option for
attaching exceptions to images when using VEX.
@y
To attach VEX documents as an attestation, you can use the `docker scout
attestation add` CLI command. Using attestations is the recommended option for
attaching exceptions to images when using VEX.
@z

@x
You can attach attestations to images that have already been pushed to a
registry. You don't need to build or push the image again. Additionally, having
the exceptions attached to the image as attestations means consumers can
inspect the exceptions for an image, directly from the registry.
@y
You can attach attestations to images that have already been pushed to a
registry. You don't need to build or push the image again. Additionally, having
the exceptions attached to the image as attestations means consumers can
inspect the exceptions for an image, directly from the registry.
@z

@x
To attach an attestation to an image:
@y
To attach an attestation to an image:
@z

@x
1. Build the image and push it to a registry.
@y
1. Build the image and push it to a registry.
@z

@x
   ```console
   $ docker build --provenance=true --sbom=true --tag <IMAGE> --push .
   ```
@y
   ```console
   $ docker build --provenance=true --sbom=true --tag <IMAGE> --push .
   ```
@z

@x
2. Attach the exception to the image as an attestation.
@y
2. Attach the exception to the image as an attestation.
@z

@x
   ```console
   $ docker scout attestation add \
     --file <cve-id>.vex.json \
     --predicate-type https://openvex.dev/ns/v0.2.0 \
     <IMAGE>
   ```
@y
   ```console
   $ docker scout attestation add \
     --file <cve-id>.vex.json \
     --predicate-type https://openvex.dev/ns/v0.2.0 \
     <IMAGE>
   ```
@z

@x
   The options for this command are:
@y
   The options for this command are:
@z

@x
   - `--file`: the location and filename of the VEX document
   - `--predicate-type`: the in-toto `predicateType` for OpenVEX
@y
   - `--file`: the location and filename of the VEX document
   - `--predicate-type`: the in-toto `predicateType` for OpenVEX
@z

@x
### Image filesystem
@y
### Image filesystem
@z

@x
Embedding VEX documents directly on the image filesystem is a good option if
you know the exceptions ahead of time, before you build the image. And it's
relatively easy; just `COPY` the VEX document to the image in your Dockerfile.
@y
Embedding VEX documents directly on the image filesystem is a good option if
you know the exceptions ahead of time, before you build the image. And it's
relatively easy; just `COPY` the VEX document to the image in your Dockerfile.
@z

@x
The downside with this approach is that you can't change or update the
exception later. Image layers are immutable, so anything you put in the image's
filesystem is there forever. Attaching the document as an
[attestation](#attestation) provides better flexibility.
@y
The downside with this approach is that you can't change or update the
exception later. Image layers are immutable, so anything you put in the image's
filesystem is there forever. Attaching the document as an
[attestation](#attestation) provides better flexibility.
@z

@x
> [!NOTE]
> VEX documents embedded in the image filesystem are not considered for images
> that have attestations. If your image has **any** attestations, Docker Scout
> will only look for exceptions in the attestations, and not in the image
> filesystem.
>
> If you want to use the VEX document embedded in the image filesystem, you
> must remove the attestation from the image. Note that provenance attestations
> may be added automatically for images. To ensure that no attestations are
> added to the image, you can explicitly disable both SBOM and provenance
> attestations using the `--provenance=false` and `--sbom=false` flags when
> building the image.
@y
> [!NOTE]
> VEX documents embedded in the image filesystem are not considered for images
> that have attestations. If your image has **any** attestations, Docker Scout
> will only look for exceptions in the attestations, and not in the image
> filesystem.
>
> If you want to use the VEX document embedded in the image filesystem, you
> must remove the attestation from the image. Note that provenance attestations
> may be added automatically for images. To ensure that no attestations are
> added to the image, you can explicitly disable both SBOM and provenance
> attestations using the `--provenance=false` and `--sbom=false` flags when
> building the image.
@z

@x
To embed a VEX document on the image filesystem, `COPY` the file into the image
as part of the image build. The following example shows how to copy all VEX
documents under `.vex/` in the build context, to `/var/lib/db` in the image.
@y
To embed a VEX document on the image filesystem, `COPY` the file into the image
as part of the image build. The following example shows how to copy all VEX
documents under `.vex/` in the build context, to `/var/lib/db` in the image.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM alpine
COPY .vex/* /var/lib/db/
```
@y
FROM alpine
COPY .vex/* /var/lib/db/
```
@z

@x
The filename of the VEX document must match the `*.vex.json` glob pattern.
It doesn't matter where on the image's filesystem you store the file.
@y
The filename of the VEX document must match the `*.vex.json` glob pattern.
It doesn't matter where on the image's filesystem you store the file.
@z

@x
Note that the copied files must be part of the filesystem of the final image,
For multi-stage builds, the documents must persist in the final stage.
@y
Note that the copied files must be part of the filesystem of the final image,
For multi-stage builds, the documents must persist in the final stage.
@z
