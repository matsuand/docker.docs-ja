%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Plans
linkTitle: Plans
description:
  Browse available Docker plans and add-ons for individuals, teams, and
  organizations.
keywords:
  docker products, docker subscriptions, docker team, docker business,
  ai governance, dhi select, docker build cloud, gordon plans,
  docker agentic platform, product catalog
@y
title: Plans
linkTitle: Plans
description:
  Browse available Docker plans and add-ons for individuals, teams, and
  organizations.
keywords:
  docker products, docker subscriptions, docker team, docker business,
  ai governance, dhi select, docker build cloud, gordon plans,
  docker agentic platform, product catalog
@z

% grid:

@x
  - title: Docker
    description: >-
      Personal and organization plans, including build and runtime minutes.
    link: /subscription-billing/plans/docker/
    icon: credit-card
@y
  - title: Docker
    description: >-
      Personal and organization plans, including build and runtime minutes.
    link: __SUBDIR__/subscription-billing/plans/docker/
    icon: credit-card
@z

@x
  - title: Gordon plans
    description: Usage plans that increase your Gordon allowance.
    link: /subscription-billing/plans/gordon/
    icon: /icons/gordon.svg
@y
  - title: Gordon plans
    description: Usage plans that increase your Gordon allowance.
    link: __SUBDIR__/subscription-billing/plans/gordon/
    icon: icons/gordon.svg
@z

@x
  - title: Docker Agentic Platform
    description: Pay-as-you-go cloud compute for individual accounts.
    link: /subscription-billing/plans/docker-agentic-platform/
    icon: cloud
@y
  - title: Docker Agentic Platform
    description: Pay-as-you-go cloud compute for individual accounts.
    link: __SUBDIR__/subscription-billing/plans/docker-agentic-platform/
    icon: cloud
@z

@x
  - title: Docker Hardened Images (DHI)
    description: Hardened image repositories for organization accounts.
    link: /subscription-billing/plans/dhi/
    icon: /icons/dhi.svg
@y
  - title: Docker Hardened Images (DHI)
    description: Hardened image repositories for organization accounts.
    link: __SUBDIR__/subscription-billing/plans/dhi/
    icon: icons/dhi.svg
@z

@x
  - title: AI Governance
    description: Licenses for organization-wide AI policy enforcement.
    link: /subscription-billing/plans/ai-governance/
    icon: shield-check
@y
  - title: AI Governance
    description: Licenses for organization-wide AI policy enforcement.
    link: __SUBDIR__/subscription-billing/plans/ai-governance/
    icon: shield-check
@z

@x
  - title: Docker Verified Publisher (DVP)
    description: >-
      Publisher analytics and reporting plans for organization accounts.
    link: /subscription-billing/plans/docker-verified-publisher/
    icon: check-badge
@y
  - title: Docker Verified Publisher (DVP)
    description: >-
      Publisher analytics and reporting plans for organization accounts.
    link: __SUBDIR__/subscription-billing/plans/docker-verified-publisher/
    icon: check-badge
@z

@x
Docker plans attach to an individual account, an organization, or a specific
product. Plans make up your subscription.
@y
Docker plans attach to an individual account, an organization, or a specific
product. Plans make up your subscription.
@z

@x
* Docker Personal and Docker Pro are subscriptions for individual accounts.
* Docker Team and Docker Business are subscriptions for organization
  accounts.
* Product plans let you subscribe to a Docker product without altering
  your account type plan.
@y
* Docker Personal and Docker Pro are subscriptions for individual accounts.
* Docker Team and Docker Business are subscriptions for organization
  accounts.
* Product plans let you subscribe to a Docker product without altering
  your account type plan.
@z

@x
Each plan page covers usage entitlements, billing cycle, and management
options.
@y
Each plan page covers usage entitlements, billing cycle, and management
options.
@z

@x
## Choose a plan
@y
## Choose a plan
@z

@x
Compare billing models and tiers before you subscribe.
@y
Compare billing models and tiers before you subscribe.
@z

@x
| Plans | Billing model | Types |
| --- | --- | --- |
| [Docker](/manuals/subscription-billing/plans/docker.md) | Flat-rate plans for individual and organization accounts | Docker Personal, Docker Pro, Docker Team, Docker Business |
| [Docker Hardened Images (DHI)](/manuals/subscription-billing/plans/dhi.md) | Annual plans billed per repository. DHI Community is free. | DHI Community, DHI Select, DHI Enterprise |
| [Gordon](/manuals/subscription-billing/plans/gordon.md) | Monthly plans that raise your Gordon usage allowance | Gordon Plus, Gordon Max, Gordon Ultra |
| [Docker Agentic Platform](/manuals/subscription-billing/plans/docker-agentic-platform.md) | Pay-as-you-go cloud compute, billed monthly | Pay-as-you-go |
| [AI Governance](/manuals/subscription-billing/plans/ai-governance.md) | Licenses purchased through Docker sales. | AI Governance |
| [Docker Verified Publisher (DVP)](/manuals/subscription-billing/plans/docker-verified-publisher.md) | Flat-rate annual plans. DVP Growth lets you add consuming domains in blocks of 25. | DVP Starter, DVP Growth |
@y
| Plans | Billing model | Types |
| --- | --- | --- |
| [Docker](manuals/subscription-billing/plans/docker.md) | Flat-rate plans for individual and organization accounts | Docker Personal, Docker Pro, Docker Team, Docker Business |
| [Docker Hardened Images (DHI)](manuals/subscription-billing/plans/dhi.md) | Annual plans billed per repository. DHI Community is free. | DHI Community, DHI Select, DHI Enterprise |
| [Gordon](manuals/subscription-billing/plans/gordon.md) | Monthly plans that raise your Gordon usage allowance | Gordon Plus, Gordon Max, Gordon Ultra |
| [Docker Agentic Platform](manuals/subscription-billing/plans/docker-agentic-platform.md) | Pay-as-you-go cloud compute, billed monthly | Pay-as-you-go |
| [AI Governance](manuals/subscription-billing/plans/ai-governance.md) | Licenses purchased through Docker sales. | AI Governance |
| [Docker Verified Publisher (DVP)](manuals/subscription-billing/plans/docker-verified-publisher.md) | Flat-rate annual plans. DVP Growth lets you add consuming domains in blocks of 25. | DVP Starter, DVP Growth |
@z

@x
## Add units to a plan {#top-up-your-plan}
@y
## Add units to a plan {#top-up-your-plan}
@z

@x
Add seats, minutes, or other units without changing the plan type.
@y
Add seats, minutes, or other units without changing the plan type.
@z

@x
| Unit | Description | Examples |
| --- | --- | --- |
| [Seats](/manuals/accounts/organization/manage/manage-seats.md) | Each seat extends entitlements to one more member. | Docker Team, Docker Business |
| [Licenses](/manuals/accounts/organization/manage/manage-licenses.md) | Access to specific products or features. | AI Governance, Docker Offload |
| [Minutes](/manuals/subscription-billing/plans/docker.md#docker-build-cloud-minutes) | Build and test runtime capacity, sold in blocks and consumed within the billing period. | Docker Build Cloud, Testcontainers Cloud |
| [Repositories](/manuals/subscription-billing/plans/dhi.md) | Additional container repositories covered by security scanning and analysis features. | DHI |
| [Consuming domains](/manuals/subscription-billing/plans/docker-verified-publisher.md#add-consuming-domains) | Additional consuming domains tracked in publisher analytics. | DVP Growth |
@y
| Unit | Description | Examples |
| --- | --- | --- |
| [Seats](manuals/accounts/organization/manage/manage-seats.md) | Each seat extends entitlements to one more member. | Docker Team, Docker Business |
| [Licenses](manuals/accounts/organization/manage/manage-licenses.md) | Access to specific products or features. | AI Governance, Docker Offload |
| [Minutes](manuals/subscription-billing/plans/docker.md#docker-build-cloud-minutes) | Build and test runtime capacity, sold in blocks and consumed within the billing period. | Docker Build Cloud, Testcontainers Cloud |
| [Repositories](manuals/subscription-billing/plans/dhi.md) | Additional container repositories covered by security scanning and analysis features. | DHI |
| [Consuming domains](manuals/subscription-billing/plans/docker-verified-publisher.md#add-consuming-domains) | Additional consuming domains tracked in publisher analytics. | DVP Growth |
@z

@x
## Product catalog
@y
## Product catalog
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
