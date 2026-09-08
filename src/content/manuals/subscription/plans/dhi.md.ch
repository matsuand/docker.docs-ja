%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: DHI plans
linkTitle: Docker Hardened Images
description:
  Manage Docker Hardened Images Select and Enterprise repositories for
  organization accounts, including purchasing, adding repositories, and
  deactivating
keywords: dhi select, dhi enterprise, docker hardened images, hardened images,
  repositories, organization subscription, secure images
@y
title: DHI plans
linkTitle: Docker Hardened Images
description:
  Manage Docker Hardened Images Select and Enterprise repositories for
  organization accounts, including purchasing, adding repositories, and
  deactivating
keywords: dhi select, dhi enterprise, docker hardened images, hardened images,
  repositories, organization subscription, secure images
@z

@x
[Docker Hardened Images (DHI)](/manuals/dhi/_index.md) are secure, minimal, production-ready container images maintained by Docker.
@y
[Docker Hardened Images (DHI)](manuals/dhi/_index.md) are secure, minimal, production-ready container images maintained by Docker.
@z

@x
- DHI Community is free and available to every developer.
- DHI Select is a paid plan for organizations that need compliance-ready images and SLA-backed patching. You can self-serve it in the billing portal.
- DHI Enterprise is for organizations with advanced security and customization requirements. To subscribe, <a href="https://www.docker.com/pricing/contact-sales/" id="dkr_docs_cs_plans_dhi_enterprise" class="link" rel="noopener">contact sales</a>.
@y
- DHI Community is free and available to every developer.
- DHI Select is a paid plan for organizations that need compliance-ready images and SLA-backed patching. You can self-serve it in the billing portal.
- DHI Enterprise is for organizations with advanced security and customization requirements. To subscribe, <a href="https://www.docker.com/pricing/contact-sales/" id="dkr_docs_cs_plans_dhi_enterprise" class="link" rel="noopener">contact sales</a>.
@z

@x
For a full plan comparison, see the [Docker pricing page](https://www.docker.com/pricing/).
@y
For a full plan comparison, see the [Docker pricing page](https://www.docker.com/pricing/).
@z

@x
## Usage
@y
## Usage
@z

@x
DHI Community gives you access to hardened base images from a public registry at no cost or additional setup. Any organization can pull hardened base images directly from `dhi.io`.
@y
DHI Community gives you access to hardened base images from a public registry at no cost or additional setup. Any organization can pull hardened base images directly from `dhi.io`.
@z

@x
When you upgrade from DHI Community to DHI Select, you purchase a set number of repositories that are mirrored into your organization's namespace. Entitlements are scoped to the organization account that you assign them to during checkout. All organization members can then pull from those mirrored repositories.
@y
When you upgrade from DHI Community to DHI Select, you purchase a set number of repositories that are mirrored into your organization's namespace. Entitlements are scoped to the organization account that you assign them to during checkout. All organization members can then pull from those mirrored repositories.
@z

@x
DHI Enterprise extends DHI Select with unlimited customizations, optional full catalog access, the Hardened System Packages repository, and an Extended Lifecycle Support add-on.
@y
DHI Enterprise extends DHI Select with unlimited customizations, optional full catalog access, the Hardened System Packages repository, and an Extended Lifecycle Support add-on.
@z

@x
For details on setting up and managing repositories, see [Get started with DHI Select and Enterprise](/manuals/dhi/how-to/select-enterprise.md).
@y
For details on setting up and managing repositories, see [Get started with DHI Select and Enterprise](manuals/dhi/how-to/select-enterprise.md).
@z

@x
## Billing cycle
@y
## Billing cycle
@z

@x
DHI Select is an annual plan billed per repository from the date your plan starts. Repositories added mid-cycle are prorated for the remainder of the billing period. You can add more repositories to your DHI Select plan by going to **Active plans** in the billing portal. For steps, see [Manage plans](../manage.md#upgrade-plans).
@y
DHI Select is an annual plan billed per repository from the date your plan starts. Repositories added mid-cycle are prorated for the remainder of the billing period. You can add more repositories to your DHI Select plan by going to **Active plans** in the billing portal. For steps, see [Manage plans](../manage.md#upgrade-plans).
@z

@x
## Disable auto-renewal
@y
## Disable auto-renewal
@z

@x
If you want to revert your plan to DHI Community, you must disable auto-renewal. Disabling auto-renewal is deferred to the end of the current billing cycle and your repository access remains active until then. To disable auto-renewal:
@y
If you want to revert your plan to DHI Community, you must disable auto-renewal. Disabling auto-renewal is deferred to the end of the current billing cycle and your repository access remains active until then. To disable auto-renewal:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and go to **Billing**.
1. From **Active plans**, select **Manage** next to **Hardened Images**.
1. Select **Disable auto-renewal**.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and go to **Billing**.
1. From **Active plans**, select **Manage** next to **Hardened Images**.
1. Select **Disable auto-renewal**.
@z

@x
## Remove repositories
@y
## Remove repositories
@z

@x
You may also remove repositories from your plan. Repository removals are deferred to the end of the current billing cycle. You can remove repositories at any time, but you cannot stop a plan mid-cycle to receive a partial refund. Repository access remains active until the cycle ends.
@y
You may also remove repositories from your plan. Repository removals are deferred to the end of the current billing cycle. You can remove repositories at any time, but you cannot stop a plan mid-cycle to receive a partial refund. Repository access remains active until the cycle ends.
@z

@x
To remove repositories:
@y
To remove repositories:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and go to **Billing**.
1. From **Active plans**, select **Manage** next to **Hardened Images**.
    - Select **Remove repositories** to adjust your repository count.
    - To keep your current repository count after renewal, select **Cancel scheduled change**. 
    - Cancellations and repository removals take effect at the end of the current annual billing cycle.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and go to **Billing**.
1. From **Active plans**, select **Manage** next to **Hardened Images**.
    - Select **Remove repositories** to adjust your repository count.
    - To keep your current repository count after renewal, select **Cancel scheduled change**. 
    - Cancellations and repository removals take effect at the end of the current annual billing cycle.
@z

@x
If you're subscribed to DHI Enterprise, reach out to your sales representative to change your DHI plan.
@y
If you're subscribed to DHI Enterprise, reach out to your sales representative to change your DHI plan.
@z
