%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Extensions
keywords: Docker Extensions, Docker Desktop, Linux, Mac, Windows, feedback
title: Settings and feedback for Docker Extensions
@y
description: Extensions
keywords: Docker Extensions, Docker Desktop, Linux, Mac, Windows, feedback
title: Settings and feedback for Docker Extensions
@z

@x
## Settings
@y
## Settings
@z

@x
### Turn on or turn off extensions
@y
### Turn on or turn off extensions
@z

@x
Docker Extensions is switched on by default. To change your settings:
@y
Docker Extensions is switched on by default. To change your settings:
@z

@x
1. Navigate to **Settings**.
2. Select the **Extensions** tab.
3. Next to **Enable Docker Extensions**, select or clear the checkbox to set your desired state.
4. In the bottom-right corner, select **Apply & Restart**.
@y
1. Navigate to **Settings**.
2. Select the **Extensions** tab.
3. Next to **Enable Docker Extensions**, select or clear the checkbox to set your desired state.
4. In the bottom-right corner, select **Apply & Restart**.
@z

@x
>**Note**
>
> If you are an [organization owner](/manuals/admin/organization/manage-a-team.md#organization-owner), you can turn off extensions for your users. Open the `settings.json` file, and set `"extensionsEnabled"` to `false`. 
> The `settings.json` file is located at:
>   - `~/Library/Group Containers/group.com.docker/settings.json` on Mac
>   - `C:\Users\[USERNAME]\AppData\Roaming\Docker\settings.json` on Windows
>
> This can also be done with [Hardened Docker Desktop](/manuals/security/for-admins/hardened-desktop/_index.md)
@y
>**Note**
>
> If you are an [organization owner](manuals/admin/organization/manage-a-team.md#organization-owner), you can turn off extensions for your users. Open the `settings.json` file, and set `"extensionsEnabled"` to `false`. 
> The `settings.json` file is located at:
>   - `~/Library/Group Containers/group.com.docker/settings.json` on Mac
>   - `C:\Users\[USERNAME]\AppData\Roaming\Docker\settings.json` on Windows
>
> This can also be done with [Hardened Docker Desktop](manuals/security/for-admins/hardened-desktop/_index.md)
@z

@x
### Turn on or turn off extensions not available in the Marketplace
@y
### Turn on or turn off extensions not available in the Marketplace
@z

@x
You can install extensions through the Marketplace or through the Extensions SDK tools. You can choose to only allow published extensions. These are extensions that have been reviewed and published in the Extensions Marketplace.
@y
You can install extensions through the Marketplace or through the Extensions SDK tools. You can choose to only allow published extensions. These are extensions that have been reviewed and published in the Extensions Marketplace.
@z

@x
1. Navigate to **Settings**.
2. Select the **Extensions** tab.
3. Next to **Allow only extensions distributed through the Docker Marketplace**, select or clear the checkbox to set your desired state.
4. In the bottom-right corner, select **Apply & Restart**.
@y
1. Navigate to **Settings**.
2. Select the **Extensions** tab.
3. Next to **Allow only extensions distributed through the Docker Marketplace**, select or clear the checkbox to set your desired state.
4. In the bottom-right corner, select **Apply & Restart**.
@z

@x
### See containers created by extensions
@y
### See containers created by extensions
@z

@x
By default, containers created by extensions are hidden from the list of containers in Docker Dashboard and the Docker CLI. To make them visible
update your settings:
@y
By default, containers created by extensions are hidden from the list of containers in Docker Dashboard and the Docker CLI. To make them visible
update your settings:
@z

@x
1. Navigate to **Settings**.
2. Select the **Extensions** tab.
3. Next to **Show Docker Extensions system containers**, select or clear the checkbox to set your desired state.
4. In the bottom-right corner, select **Apply & Restart**.
@y
1. Navigate to **Settings**.
2. Select the **Extensions** tab.
3. Next to **Show Docker Extensions system containers**, select or clear the checkbox to set your desired state.
4. In the bottom-right corner, select **Apply & Restart**.
@z

@x
> [!NOTE]
>
> Enabling extensions doesn't use computer resources (CPU / Memory) by itself.
>
> Specific extensions might use computer resources, depending on the features and implementation of each extension, but there is no reserved resources or usage cost associated with enabling extensions.
@y
> [!NOTE]
>
> Enabling extensions doesn't use computer resources (CPU / Memory) by itself.
>
> Specific extensions might use computer resources, depending on the features and implementation of each extension, but there is no reserved resources or usage cost associated with enabling extensions.
@z

@x
## Submit feedback
@y
## Submit feedback
@z

@x
Feedback can be given to an extension author through a dedicated Slack channel or GitHub. To submit feedback about a particular extension:
@y
Feedback can be given to an extension author through a dedicated Slack channel or GitHub. To submit feedback about a particular extension:
@z

@x
1. Navigate to Docker Dashboard and select the **Manage** tab.
   This displays a list of extensions you've installed.
2. Select the extension you want to provide feedback on. 
3. Scroll down to the bottom of the extension's description and, depending on the 
extension, select:
    - Support
    - Slack
    - Issues. You'll be sent to a page outside of Docker Desktop to submit your feedback.
@y
1. Navigate to Docker Dashboard and select the **Manage** tab.
   This displays a list of extensions you've installed.
2. Select the extension you want to provide feedback on. 
3. Scroll down to the bottom of the extension's description and, depending on the 
extension, select:
    - Support
    - Slack
    - Issues. You'll be sent to a page outside of Docker Desktop to submit your feedback.
@z

@x
If an extension doesn't provide a way for you to give feedback, contact us and we'll pass on the feedback for you. To provide feedback, select the **Give feedback** to the right of **Extensions Marketplace**.
@y
If an extension doesn't provide a way for you to give feedback, contact us and we'll pass on the feedback for you. To provide feedback, select the **Give feedback** to the right of **Extensions Marketplace**.
@z
