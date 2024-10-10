%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
title: Docker Scout
@y
title: Docker Scout
@z

@x
keywords: scout, supply chain, vulnerabilities, packages, cves, scan, analysis, analyze
description:
  Get an overview on Docker Scout to proactively enhance your software supply chain security
@y
keywords: scout, supply chain, vulnerabilities, packages, cves, scan, analysis, analyze
description:
  Get an overview on Docker Scout to proactively enhance your software supply chain security
@z

% snip aliases...

% grid:

@x
  - title: Quickstart
    link: /scout/quickstart/
    description: Learn what Docker Scout can do, and how to get started.
    icon: explore
@y
  - title: クイックスタート
    link: __SUBDIR__/scout/quickstart/
    description: Docker Scout では何ができるか、どのように始めたら良いかを学びます。
    icon: explore
@z

@x
  - title: Image analysis
    link: /scout/image-analysis/
    description: Reveal and dig into the composition of your images.
    icon: radar
@y
  - title: イメージ分析
    link: __SUBDIR__/scout/image-analysis/
    description: Reveal and dig into the composition of your images.
    icon: radar
@z

@x
  - title: Advisory database
    link: /scout/advisory-db-sources/
    description: Learn about the information sources that Docker Scout uses.
    icon: database
@y
  - title: Advisory database
    link: __SUBDIR__/scout/advisory-db-sources/
    description: Learn about the information sources that Docker Scout uses.
    icon: database
@z

@x
  - title: Integrations
    description: |
      Connect Docker Scout with your CI, registries, and other third-party services.
    link: /scout/integrations/
    icon: multiple_stop
@y
  - title: Integrations
    description: |
      Connect Docker Scout with your CI, registries, and other third-party services.
    link: __SUBDIR__/scout/integrations/
    icon: multiple_stop
@z

@x
  - title: Dashboard
    link: /scout/dashboard/
    description: |
      The web interface for Docker Scout.
    icon: dashboard
@y
  - title: ダッシュボード
    link: __SUBDIR__/scout/dashboard/
    description: |
      Docker Scout のウェブインターフェースです。
    icon: dashboard
@z

@x
  - title: Policy
    link: /scout/policy/
    description: |
      Ensure that your artifacts align with supply chain best practices.
    icon: policy
@y
  - title: ポリシー
    link: __SUBDIR__/scout/policy/
    description: |
      Ensure that your artifacts align with supply chain best practices.
    icon: policy
@z

@x
  - title: Upgrade
    link: /billing/scout-billing/
    description: |
      The free plan includes up to 3 repositories. Upgrade for more.
    icon: upgrade
---
@y
  - title: アップグレード
    link: __SUBDIR__/billing/scout-billing/
    description: |
      無償プランは 3 リポジトリまで。アップグレードによりさらに増やせます。
    icon: upgrade
---
@z

@x
Container images consist of layers and software packages, which are susceptible to vulnerabilities.
These vulnerabilities can compromise the security of containers and applications.
@y
Container images consist of layers and software packages, which are susceptible to vulnerabilities.
These vulnerabilities can compromise the security of containers and applications.
@z

@x
Docker Scout is a solution for proactively enhancing your software supply chain security.
By analyzing your images, Docker Scout compiles an inventory of components, also known as a Software Bill of Materials (SBOM).
The SBOM is matched against a continuously updated vulnerability database to pinpoint security weaknesses.
@y
Docker Scout is a solution for proactively enhancing your software supply chain security.
By analyzing your images, Docker Scout compiles an inventory of components, also known as a Software Bill of Materials (SBOM).
The SBOM is matched against a continuously updated vulnerability database to pinpoint security weaknesses.
@z

@x
Docker Scout is a standalone service and platform that you can interact with
using Docker Desktop, Docker Hub, the Docker CLI, and the Docker Scout Dashboard.
Docker Scout also facilitates integrations with third-party systems, such as container registries and CI platforms.
@y
Docker Scout is a standalone service and platform that you can interact with
using Docker Desktop, Docker Hub, the Docker CLI, and the Docker Scout Dashboard.
Docker Scout also facilitates integrations with third-party systems, such as container registries and CI platforms.
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
