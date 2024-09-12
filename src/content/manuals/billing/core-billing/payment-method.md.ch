%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Add or update a payment method
weight: 20
description: Learn how to add or update a payment method in Docker Hub
keywords: payments, billing, subscription, supported payment methods, failed payments, coupons
billing:
- /billing/payment-method/
---
@y
---
title: Add or update a payment method
weight: 20
description: Learn how to add or update a payment method in Docker Hub
keywords: payments, billing, subscription, supported payment methods, failed payments, coupons
billing:
- /billing/payment-method/
---
@z

@x
{{< include "tax-compliance.md" >}}
@y
{{< include "tax-compliance.md" >}}
@z

@x
This page describes how to add or update a payment method for your personal account or for an organization.
@y
This page describes how to add or update a payment method for your personal account or for an organization.
@z

@x
You can add a payment method or update your account's existing payment method at any time.
@y
You can add a payment method or update your account's existing payment method at any time.
@z

@x
>**Important**
>
> If you want to remove all payment methods, you must first downgrade your subscription to a free plan. See [Downgrade](../../subscription/core-subscription/downgrade.md).
@y
>**Important**
>
> If you want to remove all payment methods, you must first downgrade your subscription to a free plan. See [Downgrade](../../subscription/core-subscription/downgrade.md).
@z

@x
The following payment methods are supported:
@y
The following payment methods are supported:
@z

@x
- Visa
- MasterCard
- American Express
- Discover
- JCB
- Diners
- UnionPay
@y
- Visa
- MasterCard
- American Express
- Discover
- JCB
- Diners
- UnionPay
@z

@x
All currency, for example the amount listed on your billing invoice, is in United States dollar (USD).
@y
All currency, for example the amount listed on your billing invoice, is in United States dollar (USD).
@z

@x
## Manage payment method
@y
## Manage payment method
@z

@x
### Personal account
@y
### Personal account
@z

@x
1. Select your avatar in the top-right corner of Docker Hub.
2. From the drop-down menu select **Billing**.
3. Select the **Payment methods and billing history** link.
4. In the **Payment method** section, select **Add payment method**.
5. Enter your new payment information, then select **Add**.
6. Select the **Actions** icon, then select **Make default** to ensure that your new payment method applies to all purchases and subscriptions.
7. Optional. You can remove non-default payment methods by selecting the **Actions** icon. Then, select **Delete**.
@y
1. Select your avatar in the top-right corner of Docker Hub.
2. From the drop-down menu select **Billing**.
3. Select the **Payment methods and billing history** link.
4. In the **Payment method** section, select **Add payment method**.
5. Enter your new payment information, then select **Add**.
6. Select the **Actions** icon, then select **Make default** to ensure that your new payment method applies to all purchases and subscriptions.
7. Optional. You can remove non-default payment methods by selecting the **Actions** icon. Then, select **Delete**.
@z

@x
### Organization
@y
### Organization
@z

@x
> [!NOTE]
>
> You must be an organization owner to make changes to the payment information.
@y
> [!NOTE]
>
> You must be an organization owner to make changes to the payment information.
@z

@x
1. Select your avatar in the top-right corner of Docker Hub.
2. From the drop-down menu select **Billing**.
3. Select the organization account you want to update.
4. Select the **Payment methods and billing history** link.
5. In the **Payment Method** section, select **Add payment method**.
6. Enter your new payment information, then select **Add**.
7. Select the **Actions** icon, then select **Make default** to ensure that your new payment method applies to all purchases and subscriptions.
8. Optional. You can remove non-default payment methods by selecting the **Actions** icon. Then, select **Delete**.
@y
1. Select your avatar in the top-right corner of Docker Hub.
2. From the drop-down menu select **Billing**.
3. Select the organization account you want to update.
4. Select the **Payment methods and billing history** link.
5. In the **Payment Method** section, select **Add payment method**.
6. Enter your new payment information, then select **Add**.
7. Select the **Actions** icon, then select **Make default** to ensure that your new payment method applies to all purchases and subscriptions.
8. Optional. You can remove non-default payment methods by selecting the **Actions** icon. Then, select **Delete**.
@z

@x
## Failed payments
@y
## Failed payments
@z

@x
If your subscription payment fails, there is a grace period of 15 days, including the due date. Docker retries to collect the payment 3 times using the following schedule:
@y
If your subscription payment fails, there is a grace period of 15 days, including the due date. Docker retries to collect the payment 3 times using the following schedule:
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
Docker also sends an email notification `Action Required - Credit Card Payment Failed` with an attached unpaid invoice after each failed payment attempt. 
@y
Docker also sends an email notification `Action Required - Credit Card Payment Failed` with an attached unpaid invoice after each failed payment attempt. 
@z

@x
Once the grace period is over and the invoice is still not paid, the subscription downgrades to a free plan and all paid features are disabled.
@y
Once the grace period is over and the invoice is still not paid, the subscription downgrades to a free plan and all paid features are disabled.
@z

@x
## Redeem a coupon
@y
## Redeem a coupon
@z

@x
You can redeem a coupon for any paid Docker subscription.
@y
You can redeem a coupon for any paid Docker subscription.
@z

@x
A coupon can be used when you:
- Sign up to a new paid subscription from a free subscription
- Upgrade an existing paid subscription
@y
A coupon can be used when you:
- Sign up to a new paid subscription from a free subscription
- Upgrade an existing paid subscription
@z

@x
You are asked to enter your coupon code when you confirm or enter your payment method.
@y
You are asked to enter your coupon code when you confirm or enter your payment method.
@z

@x
If you use a coupon to pay for a subscription, when the coupon expires, your payment method is charged the full cost of your subscription. If you don't have a saved payment method, your account downgrades to a free subscription.
@y
If you use a coupon to pay for a subscription, when the coupon expires, your payment method is charged the full cost of your subscription. If you don't have a saved payment method, your account downgrades to a free subscription.
@z
