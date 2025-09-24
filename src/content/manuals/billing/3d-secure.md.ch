%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Use 3D Secure authentication for Docker billing
linkTitle: 3D Secure authentication
description: Docker billing supports 3D Secure (3DS) for secure payment authentication. Learn how 3DS works with Docker subscriptions.
keywords: billing, renewal, payments, subscriptions, 3DS, credit card verification, secure payments, Docker billing security
@y
title: Use 3D Secure authentication for Docker billing
linkTitle: 3D Secure authentication
description: Docker billing supports 3D Secure (3DS) for secure payment authentication. Learn how 3DS works with Docker subscriptions.
keywords: billing, renewal, payments, subscriptions, 3DS, credit card verification, secure payments, Docker billing security
@z

@x
Docker supports 3D Secure (3DS), an extra layer of authentication required
for certain credit card payments. If your bank or card issuer requires 3DS, you
may need to verify your identity before your payment can be completed.
@y
Docker supports 3D Secure (3DS), an extra layer of authentication required
for certain credit card payments. If your bank or card issuer requires 3DS, you
may need to verify your identity before your payment can be completed.
@z

@x
## How it works
@y
## How it works
@z

@x
When a 3DS check is triggered during checkout, your bank or card issuer
may ask you to verify your identity. This can include:
@y
When a 3DS check is triggered during checkout, your bank or card issuer
may ask you to verify your identity. This can include:
@z

@x
- Entering a one-time password sent to your phone
- Approving the charge through your mobile banking app
- Answering a security question or using biometrics
@y
- Entering a one-time password sent to your phone
- Approving the charge through your mobile banking app
- Answering a security question or using biometrics
@z

@x
The exact verification steps depend on your financial institution's
requirements.
@y
The exact verification steps depend on your financial institution's
requirements.
@z

@x
## When you need to verify
@y
## When you need to verify
@z

@x
You may be asked to verify your identity when performing any of the following
actions:
@y
You may be asked to verify your identity when performing any of the following
actions:
@z

@x
- Starting a [paid subscription](../subscription/setup.md)
- Changing your [billing cycle](/billing/cycle/) from monthly to annual
- [Upgrading your subscription](../subscription/change.md)
- [Adding seats](../subscription/manage-seats.md) to an existing subscription
@y
- Starting a [paid subscription](../subscription/setup.md)
- Changing your [billing cycle](__SUBDIR__/billing/cycle/) from monthly to annual
- [Upgrading your subscription](../subscription/change.md)
- [Adding seats](../subscription/manage-seats.md) to an existing subscription
@z

@x
If 3DS is required and your payment method supports it, the verification prompt
will appear during checkout.
@y
If 3DS is required and your payment method supports it, the verification prompt
will appear during checkout.
@z

@x
## Troubleshooting payment verification
@y
## Troubleshooting payment verification
@z

@x
If you're unable to complete your payment due to 3DS:
@y
If you're unable to complete your payment due to 3DS:
@z

@x
1. Retry your transaction. Make sure you're completing the verification
prompt in the same browser tab.
1. Use a different payment method. Some cards may not support 3DS properly
or be blocked.
1. Contact your bank. Your bank may be blocking the payment or the 3DS
verification attempt.
@y
1. Retry your transaction. Make sure you're completing the verification
prompt in the same browser tab.
1. Use a different payment method. Some cards may not support 3DS properly
or be blocked.
1. Contact your bank. Your bank may be blocking the payment or the 3DS
verification attempt.
@z

@x
> [!NOTE]
>
> Disabling ad blockers or browser extensions that block pop-ups can help
the 3DS prompt display correctly.
@y
> [!NOTE]
>
> Disabling ad blockers or browser extensions that block pop-ups can help
the 3DS prompt display correctly.
@z
