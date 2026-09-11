%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Evaluate policies
description: Evaluate Docker Scout policies using the CLI, with built-in and custom Rego policies
keywords: scout, policy, rego, opa, cli, custom policies, policy bundle
@y
title: Evaluate policies
description: Evaluate Docker Scout policies using the CLI, with built-in and custom Rego policies
keywords: scout, policy, rego, opa, cli, custom policies, policy bundle
@z

@x
{{< summary-bar feature_name="Evaluate policies" >}}
@y
{{< summary-bar feature_name="Evaluate policies" >}}
@z

@x
`docker scout policy` lets you evaluate images against a configurable policy
set using the CLI. You can use the built-in defaults, adjust thresholds to
match your requirements, or write custom policies in
[Rego](https://www.openpolicyagent.org/docs/latest/policy-language/).
@y
`docker scout policy` lets you evaluate images against a configurable policy
set using the CLI. You can use the built-in defaults, adjust thresholds to
match your requirements, or write custom policies in
[Rego](https://www.openpolicyagent.org/docs/latest/policy-language/).
@z

@x
## How it works
@y
## How it works
@z

@x
When you run `docker scout policy`, the CLI indexes the image into an SBOM,
enriches it with CVE and VEX data, then evaluates each configured policy
in-process. No data is sent to the Scout service, and an
organization is not required for most use cases.
@y
When you run `docker scout policy`, the CLI indexes the image into an SBOM,
enriches it with CVE and VEX data, then evaluates each configured policy
in-process. No data is sent to the Scout service, and an
organization is not required for most use cases.
@z

@x
Policies come from three sources, which can be combined:
@y
Policies come from three sources, which can be combined:
@z

@x
- Built-in defaults: a curated set embedded in the CLI, used when no other
  source is given.
- OCI policy bundles: Rego packaged as an OCI artifact and pulled from a
  registry with `--policy-bundle`.
- Local `.rego` files: for authoring and iterating on custom policies with
  `--policy-file` or `--policy-dir`.
@y
- Built-in defaults: a curated set embedded in the CLI, used when no other
  source is given.
- OCI policy bundles: Rego packaged as an OCI artifact and pulled from a
  registry with `--policy-bundle`.
- Local `.rego` files: for authoring and iterating on custom policies with
  `--policy-file` or `--policy-dir`.
@z

@x
## Use in CI
@y
## Use in CI
@z

@x
Use the [Docker Scout GitHub Action](https://github.com/marketplace/actions/docker-scout)
to evaluate policies as part of your workflow:
@y
Use the [Docker Scout GitHub Action](https://github.com/marketplace/actions/docker-scout)
to evaluate policies as part of your workflow:
@z

@x
```yaml
- name: Evaluate policies
  uses: docker/scout-action@v1
  with:
    command: policy
    image: ${{ env.IMAGE_NAME }}
    organization: <ORG>
```
@y
```yaml
- name: Evaluate policies
  uses: docker/scout-action@v1
  with:
    command: policy
    image: ${{ env.IMAGE_NAME }}
    organization: <ORG>
```
@z

@x
For other CI platforms, install the
[Docker Scout CLI plugin](/manuals/scout/install.md) on your runner and run
`docker scout policy <image> --exit-code`.
@y
For other CI platforms, install the
[Docker Scout CLI plugin](manuals/scout/install.md) on your runner and run
`docker scout policy <image> --exit-code`.
@z

@x
To gate a build on policy compliance compared to an environment, use the
`compare` command with a policy configuration:
@y
To gate a build on policy compliance compared to an environment, use the
`compare` command with a policy configuration:
@z

% snip code...

@x
See [Configure built-in policies](#configure-built-in-policies) for the
`policy-config` file format.
@y
See [Configure built-in policies](#configure-built-in-policies) for the
`policy-config` file format.
@z

@x
## Examples
@y
## Examples
@z

@x
Evaluate an image against the built-in policy set:
@y
Evaluate an image against the built-in policy set:
@z

@x
```console
$ docker scout policy myorg/app:latest
```
@y
```console
$ docker scout policy myorg/app:latest
```
@z

@x
Use `--exit-code` to fail the pipeline when any policy is not met:
@y
Use `--exit-code` to fail the pipeline when any policy is not met:
@z

@x
```console
$ docker scout policy myorg/app:latest --exit-code
```
@y
```console
$ docker scout policy myorg/app:latest --exit-code
```
@z

@x
To customize which policies run and their thresholds, pass a policy-config
file:
@y
To customize which policies run and their thresholds, pass a policy-config
file:
@z

@x
```console
$ docker scout policy myorg/app:latest --policy-config policies.json
```
@y
```console
$ docker scout policy myorg/app:latest --policy-config policies.json
```
@z

@x
Policy results are also surfaced by `docker scout quickview` and
`docker scout compare`, which accept the same `--policy-file`,
`--policy-dir`, `--policy-bundle`, and `--policy-config` flags.
@y
Policy results are also surfaced by `docker scout quickview` and
`docker scout compare`, which accept the same `--policy-file`,
`--policy-dir`, `--policy-bundle`, and `--policy-config` flags.
@z

@x
Other useful flags:
@y
Other useful flags:
@z

@x
```console
# Evaluate a specific platform for a multi-platform image
$ docker scout policy myorg/app:latest --platform linux/arm64
@y
```console
# Evaluate a specific platform for a multi-platform image
$ docker scout policy myorg/app:latest --platform linux/arm64
@z

@x
# Show results for a specific policy only
$ docker scout policy myorg/app:latest --only-policy "No copyleft licenses"
@y
# Show results for a specific policy only
$ docker scout policy myorg/app:latest --only-policy "No copyleft licenses"
@z

@x
# Write the report to a file
$ docker scout policy myorg/app:latest --output report.txt
```
@y
# Write the report to a file
$ docker scout policy myorg/app:latest --output report.txt
```
@z

@x
## Health score
@y
## Health score
@z

@x
`docker scout policy`, `docker scout quickview`, and `docker scout compare` also
report a health score alongside the policy results: a numeric percentage and an
A-F letter grade, computed entirely from the local policy evaluation. No data is
sent to the Scout service to compute it.
@y
`docker scout policy`, `docker scout quickview`, and `docker scout compare` also
report a health score alongside the policy results: a numeric percentage and an
A-F letter grade, computed entirely from the local policy evaluation. No data is
sent to the Scout service to compute it.
@z

@x
```console
$ docker scout policy myorg/app:latest
...
Health score  B (83%)
```
@y
```console
$ docker scout policy myorg/app:latest
...
Health score  B (83%)
```
@z

@x
`docker scout compare` shows the score for both images:
@y
`docker scout compare` shows the score for both images:
@z

@x
```console
Health score  Analyzed B (83%)  Comparison C (65%)
```
@y
```console
Health score  Analyzed B (83%)  Comparison C (65%)
```
@z

@x
### How the score is calculated
@y
### How the score is calculated
@z

@x
The score is a weighted pass ratio:
@y
The score is a weighted pass ratio:
@z

@x
- Each policy contributes a weight to the total, taken from its `custom.weight`
  metadata annotation (see [Metadata annotations](#metadata-annotations)) or a
  `weight` override in the policy-config file. Policies without a declared
  weight default to `10`.
- A policy that passes (reports zero violations) contributes its full weight to
  the scored points.
- A policy that fails still counts its weight toward the total, but contributes
  nothing to the scored points, which lowers the score.
- A policy with no data to evaluate (unknown) also counts toward the total
  without contributing to the scored points.
- A policy with a weight of `0` is excluded from the score entirely.
@y
- Each policy contributes a weight to the total, taken from its `custom.weight`
  metadata annotation (see [Metadata annotations](#metadata-annotations)) or a
  `weight` override in the policy-config file. Policies without a declared
  weight default to `10`.
- A policy that passes (reports zero violations) contributes its full weight to
  the scored points.
- A policy that fails still counts its weight toward the total, but contributes
  nothing to the scored points, which lowers the score.
- A policy with no data to evaluate (unknown) also counts toward the total
  without contributing to the scored points.
- A policy with a weight of `0` is excluded from the score entirely.
@z

@x
The percentage is `scored / total * 100`, mapped to a letter grade using strict
greater-than thresholds:
@y
The percentage is `scored / total * 100`, mapped to a letter grade using strict
greater-than thresholds:
@z

@x
| Score | Grade |
| --- | --- |
| > 90% | A |
| > 70% | B |
| > 50% | C |
| > 30% | D |
| > 10% | E |
| <= 10% | F |
@y
| Score | Grade |
| --- | --- |
| > 90% | A |
| > 70% | B |
| > 50% | C |
| > 30% | D |
| > 10% | E |
| <= 10% | F |
@z

@x
Thresholds are exclusive of their lower bound, so an exact boundary value
grades down: a score of exactly 90% is a B, not an A; exactly 70% is a C, and
so on.
@y
Thresholds are exclusive of their lower bound, so an exact boundary value
grades down: a score of exactly 90% is a B, not an A; exactly 70% is a C, and
so on.
@z

@x
If every policy is excluded from the score (for example, all policies are
configured with `weight: 0`), no health score is shown at all.
@y
If every policy is excluded from the score (for example, all policies are
configured with `weight: 0`), no health score is shown at all.
@z

@x
To change a policy's contribution to the score, set `custom.weight` in the
policy's Rego metadata, or override it per policy in the policy-config file:
@y
To change a policy's contribution to the score, set `custom.weight` in the
policy's Rego metadata, or override it per policy in the policy-config file:
@z

% snip code...

@x
## Built-in policies
@y
## Built-in policies
@z

@x
The following policies are available by default:
@y
The following policies are available by default:
@z

@x
| Policy | What it checks |
| --- | --- |
| No fixable critical or high vulnerabilities | Critical/high CVEs that have a fix available |
| No high-profile vulnerabilities | Curated list of well-known CVEs (Log4Shell, XZ backdoor, and others) |
| No copyleft licenses | Packages under AGPL, GPL, LGPL, MPL, and similar licenses |
| No outdated base images | Base image is behind the latest digest of its tag |
| Supply chain attestations | Provenance and SBOM attestations are attached |
| Default non-root user | Image is configured to run as a non-root user |
| No unapproved base images | Base image matches a configurable allowlist |
@y
| Policy | What it checks |
| --- | --- |
| No fixable critical or high vulnerabilities | Critical/high CVEs that have a fix available |
| No high-profile vulnerabilities | Curated list of well-known CVEs (Log4Shell, XZ backdoor, and others) |
| No copyleft licenses | Packages under AGPL, GPL, LGPL, MPL, and similar licenses |
| No outdated base images | Base image is behind the latest digest of its tag |
| Supply chain attestations | Provenance and SBOM attestations are attached |
| Default non-root user | Image is configured to run as a non-root user |
| No unapproved base images | Base image matches a configurable allowlist |
@z

@x
## Configure built-in policies
@y
## Configure built-in policies
@z

@x
A JSON policy-config file controls which policies run and their thresholds.
Pass it with `--policy-config`.
@y
A JSON policy-config file controls which policies run and their thresholds.
Pass it with `--policy-config`.
@z

@x
```json
{
  "policies": [
    {
      "name": "fixable-vulnerabilities",
      "config": {
        "severities": ["CRITICAL"],
        "grace_period_days": 14
      }
    },
    {
      "name": "no-stale-base-images",
      "enabled": false
    }
  ]
}
```
@y
```json
{
  "policies": [
    {
      "name": "fixable-vulnerabilities",
      "config": {
        "severities": ["CRITICAL"],
        "grace_period_days": 14
      }
    },
    {
      "name": "no-stale-base-images",
      "enabled": false
    }
  ]
}
```
@z

@x
- `policies[].name`: the policy's stable ID (see the following table).
- `policies[].enabled`: set to `false` to skip the policy. Policies not listed are enabled by default.
- `policies[].weight`: overrides the policy's `custom.weight` metadata annotation,
  which determines its contribution to the [health score](#health-score). A
  weight of `0` excludes the policy from the score. When omitted, the policy's
  own annotation is used, or `10` if it has none.
- `policies[].config`: an object passed to the policy as `data.config`.
@y
- `policies[].name`: the policy's stable ID (see the following table).
- `policies[].enabled`: set to `false` to skip the policy. Policies not listed are enabled by default.
- `policies[].weight`: overrides the policy's `custom.weight` metadata annotation,
  which determines its contribution to the [health score](#health-score). A
  weight of `0` excludes the policy from the score. When omitted, the policy's
  own annotation is used, or `10` if it has none.
- `policies[].config`: an object passed to the policy as `data.config`.
@z

@x
### Configuration reference
@y
### Configuration reference
@z

@x
The following table lists the configurable keys for each built-in policy.
@y
The following table lists the configurable keys for each built-in policy.
@z

@x
| Policy (stable ID) | config key | Default | Description |
| --- | --- | --- | --- |
| `fixable-vulnerabilities` | `severities` | `["CRITICAL","HIGH"]` | Severity levels that count as a violation |
| `fixable-vulnerabilities` | `fixable_only` | `true` | When `true`, only vulnerabilities with a known fix count |
| `fixable-vulnerabilities` | `package_types` | `[]` | Allowlist of PURL package types to consider; empty means all |
| `fixable-vulnerabilities` | `grace_period_days` | `0` | Days a newly disclosed CVE is exempt |
| `high-profile-vulnerabilities` | `cves` | [Default high-profile CVEs](#default-high-profile-cves) | CVE IDs considered high-profile |
| `high-profile-vulnerabilities` | `ignored_cves` | `[]` | CVE IDs excluded from causing a failure |
| `high-profile-vulnerabilities` | `include_cisa_kev` | `true` | Also flag vulnerabilities in the CISA KEV catalog |
| `copyleft-license` | `licenses` | AGPL/GPL/LGPL/MPL/… | SPDX license IDs treated as copyleft |
| `copyleft-license` | `ignored_packages` | `[]` | Package URLs exempted from the check |
| `approved-base-images` | `allowed_base_images` | `["*"]` | Glob patterns of allowed base image references |
| `approved-base-images` | `allowed_distros_only` | `true` | When enabled, base image must use an allowed OS distribution |
| `approved-base-images` | `allowed_distros` | curated list | OS distributions considered allowed |
| `supply-chain-attestations` | `required_attestations` | provenance and SBOM predicate types | Attestation predicate types that must be present |
@y
| Policy (stable ID) | config key | Default | Description |
| --- | --- | --- | --- |
| `fixable-vulnerabilities` | `severities` | `["CRITICAL","HIGH"]` | Severity levels that count as a violation |
| `fixable-vulnerabilities` | `fixable_only` | `true` | When `true`, only vulnerabilities with a known fix count |
| `fixable-vulnerabilities` | `package_types` | `[]` | Allowlist of PURL package types to consider; empty means all |
| `fixable-vulnerabilities` | `grace_period_days` | `0` | Days a newly disclosed CVE is exempt |
| `high-profile-vulnerabilities` | `cves` | [Default high-profile CVEs](#default-high-profile-cves) | CVE IDs considered high-profile |
| `high-profile-vulnerabilities` | `ignored_cves` | `[]` | CVE IDs excluded from causing a failure |
| `high-profile-vulnerabilities` | `include_cisa_kev` | `true` | Also flag vulnerabilities in the CISA KEV catalog |
| `copyleft-license` | `licenses` | AGPL/GPL/LGPL/MPL/… | SPDX license IDs treated as copyleft |
| `copyleft-license` | `ignored_packages` | `[]` | Package URLs exempted from the check |
| `approved-base-images` | `allowed_base_images` | `["*"]` | Glob patterns of allowed base image references |
| `approved-base-images` | `allowed_distros_only` | `true` | When enabled, base image must use an allowed OS distribution |
| `approved-base-images` | `allowed_distros` | curated list | OS distributions considered allowed |
| `supply-chain-attestations` | `required_attestations` | provenance and SBOM predicate types | Attestation predicate types that must be present |
@z

@x
#### Default high-profile CVEs
@y
#### Default high-profile CVEs
@z

@x
The built-in `cves` list includes the following CVEs. Docker updates this list
as new high-profile vulnerabilities are disclosed.
@y
The built-in `cves` list includes the following CVEs. Docker updates this list
as new high-profile vulnerabilities are disclosed.
@z

@x
| CVE ID | Common name |
| --- | --- |
| CVE-2014-0160 | Heartbleed |
| CVE-2014-6271 | Shellshock |
| CVE-2021-44228 | Log4Shell |
| CVE-2021-45046 | Log4j follow-up |
| CVE-2022-22965 | Spring4Shell |
| CVE-2023-38545 | curl SOCKS5 heap overflow |
| CVE-2023-44487 | HTTP/2 Rapid Reset |
| CVE-2024-3094 | XZ Utils backdoor |
@y
| CVE ID | Common name |
| --- | --- |
| CVE-2014-0160 | Heartbleed |
| CVE-2014-6271 | Shellshock |
| CVE-2021-44228 | Log4Shell |
| CVE-2021-45046 | Log4j follow-up |
| CVE-2022-22965 | Spring4Shell |
| CVE-2023-38545 | curl SOCKS5 heap overflow |
| CVE-2023-44487 | HTTP/2 Rapid Reset |
| CVE-2024-3094 | XZ Utils backdoor |
@z

@x
To override the list, set `cves` in your policy-config file:
@y
To override the list, set `cves` in your policy-config file:
@z

@x
```json
{
  "policies": [
    {
      "name": "high-profile-vulnerabilities",
      "config": {
        "cves": ["CVE-2021-44228", "CVE-2024-3094"]
      }
    }
  ]
}
```
@y
```json
{
  "policies": [
    {
      "name": "high-profile-vulnerabilities",
      "config": {
        "cves": ["CVE-2021-44228", "CVE-2024-3094"]
      }
    }
  ]
}
```
@z

@x
## Write custom policies
@y
## Write custom policies
@z

@x
Policies are Rego modules in the `docker.scout` package. A policy declares a
boolean `pass` rule and a `violation` set. Use `--policy-file` for a single
file or `--policy-dir` to load a directory recursively.
@y
Policies are Rego modules in the `docker.scout` package. A policy declares a
boolean `pass` rule and a `violation` set. Use `--policy-file` for a single
file or `--policy-dir` to load a directory recursively.
@z

@x
```rego
# METADATA
# title: No packages from internal registry
# description: Flags packages sourced from registry.internal.example.com.
# custom:
#   name: no-internal-registry
#   result_type: generic
#   weight: 5
#   not_compliant_title: Packages from internal registry found
#   details_order:
#   - purl
#   - reason
package docker.scout
@y
```rego
# METADATA
# title: No packages from internal registry
# description: Flags packages sourced from registry.internal.example.com.
# custom:
#   name: no-internal-registry
#   result_type: generic
#   weight: 5
#   not_compliant_title: Packages from internal registry found
#   details_order:
#   - purl
#   - reason
package docker.scout
@z

@x
import rego.v1
@y
import rego.v1
@z

@x
default pass := false
@y
default pass := false
@z

@x
pass if {
    count(violation) == 0
}
@y
pass if {
    count(violation) == 0
}
@z

@x
violation contains v if {
    att := oci.referrer("https://scout.docker.com/sbom/v0.1")
    some pkg in att.statement.predicate.artifacts
    contains(pkg.purl, "registry.internal.example.com")
    v := {
        "message": sprintf("Package %s sourced from internal registry", [pkg.purl]),
        "detail": {
            "purl": pkg.purl,
            "reason": "matches registry.internal.example.com",
        },
    }
}
```
@y
violation contains v if {
    att := oci.referrer("https://scout.docker.com/sbom/v0.1")
    some pkg in att.statement.predicate.artifacts
    contains(pkg.purl, "registry.internal.example.com")
    v := {
        "message": sprintf("Package %s sourced from internal registry", [pkg.purl]),
        "detail": {
            "purl": pkg.purl,
            "reason": "matches registry.internal.example.com",
        },
    }
}
```
@z

@x
```console
# Single file
$ docker scout policy myorg/app:latest --policy-file ./no-internal-registry.rego
@y
```console
# Single file
$ docker scout policy myorg/app:latest --policy-file ./no-internal-registry.rego
@z

@x
# Directory of policies
$ docker scout policy myorg/app:latest --policy-dir ./rego
@y
# Directory of policies
$ docker scout policy myorg/app:latest --policy-dir ./rego
@z

@x
# Custom policies combined with a config file
$ docker scout policy myorg/app:latest \
  --policy-dir ./rego \
  --policy-config ./policies.json
```
@y
# Custom policies combined with a config file
$ docker scout policy myorg/app:latest \
  --policy-dir ./rego \
  --policy-config ./policies.json
```
@z

@x
Both `--policy-file` and `--policy-dir` are repeatable. When either is
provided, the built-in defaults are not loaded automatically. To run both
built-in and custom policies together, publish the built-in set to a registry
with `docker scout policy publish`, then pass both bundles using
`--policy-bundle`:
@y
Both `--policy-file` and `--policy-dir` are repeatable. When either is
provided, the built-in defaults are not loaded automatically. To run both
built-in and custom policies together, publish the built-in set to a registry
with `docker scout policy publish`, then pass both bundles using
`--policy-bundle`:
@z

@x
```console
$ docker scout policy myorg/app:latest \
  --policy-bundle registry.example.com/default-policies:latest \
  --policy-bundle registry.example.com/dhi-policies:latest \
  --policy-file ./custom.rego
```
@y
```console
$ docker scout policy myorg/app:latest \
  --policy-bundle registry.example.com/default-policies:latest \
  --policy-bundle registry.example.com/dhi-policies:latest \
  --policy-file ./custom.rego
```
@z

@x
`--policy-bundle` is repeatable, so you can combine as many bundles as needed
alongside local policy files.
@y
`--policy-bundle` is repeatable, so you can combine as many bundles as needed
alongside local policy files.
@z

@x
### Metadata annotations
@y
### Metadata annotations
@z

@x
The CLI reads [OPA metadata annotations](https://www.openpolicyagent.org/docs/latest/annotations/)
to render results. Place them in a `# METADATA` block immediately above the
`package` declaration.
@y
The CLI reads [OPA metadata annotations](https://www.openpolicyagent.org/docs/latest/annotations/)
to render results. Place them in a `# METADATA` block immediately above the
`package` declaration.
@z

@x
| Annotation | Purpose |
| --- | --- |
| `title` | Human-readable policy name shown in the report |
| `description` | Longer explanation |
| `custom.name` | Stable ID used to match `--policy-config` entries. Defaults to the package path if omitted |
| `custom.result_type` | How violations are rendered: `vulnerability`, `license`, `boolean`, or `generic` (default) |
| `custom.weight` | Scoring weight and display sort order. Higher weights sort first in the report and contribute more to the [health score](#health-score). Defaults to `10` when omitted; a weight of `0` excludes the policy from the score |
| `custom.not_compliant_title` | Status label shown when the policy fails |
| `custom.details_order` | Ordered list of `detail` keys to display as columns |
@y
| Annotation | Purpose |
| --- | --- |
| `title` | Human-readable policy name shown in the report |
| `description` | Longer explanation |
| `custom.name` | Stable ID used to match `--policy-config` entries. Defaults to the package path if omitted |
| `custom.result_type` | How violations are rendered: `vulnerability`, `license`, `boolean`, or `generic` (default) |
| `custom.weight` | Scoring weight and display sort order. Higher weights sort first in the report and contribute more to the [health score](#health-score). Defaults to `10` when omitted; a weight of `0` excludes the policy from the score |
| `custom.not_compliant_title` | Status label shown when the policy fails |
| `custom.details_order` | Ordered list of `detail` keys to display as columns |
@z

@x
### Output contract
@y
### Output contract
@z

@x
- `pass`: `true` when the policy is met. The standard form is `pass if { count(violation) == 0 }`.
- `violation`: a set of objects. Each object should have a `message` string and
  a `detail` object whose keys match `custom.details_order`. An optional
  `remediation` string is shown as remediation guidance.
@y
- `pass`: `true` when the policy is met. The standard form is `pass if { count(violation) == 0 }`.
- `violation`: a set of objects. Each object should have a `message` string and
  a `detail` object whose keys match `custom.details_order`. An optional
  `remediation` string is shown as remediation guidance.
@z

@x
### Input and built-in functions
@y
### Input and built-in functions
@z

@x
The evaluation input is the enriched SBOM. Key entry points:
@y
The evaluation input is the enriched SBOM. Key entry points:
@z

@x
- `input.source.image`: image metadata, including `input.source.image.config.config.User`,
  `input.source.image.name`, and `input.source.image.digest`.
- `data.config`: the per-policy `config` object from the policy-config file.
@y
- `input.source.image`: image metadata, including `input.source.image.config.config.User`,
  `input.source.image.name`, and `input.source.image.digest`.
- `data.config`: the per-policy `config` object from the policy-config file.
@z

@x
The following built-in functions are available in policy Rego:
@y
The following built-in functions are available in policy Rego:
@z

@x
| Function | Description |
| --- | --- |
| `oci.referrer(predicateType)` | Retrieve an attestation by predicate type |
| `oci.canonical_name(ref)` | Normalize an image reference, for example `"node:25"` to `"docker.io/library/node"` |
| `oci.image_digest(ref)` | Resolve the current digest of a tag from its registry |
| `oci.index(ref, digest)` | Get the OCI image index for an image |
| `oci.referrer_index(ref, digest)` | Get the OCI referrer index for an image |
| `oci.referrer_by_digest(ref, digest)` | Get a referrer for an image by digest |
| `scout.parse_purl(purl)` | Parse a PURL into its components |
| `scout.package_provenance(purl)` | Provenance of a package from the SBOM |
| `scout.vulnerabilities(purls)` | Vulnerabilities for the given PURLs |
| `scout.package_recommendation(purl)` | Recommended (fixed) version for a package |
| `scout.base_image()` | Base image matches recorded in the SBOM |
| `cosign.verify_dsse(envelope, opts)` | Verify an in-toto DSSE envelope's cosign signature |
| `cosign.verify_image(ref, opts)` | Verify an image's cosign signature |
| `gpg.verify_commit(...)` | Verify a detached commit signature |
@y
| Function | Description |
| --- | --- |
| `oci.referrer(predicateType)` | Retrieve an attestation by predicate type |
| `oci.canonical_name(ref)` | Normalize an image reference, for example `"node:25"` to `"docker.io/library/node"` |
| `oci.image_digest(ref)` | Resolve the current digest of a tag from its registry |
| `oci.index(ref, digest)` | Get the OCI image index for an image |
| `oci.referrer_index(ref, digest)` | Get the OCI referrer index for an image |
| `oci.referrer_by_digest(ref, digest)` | Get a referrer for an image by digest |
| `scout.parse_purl(purl)` | Parse a PURL into its components |
| `scout.package_provenance(purl)` | Provenance of a package from the SBOM |
| `scout.vulnerabilities(purls)` | Vulnerabilities for the given PURLs |
| `scout.package_recommendation(purl)` | Recommended (fixed) version for a package |
| `scout.base_image()` | Base image matches recorded in the SBOM |
| `cosign.verify_dsse(envelope, opts)` | Verify an in-toto DSSE envelope's cosign signature |
| `cosign.verify_image(ref, opts)` | Verify an image's cosign signature |
| `gpg.verify_commit(...)` | Verify a detached commit signature |
@z

@x
Common predicate types for `oci.referrer`:
@y
Common predicate types for `oci.referrer`:
@z

@x
| Predicate type | Content |
| --- | --- |
| `https://scout.docker.com/vulnerabilities/v0.1` | CVEs per package |
| `https://scout.docker.com/sbom/v0.1` | SBOM artifacts, with `purl` and `licenses` |
| `https://scout.docker.com/provenance/v0.1` | Build provenance, including `base_image` |
| `https://openvex.dev/ns/v0.2.0` | VEX statements |
@y
| Predicate type | Content |
| --- | --- |
| `https://scout.docker.com/vulnerabilities/v0.1` | CVEs per package |
| `https://scout.docker.com/sbom/v0.1` | SBOM artifacts, with `purl` and `licenses` |
| `https://scout.docker.com/provenance/v0.1` | Build provenance, including `base_image` |
| `https://openvex.dev/ns/v0.2.0` | VEX statements |
@z

@x
## Debug policies
@y
## Debug policies
@z

@x
Add `print()` statements to your Rego and enable debug output by setting
`"debug": true` in the policy-config file:
@y
Add `print()` statements to your Rego and enable debug output by setting
`"debug": true` in the policy-config file:
@z

@x
```rego
violation contains v if {
    att := oci.referrer("https://scout.docker.com/sbom/v0.1")
    some pkg in att.statement.predicate.artifacts
    print("checking", pkg.purl)
    contains(pkg.purl, blocked)
    # ...
}
```
@y
```rego
violation contains v if {
    att := oci.referrer("https://scout.docker.com/sbom/v0.1")
    some pkg in att.statement.predicate.artifacts
    print("checking", pkg.purl)
    contains(pkg.purl, blocked)
    # ...
}
```
@z

@x
```json
{
  "debug": true,
  "policies": [
    { "name": "no-internal-registry" }
  ]
}
```
@y
```json
{
  "debug": true,
  "policies": [
    { "name": "no-internal-registry" }
  ]
}
```
@z

@x
Output is prefixed with the policy name and source line:
@y
Output is prefixed with the policy name and source line:
@z

@x
```text
no-internal-registry#28: checking pkg:deb/debian/curl@7.88.1
```
@y
```text
no-internal-registry#28: checking pkg:deb/debian/curl@7.88.1
```
@z

@x
> [!NOTE]
>
> The `debug` field in the policy-config controls `print()` output from your
> Rego. The global `--debug` flag is separate: it enables CLI-level debug
> logging for bundle loading, registry resolution, and similar internals.
@y
> [!NOTE]
>
> The `debug` field in the policy-config controls `print()` output from your
> Rego. The global `--debug` flag is separate: it enables CLI-level debug
> logging for bundle loading, registry resolution, and similar internals.
@z

@x
### Inspect raw evaluation results
@y
### Inspect raw evaluation results
@z

@x
Use `--result-file` to write the full evaluation result for every policy to a
JSON file. This is useful when iterating on a custom policy to inspect
intermediate values.
@y
Use `--result-file` to write the full evaluation result for every policy to a
JSON file. This is useful when iterating on a custom policy to inspect
intermediate values.
@z

@x
```console
$ docker scout policy myorg/app:latest \
  --policy-file ./no-internal-registry.rego \
  --result-file result.json
```
@y
```console
$ docker scout policy myorg/app:latest \
  --policy-file ./no-internal-registry.rego \
  --result-file result.json
```
@z

@x
Each entry in the output contains:
@y
Each entry in the output contains:
@z

@x
- `pass`: the policy's boolean outcome.
- `violations`: the `detail` object of each reported violation.
- `bindings`: the raw `data.docker.scout` document, including the `violation`
  set and any other complete rules, for inspecting intermediate values.
- `metrics`: OPA evaluation metrics (timers and counters).
@y
- `pass`: the policy's boolean outcome.
- `violations`: the `detail` object of each reported violation.
- `bindings`: the raw `data.docker.scout` document, including the `violation`
  set and any other complete rules, for inspecting intermediate values.
- `metrics`: OPA evaluation metrics (timers and counters).
@z

@x
```json
{
  "no-internal-registry": {
    "pass": false,
    "violations": [
      { "purl": "pkg:deb/debian/curl@7.88.1", "reason": "matches \"registry.internal.example.com\"" }
    ],
    "bindings": {
      "blocked": "registry.internal.example.com",
      "violation": [
        {
          "message": "Package pkg:deb/debian/curl@7.88.1 sourced from internal registry",
          "detail": {
            "purl": "pkg:deb/debian/curl@7.88.1",
            "reason": "matches \"registry.internal.example.com\""
          }
        }
      ]
    },
    "metrics": {
      "timer_rego_query_eval_ns": 1234567
    }
  }
}
```
@y
```json
{
  "no-internal-registry": {
    "pass": false,
    "violations": [
      { "purl": "pkg:deb/debian/curl@7.88.1", "reason": "matches \"registry.internal.example.com\"" }
    ],
    "bindings": {
      "blocked": "registry.internal.example.com",
      "violation": [
        {
          "message": "Package pkg:deb/debian/curl@7.88.1 sourced from internal registry",
          "detail": {
            "purl": "pkg:deb/debian/curl@7.88.1",
            "reason": "matches \"registry.internal.example.com\""
          }
        }
      ]
    },
    "metrics": {
      "timer_rego_query_eval_ns": 1234567
    }
  }
}
```
@z

@x
## Share policies as OCI bundles
@y
## Share policies as OCI bundles
@z

@x
Package `.rego` files as an OCI artifact and distribute them through any
registry.
@y
Package `.rego` files as an OCI artifact and distribute them through any
registry.
@z

@x
### Publish a bundle
@y
### Publish a bundle
@z

@x
```console
# Publish a directory of policies
$ docker scout policy publish \
  --policy-dir ./rego \
  registry.example.com/my-policies:latest
@y
```console
# Publish a directory of policies
$ docker scout policy publish \
  --policy-dir ./rego \
  registry.example.com/my-policies:latest
@z

@x
# Publish specific files
$ docker scout policy publish \
  --policy-file fixable.rego \
  --policy-file licenses.rego \
  registry.example.com/my-policies:latest
@y
# Publish specific files
$ docker scout policy publish \
  --policy-file fixable.rego \
  --policy-file licenses.rego \
  registry.example.com/my-policies:latest
@z

@x
# Publish the built-in default set
$ docker scout policy publish registry.example.com/my-policies:latest
```
@y
# Publish the built-in default set
$ docker scout policy publish registry.example.com/my-policies:latest
```
@z

@x
Each module's metadata is validated before publishing. The command prints the
resulting digest and the list of bundled policies.
@y
Each module's metadata is validated before publishing. The command prints the
resulting digest and the list of bundled policies.
@z

@x
### Use a bundle
@y
### Use a bundle
@z

@x
```console
$ docker scout policy myorg/app:latest \
  --policy-bundle registry.example.com/my-policies:latest
@y
```console
$ docker scout policy myorg/app:latest \
  --policy-bundle registry.example.com/my-policies:latest
@z

@x
# Combine a bundle with local files and a config
$ docker scout policy myorg/app:latest \
  --policy-bundle registry.example.com/my-policies:latest \
  --policy-file ./extra.rego \
  --policy-config ./policies.json
```
@y
# Combine a bundle with local files and a config
$ docker scout policy myorg/app:latest \
  --policy-bundle registry.example.com/my-policies:latest \
  --policy-file ./extra.rego \
  --policy-config ./policies.json
```
@z

@x
`--policy-bundle` is repeatable. Authentication uses your existing Docker
registry credentials. Bundles are cached by digest, so re-running against the
same bundle does not re-download it. A new digest (for example, after
re-publishing `:latest`) is fetched automatically.
@y
`--policy-bundle` is repeatable. Authentication uses your existing Docker
registry credentials. Bundles are cached by digest, so re-running against the
same bundle does not re-download it. A new digest (for example, after
re-publishing `:latest`) is fetched automatically.
@z
