%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Configure policies
description: Learn how to configure or disable the default policies in Docker Scout
keywords: scout, policy, configure, disable, enable, parametrize, thresholds
---
@y
---
title: Configure policies
description: Learn how to configure or disable the default policies in Docker Scout
keywords: scout, policy, configure, disable, enable, parametrize, thresholds
---
@z

@x
Some of the existing policies are configurable. This means that you can clone
an existing policy and create new, custom policies with your own configuration.
You can also disable a policy altogether, if a policy doesn't quite match your
needs.
@y
Some of the existing policies are configurable. This means that you can clone
an existing policy and create new, custom policies with your own configuration.
You can also disable a policy altogether, if a policy doesn't quite match your
needs.
@z

@x
## Configure a policy
@y
## Configure a policy
@z

@x
To change the configuration of a policy, you must clone one of the existing
default policies, and then save your configuration as a new policy. You can
edit the display name and description of the new policy to help distinguish
it from the default policy it's based on.
@y
To change the configuration of a policy, you must clone one of the existing
default policies, and then save your configuration as a new policy. You can
edit the display name and description of the new policy to help distinguish
it from the default policy it's based on.
@z

@x
The available configuration parameters for a policy depends on the default
policy you used as a base for your custom policy.
@y
The available configuration parameters for a policy depends on the default
policy you used as a base for your custom policy.
@z

@x
To configure a policy:
@y
To configure a policy:
@z

@x
1. Go to the [Policies page](https://scout.docker.com/reports/policy) in the Docker Scout Dashboard.
2. Select the policy you want to configure.
3. Select **View policy details** to open the policy side panel.
@y
1. Go to the [Policies page](https://scout.docker.com/reports/policy) in the Docker Scout Dashboard.
2. Select the policy you want to configure.
3. Select **View policy details** to open the policy side panel.
@z

@x
   If this button is grayed out, then the selected policy doesn't have any
   configuration parameters.
@y
   If this button is grayed out, then the selected policy doesn't have any
   configuration parameters.
@z

@x
4. In the side panel, select **Copy to customize** to open the policy configuration page.
5. Update the policy parameters.
6. Save the changes:
@y
4. In the side panel, select **Copy to customize** to open the policy configuration page.
5. Update the policy parameters.
6. Save the changes:
@z

@x
   - Select **Save and enable** to commit the changes and enable the policy for
     your current organization.
   - Select **Save policy** to save the policy configuration without enabling
     it.
@y
   - Select **Save and enable** to commit the changes and enable the policy for
     your current organization.
   - Select **Save policy** to save the policy configuration without enabling
     it.
@z

@x
## Disable a policy
@y
## Disable a policy
@z

@x
When you disable a policy, evaluation results for that policy are hidden, and
no longer appear in the Docker Scout Dashboard or in the CLI. Historic
evaluation results aren't deleted if you disable a policy, so if you change
your mind and re-enable a policy later, results from earlier evaluations will
still be available.
@y
When you disable a policy, evaluation results for that policy are hidden, and
no longer appear in the Docker Scout Dashboard or in the CLI. Historic
evaluation results aren't deleted if you disable a policy, so if you change
your mind and re-enable a policy later, results from earlier evaluations will
still be available.
@z

@x
To disable a policy:
@y
To disable a policy:
@z

@x
1. Go to the [Policies page](https://scout.docker.com/reports/policy) in the Docker Scout Dashboard.
2. Select the policy you want to disable.
3. Select the **Disable** button.
@y
1. Go to the [Policies page](https://scout.docker.com/reports/policy) in the Docker Scout Dashboard.
2. Select the policy you want to disable.
3. Select the **Disable** button.
@z
