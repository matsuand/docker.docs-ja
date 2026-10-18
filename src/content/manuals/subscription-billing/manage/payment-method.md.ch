%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Add or update a payment method
linkTitle: Payment methods
@y
title: Add or update a payment method
linkTitle: Payment methods
@z

@x
description: >-
  Manage cards, US bank accounts, and Stripe Link in Docker Home, and choose
  pay by invoice when you subscribe an organization to an annual plan.
keywords: payments, billing, subscription, payment methods, credit card, ACH,
  US bank account, Stripe Link, pay by invoice, annual renewal, failed
  payments, organization billing
@y
description: >-
  Manage cards, US bank accounts, and Stripe Link in Docker Home, and choose
  pay by invoice when you subscribe an organization to an annual plan.
keywords: payments, billing, subscription, payment methods, credit card, ACH,
  US bank account, Stripe Link, pay by invoice, annual renewal, failed
  payments, organization billing
@z

@x
Docker supports several payment methods for paid personal accounts and
organizations. This page describes supported payment types, how to manage
payments from [Docker Home](https://app.docker.com/), and how to set up pay
by invoice.
@y
Docker supports several payment methods for paid personal accounts and
organizations. This page describes supported payment types, how to manage
payments from [Docker Home](https://app.docker.com/), and how to set up pay
by invoice.
@z

@x
## Supported payment types
@y
## Supported payment types
@z

@x
You can add or update a payment method at any time. All charges are in United
States dollars (USD). Docker supports the following payment methods:
@y
You can add or update a payment method at any time. All charges are in United
States dollars (USD). Docker supports the following payment methods:
@z

@x
| Category      | Payment type                                                            |
| ------------- | ----------------------------------------------------------------------- |
| Cards         | Visa, MasterCard, American Express, Discover, JCB, Diners, UnionPay     |
| Wallets       | Stripe Link                                                             |
| Bank accounts | Automated Clearing House (ACH) transfer with a verified US bank account |
@y
| Category      | Payment type                                                            |
| ------------- | ----------------------------------------------------------------------- |
| Cards         | Visa, MasterCard, American Express, Discover, JCB, Diners, UnionPay     |
| Wallets       | Stripe Link                                                             |
| Bank accounts | Automated Clearing House (ACH) transfer with a verified US bank account |
@z

@x
Some payment methods need extra setup before you can set them as default. For
example:
@y
Some payment methods need extra setup before you can set them as default. For
example:
@z

@x
- Verify a
  [bank account](#verify-a-bank-account) before choosing it as a payment
  method.
- Use an existing Stripe Link account, or enter your card information to set
  up Stripe Link.
@y
- Verify a
  [bank account](#verify-a-bank-account) before choosing it as a payment
  method.
- Use an existing Stripe Link account, or enter your card information to set
  up Stripe Link.
@z

@x
## Manage payment method
@y
## Manage payment method
@z

@x
Paid personal accounts and organizations follow the same procedures to add,
update, or remove payment methods.
@y
Paid personal accounts and organizations follow the same procedures to add,
update, or remove payment methods.
@z

@x
### Add payment method
@y
### Add payment method
@z

@x
You can add multiple payment methods in the billing portal. When you add a
new payment method, you set it as the default.
@y
You can add multiple payment methods in the billing portal. When you add a
new payment method, you set it as the default.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/).
1. Select your username for a personal account, or select your organization
   name for an organization.
1. Select **Billing** to go to the billing portal, then **Change** in the
   **Payment method** tile.
1. From the **Change payment method** modal, choose to add a card, a US bank
   account, or a Stripe Link payment.
   - To pay with a card, enter your card information.
   - To pay with a US bank account, verify your **Email** and **Full name**.
     - If your bank is listed, select your bank's name.
     - If your bank is not listed, select **Search for your bank**.
   - To pay through Stripe Link, select an existing payment method, then
     select **Use this card**.
1. For first-time setup, enter your billing information.
1. Finish adding the payment method by selecting **Save as default**.
@y
1. Sign in to [Docker Home](https://app.docker.com/).
1. Select your username for a personal account, or select your organization
   name for an organization.
1. Select **Billing** to go to the billing portal, then **Change** in the
   **Payment method** tile.
1. From the **Change payment method** modal, choose to add a card, a US bank
   account, or a Stripe Link payment.
   - To pay with a card, enter your card information.
   - To pay with a US bank account, verify your **Email** and **Full name**.
     - If your bank is listed, select your bank's name.
     - If your bank is not listed, select **Search for your bank**.
   - To pay through Stripe Link, select an existing payment method, then
     select **Use this card**.
1. For first-time setup, enter your billing information.
1. Finish adding the payment method by selecting **Save as default**.
@z

@x
### Change default payment method
@y
### Change default payment method
@z

@x
After adding one or more payment methods, you can set one as a default
method.
@y
After adding one or more payment methods, you can set one as a default
method.
@z

@x
1. From **Billing**, go to the **Payment method** tile.
1. Select **Change** to open the **Change payment method** modal, then select
   **Change** next to your current default method.
1. Choose the payment method you want to set as default.
1. Verify your information, then select **Save as default**.
@y
1. From **Billing**, go to the **Payment method** tile.
1. Select **Change** to open the **Change payment method** modal, then select
   **Change** next to your current default method.
1. Choose the payment method you want to set as default.
1. Verify your information, then select **Save as default**.
@z

@x
### Remove payment method
@y
### Remove payment method
@z

@x
You can only remove secondary payment methods. To remove a secondary payment
method:
@y
You can only remove secondary payment methods. To remove a secondary payment
method:
@z

@x
1. From **Billing**, go to the **Payment method** tile.
1. Select **Change** to open the **Change payment method** modal.
1. Select the **Actions** menu next to the payment method you want to remove,
   then select **Remove**.
1. Verify your billing details, then select **Save as default**.
@y
1. From **Billing**, go to the **Payment method** tile.
1. Select **Change** to open the **Change payment method** modal.
1. Select the **Actions** menu next to the payment method you want to remove,
   then select **Remove**.
1. Verify your billing details, then select **Save as default**.
@z

@x
To remove your default payment method, first set a different payment method
as default, or
[downgrade to a free subscription](/manuals/subscription-billing/plans/docker.md#cancel-a-docker-plan).
@y
To remove your default payment method, first set a different payment method
as default, or
[downgrade to a free subscription](manuals/subscription-billing/plans/docker.md#cancel-a-docker-plan).
@z

@x
## Pay by invoice
@y
## Pay by invoice
@z

@x
> [!TIP]
>
> Pay by invoice is available when you subscribe an organization to an
> [annual Docker Team or Docker Business plan](https://www.docker.com/pricing?ref=Docs&refAction=DocsBillingPaymentMethod).
@y
> [!TIP]
>
> Pay by invoice is available when you subscribe an organization to an
> [annual Docker Team or Docker Business plan](https://www.docker.com/pricing?ref=Docs&refAction=DocsBillingPaymentMethod).
@z

@x
Pay by invoice means you pay for the first subscription period with a card or
ACH bank transfer. At renewal, Docker emails an invoice to pay manually
instead of charging your default payment method automatically.
@y
Pay by invoice means you pay for the first subscription period with a card or
ACH bank transfer. At renewal, Docker emails an invoice to pay manually
instead of charging your default payment method automatically.
@z

@x
You choose this option during organization subscribe checkout. It isn't
available when you upgrade or change an existing subscription.
@y
You choose this option during organization subscribe checkout. It isn't
available when you upgrade or change an existing subscription.
@z

@x
1. Start an annual organization subscription in
   [Docker Home](https://app.docker.com/).
1. On the payment page, select **Pay by invoice for future renewals**.
1. Complete checkout with a card or US bank account for the first period.
@y
1. Start an annual organization subscription in
   [Docker Home](https://app.docker.com/).
1. On the payment page, select **Pay by invoice for future renewals**.
1. Complete checkout with a card or US bank account for the first period.
@z

@x
If Docker manages your subscription through sales, contact your Docker sales
representative to change how renewals are collected.
@y
If Docker manages your subscription through sales, contact your Docker sales
representative to change how renewals are collected.
@z

@x
## Verify a bank account
@y
## Verify a bank account
@z

@x
You can verify your bank account with instant verification for supported
banks. You must sign in to your US bank account when adding your bank as a
payment method:
@y
You can verify your bank account with instant verification for supported
banks. You must sign in to your US bank account when adding your bank as a
payment method:
@z

@x
1. From **Billing**, go to the **Payment method** tile and select **Change**.
1. Choose **US bank account** as your payment method.
1. Verify your **Email** and **Full name**.
1. Search for your bank, then select it to initiate the sign-in flow.
1. Review the terms and conditions. This agreement lets Docker debit
   payments from your connected bank account.
1. Select **Agree and continue**.
1. Select an account to link and verify, then select **Connect account**.
@y
1. From **Billing**, go to the **Payment method** tile and select **Change**.
1. Choose **US bank account** as your payment method.
1. Verify your **Email** and **Full name**.
1. Search for your bank, then select it to initiate the sign-in flow.
1. Review the terms and conditions. This agreement lets Docker debit
   payments from your connected bank account.
1. Select **Agree and continue**.
1. Select an account to link and verify, then select **Connect account**.
@z

@x
When the account is verified, a success message appears.
@y
When the account is verified, a success message appears.
@z

@x
## Failed payments
@y
## Failed payments
@z

@x
If your payment fails, select **Pay now** to retry the payment through
Stripe.
@y
If your payment fails, select **Pay now** to retry the payment through
Stripe.
@z

@x
You have a grace period of 15 days, including the due date, when your payment
fails. Docker attempts to collect the payment three times using the following
schedule:
@y
You have a grace period of 15 days, including the due date, when your payment
fails. Docker attempts to collect the payment three times using the following
schedule:
@z

@x
- 3 days after the due date
- 5 days after the previous attempt
- 7 days after the previous attempt
@y
- 3 days after the due date
- 5 days after the previous attempt
- 7 days after the previous attempt
@z

@x
Docker also sends an email notification
`Action Required - Credit Card Payment Failed` with an attached unpaid
invoice after each failed payment attempt.
@y
Docker also sends an email notification
`Action Required - Credit Card Payment Failed` with an attached unpaid
invoice after each failed payment attempt.
@z

@x
If the invoice remains unpaid after the grace period, the subscription
downgrades to a free subscription and all paid features are disabled.
@y
If the invoice remains unpaid after the grace period, the subscription
downgrades to a free subscription and all paid features are disabled.
@z
