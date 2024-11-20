%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Use Jamf Pro
description: Use Jamf Pro to deploy Docker Desktop
keywords: jamf, mac, docker desktop, deploy, mdm, enterprise, administrator,
@y
title: Use Jamf Pro
description: Use Jamf Pro to deploy Docker Desktop
keywords: jamf, mac, docker desktop, deploy, mdm, enterprise, administrator,
@z

@x
Learn how to deploy Docker Desktop for Mac using Jamf Pro.
@y
Learn how to deploy Docker Desktop for Mac using Jamf Pro.
@z

@x
First, upload the package:
@y
First, upload the package:
@z

@x
1. From the Jamf pro console, Navigate to **Computers** > **Management Settings** > **Computer Management** > **Packages**.
2. Select **New** to add a new package.
3. Upload the `Docker.pkg` file.
@y
1. From the Jamf pro console, Navigate to **Computers** > **Management Settings** > **Computer Management** > **Packages**.
2. Select **New** to add a new package.
3. Upload the `Docker.pkg` file.
@z

@x
Next, create a policy for deployment:
@y
Next, create a policy for deployment:
@z

@x
1. Navigate to **Computers** > **Policies**.
2. Select **New**to create a new policy.
3. Enter a name for the policy, for example "Deploy Docker Desktop".
4. Under the **Packages** tab, add the Docker package you uploaded.
5. Configure the scope to target the devices or device groups you want to install Docker on.
6. Save the policy and deploy.
@y
1. Navigate to **Computers** > **Policies**.
2. Select **New**to create a new policy.
3. Enter a name for the policy, for example "Deploy Docker Desktop".
4. Under the **Packages** tab, add the Docker package you uploaded.
5. Configure the scope to target the devices or device groups you want to install Docker on.
6. Save the policy and deploy.
@z

@x
For more information, see [Jamf Pro's official documentation](https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-current/page/Policies.html). 
@y
For more information, see [Jamf Pro's official documentation](https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-current/page/Policies.html). 
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
- Learn how to [Enforce sign-in](/manuals/security/for-admins/enforce-sign-in/_index.md) for your users.
@y
- Learn how to [Enforce sign-in](manuals/security/for-admins/enforce-sign-in/_index.md) for your users.
@z
