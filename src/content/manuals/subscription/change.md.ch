%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Change your subscription
description: Upgrade or downgrade your Docker subscription and understand billing changes
keywords: upgrade subscription, downgrade subscription, docker pricing, subscription changes
@y
title: Change your subscription
description: Upgrade or downgrade your Docker subscription and understand billing changes
keywords: upgrade subscription, downgrade subscription, docker pricing, subscription changes
@z

@x
You can upgrade or downgrade your Docker subscription at any time to match your changing needs. This page explains how to make subscription changes and what to expect with billing and feature access.
@y
You can upgrade or downgrade your Docker subscription at any time to match your changing needs. This page explains how to make subscription changes and what to expect with billing and feature access.
@z

@x
## Upgrade your subscription
@y
## Upgrade your subscription
@z

@x
When you upgrade your Docker subscription, you immediately get access to all features and entitlements in your new subscription tier.
@y
When you upgrade your Docker subscription, you immediately get access to all features and entitlements in your new subscription tier.
@z

@x
For detailed feature information, see [Docker Pricing](https://www.docker.com/pricing?ref=Docs&refAction=DocsSubscriptionChange).
@y
For detailed feature information, see [Docker Pricing](https://www.docker.com/pricing?ref=Docs&refAction=DocsSubscriptionChange).
@z

@x
To upgrade your subscription:
@y
To upgrade your subscription:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select the organization
   you want to upgrade.
1. Select **Billing**.
1. Optional. If you're upgrading from a free Personal subscription to a Team subscription and want to keep your username, [convert your user account into an organization](../admin/organization/convert-account.md).
1. Select **Upgrade**.
1. Follow the on-screen instructions to complete your upgrade. If you choose to pay using a US bank account, you must verify the account. For more information, see [Verify a bank account](/manuals/billing/payment-method.md#verify-a-bank-account).
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select the organization
   you want to upgrade.
1. Select **Billing**.
1. Optional. If you're upgrading from a free Personal subscription to a Team subscription and want to keep your username, [convert your user account into an organization](../admin/organization/convert-account.md).
1. Select **Upgrade**.
1. Follow the on-screen instructions to complete your upgrade. If you choose to pay using a US bank account, you must verify the account. For more information, see [Verify a bank account](manuals/billing/payment-method.md#verify-a-bank-account).
@z

@x
## Downgrade your subscription
@y
## Downgrade your subscription
@z

@x
You can downgrade your Docker subscription at any time before the renewal date. The unused portion isn't refundable, but you retain access to paid features until the next billing cycle.
@y
You can downgrade your Docker subscription at any time before the renewal date. The unused portion isn't refundable, but you retain access to paid features until the next billing cycle.
@z

@x
### Downgrade considerations
@y
### Downgrade considerations
@z

@x
Consider the following before downgrading:
@y
Consider the following before downgrading:
@z

@x
- Team size and repositories: You may need to reduce team members and convert private repositories to public or delete them based on your new subscription limits.
- SSO and SCIM: If downgrading from Docker Business and your organization uses single sign-on, remove your SSO connection and verified domains first. Organization members who were auto-provisioned through SCIM need to reset their passwords to sign in without SSO.
- Private repository collaborators: Personal subscriptions don't include collaborators for private repositories. When downgrading from Pro to Personal, all collaborators are removed and additional private repositories are locked.
@y
- Team size and repositories: You may need to reduce team members and convert private repositories to public or delete them based on your new subscription limits.
- SSO and SCIM: If downgrading from Docker Business and your organization uses single sign-on, remove your SSO connection and verified domains first. Organization members who were auto-provisioned through SCIM need to reset their passwords to sign in without SSO.
- Private repository collaborators: Personal subscriptions don't include collaborators for private repositories. When downgrading from Pro to Personal, all collaborators are removed and additional private repositories are locked.
@z

@x
For feature limits in each tier, see [Docker Pricing](https://www.docker.com/pricing?ref=Docs&refAction=DocsSubscriptionChange).
@y
For feature limits in each tier, see [Docker Pricing](https://www.docker.com/pricing?ref=Docs&refAction=DocsSubscriptionChange).
@z

@x
To downgrade your subscription:
@y
To downgrade your subscription:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select
   the organization you want to downgrade.
1. Select **Billing**.
1. Select the action icon and then **Cancel subscription**.
1. Fill out the feedback survey to continue with cancellation.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select
   the organization you want to downgrade.
1. Select **Billing**.
1. Select the action icon and then **Cancel subscription**.
1. Fill out the feedback survey to continue with cancellation.
@z

@x
> [!IMPORTANT]
>
> If you have a sales-assisted Docker Business subscription, contact your account manager to downgrade your subscription.
@y
> [!IMPORTANT]
>
> If you have a sales-assisted Docker Business subscription, contact your account manager to downgrade your subscription.
@z

@x
## Subscription pause policy
@y
## Subscription pause policy
@z

@x
You can't pause or delay a subscription. If a subscription invoice isn't paid by the due date, there's a 15-day grace period starting from the due date.
@y
You can't pause or delay a subscription. If a subscription invoice isn't paid by the due date, there's a 15-day grace period starting from the due date.
@z
