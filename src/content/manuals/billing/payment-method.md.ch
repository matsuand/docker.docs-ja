%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Add or update a payment method
@y
title: Add or update a payment method
@z

@x
description: Learn how to add or update a payment method in Docker Hub
keywords: payments, billing, subscription, supported payment methods, failed payments, add credit card, bank transfer, Stripe Link, payment failure
@y
description: Learn how to add or update a payment method in Docker Hub
keywords: payments, billing, subscription, supported payment methods, failed payments, add credit card, bank transfer, Stripe Link, payment failure
@z

@x
Docker supports different payment methods for your paid personal
account or organization. This page describes supported payment types, how to make payments from [Docker Home](https://app.docker.com/), and how to set up pay by invoice.
@y
Docker supports different payment methods for your paid personal
account or organization. This page describes supported payment types, how to make payments from [Docker Home](https://app.docker.com/), and how to set up pay by invoice.
@z

@x
## Supported payment types
@y
## Supported payment types
@z

@x
You can add a payment method or update your account's existing payment method
at any time. All charges are in United States dollars (USD). The following payment methods are supported:
@y
You can add a payment method or update your account's existing payment method
at any time. All charges are in United States dollars (USD). The following payment methods are supported:
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
## Prerequisites
@y
## Prerequisites
@z

@x
Certain payment methods require additional steps before selecting them as a payment method:
@y
Certain payment methods require additional steps before selecting them as a payment method:
@z

@x
- You must [verify a bank account](/manuals/billing/payment-method.md#verify-a-bank-account) before choosing a bank account.
- You must have a Docker Business or Docker Team plan to [pay by invoice](/manuals/billing/payment-method.md#enable-and-disable-pay-by-invoice).
- You must be an existing Stripe Link customer, or fill out the card information form to use Link payments.
@y
- You must [verify a bank account](manuals/billing/payment-method.md#verify-a-bank-account) before choosing a bank account.
- You must have a Docker Business or Docker Team plan to [pay by invoice](manuals/billing/payment-method.md#enable-and-disable-pay-by-invoice).
- You must be an existing Stripe Link customer, or fill out the card information form to use Link payments.
@z

@x
## Manage payment method
@y
## Manage payment method
@z

@x
Paid personal accounts and organizations follow the same procedures to add, update, or remove payment methods.
@y
Paid personal accounts and organizations follow the same procedures to add, update, or remove payment methods.
@z

@x
### Add payment method
@y
### Add payment method
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/).
1. Select your account name for personal accounts, or select your organization name for organization accounts.
1. Select **Billing**, then **Payment methods**.
1. Select **Add payment method** and enter your new payment information:
   - For first time setup, fill in your billing information.
   - To purchase as a business, provide your tax ID.
1. Choose to add a card, a US bank account, or a Link payment.
   - To pay with card, fill out the card information form.
   - To pay with a US bank account:
     - Verify your **Email** and **Full name**.
     - If your bank is listed, select your bank's name.
     - If your bank is not listed, select **Search for your bank**.
   - To pay through Link, select an existing payment and choose **Use this card**.
1. Finish adding the payment method by selecting **Add payment method**.
@y
1. Sign in to [Docker Home](https://app.docker.com/).
1. Select your account name for personal accounts, or select your organization name for organization accounts.
1. Select **Billing**, then **Payment methods**.
1. Select **Add payment method** and enter your new payment information:
   - For first time setup, fill in your billing information.
   - To purchase as a business, provide your tax ID.
1. Choose to add a card, a US bank account, or a Link payment.
   - To pay with card, fill out the card information form.
   - To pay with a US bank account:
     - Verify your **Email** and **Full name**.
     - If your bank is listed, select your bank's name.
     - If your bank is not listed, select **Search for your bank**.
   - To pay through Link, select an existing payment and choose **Use this card**.
1. Finish adding the payment method by selecting **Add payment method**.
@z

@x
### Set default payment method
@y
### Set default payment method
@z

@x
After adding one or more payment methods, you can set one as a default method.
@y
After adding one or more payment methods, you can set one as a default method.
@z

@x
1. From **Billing**, go to **Payment methods**.
1. Find the payment method you want to set as default from the **Payment method** table.
1. Select the three dots, then choose **Set as default**.
@y
1. From **Billing**, go to **Payment methods**.
1. Find the payment method you want to set as default from the **Payment method** table.
1. Select the three dots, then choose **Set as default**.
@z

@x
### Remove payment method
@y
### Remove payment method
@z

@x
To remove a single payment method:
@y
To remove a single payment method:
@z

@x
1. From **Billing**, go to **Payment methods**.
1. Find the payment method you want to remove from the **Payment method** table.
1. Select the three dots, then choose **Remove**.
@y
1. From **Billing**, go to **Payment methods**.
1. Find the payment method you want to remove from the **Payment method** table.
1. Select the three dots, then choose **Remove**.
@z

@x
To remove your default payment method, first set a different payment method as default, or [downgrade to a free subscription](/manuals/subscription/change.md).
@y
To remove your default payment method, first set a different payment method as default, or [downgrade to a free subscription](manuals/subscription/change.md).
@z

@x
## Enable and disable pay by invoice
@y
## Enable and disable pay by invoice
@z

@x
> [!TIP]
> Do you need to pay by invoice? [Upgrade to a Docker Business or Docker Team plan](https://www.docker.com/pricing?ref=Docs&refAction=DocsBillingPaymentMethod) and choose the annual subscription.
@y
> [!TIP]
> Do you need to pay by invoice? [Upgrade to a Docker Business or Docker Team plan](https://www.docker.com/pricing?ref=Docs&refAction=DocsBillingPaymentMethod) and choose the annual subscription.
@z

@x
Pay by invoice requires you to pay upfront for your first subscription period using a payment card or ACH bank transfer. At renewal time, instead of automatic payment, you'll receive an invoice via
email that you must pay manually.
@y
Pay by invoice requires you to pay upfront for your first subscription period using a payment card or ACH bank transfer. At renewal time, instead of automatic payment, you'll receive an invoice via
email that you must pay manually.
@z

@x
Follow these steps to enable or disable pay by invoice:
@y
Follow these steps to enable or disable pay by invoice:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
2. Select **Billing**, then **Payment methods**.
3. Select **Pay by invoice**, then select the pay by invoice toggle to enable or disable.
4. Confirm your billing contact details. If you need to change them, select
   **Change** and enter your new details.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
2. Select **Billing**, then **Payment methods**.
3. Select **Pay by invoice**, then select the pay by invoice toggle to enable or disable.
4. Confirm your billing contact details. If you need to change them, select
   **Change** and enter your new details.
@z

@x
Pay by invoice is not available for
subscription upgrades or changes.
@y
Pay by invoice is not available for
subscription upgrades or changes.
@z

@x
## Verify a bank account
@y
## Verify a bank account
@z

@x
There are two ways to verify a bank account as a payment method:
@y
There are two ways to verify a bank account as a payment method:
@z

@x
- Instant verification: Docker supports several major banks for instant
  verification.
- Manual verification: All other banks must be verified manually.
@y
- Instant verification: Docker supports several major banks for instant
  verification.
- Manual verification: All other banks must be verified manually.
@z

@x
### Instant verification
@y
### Instant verification
@z

@x
To verify your bank account instantly, you must sign in to your bank account
from the Docker billing flow:
@y
To verify your bank account instantly, you must sign in to your bank account
from the Docker billing flow:
@z

@x
1. Choose **US bank account** as your payment method.
1. Verify your **Email** and **Full name**.
1. If your bank is listed, select your bank's name or
   select **Search for your bank**.
1. Sign in to your bank and review the terms and conditions. This agreement
   allows Docker to debit payments from your connected bank account.
1. Select **Agree and continue**.
1. Select an account to link and verify, and select **Connect account**.
@y
1. Choose **US bank account** as your payment method.
1. Verify your **Email** and **Full name**.
1. If your bank is listed, select your bank's name or
   select **Search for your bank**.
1. Sign in to your bank and review the terms and conditions. This agreement
   allows Docker to debit payments from your connected bank account.
1. Select **Agree and continue**.
1. Select an account to link and verify, and select **Connect account**.
@z

@x
When the account is verified, you will see a success message in the pop-up
modal.
@y
When the account is verified, you will see a success message in the pop-up
modal.
@z

@x
### Manual verification
@y
### Manual verification
@z

@x
To verify your bank account manually, you must enter the micro-deposit amount
from your bank statement:
@y
To verify your bank account manually, you must enter the micro-deposit amount
from your bank statement:
@z

@x
1. Choose **US bank account** as your payment method.
1. Verify your **Email** and **First and last name**.
1. Select **Enter bank details manually instead**.
1. Enter your bank details: **Routing number** and **Account number**.
1. Select **Submit**.
1. You will receive an email with instructions on how to manually verify.
@y
1. Choose **US bank account** as your payment method.
1. Verify your **Email** and **First and last name**.
1. Select **Enter bank details manually instead**.
1. Enter your bank details: **Routing number** and **Account number**.
1. Select **Submit**.
1. You will receive an email with instructions on how to manually verify.
@z

@x
Manual verification uses micro-deposits. You’ll see a small deposit
(such as $0.01) in your bank account within 1–2 business days. Open your manual
verification email and enter the amount of this deposit to verify your account.
@y
Manual verification uses micro-deposits. You’ll see a small deposit
(such as $0.01) in your bank account within 1–2 business days. Open your manual
verification email and enter the amount of this deposit to verify your account.
@z

@x
## Failed payments
@y
## Failed payments
@z

@x
If your payment fails, select **Pay now**. This redirects you from Docker Hub so you can manually retry the payment through Stripe.
@y
If your payment fails, select **Pay now**. This redirects you from Docker Hub so you can manually retry the payment through Stripe.
@z

@x
You have a grace period of 15 days
including the due date when your payment fails. Docker retries to collect the payment 3 times using the
following schedule:
@y
You have a grace period of 15 days
including the due date when your payment fails. Docker retries to collect the payment 3 times using the
following schedule:
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
`Action Required - Credit Card Payment Failed` with an attached unpaid invoice
after each failed payment attempt.
@y
Docker also sends an email notification
`Action Required - Credit Card Payment Failed` with an attached unpaid invoice
after each failed payment attempt.
@z

@x
Once the grace period is over and the invoice is still not paid, the
subscription downgrades to a free subscription and all paid features are
disabled.
@y
Once the grace period is over and the invoice is still not paid, the
subscription downgrades to a free subscription and all paid features are
disabled.
@z
