%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Explore VEX statements in Docker Hardened Images
description: |
  Scan a Docker Hardened Image with and without VEX and audit every CVE suppression
  and its justification.
summary: >
  Scan a Docker Hardened Image with and without VEX and audit every suppression
  and its justification.
keywords: vex, openvex, not_affected, under_investigation, affected, cve, docker scout, dhi, vulnerability
@y
title: Explore VEX statements in Docker Hardened Images
description: |
  Scan a Docker Hardened Image with and without VEX and audit every CVE suppression
  and its justification.
summary: >
  Scan a Docker Hardened Image with and without VEX and audit every suppression
  and its justification.
keywords: vex, openvex, not_affected, under_investigation, affected, cve, docker scout, dhi, vulnerability
@z

@x
  time: 25 minutes
@y
  time: 25 分
@z

@x
Standard vulnerability scanners report CVEs against packages present in an
image. With Docker Hardened Images, those packages are there by design, but each
reported CVE has a VEX statement explaining whether it is exploitable in this
specific product configuration. This guide walks through scanning a Docker
Hardened Image with and without VEX and auditing the justification behind every
suppression.
@y
Standard vulnerability scanners report CVEs against packages present in an
image. With Docker Hardened Images, those packages are there by design, but each
reported CVE has a VEX statement explaining whether it is exploitable in this
specific product configuration. This guide walks through scanning a Docker
Hardened Image with and without VEX and auditing the justification behind every
suppression.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- [Docker Desktop](https://www.docker.com/products/docker-desktop/), authenticated
  to `dhi.io`. Sign in with `docker login dhi.io`. Docker Desktop includes
  Docker Scout, which fetches the VEX attestation.
- A vulnerability scanner. This guide shows examples for Docker Scout,
  [Trivy](https://trivy.dev/), and [Grype](https://github.com/anchore/grype).
  Trivy and Grype can also run as Docker containers with no installation needed.
- `jq` (optional), for filtering the VEX file.
@y
- [Docker Desktop](https://www.docker.com/products/docker-desktop/), authenticated
  to `dhi.io`. Sign in with `docker login dhi.io`. Docker Desktop includes
  Docker Scout, which fetches the VEX attestation.
- A vulnerability scanner. This guide shows examples for Docker Scout,
  [Trivy](https://trivy.dev/), and [Grype](https://github.com/anchore/grype).
  Trivy and Grype can also run as Docker containers with no installation needed.
- `jq` (optional), for filtering the VEX file.
@z

@x
## Expose daemon for Windows users
@y
## Expose daemon for Windows users
@z

@x
The `-v /var/run/docker.sock:/var/run/docker.sock` socket mount used in the
containerized scanner commands throughout this guide does not work on Docker
Desktop for Windows. To use containerized scanners on Windows, go to
**Settings > General** in Docker Desktop and turn on **Expose daemon on
tcp://localhost:2375 without TLS**. Then replace
`-v /var/run/docker.sock:/var/run/docker.sock` with
`-e DOCKER_HOST=tcp://host.docker.internal:2375` in every containerized
scanner command.
@y
The `-v /var/run/docker.sock:/var/run/docker.sock` socket mount used in the
containerized scanner commands throughout this guide does not work on Docker
Desktop for Windows. To use containerized scanners on Windows, go to
**Settings > General** in Docker Desktop and turn on **Expose daemon on
tcp://localhost:2375 without TLS**. Then replace
`-v /var/run/docker.sock:/var/run/docker.sock` with
`-e DOCKER_HOST=tcp://host.docker.internal:2375` in every containerized
scanner command.
@z

@x
> [!WARNING]
>
> Exposing the daemon on TCP without TLS makes your system vulnerable to
> remote code execution attacks. Turn off the setting when you are done
> testing.
@y
> [!WARNING]
>
> Exposing the daemon on TCP without TLS makes your system vulnerable to
> remote code execution attacks. Turn off the setting when you are done
> testing.
@z

@x
## Step 1: Scan without VEX
@y
## Step 1: Scan without VEX
@z

@x
Sign in to the Docker Hardened Images registry:
@y
Sign in to the Docker Hardened Images registry:
@z

@x
```console
$ docker login dhi.io
```
@y
```console
$ docker login dhi.io
```
@z

@x
Then pull the image:
@y
Then pull the image:
@z

@x
```console
$ docker pull dhi.io/python:3.13
```
@y
```console
$ docker pull dhi.io/python:3.13
```
@z

@x
Then scan without VEX to see the raw CVE count. Docker Scout automatically
applies VEX on Docker Hardened Images. To see the unfiltered CVE baseline,
use Trivy or Grype.
@y
Then scan without VEX to see the raw CVE count. Docker Scout automatically
applies VEX on Docker Hardened Images. To see the unfiltered CVE baseline,
use Trivy or Grype.
@z

@x
{{< tabs >}}
{{< tab name="Trivy" >}}
@y
{{< tabs >}}
{{< tab name="Trivy" >}}
@z

@x
```console
$ trivy image --scanners vuln dhi.io/python:3.13
```
@y
```console
$ trivy image --scanners vuln dhi.io/python:3.13
```
@z

@x
If Trivy isn't installed, run it in a container:
@y
If Trivy isn't installed, run it in a container:
@z

@x
```console
$ docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  aquasec/trivy:latest image --scanners vuln dhi.io/python:3.13
```
@y
```console
$ docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  aquasec/trivy:latest image --scanners vuln dhi.io/python:3.13
```
@z

@x
Example output:
@y
Example output:
@z

@x
```plaintext
Total: 30 (UNKNOWN: 0, LOW: 15, MEDIUM: 11, HIGH: 4, CRITICAL: 0)
```
@y
```plaintext
Total: 30 (UNKNOWN: 0, LOW: 15, MEDIUM: 11, HIGH: 4, CRITICAL: 0)
```
@z

@x
{{< /tab >}}
{{< tab name="Grype" >}}
@y
{{< /tab >}}
{{< tab name="Grype" >}}
@z

@x
```console
$ grype dhi.io/python:3.13
```
@y
```console
$ grype dhi.io/python:3.13
```
@z

@x
If Grype isn't installed, run it in a container:
@y
If Grype isn't installed, run it in a container:
@z

@x
```console
$ docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  anchore/grype:latest docker:dhi.io/python:3.13
```
@y
```console
$ docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  anchore/grype:latest docker:dhi.io/python:3.13
```
@z

@x
Example output:
@y
Example output:
@z

@x
```plaintext
NAME          INSTALLED              FIXED IN     TYPE  VULNERABILITY       SEVERITY
libc6         2.41-12+deb13u2                     deb   CVE-2018-20796      Negligible
libc6         2.41-12+deb13u2        (won't fix)  deb   CVE-2026-4437       High
libc6         2.41-12+deb13u2        (won't fix)  deb   CVE-2026-5450       Critical
...
```
@y
```plaintext
NAME          INSTALLED              FIXED IN     TYPE  VULNERABILITY       SEVERITY
libc6         2.41-12+deb13u2                     deb   CVE-2018-20796      Negligible
libc6         2.41-12+deb13u2        (won't fix)  deb   CVE-2026-4437       High
libc6         2.41-12+deb13u2        (won't fix)  deb   CVE-2026-5450       Critical
...
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
The output lists CVEs across `libc6`, `libncursesw6`, `libsqlite3-0`, `libuuid1`,
`zlib1g`, and others, all runtime dependencies that Python needs to function.
These packages are present by design.
@y
The output lists CVEs across `libc6`, `libncursesw6`, `libsqlite3-0`, `libuuid1`,
`zlib1g`, and others, all runtime dependencies that Python needs to function.
These packages are present by design.
@z

@x
A scan result like this doesn't mean every reported CVE requires patching. It means
these CVEs have been reported against packages present in the image. Whether any of
those CVEs are actually exploitable in this configuration is a separate
question, and that's exactly what VEX answers.
@y
A scan result like this doesn't mean every reported CVE requires patching. It means
these CVEs have been reported against packages present in the image. Whether any of
those CVEs are actually exploitable in this configuration is a separate
question, and that's exactly what VEX answers.
@z

@x
## Step 2: Fetch the VEX attestation
@y
## Step 2: Fetch the VEX attestation
@z

@x
Export the VEX attestation to a local file:
@y
Export the VEX attestation to a local file:
@z

@x
```console
$ docker scout vex get registry://dhi.io/python:3.13 --output python-vex.json
```
@y
```console
$ docker scout vex get registry://dhi.io/python:3.13 --output python-vex.json
```
@z

@x
The `registry://` prefix tells Scout to fetch the attestation from the registry
rather than the local image store. Because you pulled the image in Step 1, it
already exists locally, and without this prefix Scout would find no attestation
there.
@y
The `registry://` prefix tells Scout to fetch the attestation from the registry
rather than the local image store. Because you pulled the image in Step 1, it
already exists locally, and without this prefix Scout would find no attestation
there.
@z

@x
This fetches a signed OpenVEX document from `registry.scout.docker.com`,
Docker's supply chain metadata registry for all Docker Hardened Images. The
document records Docker's exploitability assessment for every CVE found in the
image's SBOM.
@y
This fetches a signed OpenVEX document from `registry.scout.docker.com`,
Docker's supply chain metadata registry for all Docker Hardened Images. The
document records Docker's exploitability assessment for every CVE found in the
image's SBOM.
@z

@x
> [!NOTE]
>
> Docker Scout fetches this file automatically when scanning. You only need to
> download it explicitly for scanners that don't natively integrate it, or to
> run the `jq` queries in Steps 5 and 6.
@y
> [!NOTE]
>
> Docker Scout fetches this file automatically when scanning. You only need to
> download it explicitly for scanners that don't natively integrate it, or to
> run the `jq` queries in Steps 5 and 6.
@z

@x
## Step 3: Scan with VEX applied
@y
## Step 3: Scan with VEX applied
@z

@x
{{< tabs >}}
{{< tab name="Docker Scout" >}}
@y
{{< tabs >}}
{{< tab name="Docker Scout" >}}
@z

@x
Docker Scout automatically fetches and applies the VEX attestation with no local
file needed:
@y
Docker Scout automatically fetches and applies the VEX attestation with no local
file needed:
@z

@x
```console
$ docker scout cves dhi.io/python:3.13
```
@y
```console
$ docker scout cves dhi.io/python:3.13
```
@z

@x
Example output:
@y
Example output:
@z

@x
```plaintext
    ✓ SBOM obtained from attestation, 47 packages indexed
    ✓ Provenance obtained from attestation
    ✓ VEX statements obtained from attestation
    ✓ No vulnerable package detected
```
@y
```plaintext
    ✓ SBOM obtained from attestation, 47 packages indexed
    ✓ Provenance obtained from attestation
    ✓ VEX statements obtained from attestation
    ✓ No vulnerable package detected
```
@z

@x
{{< /tab >}}
{{< tab name="Trivy" >}}
@y
{{< /tab >}}
{{< tab name="Trivy" >}}
@z

@x
Pass the VEX file with the `--vex` flag:
@y
Pass the VEX file with the `--vex` flag:
@z

@x
```console
$ trivy image --scanners vuln --vex python-vex.json dhi.io/python:3.13
```
@y
```console
$ trivy image --scanners vuln --vex python-vex.json dhi.io/python:3.13
```
@z

@x
If Trivy isn't installed, run it in a container:
@y
If Trivy isn't installed, run it in a container:
@z

@x
```console
$ docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$(pwd)/python-vex.json:/tmp/vex.json" \
  aquasec/trivy:latest image --scanners vuln --vex /tmp/vex.json dhi.io/python:3.13
```
@y
```console
$ docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$(pwd)/python-vex.json:/tmp/vex.json" \
  aquasec/trivy:latest image --scanners vuln --vex /tmp/vex.json dhi.io/python:3.13
```
@z

@x
Example output:
@y
Example output:
@z

@x
```plaintext
Total: 0 (UNKNOWN: 0, LOW: 0, MEDIUM: 0, HIGH: 0, CRITICAL: 0)
@y
```plaintext
Total: 0 (UNKNOWN: 0, LOW: 0, MEDIUM: 0, HIGH: 0, CRITICAL: 0)
@z

@x
Some vulnerabilities have been ignored/suppressed. Use the '--show-suppressed' flag to display them.
```
@y
Some vulnerabilities have been ignored/suppressed. Use the '--show-suppressed' flag to display them.
```
@z

@x
{{< /tab >}}
{{< tab name="Grype" >}}
@y
{{< /tab >}}
{{< tab name="Grype" >}}
@z

@x
Pass the VEX file with the `--vex` flag:
@y
Pass the VEX file with the `--vex` flag:
@z

@x
```console
$ grype dhi.io/python:3.13 --vex python-vex.json
```
@y
```console
$ grype dhi.io/python:3.13 --vex python-vex.json
```
@z

@x
If Grype isn't installed, run it in a container:
@y
If Grype isn't installed, run it in a container:
@z

@x
```console
$ docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$(pwd)/python-vex.json:/tmp/vex.json" \
  anchore/grype:latest docker:dhi.io/python:3.13 --vex /tmp/vex.json
```
@y
```console
$ docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$(pwd)/python-vex.json:/tmp/vex.json" \
  anchore/grype:latest docker:dhi.io/python:3.13 --vex /tmp/vex.json
```
@z

@x
Example output:
@y
Example output:
@z

@x
```plaintext
No vulnerabilities found
```
@y
```plaintext
No vulnerabilities found
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Same image, same packages, same CVE database. The only difference is context.
The scanner matched each CVE against the VEX file and suppressed every one that
Docker assessed as not exploitable.
@y
Same image, same packages, same CVE database. The only difference is context.
The scanner matched each CVE against the VEX file and suppressed every one that
Docker assessed as not exploitable.
@z

@x
The packages are still there. Check the SBOM and you will see `libc6`,
`libsqlite3-0`, and every other package from Step 1. Zero CVEs does not mean
the packages were removed. It means each reported CVE has a documented reason
why it does not apply to this product configuration.
@y
The packages are still there. Check the SBOM and you will see `libc6`,
`libsqlite3-0`, and every other package from Step 1. Zero CVEs does not mean
the packages were removed. It means each reported CVE has a documented reason
why it does not apply to this product configuration.
@z

@x
VEX is an open standard: the attestation travels with the image and any
compliant scanner reads the same reasoning.
@y
VEX is an open standard: the attestation travels with the image and any
compliant scanner reads the same reasoning.
@z

@x
## Step 4: Inspect every suppression and its justification
@y
## Step 4: Inspect every suppression and its justification
@z

@x
Docker Scout and Grype suppress VEX-matched CVEs but do not surface the
justification code in their output. Use Trivy's `--show-suppressed` flag to see
every suppressed CVE alongside its per-CVE justification code.
@y
Docker Scout and Grype suppress VEX-matched CVEs but do not surface the
justification code in their output. Use Trivy's `--show-suppressed` flag to see
every suppressed CVE alongside its per-CVE justification code.
@z

@x
```console
$ trivy image --scanners vuln --vex python-vex.json --show-suppressed dhi.io/python:3.13
```
@y
```console
$ trivy image --scanners vuln --vex python-vex.json --show-suppressed dhi.io/python:3.13
```
@z

@x
If Trivy isn't installed, run it in a container:
@y
If Trivy isn't installed, run it in a container:
@z

@x
```console
$ docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$(pwd)/python-vex.json:/tmp/vex.json" \
  aquasec/trivy:latest image --scanners vuln --vex /tmp/vex.json --show-suppressed dhi.io/python:3.13
```
@y
```console
$ docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$(pwd)/python-vex.json:/tmp/vex.json" \
  aquasec/trivy:latest image --scanners vuln --vex /tmp/vex.json --show-suppressed dhi.io/python:3.13
```
@z

@x
Example output:
@y
Example output:
@z

@x
```plaintext
Suppressed Vulnerabilities (Total: 28)
======================================
┌──────────────┬──────────────────┬──────────┬──────────────┬───────────────────────────────────────────────────┐
│   Library    │  Vulnerability   │ Severity │    Status    │                     Statement                     │
├──────────────┼──────────────────┼──────────┼──────────────┼───────────────────────────────────────────────────┤
│ libc6        │ CVE-2010-4756    │ LOW      │ not_affected │ vulnerable_code_cannot_be_controlled_by_adversary │
│ libsqlite3-0 │ CVE-2025-70873   │ LOW      │ not_affected │ vulnerable_code_not_present                       │
│ ...          │ ...              │ ...      │ ...          │ ...                                               │
└──────────────┴──────────────────┴──────────┴──────────────┴───────────────────────────────────────────────────┘
```
@y
```plaintext
Suppressed Vulnerabilities (Total: 28)
======================================
┌──────────────┬──────────────────┬──────────┬──────────────┬───────────────────────────────────────────────────┐
│   Library    │  Vulnerability   │ Severity │    Status    │                     Statement                     │
├──────────────┼──────────────────┼──────────┼──────────────┼───────────────────────────────────────────────────┤
│ libc6        │ CVE-2010-4756    │ LOW      │ not_affected │ vulnerable_code_cannot_be_controlled_by_adversary │
│ libsqlite3-0 │ CVE-2025-70873   │ LOW      │ not_affected │ vulnerable_code_not_present                       │
│ ...          │ ...              │ ...      │ ...          │ ...                                               │
└──────────────┴──────────────────┴──────────┴──────────────┴───────────────────────────────────────────────────┘
```
@z

@x
The `Statement` column shows the machine-readable justification code from the
VEX file.
@y
The `Statement` column shows the machine-readable justification code from the
VEX file.
@z

@x
The justification codes have precise meanings:
@y
The justification codes have precise meanings:
@z

@x
- `vulnerable_code_cannot_be_controlled_by_adversary`: the vulnerable code
  path exists in the package, but an attacker cannot trigger it in this
  configuration.
- `vulnerable_code_not_present`: the vulnerable code was not compiled into
  this build or is otherwise absent.
- `inline_mitigations_already_exist`: Docker has applied a backport or patch
  that addresses the CVE in this image.
@y
- `vulnerable_code_cannot_be_controlled_by_adversary`: the vulnerable code
  path exists in the package, but an attacker cannot trigger it in this
  configuration.
- `vulnerable_code_not_present`: the vulnerable code was not compiled into
  this build or is otherwise absent.
- `inline_mitigations_already_exist`: Docker has applied a backport or patch
  that addresses the CVE in this image.
@z

@x
For the full list of justification codes, see [VEX status
reference](/manuals/dhi/explore/security-concepts/vex.md#not_affected-justification-codes).
@y
For the full list of justification codes, see [VEX status
reference](manuals/dhi/explore/security-concepts/vex.md#not_affected-justification-codes).
@z

@x
Every suppression is documented, auditable, and verifiable with any VEX-enabled
scanner.
@y
Every suppression is documented, auditable, and verifiable with any VEX-enabled
scanner.
@z

@x
## Step 5: Read Docker's reasoning for a specific CVE
@y
## Step 5: Read Docker's reasoning for a specific CVE
@z

@x
The justification codes are machine-readable; the `status_notes` field in the
VEX file contains Docker's human-readable reasoning. Use `jq` to look up a
specific CVE:
@y
The justification codes are machine-readable; the `status_notes` field in the
VEX file contains Docker's human-readable reasoning. Use `jq` to look up a
specific CVE:
@z

@x
```console
$ jq '.statements[] | select(.vulnerability.name == "CVE-2010-4756") | {status, justification, status_notes}' python-vex.json
```
@y
```console
$ jq '.statements[] | select(.vulnerability.name == "CVE-2010-4756") | {status, justification, status_notes}' python-vex.json
```
@z

@x
Example output:
@y
Example output:
@z

@x
```json
{
  "status": "not_affected",
  "justification": "vulnerable_code_cannot_be_controlled_by_adversary",
  "status_notes": "Standard POSIX behavior in glibc. Applications using glob need to impose limits themselves. Requires authenticated access and is considered unimportant by Debian."
}
```
@y
```json
{
  "status": "not_affected",
  "justification": "vulnerable_code_cannot_be_controlled_by_adversary",
  "status_notes": "Standard POSIX behavior in glibc. Applications using glob need to impose limits themselves. Requires authenticated access and is considered unimportant by Debian."
}
```
@z

@x
The `status_notes` field explains Docker's reasoning in plain language. For
CVE-2010-4756, the glob behavior described by the CVE is standard POSIX
behavior, requires authenticated access, and is classified as unimportant by
the Debian security team.
@y
The `status_notes` field explains Docker's reasoning in plain language. For
CVE-2010-4756, the glob behavior described by the CVE is standard POSIX
behavior, requires authenticated access, and is classified as unimportant by
the Debian security team.
@z

@x
Each statement also lists the affected products as Package URLs (PURLs), for
example `pkg:deb/debian/glibc@2.41-12%2Bdeb13u2?os_distro=trixie&os_name=debian&os_version=13`.
Trivy matched this statement to `libc6` in the image's SBOM by comparing that
PURL against the packages recorded in the SBOM.
@y
Each statement also lists the affected products as Package URLs (PURLs), for
example `pkg:deb/debian/glibc@2.41-12%2Bdeb13u2?os_distro=trixie&os_name=debian&os_version=13`.
Trivy matched this statement to `libc6` in the image's SBOM by comparing that
PURL against the packages recorded in the SBOM.
@z

@x
> [!IMPORTANT]
>
> PURL matching is strict. Scanners must match VEX statements to packages
> using the full PURL string, including the `os_name`, `os_version`, and
> `os_distro` qualifiers. Matching on package name alone risks applying a
> suppression from one OS version to a different version where the CVE *is*
> exploitable.
@y
> [!IMPORTANT]
>
> PURL matching is strict. Scanners must match VEX statements to packages
> using the full PURL string, including the `os_name`, `os_version`, and
> `os_distro` qualifiers. Matching on package name alone risks applying a
> suppression from one OS version to a different version where the CVE *is*
> exploitable.
@z

@x
## Step 6: Filter VEX statements by status
@y
## Step 6: Filter VEX statements by status
@z

@x
Once you have `python-vex.json`, use `jq` to query it directly.
@y
Once you have `python-vex.json`, use `jq` to query it directly.
@z

@x
Count statements by status:
@y
Count statements by status:
@z

@x
```console
$ jq '[.statements[].status] | group_by(.) | map({status: .[0], count: length})' python-vex.json
```
@y
```console
$ jq '[.statements[].status] | group_by(.) | map({status: .[0], count: length})' python-vex.json
```
@z

@x
List all CVEs under active investigation:
@y
List all CVEs under active investigation:
@z

@x
```console
$ jq '[.statements[] | select(.status == "under_investigation") | {cve: .vulnerability.name, products: [.products[]."@id"]}]' python-vex.json
```
@y
```console
$ jq '[.statements[] | select(.status == "under_investigation") | {cve: .vulnerability.name, products: [.products[]."@id"]}]' python-vex.json
```
@z

@x
List any CVEs with `affected` status:
@y
List any CVEs with `affected` status:
@z

@x
```console
$ jq '[.statements[] | select(.status == "affected") | {cve: .vulnerability.name, action: .action_statement}]' python-vex.json
```
@y
```console
$ jq '[.statements[] | select(.status == "affected") | {cve: .vulnerability.name, action: .action_statement}]' python-vex.json
```
@z

@x
The `affected` query returns an empty array for the current `dhi.io/python:3.13`
image, which is the expected result for an actively maintained tag. To see `affected`
entries across all DHI Python versions, query the full VEX feed:
@y
The `affected` query returns an empty array for the current `dhi.io/python:3.13`
image, which is the expected result for an actively maintained tag. To see `affected`
entries across all DHI Python versions, query the full VEX feed:
@z

@x
```console
$ curl -s https://raw.githubusercontent.com/docker-hardened-images/advisories/main/vex/python/dhi-python.vex.json \
  | jq '[.statements[] | select(.status == "affected") | {cve: .vulnerability.name, action: .action_statement}]'
```
@y
```console
$ curl -s https://raw.githubusercontent.com/docker-hardened-images/advisories/main/vex/python/dhi-python.vex.json \
  | jq '[.statements[] | select(.status == "affected") | {cve: .vulnerability.name, action: .action_statement}]'
```
@z

@x
For status definitions and justification codes, see the [VEX status
reference](/manuals/dhi/explore/security-concepts/vex.md#vex-status-reference).
@y
For status definitions and justification codes, see the [VEX status
reference](manuals/dhi/explore/security-concepts/vex.md#vex-status-reference).
@z

@x
## What's next
@y
## What's next
@z

@x
- Scan with other tools: Learn how to apply DHI VEX statements with Trivy
  (VEX Hub) and Grype in [Scan Docker Hardened
  Images](/manuals/dhi/how-to/scan.md).
- Write your own VEX for child images: If you build on top of a DHI and
  want to suppress CVEs in packages you add, see [Create an exception using
  VEX](/manuals/scout/how-tos/create-exceptions-vex.md).
- VEX status reference: For status definitions, justification codes, and
  why DHI does not use `fixed`, see [Vulnerability Exploitability eXchange
  (VEX)](/manuals/dhi/explore/security-concepts/vex.md#vex-status-reference).
- Browse the VEX feed directly: The raw VEX data is published at
  [github.com/docker-hardened-images/advisories](https://github.com/docker-hardened-images/advisories/tree/main/vex),
  organized by image name.
@y
- Scan with other tools: Learn how to apply DHI VEX statements with Trivy
  (VEX Hub) and Grype in [Scan Docker Hardened
  Images](manuals/dhi/how-to/scan.md).
- Write your own VEX for child images: If you build on top of a DHI and
  want to suppress CVEs in packages you add, see [Create an exception using
  VEX](manuals/scout/how-tos/create-exceptions-vex.md).
- VEX status reference: For status definitions, justification codes, and
  why DHI does not use `fixed`, see [Vulnerability Exploitability eXchange
  (VEX)](manuals/dhi/explore/security-concepts/vex.md#vex-status-reference).
- Browse the VEX feed directly: The raw VEX data is published at
  [github.com/docker-hardened-images/advisories](https://github.com/docker-hardened-images/advisories/tree/main/vex),
  organized by image name.
@z
