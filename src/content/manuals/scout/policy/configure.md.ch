%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Configure policies
description: Learn how to configure, disable, or delete policies in Docker Scout
keywords: scout, policy, configure, delete, enable, parametrize, thresholds
@y
title: Configure policies
description: Learn how to configure, disable, or delete policies in Docker Scout
keywords: scout, policy, configure, delete, enable, parametrize, thresholds
@z

@x
Some policy types are configurable. This means that you can create new,
customized version of that policy type with your own configuration parameters.
You can also disable a policy if you need to temporarily disregard it, or
delete a policy altogether if it doesn't match your needs.
@y
Some policy types are configurable. This means that you can create new,
customized version of that policy type with your own configuration parameters.
You can also disable a policy if you need to temporarily disregard it, or
delete a policy altogether if it doesn't match your needs.
@z

@x
> [!NOTE]
> Historic evaluation results for the default policy configuration are removed
> if you delete or customize a policy.
@y
> [!NOTE]
> Historic evaluation results for the default policy configuration are removed
> if you delete or customize a policy.
@z

@x
## Add a policy
@y
## Add a policy
@z

@x
To add a new policy, select the policy type that you want to customize. All
custom policies use a policy type as a base.
@y
To add a new policy, select the policy type that you want to customize. All
custom policies use a policy type as a base.
@z

@x
You can edit the display name and description of the new policy to help
better communicate the compliant and non-compliant states of the policy.
You can not change the name of the policy type, only its display names.
@y
You can edit the display name and description of the new policy to help
better communicate the compliant and non-compliant states of the policy.
You can not change the name of the policy type, only its display names.
@z

@x
The available configuration parameters for a policy depends on the
policy type that you're editing. For more information, refer to
[Policy types](/manuals/scout/policy/_index.md#policy-types).
@y
The available configuration parameters for a policy depends on the
policy type that you're editing. For more information, refer to
[Policy types](manuals/scout/policy/_index.md#policy-types).
@z

@x
To add a policy:
@y
To add a policy:
@z

@x
1. Go to the [Policies page](https://scout.docker.com/reports/policy) in the Docker Scout Dashboard.
2. Select the **Add policy** button to open the policy configuration screen.
3. On the policy configuration screen, locate the policy type that you want to
   configure, and select **Configure** to open the policy configuration page.
@y
1. Go to the [Policies page](https://scout.docker.com/reports/policy) in the Docker Scout Dashboard.
2. Select the **Add policy** button to open the policy configuration screen.
3. On the policy configuration screen, locate the policy type that you want to
   configure, and select **Configure** to open the policy configuration page.
@z

@x
   - If the **Configure** button is grayed out, it means the current policy
     has no configurable parameters.
   - If the button reads **Integrate**, it indicates that setup is required
     before the policy can be enabled. Selecting **Integrate** will direct you
     to the integration's setup guide.
@y
   - If the **Configure** button is grayed out, it means the current policy
     has no configurable parameters.
   - If the button reads **Integrate**, it indicates that setup is required
     before the policy can be enabled. Selecting **Integrate** will direct you
     to the integration's setup guide.
@z

@x
4. Update the policy parameters.
5. Save the changes:
@y
4. Update the policy parameters.
5. Save the changes:
@z

@x
   - Select **Save policy** to commit the changes and enable the policy for
     your current organization.
   - Select **Save and disable** to save the policy configuration without enabling
     it.
@y
   - Select **Save policy** to commit the changes and enable the policy for
     your current organization.
   - Select **Save and disable** to save the policy configuration without enabling
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

@x
## Delete a policy
@y
## Delete a policy
@z

@x
When you delete a policy, evaluation results for that policy are deleted as
well, and no longer appear in the Docker Scout Dashboard or in the CLI.
@y
When you delete a policy, evaluation results for that policy are deleted as
well, and no longer appear in the Docker Scout Dashboard or in the CLI.
@z

@x
To delete a policy:
@y
To delete a policy:
@z

@x
1. Go to the [Policies page](https://scout.docker.com/reports/policy) in the Docker Scout Dashboard.
2. Select the policy you want to delete.
3. Select the **Delete** button.
@y
1. Go to the [Policies page](https://scout.docker.com/reports/policy) in the Docker Scout Dashboard.
2. Select the policy you want to delete.
3. Select the **Delete** button.
@z

@x
## Recover a deleted policy
@y
## Recover a deleted policy
@z

@x
If you've deleted a policy, you can recreate it by following the steps in [Add
a policy](#add-a-policy). On the policy configuration screen, select
**Configure** on the deleted policy that you wish to recreate.
@y
If you've deleted a policy, you can recreate it by following the steps in [Add
a policy](#add-a-policy). On the policy configuration screen, select
**Configure** on the deleted policy that you wish to recreate.
@z
