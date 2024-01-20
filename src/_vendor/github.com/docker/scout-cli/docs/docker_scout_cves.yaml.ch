%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout cves
short: Display CVEs identified in a software artifact
long: |-
    The `docker scout cves` command analyzes a software artifact for vulnerabilities.
@y
command: docker scout cves
short: Display CVEs identified in a software artifact
long: |-
    The `docker scout cves` command analyzes a software artifact for vulnerabilities.
@z

@x
    If no image is specified, the most recently built image is used.
@y
    If no image is specified, the most recently built image is used.
@z

@x
    The following artifact types are supported:
@y
    The following artifact types are supported:
@z

@x
    - Images
    - OCI layout directories
    - Tarball archives, as created by `docker save`
    - Local directory or file
@y
    - Images
    - OCI layout directories
    - Tarball archives, as created by `docker save`
    - Local directory or file
@z

@x
    By default, the tool expects an image reference, such as:
@y
    By default, the tool expects an image reference, such as:
@z

@x
    - `redis`
    - `curlimages/curl:7.87.0`
    - `mcr.microsoft.com/dotnet/runtime:7.0`
@y
    - `redis`
    - `curlimages/curl:7.87.0`
    - `mcr.microsoft.com/dotnet/runtime:7.0`
@z

@x
    If the artifact you want to analyze is an OCI directory, a tarball archive, a local file or directory,
    or if you want to control from where the image will be resolved, you must prefix the reference with one of the following:
@y
    If the artifact you want to analyze is an OCI directory, a tarball archive, a local file or directory,
    or if you want to control from where the image will be resolved, you must prefix the reference with one of the following:
@z

@x
    - `image://` (default) use a local image, or fall back to a registry lookup
    - `local://` use an image from the local image store (don't do a registry lookup)
    - `registry://` use an image from a registry (don't use a local image)
    - `oci-dir://` use an OCI layout directory
    - `archive://` use a tarball archive, as created by `docker save`
    - `fs://` use a local directory or file
usage: docker scout cves [OPTIONS] [IMAGE|DIRECTORY|ARCHIVE]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: details
      value_type: bool
      default_value: "false"
      description: Print details on default text output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: env
      value_type: string
      description: Name of environment
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: exit-code
      shorthand: e
      value_type: bool
      default_value: "false"
      description: Return exit code '2' if vulnerabilities are detected
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: format
      value_type: string
      default_value: packages
      description: "Output format of the generated vulnerability report:\n- packages: default output, plain text with vulnerabilities grouped by packages\n- sarif: json Sarif output\n- spdx: json SPDX output \n- markdown: markdown output (including some html tags like collapsible sections)\n- sbom: json SBOM output"
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ignore-base
      value_type: bool
      default_value: "false"
      description: Filter out CVEs introduced from base image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: locations
      value_type: bool
      default_value: "false"
      description: Print package locations including file paths and layer diff_id
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: multi-stage
      value_type: bool
      default_value: "false"
      description: Show packages from multi-stage Docker builds
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-cve-id
      value_type: stringSlice
      default_value: '[]'
      description: |
        Comma separated list of CVE ids (like CVE-2021-45105) to search for
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-fixed
      value_type: bool
      default_value: "false"
      description: Filter to fixable CVEs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-metric
      value_type: stringSlice
      default_value: '[]'
      description: |
        Comma separated list of CVSS metrics (like AV:N or PR:L) to filter CVEs by
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-package
      value_type: stringSlice
      default_value: '[]'
      description: Comma separated regular expressions to filter packages by
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-package-type
      value_type: stringSlice
      default_value: '[]'
      description: |
        Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-severity
      value_type: stringSlice
      default_value: '[]'
      description: |
        Comma separated list of severities (critical, high, medium, low, unspecified) to filter CVEs by
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-stage
      value_type: stringSlice
      default_value: '[]'
      description: Comma separated list of multi-stage Docker build stage names
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-unfixed
      value_type: bool
      default_value: "false"
      description: Filter to unfixed CVEs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-vex-affected
      value_type: bool
      default_value: "false"
      description: Filter CVEs by VEX statements with status not affected
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-vuln-packages
      value_type: bool
      default_value: "false"
      description: |
        When used with --format=only-packages ignore packages with no vulnerabilities
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Write the report to a file.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Platform of image to analyze
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ref
      value_type: string
      description: |-
        Reference to use if the provided tarball contains multiple references.
        Can only be used with archive.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: stream
      value_type: string
      description: Name of stream
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: vex
      value_type: bool
      default_value: "false"
      description: Apply VEX statements to filter CVEs
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: vex-author
      value_type: stringSlice
      default_value: '[]'
      description: List of VEX statement authors to accept
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: vex-location
      value_type: stringSlice
      default_value: '[]'
      description: File location of directory or file containing VEX statements
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: debug
      value_type: bool
      default_value: "false"
      description: Debug messages
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose-debug
      value_type: bool
      default_value: "false"
      description: Verbose debug
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Display vulnerabilities grouped by package
@y
    - `image://` (default) use a local image, or fall back to a registry lookup
    - `local://` use an image from the local image store (don't do a registry lookup)
    - `registry://` use an image from a registry (don't use a local image)
    - `oci-dir://` use an OCI layout directory
    - `archive://` use a tarball archive, as created by `docker save`
    - `fs://` use a local directory or file
usage: docker scout cves [OPTIONS] [IMAGE|DIRECTORY|ARCHIVE]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: details
      value_type: bool
      default_value: "false"
      description: Print details on default text output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: env
      value_type: string
      description: Name of environment
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: exit-code
      shorthand: e
      value_type: bool
      default_value: "false"
      description: Return exit code '2' if vulnerabilities are detected
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: format
      value_type: string
      default_value: packages
      description: "Output format of the generated vulnerability report:\n- packages: default output, plain text with vulnerabilities grouped by packages\n- sarif: json Sarif output\n- spdx: json SPDX output \n- markdown: markdown output (including some html tags like collapsible sections)\n- sbom: json SBOM output"
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ignore-base
      value_type: bool
      default_value: "false"
      description: Filter out CVEs introduced from base image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: locations
      value_type: bool
      default_value: "false"
      description: Print package locations including file paths and layer diff_id
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: multi-stage
      value_type: bool
      default_value: "false"
      description: Show packages from multi-stage Docker builds
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-cve-id
      value_type: stringSlice
      default_value: '[]'
      description: |
        Comma separated list of CVE ids (like CVE-2021-45105) to search for
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-fixed
      value_type: bool
      default_value: "false"
      description: Filter to fixable CVEs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-metric
      value_type: stringSlice
      default_value: '[]'
      description: |
        Comma separated list of CVSS metrics (like AV:N or PR:L) to filter CVEs by
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-package
      value_type: stringSlice
      default_value: '[]'
      description: Comma separated regular expressions to filter packages by
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-package-type
      value_type: stringSlice
      default_value: '[]'
      description: |
        Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-severity
      value_type: stringSlice
      default_value: '[]'
      description: |
        Comma separated list of severities (critical, high, medium, low, unspecified) to filter CVEs by
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-stage
      value_type: stringSlice
      default_value: '[]'
      description: Comma separated list of multi-stage Docker build stage names
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-unfixed
      value_type: bool
      default_value: "false"
      description: Filter to unfixed CVEs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-vex-affected
      value_type: bool
      default_value: "false"
      description: Filter CVEs by VEX statements with status not affected
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-vuln-packages
      value_type: bool
      default_value: "false"
      description: |
        When used with --format=only-packages ignore packages with no vulnerabilities
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Write the report to a file.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Platform of image to analyze
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ref
      value_type: string
      description: |-
        Reference to use if the provided tarball contains multiple references.
        Can only be used with archive.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: stream
      value_type: string
      description: Name of stream
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: vex
      value_type: bool
      default_value: "false"
      description: Apply VEX statements to filter CVEs
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: vex-author
      value_type: stringSlice
      default_value: '[]'
      description: List of VEX statement authors to accept
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: vex-location
      value_type: stringSlice
      default_value: '[]'
      description: File location of directory or file containing VEX statements
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: debug
      value_type: bool
      default_value: "false"
      description: Debug messages
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose-debug
      value_type: bool
      default_value: "false"
      description: Verbose debug
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Display vulnerabilities grouped by package
@z

@x
    ```console
    $ docker scout cves alpine
    Analyzing image alpine
        ✓ Image stored for indexing
        ✓ Indexed 18 packages
        ✓ No vulnerable package detected
    ```
@y
    ```console
    $ docker scout cves alpine
    Analyzing image alpine
        ✓ Image stored for indexing
        ✓ Indexed 18 packages
        ✓ No vulnerable package detected
    ```
@z

@x
    ### Display vulnerabilities from a `docker save` tarball
@y
    ### Display vulnerabilities from a `docker save` tarball
@z

@x
    ```console
    $ docker save alpine > alpine.tar
@y
    ```console
    $ docker save alpine > alpine.tar
@z

@x
    $ docker scout cves archive://alpine.tar
    Analyzing archive alpine.tar
        ✓ Archive read
        ✓ SBOM of image already cached, 18 packages indexed
        ✓ No vulnerable package detected
    ```
@y
    $ docker scout cves archive://alpine.tar
    Analyzing archive alpine.tar
        ✓ Archive read
        ✓ SBOM of image already cached, 18 packages indexed
        ✓ No vulnerable package detected
    ```
@z

@x
    ### Display vulnerabilities from an OCI directory
@y
    ### Display vulnerabilities from an OCI directory
@z

@x
    ```console
    $ skopeo copy --override-os linux docker://alpine oci:alpine
@y
    ```console
    $ skopeo copy --override-os linux docker://alpine oci:alpine
@z

@x
    $ docker scout cves oci-dir://alpine
    Analyzing OCI directory alpine
        ✓ OCI directory read
        ✓ Image stored for indexing
        ✓ Indexed 19 packages
        ✓ No vulnerable package detected
    ```
@y
    $ docker scout cves oci-dir://alpine
    Analyzing OCI directory alpine
        ✓ OCI directory read
        ✓ Image stored for indexing
        ✓ Indexed 19 packages
        ✓ No vulnerable package detected
    ```
@z

@x
    ### Display vulnerabilities from the current directory
@y
    ### Display vulnerabilities from the current directory
@z

@x
    ```console
    $ docker scout cves fs://.
    ```
@y
    ```console
    $ docker scout cves fs://.
    ```
@z

@x
    ### Export vulnerabilities to a SARIF JSON file
@y
    ### Export vulnerabilities to a SARIF JSON file
@z

@x
    ```console
    $ docker scout cves --format sarif --output alpine.sarif.json alpine
    Analyzing image alpine
        ✓ SBOM of image already cached, 18 packages indexed
        ✓ No vulnerable package detected
        ✓ Report written to alpine.sarif.json
    ```
@y
    ```console
    $ docker scout cves --format sarif --output alpine.sarif.json alpine
    Analyzing image alpine
        ✓ SBOM of image already cached, 18 packages indexed
        ✓ No vulnerable package detected
        ✓ Report written to alpine.sarif.json
    ```
@z

@x
    ### Display markdown output
@y
    ### Display markdown output
@z

@x
    The following example shows how to generate the vulnerability report as markdown.
@y
    The following example shows how to generate the vulnerability report as markdown.
@z

@x
    ```console
    $ docker scout cves --format markdown alpine
        ✓ Pulled
        ✓ SBOM of image already cached, 19 packages indexed
        ✗ Detected 1 vulnerable package with 3 vulnerabilities
    <h2>:mag: Vulnerabilities of <code>alpine</code></h2>
@y
    ```console
    $ docker scout cves --format markdown alpine
        ✓ Pulled
        ✓ SBOM of image already cached, 19 packages indexed
        ✗ Detected 1 vulnerable package with 3 vulnerabilities
    <h2>:mag: Vulnerabilities of <code>alpine</code></h2>
@z

@x
    <details open="true"><summary>:package: Image Reference</strong> <code>alpine</code></summary>
    <table>
    <tr><td>digest</td><td><code>sha256:e3bd82196e98898cae9fe7fbfd6e2436530485974dc4fb3b7ddb69134eda2407</code></td><tr><tr><td>vulnerabilities</td><td><img alt="critical: 0" src="https://img.shields.io/badge/critical-0-lightgrey"/> <img alt="high: 0" src="https://img.shields.io/badge/high-0-lightgrey"/> <img alt="medium: 2" src="https://img.shields.io/badge/medium-2-fbb552"/> <img alt="low: 0" src="https://img.shields.io/badge/low-0-lightgrey"/> <img alt="unspecified: 1" src="https://img.shields.io/badge/unspecified-1-lightgrey"/></td></tr>
    <tr><td>platform</td><td>linux/arm64</td></tr>
    <tr><td>size</td><td>3.3 MB</td></tr>
    <tr><td>packages</td><td>19</td></tr>
    </table>
    </details></table>
    </details>
    ...
    ```
@y
    <details open="true"><summary>:package: Image Reference</strong> <code>alpine</code></summary>
    <table>
    <tr><td>digest</td><td><code>sha256:e3bd82196e98898cae9fe7fbfd6e2436530485974dc4fb3b7ddb69134eda2407</code></td><tr><tr><td>vulnerabilities</td><td><img alt="critical: 0" src="https://img.shields.io/badge/critical-0-lightgrey"/> <img alt="high: 0" src="https://img.shields.io/badge/high-0-lightgrey"/> <img alt="medium: 2" src="https://img.shields.io/badge/medium-2-fbb552"/> <img alt="low: 0" src="https://img.shields.io/badge/low-0-lightgrey"/> <img alt="unspecified: 1" src="https://img.shields.io/badge/unspecified-1-lightgrey"/></td></tr>
    <tr><td>platform</td><td>linux/arm64</td></tr>
    <tr><td>size</td><td>3.3 MB</td></tr>
    <tr><td>packages</td><td>19</td></tr>
    </table>
    </details></table>
    </details>
    ...
    ```
@z

@x
    ### List all vulnerable packages of a certain type
@y
    ### List all vulnerable packages of a certain type
@z

@x
    The following example shows how to generate a list of packages, only including
    packages of the specified type, and only showing packages that are vulnerable.
@y
    The following example shows how to generate a list of packages, only including
    packages of the specified type, and only showing packages that are vulnerable.
@z

@x
    ```console
    $ docker scout cves --format only-packages --only-package-type golang --only-vuln-packages golang:1.18.0
        ✓ Pulled
        ✓ SBOM of image already cached, 296 packages indexed
        ✗ Detected 1 vulnerable package with 40 vulnerabilities
@y
    ```console
    $ docker scout cves --format only-packages --only-package-type golang --only-vuln-packages golang:1.18.0
        ✓ Pulled
        ✓ SBOM of image already cached, 296 packages indexed
        ✗ Detected 1 vulnerable package with 40 vulnerabilities
@z

@x
       Name   Version   Type         Vulnerabilities
    ───────────────────────────────────────────────────────────
      stdlib  1.18     golang     2C    29H     8M     1L
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
       Name   Version   Type         Vulnerabilities
    ───────────────────────────────────────────────────────────
      stdlib  1.18     golang     2C    29H     8M     1L
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
