%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Securing your software supply chain with Docker Scout
linkTitle: Docker Scout
summary: |
  Enhance container security by automating vulnerability detection and
  remediation.
description: |
  Learn how to use Docker Scout to enhance container security by automating
  vulnerability detection and remediation, ensuring compliance, and protecting
  your development workflow.
@y
title: Docker Scout を使ったソフトウェアサプライチェーンのセキュリティ強化
linkTitle: Docker Scout
summary: |
  ぜい弱性の検出と修復を自動化することによってコンテナーセキュリティを向上させます。
description: |
  Learn how to use Docker Scout to enhance container security by automating
  vulnerability detection and remediation, ensuring compliance, and protecting
  your development workflow.
@z

@x
tags: [product-demo]
@y
tags: [product-demo]
@z

% params:
@x
  time: 20 minutes
@y
  time: 20 分
@z

% resource_links:
@x
    - title: Docker Scout overview
      url: /scout/
    - title: Docker Scout quickstart
      url: /scout/quickstart/
    - title: Install Docker Scout
      url: /scout/install/
@y
    - title: Docker Scout 概要
      url: __SUBDIR__/scout/
    - title: Docker Scout クイックスタート
      url: __SUBDIR__/scout/quickstart/
    - title: Docker Scout のインストール
      url: __SUBDIR__/scout/install/
@z

@x
When container images are insecure, significant risks can arise. Around 60% of
organizations have reported experiencing at least one security breach or
vulnerability incident within a year, [resulting in operational
disruption][CSA]. These incidents often result in considerable downtime, with
44% of affected companies experiencing over an hour of downtime per event. The
financial impact is substantial, with [the average data breach cost reaching
$4.45 million][IBM]. This highlights the critical importance of maintaining
robust container security measures.
@y
When container images are insecure, significant risks can arise. Around 60% of
organizations have reported experiencing at least one security breach or
vulnerability incident within a year, [resulting in operational
disruption][CSA]. These incidents often result in considerable downtime, with
44% of affected companies experiencing over an hour of downtime per event. The
financial impact is substantial, with [the average data breach cost reaching
$4.45 million][IBM]. This highlights the critical importance of maintaining
robust container security measures.
@z

@x
Docker Scout enhances container security by providing automated vulnerability
detection and remediation, addressing insecure container images, and ensuring
compliance with security standards.
@y
Docker Scout enhances container security by providing automated vulnerability
detection and remediation, addressing insecure container images, and ensuring
compliance with security standards.
@z

@x
[CSA]: https://cloudsecurityalliance.org/blog/2023/09/21/2023-global-cloud-threat-report-cloud-attacks-are-lightning-fast
@y
[CSA]: https://cloudsecurityalliance.org/blog/2023/09/21/2023-global-cloud-threat-report-cloud-attacks-are-lightning-fast
@z

@x
[IBM]: https://www.ibm.com/reports/data-breach
@y
[IBM]: https://www.ibm.com/reports/data-breach
@z

@x
## What you'll learn
@y
## What you'll learn
@z

@x
- Define Secure Software Supply Chain (SSSC)
- Review SBOMs and how to use them
- Detect and monitor vulnerabilities
@y
- Define Secure Software Supply Chain (SSSC)
- Review SBOMs and how to use them
- Detect and monitor vulnerabilities
@z

@x
## Tools integration
@y
## Tools integration
@z

@x
Works well with Docker Desktop, GitHub Actions, Jenkins, Kubernetes, and
other CI solutions.
@y
Works well with Docker Desktop, GitHub Actions, Jenkins, Kubernetes, and
other CI solutions.
@z

@x
## Who’s this for?
@y
## Who’s this for?
@z

@x
- DevOps engineers who need to integrate automated security checks into CI/CD
  pipelines to enhance the security and efficiency of their workflows.
- Developers who want to use Docker Scout to identify and remediate
  vulnerabilities early in the development process, ensuring the production of
  secure container images.
- Security professionals who must enforce security compliance, conduct
  vulnerability assessments, and ensure the overall security of containerized
  applications.
@y
- DevOps engineers who need to integrate automated security checks into CI/CD
  pipelines to enhance the security and efficiency of their workflows.
- Developers who want to use Docker Scout to identify and remediate
  vulnerabilities early in the development process, ensuring the production of
  secure container images.
- Security professionals who must enforce security compliance, conduct
  vulnerability assessments, and ensure the overall security of containerized
  applications.
@z

@x
<div id="scout-lp-survey-anchor"></div>
@y
<div id="scout-lp-survey-anchor"></div>
@z
