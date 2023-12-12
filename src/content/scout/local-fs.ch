%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Analyze local files with Docker Scout
description: Analyze and compare local code using Docker Scout on the command line
keywords: scout, vulnerabilities, analyze, analysis, cli, packages, sbom, cve, security, local, source, code, supply chain
---
@y
---
title: Analyze local files with Docker Scout
description: Analyze and compare local code using Docker Scout on the command line
keywords: scout, vulnerabilities, analyze, analysis, cli, packages, sbom, cve, security, local, source, code, supply chain
---
@z

@x
You can use the `fs://` protocol prefix with Docker Scout CLI commands to
analyze your local source code directly, without having to build and push
container images. The following commands support the `fs://` prefix:
@y
You can use the `fs://` protocol prefix with Docker Scout CLI commands to
analyze your local source code directly, without having to build and push
container images. The following commands support the `fs://` prefix:
@z

@x
- `docker scout quickview`
- `docker scout cves`
- `docker scout compare`
@y
- `docker scout quickview`
- `docker scout cves`
- `docker scout compare`
@z

@x
This feature is available in Docker Scout CLI plugin version 1.0.3 and later.
@y
This feature is available in Docker Scout CLI plugin version 1.0.3 and later.
@z

@x
## Summary
@y
## Summary
@z

@x
To get an at-a-glance vulnerability summary of the source code in the current
working directory:
@y
To get an at-a-glance vulnerability summary of the source code in the current
working directory:
@z

@x
```console
$ docker scout quickview fs://.
```
@y
```console
$ docker scout quickview fs://.
```
@z

@x
## Details
@y
## Details
@z

@x
To view the details of vulnerabilities found in your local source code, you can
use the `docker scout cves --details fs://.` command. Combine it with
other flags to narrow down the results to the packages and vulnerabilities that
you're interested in.
@y
To view the details of vulnerabilities found in your local source code, you can
use the `docker scout cves --details fs://.` command. Combine it with
other flags to narrow down the results to the packages and vulnerabilities that
you're interested in.
@z

@x
```console
$ docker scout cves --details --only-severity high fs://.
    ✓ File system read
    ✓ Indexed 323 packages
    ✗ Detected 1 vulnerable package with 1 vulnerability
@y
```console
$ docker scout cves --details --only-severity high fs://.
    ✓ File system read
    ✓ Indexed 323 packages
    ✗ Detected 1 vulnerable package with 1 vulnerability
@z

@x
​## Overview
@y
​## Overview
@z

@x
                    │        Analyzed path         
────────────────────┼──────────────────────────────
  Path              │  /Users/david/demo/scoutfs   
    vulnerabilities │    0C     1H     0M     0L   
@y
                    │        Analyzed path         
────────────────────┼──────────────────────────────
  Path              │  /Users/david/demo/scoutfs   
    vulnerabilities │    0C     1H     0M     0L   
@z

@x
​## Packages and Vulnerabilities
@y
​## Packages and Vulnerabilities
@z

@x
   0C     1H     0M     0L  fastify 3.29.0
pkg:npm/fastify@3.29.0
@y
   0C     1H     0M     0L  fastify 3.29.0
pkg:npm/fastify@3.29.0
@z

@x
    ✗ HIGH CVE-2022-39288 [OWASP Top Ten 2017 Category A9 - Using Components with Known Vulnerabilities]
      https://scout.docker.com/v/CVE-2022-39288
@y
    ✗ HIGH CVE-2022-39288 [OWASP Top Ten 2017 Category A9 - Using Components with Known Vulnerabilities]
      https://scout.docker.com/v/CVE-2022-39288
@z

@x
      fastify is a fast and low overhead web framework, for Node.js. Affected versions of 
      fastify are subject to a denial of service via malicious use of the Content-Type    
      header. An attacker can send an invalid Content-Type header that can cause the      
      application to crash. This issue has been addressed in commit  fbb07e8d  and will be
      included in release version 4.8.1. Users are advised to upgrade. Users unable to    
      upgrade may manually filter out http content with malicious Content-Type headers.   
@y
      fastify is a fast and low overhead web framework, for Node.js. Affected versions of 
      fastify are subject to a denial of service via malicious use of the Content-Type    
      header. An attacker can send an invalid Content-Type header that can cause the      
      application to crash. This issue has been addressed in commit  fbb07e8d  and will be
      included in release version 4.8.1. Users are advised to upgrade. Users unable to    
      upgrade may manually filter out http content with malicious Content-Type headers.   
@z

@x
      Affected range : <4.8.1                                        
      Fixed version  : 4.8.1                                         
      CVSS Score     : 7.5                                           
      CVSS Vector    : CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H  
@y
      Affected range : <4.8.1                                        
      Fixed version  : 4.8.1                                         
      CVSS Score     : 7.5                                           
      CVSS Vector    : CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H  
@z

@x
1 vulnerability found in 1 package
  LOW       0  
  MEDIUM    0  
  HIGH      1  
  CRITICAL  0
```
@y
1 vulnerability found in 1 package
  LOW       0  
  MEDIUM    0  
  HIGH      1  
  CRITICAL  0
```
@z

@x
## Compare
@y
## Compare
@z

@x
With `docker scout compare`, you can compare the analysis of source code on
your local filesystem with the analysis of a container image. The following
example compares local source code for the Docker Scout CLI plugin with the
`docker/scout-cli:latest` image on Docker Hub.
@y
With `docker scout compare`, you can compare the analysis of source code on
your local filesystem with the analysis of a container image. The following
example compares local source code for the Docker Scout CLI plugin with the
`docker/scout-cli:latest` image on Docker Hub.
@z

@x
```console
$ docker scout compare fs://. --to docker/scout-cli:latest --ignore-unchanged
WARN 'docker scout compare' is experimental and its behaviour might change in the future
    ✓ File system read
    ✓ Indexed 268 packages
    ✓ SBOM of image already cached, 234 packages indexed
@y
```console
$ docker scout compare fs://. --to docker/scout-cli:latest --ignore-unchanged
WARN 'docker scout compare' is experimental and its behaviour might change in the future
    ✓ File system read
    ✓ Indexed 268 packages
    ✓ SBOM of image already cached, 234 packages indexed
@z

@x
  ## Overview
@y
  ## Overview
@z

@x
                           │              Analyzed File System              │              Comparison Image
  ─────────────────────────┼────────────────────────────────────────────────┼─────────────────────────────────────────────
    Path / Image reference │  /Users/david/src/docker/scout-cli-plugin      │  docker/scout-cli:latest
                           │                                                │  bb0b01303584
      platform             │                                                │ linux/arm64
      provenance           │ https://github.com/dvdksn/scout-cli-plugin.git │ https://github.com/docker/scout-cli-plugin
                           │  6ea3f7369dbdfec101ac7c0fa9d78ef05ffa6315      │  67cb4ef78bd69545af0e223ba5fb577b27094505
      vulnerabilities      │    0C     0H     1M     1L                     │    0C     0H     1M     1L
                           │                                                │
      size                 │ 7.4 MB (-14 MB)                                │ 21 MB
      packages             │ 268 (+34)                                      │ 234
                           │                                                │
@y
                           │              Analyzed File System              │              Comparison Image
  ─────────────────────────┼────────────────────────────────────────────────┼─────────────────────────────────────────────
    Path / Image reference │  /Users/david/src/docker/scout-cli-plugin      │  docker/scout-cli:latest
                           │                                                │  bb0b01303584
      platform             │                                                │ linux/arm64
      provenance           │ https://github.com/dvdksn/scout-cli-plugin.git │ https://github.com/docker/scout-cli-plugin
                           │  6ea3f7369dbdfec101ac7c0fa9d78ef05ffa6315      │  67cb4ef78bd69545af0e223ba5fb577b27094505
      vulnerabilities      │    0C     0H     1M     1L                     │    0C     0H     1M     1L
                           │                                                │
      size                 │ 7.4 MB (-14 MB)                                │ 21 MB
      packages             │ 268 (+34)                                      │ 234
                           │                                                │
@z

@x
  ## Packages and Vulnerabilities
@y
  ## Packages and Vulnerabilities
@z

@x
    +   55 packages added
    -   21 packages removed
       213 packages unchanged
```
@y
    +   55 packages added
    -   21 packages removed
       213 packages unchanged
```
@z

@x
The previous example is truncated. The full output also includes a full package
delta for the comparison. The delta shows what packages were added, removed,
and changed between the versions.
@y
The previous example is truncated. The full output also includes a full package
delta for the comparison. The delta shows what packages were added, removed,
and changed between the versions.
@z

@x
The compare output includes version control provenance for both the local
source code and the compare target, when available.
@y
The compare output includes version control provenance for both the local
source code and the compare target, when available.
@z

@x
## Learn more
@y
## Learn more
@z

@x
Read about the commands and supported flags in the CLI reference documentation:
@y
Read about the commands and supported flags in the CLI reference documentation:
@z

@x
- [`docker scout quickview`](../engine/reference/commandline/scout_compare.md)
- [`docker scout cves`](../engine/reference/commandline/scout_compare.md)
- [`docker scout compare`](../engine/reference/commandline/scout_compare.md)
@y
- [`docker scout quickview`](../engine/reference/commandline/scout_compare.md)
- [`docker scout cves`](../engine/reference/commandline/scout_compare.md)
- [`docker scout compare`](../engine/reference/commandline/scout_compare.md)
@z
