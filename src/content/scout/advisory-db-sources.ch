%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: More details on the advisory database and CVE-to-package matching service
  behind Docker Scout analysis.
keywords: scanning, analysis, vulnerabilities, Hub, supply chain, security
title: Advisory database sources and matching service
---
@y
---
description: More details on the advisory database and CVE-to-package matching service
  behind Docker Scout analysis.
keywords: scanning, analysis, vulnerabilities, Hub, supply chain, security
title: Advisory database sources and matching service
---
@z

@x
Docker Scout is a service that helps developers and security teams build and
maintain a secure software supply chain. A key component of this is the ability
to assess your software artifacts against a reliable source of vulnerability
information. Different tools collect vulnerability information from different
sources, and use different methods to identify matches against software
artifacts. This can lead to differing results between tools.
@y
Docker Scout is a service that helps developers and security teams build and
maintain a secure software supply chain. A key component of this is the ability
to assess your software artifacts against a reliable source of vulnerability
information. Different tools collect vulnerability information from different
sources, and use different methods to identify matches against software
artifacts. This can lead to differing results between tools.
@z

@x
To help you understand why different tools can provide different results when
assessing software for vulnerabilities, this page explains how the Docker Scout
advisory database and CVE-to-package matching service works.
@y
To help you understand why different tools can provide different results when
assessing software for vulnerabilities, this page explains how the Docker Scout
advisory database and CVE-to-package matching service works.
@z

@x
## Docker Scout’s advisory database sources
@y
## Docker Scout’s advisory database sources
@z

@x
Docker Scout creates and maintains its vulnerability database by ingesting and
collating vulnerability data from multiple sources continuously. These
sources include many recognizable package repositories and trusted security
trackers, including:
@y
Docker Scout creates and maintains its vulnerability database by ingesting and
collating vulnerability data from multiple sources continuously. These
sources include many recognizable package repositories and trusted security
trackers, including:
@z

@x
- [Alpine secdb](https://secdb.alpinelinux.org/)
- [AlmaLinux Security Advisory](https://errata.almalinux.org/)
- [Amazon Linux Security Center](https://alas.aws.amazon.com/)
- [Bitnami Vulnerability Database](https://github.com/bitnami/vulndb)
- [CISA Known Exploited Vulnerability
  Catalog](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)
- [Debian Security Bug Tracker](https://security-tracker.debian.org/tracker/)
- [Exploit Prediction Scoring System (EPSS)](https://api.first.org/epss/)
- [GitHub Advisory Database](https://github.com/advisories/)
- [GitLab Advisory
  Database](https://gitlab.com/gitlab-org/advisories-community/)
- [Golang VulnDB](https://github.com/golang/vulndb)
- [inTheWild, a community-driven open database of vulnerability
  exploitation](https://github.com/gmatuz/inthewilddb)
- [National Vulnerability Database](https://nvd.nist.gov/)
- [Oracle Linux Security](https://linux.oracle.com/security/)
- [Python Packaging Advisory
  Database](https://github.com/pypa/advisory-database)
- [RedHat Security Data](https://www.redhat.com/security/data/metrics/)
- [Rocky Linux Security Advisory](https://errata.rockylinux.org/)
- [RustSec Advisory Database](https://github.com/rustsec/advisory-db)
- [SUSE Security CVRF](http://ftp.suse.com/pub/projects/security/cvrf/)
- [Ubuntu CVE Tracker](https://people.canonical.com/~ubuntu-security/cve/)
- [Wolfi Security Feed](https://packages.wolfi.dev/os/security.json)
- [Chainguard Security Feed](https://packages.cgr.dev/chainguard/security.json)
@y
- [Alpine secdb](https://secdb.alpinelinux.org/)
- [AlmaLinux Security Advisory](https://errata.almalinux.org/)
- [Amazon Linux Security Center](https://alas.aws.amazon.com/)
- [Bitnami Vulnerability Database](https://github.com/bitnami/vulndb)
- [CISA Known Exploited Vulnerability
  Catalog](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)
- [Debian Security Bug Tracker](https://security-tracker.debian.org/tracker/)
- [Exploit Prediction Scoring System (EPSS)](https://api.first.org/epss/)
- [GitHub Advisory Database](https://github.com/advisories/)
- [GitLab Advisory
  Database](https://gitlab.com/gitlab-org/advisories-community/)
- [Golang VulnDB](https://github.com/golang/vulndb)
- [inTheWild, a community-driven open database of vulnerability
  exploitation](https://github.com/gmatuz/inthewilddb)
- [National Vulnerability Database](https://nvd.nist.gov/)
- [Oracle Linux Security](https://linux.oracle.com/security/)
- [Python Packaging Advisory
  Database](https://github.com/pypa/advisory-database)
- [RedHat Security Data](https://www.redhat.com/security/data/metrics/)
- [Rocky Linux Security Advisory](https://errata.rockylinux.org/)
- [RustSec Advisory Database](https://github.com/rustsec/advisory-db)
- [SUSE Security CVRF](http://ftp.suse.com/pub/projects/security/cvrf/)
- [Ubuntu CVE Tracker](https://people.canonical.com/~ubuntu-security/cve/)
- [Wolfi Security Feed](https://packages.wolfi.dev/os/security.json)
- [Chainguard Security Feed](https://packages.cgr.dev/chainguard/security.json)
@z

@x
Docker Scout correlates the vulnerability data from these advisories with the
Software Bill of Materials (SBOM) of container images to detect what
vulnerabilities affect an image. The SBOM summarizes the contents of an image,
and Docker Scout stores the SBOM in its database.
@y
Docker Scout correlates the vulnerability data from these advisories with the
Software Bill of Materials (SBOM) of container images to detect what
vulnerabilities affect an image. The SBOM summarizes the contents of an image,
and Docker Scout stores the SBOM in its database.
@z

@x
When there is information about a new vulnerability, Docker Scout correlates
the vulnerable package with the SBOMs in the database to identify affected
images.
@y
When there is information about a new vulnerability, Docker Scout correlates
the vulnerable package with the SBOMs in the database to identify affected
images.
@z

@x
When you enable Docker Scout for your organization, you receive your own
instance of the database. The database tracks timestamped metadata about your
images that Docker Scout can then match to CVEs. Find more details on how this
works in the [image analysis page](./image-analysis.md).
@y
When you enable Docker Scout for your organization, you receive your own
instance of the database. The database tracks timestamped metadata about your
images that Docker Scout can then match to CVEs. Find more details on how this
works in the [image analysis page](./image-analysis.md).
@z

@x
Docker Scout image analysis integrates seamlessly with Docker Desktop and
Docker Hub, and you can also enable integrations with other systems, see
[Integrating Docker Scout with other systems](./integrations/index.md).
@y
Docker Scout image analysis integrates seamlessly with Docker Desktop and
Docker Hub, and you can also enable integrations with other systems, see
[Integrating Docker Scout with other systems](./integrations/index.md).
@z

@x
## How Docker Scout makes more precise matches
@y
## How Docker Scout makes more precise matches
@z

@x
Many other tools use fuzzy [Common Product Enumeration
(CPE)](https://en.wikipedia.org/wiki/Common_Platform_Enumeration) matching with
wild cards to known vulnerabilities with the versions of software packages they affect.
This can return a lot of false positives which you need to triage.
@y
Many other tools use fuzzy [Common Product Enumeration
(CPE)](https://en.wikipedia.org/wiki/Common_Platform_Enumeration) matching with
wild cards to known vulnerabilities with the versions of software packages they affect.
This can return a lot of false positives which you need to triage.
@z

@x
The typical structure of a CPE match looks like this:
@y
The typical structure of a CPE match looks like this:
@z

@x
```text
cpe:<cpe_version>:<part>:<vendor>:<product>:<version>:<update>:<edition>:<language>:<sw_edition>:<target_sw>:<target_hw>:<other>
```
@y
```text
cpe:<cpe_version>:<part>:<vendor>:<product>:<version>:<update>:<edition>:<language>:<sw_edition>:<target_sw>:<target_hw>:<other>
```
@z

@x
For example `cpe:*:*:*:calendar:*:*:*:*:*:*:*` returns a match on anything with
the product name “calendar”. If there is a vulnerability present in an npm
package, this CPE match would also return packages and modules for all other
languages too.
@y
For example `cpe:*:*:*:calendar:*:*:*:*:*:*:*` returns a match on anything with
the product name “calendar”. If there is a vulnerability present in an npm
package, this CPE match would also return packages and modules for all other
languages too.
@z

@x
Instead, Docker Scout matches CVEs to SBOMs using [Package URL (PURL)
links](https://github.com/package-url/purl-spec) that are a more precise,
universal schema for matching software packages. A PURL link can help you only
identify the relevant packages with far less false positives.
@y
Instead, Docker Scout matches CVEs to SBOMs using [Package URL (PURL)
links](https://github.com/package-url/purl-spec) that are a more precise,
universal schema for matching software packages. A PURL link can help you only
identify the relevant packages with far less false positives.
@z

@x
Continuing this example, a PURL can match the specific package name to a
language and version.
@y
Continuing this example, a PURL can match the specific package name to a
language and version.
@z

@x
```text
pkg:npm/calendar@12.0.2
```
@y
```text
pkg:npm/calendar@12.0.2
```
@z

@x
This only matches a node package with the name `calendar` and the version
`12.0.2`. For relevant packages, you can specify architectures and operating
system versions to make more precise matches.
@y
This only matches a node package with the name `calendar` and the version
`12.0.2`. For relevant packages, you can specify architectures and operating
system versions to make more precise matches.
@z

@x
In summary, Docker Scout’s technique improves matching accuracy and reduces the
number of results that turn out to be false-positives.
@y
In summary, Docker Scout’s technique improves matching accuracy and reduces the
number of results that turn out to be false-positives.
@z

@x
## Package ecosystems supported by Docker Scout
@y
## Package ecosystems supported by Docker Scout
@z

@x
By sourcing vulnerability data from the [advisory
databases](#docker-scouts-advisory-database-sources), Docker Scout is able to
support analyzing the following package ecosystems:
@y
By sourcing vulnerability data from the [advisory
databases](#docker-scouts-advisory-database-sources), Docker Scout is able to
support analyzing the following package ecosystems:
@z

@x
- .NET
- GitHub packages
- Go
- Java
- JavaScript
- PHP
- Python
- RPM
- Ruby
- `alpm` (Arch Linux)
- `apk` (Alpine Linux)
- `deb` (Debian Linux and derivatives)
@y
- .NET
- GitHub packages
- Go
- Java
- JavaScript
- PHP
- Python
- RPM
- Ruby
- `alpm` (Arch Linux)
- `apk` (Alpine Linux)
- `deb` (Debian Linux and derivatives)
@z
