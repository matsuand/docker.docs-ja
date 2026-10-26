%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Manage billing
linkTitle: Manage
description: >-
  Review Billing in Docker Home: plans, payment methods, invoices, usage,
  costs, credits, and billing details, and what you can do on each page.
keywords: billing, docker home, billing overview, manage plans, payment
  methods, invoices, usage, costs, credits, billing settings, subscription
  totals, taxes, docker subscription
@y
title: Manage billing
linkTitle: Manage
description: >-
  Review Billing in Docker Home: plans, payment methods, invoices, usage,
  costs, credits, and billing details, and what you can do on each page.
keywords: billing, docker home, billing overview, manage plans, payment
  methods, invoices, usage, costs, credits, billing settings, subscription
  totals, taxes, docker subscription
@z

% grid:

@x
  - title: Manage plans
    description: Add a new plan, upgrade an active plan, or cancel auto-renewal.
    icon: shopping-cart
    link: /subscription-billing/manage/plans/
@y
  - title: Manage plans
    description: Add a new plan, upgrade an active plan, or cancel auto-renewal.
    icon: shopping-cart
    link: __SUBDIR__/subscription-billing/manage/plans/
@z

@x
  - title: Add or update a payment method
    description: >-
      Add or update a payment method for your individual account or
      organization.
    icon: credit-card
    link: /subscription-billing/manage/payment-method/
@y
  - title: Add or update a payment method
    description: >-
      Add or update a payment method for your individual account or
      organization.
    icon: credit-card
    link: __SUBDIR__/subscription-billing/manage/payment-method/
@z

@x
  - title: Update billing information
    description: >-
      Update billing information for your individual account or
      organization.
    icon: pencil-square
    link: /subscription-billing/manage/details/
@y
  - title: Update billing information
    description: >-
      Update billing information for your individual account or
      organization.
    icon: pencil-square
    link: __SUBDIR__/subscription-billing/manage/details/
@z

@x
  - title: Invoices
    description: View billing history and download past invoices.
    icon: receipt-percent
    link: /subscription-billing/manage/history/
@y
  - title: Invoices
    description: View billing history and download past invoices.
    icon: receipt-percent
    link: __SUBDIR__/subscription-billing/manage/history/
@z

@x
  - title: 3D Secure authentication
    description: >-
      Learn how 3DS works and how to troubleshoot verification issues.
    icon: wallet
    link: /subscription-billing/manage/3d-secure/
@y
  - title: 3D Secure authentication
    description: >-
      Learn how 3DS works and how to troubleshoot verification issues.
    icon: wallet
    link: __SUBDIR__/subscription-billing/manage/3d-secure/
@z

@x
  - title: Taxes
    description: Submit a US tax exemption certificate or add a VAT number.
    icon: document-text
    link: /subscription-billing/manage/tax-certificate/
@y
  - title: Taxes
    description: Submit a US tax exemption certificate or add a VAT number.
    icon: document-text
    link: __SUBDIR__/subscription-billing/manage/tax-certificate/
@z

@x
You manage Docker plans, payment methods, invoices, usage, costs, credits, and
billing details from **Billing** in Docker Home. Billing applies to the
account you select, either your individual account or an organization.
@y
You manage Docker plans, payment methods, invoices, usage, costs, credits, and
billing details from **Billing** in Docker Home. Billing applies to the
account you select, either your individual account or an organization.
@z

@x
For an organization, you must be an organization owner, or have a
[custom role](/manuals/security/roles-and-permissions/custom-roles/permissions-reference.md#billing)
with the **View billing** or **Manage billing** permission. Without it, Docker
Home shows **No access to billing**.
@y
For an organization, you must be an organization owner, or have a
[custom role](manuals/security/roles-and-permissions/custom-roles/permissions-reference.md#billing)
with the **View billing** or **Manage billing** permission. Without it, Docker
Home shows **No access to billing**.
@z

@x
## Overview
@y
## Overview
@z

@x
**Overview** is the Billing home. It shows the default payment method, a tile
for each active plan, and your subscription totals with the next charge date.
The page also shows:
@y
**Overview** is the Billing home. It shows the default payment method, a tile
for each active plan, and your subscription totals with the next charge date.
The page also shows:
@z

@x
* **Monthly subscriptions** when you have a monthly plan
* **Annual subscriptions** when you have an annual plan
* An alert for a
  [failed payment](/manuals/subscription-billing/manage/payment-method.md#failed-payments)
  or a
  [bank account waiting for verification](/manuals/subscription-billing/manage/payment-method.md#verify-a-bank-account)
@y
* **Monthly subscriptions** when you have a monthly plan
* **Annual subscriptions** when you have an annual plan
* An alert for a
  [failed payment](manuals/subscription-billing/manage/payment-method.md#failed-payments)
  or a
  [bank account waiting for verification](manuals/subscription-billing/manage/payment-method.md#verify-a-bank-account)
@z

@x
> [!TIP]
>
> If Docker sales manages your subscription, the sidebar shows **Overview**
> only. Contact your Docker sales representative to renew, make changes, or
> request invoices.
@y
> [!TIP]
>
> If Docker sales manages your subscription, the sidebar shows **Overview**
> only. Contact your Docker sales representative to renew, make changes, or
> request invoices.
@z

@x
## Invoices
@y
## Invoices
@z

@x
**Invoices** lists every invoice with its date, number, description, status,
and amount. You can open an invoice or download a PDF when your Docker account
has a verified email address.
@y
**Invoices** lists every invoice with its date, number, description, status,
and amount. You can open an invoice or download a PDF when your Docker account
has a verified email address.
@z

@x
## Usage
@y
## Usage
@z

@x
**Usage** charts usage-based charges across billing periods. You can filter
by period, product, and meter, and export a CSV.
@y
**Usage** charts usage-based charges across billing periods. You can filter
by period, product, and meter, and export a CSV.
@z

@x
Plans that report usage appear here, including Docker Build Cloud minutes,
Testcontainers Cloud minutes, and Docker Agentic Platform compute. With no
usage-based plan, the page shows **No usage-based products**. See
[Plans](/manuals/subscription-billing/plans/_index.md#choose-a-plan)
for which plans are metered.
@y
Plans that report usage appear here, including Docker Build Cloud minutes,
Testcontainers Cloud minutes, and Docker Agentic Platform compute. With no
usage-based plan, the page shows **No usage-based products**. See
[Plans](manuals/subscription-billing/plans/_index.md#choose-a-plan)
for which plans are metered.
@z

@x
## Costs
@y
## Costs
@z

@x
**Costs** shows charges for one billing period, grouped by the product each
charge is for. The page labels that column **Resource**. You can switch
billing periods and export a CSV. Costs also shows:
@y
**Costs** shows charges for one billing period, grouped by the product each
charge is for. The page labels that column **Resource**. You can switch
billing periods and export a CSV. Costs also shows:
@z

@x
* Period status
* Amounts excluding tax
* **Cost to date** for the current period
* The subtotal for a closed period
* Credits, when the account has them
@y
* Period status
* Amounts excluding tax
* **Cost to date** for the current period
* The subtotal for a closed period
* Credits, when the account has them
@z

@x
An invoice total can differ, because the invoice adds tax and any credits.
@y
An invoice total can differ, because the invoice adds tax and any credits.
@z

@x
## Credits
@y
## Credits
@z

@x
**Credits** shows the credit balances for your products. Open a balance to
see each grant and its remaining amount. Docker applies these balances to
your costs at the end of the billing period.
@y
**Credits** shows the credit balances for your products. Open a balance to
see each grant and its remaining amount. Docker applies these balances to
your costs at the end of the billing period.
@z

@x
## Settings
@y
## Settings
@z

@x
**Settings** shows the default payment method, billing address, tax ID, and
billing email. You can update the payment method, address, or billing email
on this page.
@y
**Settings** shows the default payment method, billing address, tax ID, and
billing email. You can update the payment method, address, or billing email
on this page.
@z

@x
## Next steps
@y
## Next steps
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
