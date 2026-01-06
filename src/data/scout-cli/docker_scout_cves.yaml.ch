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
    イメージの指定がない場合は、直近にビルドされた最新のイメージが用いられます。
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
    - `sbom://` SPDX file or in-toto attestation file with SPDX predicate or `syft` json SBOM file
        In case of `sbom://` prefix, if the file is not defined then it will try to read it from the standard input.
@y
    - `image://` (default) use a local image, or fall back to a registry lookup
    - `local://` use an image from the local image store (don't do a registry lookup)
    - `registry://` use an image from a registry (don't use a local image)
    - `oci-dir://` use an OCI layout directory
    - `archive://` use a tarball archive, as created by `docker save`
    - `fs://` use a local directory or file
    - `sbom://` SPDX file or in-toto attestation file with SPDX predicate or `syft` json SBOM file
        In case of `sbom://` prefix, if the file is not defined then it will try to read it from the standard input.
@z

@x
usage: docker scout cves [OPTIONS] [IMAGE|DIRECTORY|ARCHIVE]
@y
usage: docker scout cves [OPTIONS] [IMAGE|DIRECTORY|ARCHIVE]
@z

% options:

@x details
      description: Print details on default text output
@y
      description: Print details on default text output
@z

@x env
      description: Name of environment
@y
      description: Name of environment
@z

@x epss
      description: |
        Display the EPSS scores and organize the package's CVEs according to their EPSS score
@y
      description: |
        Display the EPSS scores and organize the package's CVEs according to their EPSS score
@z

@x epss-percentile
      description: |
        Exclude CVEs with EPSS scores less than the specified percentile (0 to 1)
@y
      description: |
        Exclude CVEs with EPSS scores less than the specified percentile (0 to 1)
@z

@x epss-score
      description: |
        Exclude CVEs with EPSS scores less than the specified value (0 to 1)
@y
      description: |
        Exclude CVEs with EPSS scores less than the specified value (0 to 1)
@z

@x exit-code
      description: Return exit code '2' if vulnerabilities are detected
@y
      description: Return exit code '2' if vulnerabilities are detected
@z

@x format
      description: |-
        Output format of the generated vulnerability report:
        - packages: default output, plain text with vulnerabilities grouped by packages
        - sarif: json Sarif output
        - spdx: json SPDX output
        - gitlab: json GitLab output
        - markdown: markdown output (including some html tags like collapsible sections)
        - sbom: json SBOM output
@y
      description: |-
        Output format of the generated vulnerability report:
        - packages: default output, plain text with vulnerabilities grouped by packages
        - sarif: json Sarif output
        - spdx: json SPDX output
        - gitlab: json GitLab output
        - markdown: markdown output (including some html tags like collapsible sections)
        - sbom: json SBOM output
@z

@x ignore-base
      description: Filter out CVEs introduced from base image
@y
      description: Filter out CVEs introduced from base image
@z

@x ignore-suppressed
      description: |
        Filter CVEs found in Scout exceptions based on the specified exception scope
@y
      description: |
        Filter CVEs found in Scout exceptions based on the specified exception scope
@z

@x local
      description: Local mode
@y
      description: Local mode
@z

@x local-vulndb
      description: Local vulnerability database
@y
      description: Local vulnerability database
@z

@x locations
      description: Print package locations including file paths and layer diff_id
@y
      description: Print package locations including file paths and layer diff_id
@z

@x multi-stage
      description: Show packages from multi-stage Docker builds
@y
      description: Show packages from multi-stage Docker builds
@z

@x only-cve-id
      description: |
        Comma separated list of CVE ids (like CVE-2021-45105) to search for
@y
      description: |
        Comma separated list of CVE ids (like CVE-2021-45105) to search for
@z

@x only-fixed
      description: Filter to fixable CVEs
@y
      description: Filter to fixable CVEs
@z

@x only-metric
      description: |
        Comma separated list of CVSS metrics (like AV:N or PR:L) to filter CVEs by
@y
      description: |
        Comma separated list of CVSS metrics (like AV:N or PR:L) to filter CVEs by
@z

@x only-package
      description: Comma separated regular expressions to filter packages by
@y
      description: Comma separated regular expressions to filter packages by
@z

@x only-package-type
      description: |
        Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)
@y
      description: |
        Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)
@z

@x only-severity
      description: |
        Comma separated list of severities (critical, high, medium, low, unspecified) to filter CVEs by
@y
      description: |
        Comma separated list of severities (critical, high, medium, low, unspecified) to filter CVEs by
@z

@x only-stage
      description: Comma separated list of multi-stage Docker build stage names
@y
      description: Comma separated list of multi-stage Docker build stage names
@z

@x only-unfixed
      description: Filter to unfixed CVEs
@y
      description: Filter to unfixed CVEs
@z

@x only-vex-affected
      description: Filter CVEs by VEX statements with status not affected
@y
      description: Filter CVEs by VEX statements with status not affected
@z

@x only-vuln-packages
      description: |
        When used with --format=only-packages ignore packages with no vulnerabilities
@y
      description: |
        When used with --format=only-packages ignore packages with no vulnerabilities
@z

@x org
      description: Namespace of the Docker organization
@y
      description: Namespace of the Docker organization
@z

@x output
      description: Write the report to a file
@y
      description: Write the report to a file
@z

@x platform
      description: Platform of image to analyze
@y
      description: Platform of image to analyze
@z

@x ref
      description: |-
        Reference to use if the provided tarball contains multiple references.
        Can only be used with archive
@y
      description: |-
        Reference to use if the provided tarball contains multiple references.
        Can only be used with archive
@z

@x stream
      description: Name of stream
@y
      description: Name of stream
@z

@x vex
      description: Apply VEX statements to filter CVEs
@y
      description: Apply VEX statements to filter CVEs
@z

@x vex-author
      description: List of VEX statement authors to accept
@y
      description: List of VEX statement authors to accept
@z

@x vex-location
      description: File location of directory or file containing VEX statements
@y
      description: File location of directory or file containing VEX statements
@z

% inherited_options:

@x debug
      description: Debug messages
@y
      description: Debug messages
@z

@x verbose-debug
      description: Verbose debug
@y
      description: Verbose debug
@z

@x
examples: |-
    ### Display vulnerabilities grouped by package
@y
examples: |-
    ### Display vulnerabilities grouped by package
@z

% snip command...

@x
    ### Display vulnerabilities from a `docker save` tarball
@y
    ### Display vulnerabilities from a `docker save` tarball
@z

% snip command...

@x
    ### Display vulnerabilities from an OCI directory
@y
    ### Display vulnerabilities from an OCI directory
@z

% snip command...

@x
    ### Display vulnerabilities from the current directory
@y
    ### Display vulnerabilities from the current directory
@z

% snip command...

@x
    ### Export vulnerabilities to a SARIF JSON file
@y
    ### Export vulnerabilities to a SARIF JSON file
@z

% snip command...

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

% snip command...

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

% snip command...

@x
    ### Display EPSS score (--epss) {#epss}
@y
    ### Display EPSS score (--epss) {#epss}
@z

@x
    The `--epss` flag adds [Exploit Prediction Scoring System (EPSS)](https://www.first.org/epss/)
    scores to the `docker scout cves` output. EPSS scores are estimates of the likelihood (probability)
    that a software vulnerability will be exploited in the wild in the next 30 days.
    The higher the score, the greater the probability that a vulnerability will be exploited.
@y
    The `--epss` flag adds [Exploit Prediction Scoring System (EPSS)](https://www.first.org/epss/)
    scores to the `docker scout cves` output. EPSS scores are estimates of the likelihood (probability)
    that a software vulnerability will be exploited in the wild in the next 30 days.
    The higher the score, the greater the probability that a vulnerability will be exploited.
@z

% snip command...

@x
    - `EPSS Score` is a floating point number between 0 and 1 representing the probability of exploitation in the wild in the next 30 days (following score publication).
    - `EPSS Percentile` is the percentile of the current score, the proportion of all scored vulnerabilities with the same or a lower EPSS score.
@y
    - `EPSS Score` is a floating point number between 0 and 1 representing the probability of exploitation in the wild in the next 30 days (following score publication).
    - `EPSS Percentile` is the percentile of the current score, the proportion of all scored vulnerabilities with the same or a lower EPSS score.
@z

@x
    You can use the `--epss-score` and `--epss-percentile` flags to filter the output
    of `docker scout cves` based on these scores. For example,
    to only show vulnerabilities with an EPSS score higher than 0.5:
@y
    You can use the `--epss-score` and `--epss-percentile` flags to filter the output
    of `docker scout cves` based on these scores. For example,
    to only show vulnerabilities with an EPSS score higher than 0.5:
@z

% snip command...

@x
    EPSS scores are updated on a daily basis.
    By default, the latest available score is displayed.
    You can use the `--epss-date` flag to manually specify a date
    in the format `yyyy-mm-dd` for fetching EPSS scores.
@y
    EPSS scores are updated on a daily basis.
    By default, the latest available score is displayed.
    You can use the `--epss-date` flag to manually specify a date
    in the format `yyyy-mm-dd` for fetching EPSS scores.
@z

% snip command...

@x
    ### List vulnerabilities from an SPDX file
@y
    ### List vulnerabilities from an SPDX file
@z

@x
    The following example shows how to generate a list of vulnerabilities from an SPDX file using `syft`.
@y
    The following example shows how to generate a list of vulnerabilities from an SPDX file using `syft`.
@z

% snip command...
% snip directives...
