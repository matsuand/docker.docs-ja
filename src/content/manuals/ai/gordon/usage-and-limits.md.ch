%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Gordon usage and limits
linkTitle: Usage and limits
description: Understand Gordon's usage limits and how they vary by Docker
  subscription tier
@y
title: Gordon usage and limits
linkTitle: Usage and limits
description: Understand Gordon's usage limits and how they vary by Docker
  subscription tier
@z

@x
{{< summary-bar feature_name="Gordon" >}}
@y
{{< summary-bar feature_name="Gordon" >}}
@z

@x
Gordon is available with all Docker subscriptions. Usage limits apply based on
your subscription tier to ensure fair resource allocation.
@y
Gordon is available with all Docker subscriptions. Usage limits apply based on
your subscription tier to ensure fair resource allocation.
@z

@x
## Usage limits by subscription
@y
## Usage limits by subscription
@z

@x
Usage limits increase with higher subscription tiers:
@y
Usage limits increase with higher subscription tiers:
@z

@x
| Subscription | Usage Multiplier | Description                          |
| ------------ | ---------------- | ------------------------------------ |
| Personal     | 1x (baseline)    | Standard usage for personal projects |
| Pro          | 3x               | Three times Personal tier usage      |
| Team         | 3x               | Three times Personal tier usage      |
| Business     | 6x               | Six times Personal tier usage        |
@y
| Subscription | Usage Multiplier | Description                          |
| ------------ | ---------------- | ------------------------------------ |
| Personal     | 1x (baseline)    | Standard usage for personal projects |
| Pro          | 3x               | Three times Personal tier usage      |
| Team         | 3x               | Three times Personal tier usage      |
| Business     | 6x               | Six times Personal tier usage        |
@z

@x
> [!NOTE]
> Limits are per user, not per organization for Team and Business
> subscriptions. Team provides the same multiplier as Pro (3x), but limits
> apply per individual user rather than being shared across the organization.
@y
> [!NOTE]
> Limits are per user, not per organization for Team and Business
> subscriptions. Team provides the same multiplier as Pro (3x), but limits
> apply per individual user rather than being shared across the organization.
@z

@x
## How usage is measured
@y
## How usage is measured
@z

@x
Gordon usage is activity-based. Each interaction consumes resources based on the
complexity of your request and the work Gordon performs. Simple queries use less
than complex multi-step tasks.
@y
Gordon usage is activity-based. Each interaction consumes resources based on the
complexity of your request and the work Gordon performs. Simple queries use less
than complex multi-step tasks.
@z

@x
## What happens when you reach a limit
@y
## What happens when you reach a limit
@z

@x
As you approach your usage limit, a message appears near the chat input
prompting you to upgrade your subscription.
@y
As you approach your usage limit, a message appears near the chat input
prompting you to upgrade your subscription.
@z

@x
When you reach your usage limit, Gordon becomes unavailable until the limit
resets. The interface displays when the limit will reset and suggests upgrading
your subscription for higher limits.
@y
When you reach your usage limit, Gordon becomes unavailable until the limit
resets. The interface displays when the limit will reset and suggests upgrading
your subscription for higher limits.
@z

@x
## Fair use policy
@y
## Fair use policy
@z

@x
Usage limits are designed for typical development workflows. Gordon is intended
for:
@y
Usage limits are designed for typical development workflows. Gordon is intended
for:
@z

@x
- Active development and debugging
- Learning Docker concepts
- Optimizing Docker configurations
- Troubleshooting issues
@y
- Active development and debugging
- Learning Docker concepts
- Optimizing Docker configurations
- Troubleshooting issues
@z

@x
Automated scripting or excessive programmatic access may be subject to
additional restrictions.
@y
Automated scripting or excessive programmatic access may be subject to
additional restrictions.
@z
