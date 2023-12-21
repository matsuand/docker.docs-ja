%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn about company owners.
keywords: company, owners
title: Manage company owners
aliases:
- /docker-hub/company-owner/
---
@y
---
description: Learn about company owners.
keywords: company, owners
title: Manage company owners
aliases:
- /docker-hub/company-owner/
---
@z

@x
As a company owner, you can configure [Single Sign-on (SSO)](../../security/for-admins/single-sign-on/_index.md) and [System for Cross-domain Identity Management (SCIM)](../../security/for-admins/scim.md) for all organizations under the company.
@y
As a company owner, you can configure [Single Sign-on (SSO)](../../security/for-admins/single-sign-on/_index.md) and [System for Cross-domain Identity Management (SCIM)](../../security/for-admins/scim.md) for all organizations under the company.
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
## Add a company owner
@y
## Add a company owner
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com/), navigate to the **Organizations** page, and select your company.
2. In the **Overview** tab, select **Add owner** and enter their Docker ID or email address.
3. Once you've selected **Add Owner**, you can view the user in the **Company Owners** table.
@y
1. Sign in to [Docker Hub](https://hub.docker.com/), navigate to the **Organizations** page, and select your company.
2. In the **Overview** tab, select **Add owner** and enter their Docker ID or email address.
3. Once you've selected **Add Owner**, you can view the user in the **Company Owners** table.
@z

@x
    ![company-overview](../images/company-overview.png)
@y
    ![company-overview](../images/company-overview.png)
@z

@x
## Remove a company owner
@y
## Remove a company owner
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com/), navigate to the **Organizations** page, and select your company.
2. In the **Overview** tab, find the **Company Owner** you want to remove.
3. Select the **Action** icon and remove the owner.
@y
1. Sign in to [Docker Hub](https://hub.docker.com/), navigate to the **Organizations** page, and select your company.
2. In the **Overview** tab, find the **Company Owner** you want to remove.
3. Select the **Action** icon and remove the owner.
@z

@x
    ![remove-owner](../images/remove-owner.png)
@y
    ![remove-owner](../images/remove-owner.png)
@z

@x
{{< /tab >}}
{{< tab name="Admin Console" >}}
@y
{{< /tab >}}
{{< tab name="Admin Console" >}}
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
@z

@x
## Add a company owner
@y
## Add a company owner
@z

@x
1. Sign in to the [Admin Console](https://admin.docker.com).
2. In the left navigation, select your company in the drop-down menu.
3. Select **Company Owners**.
4. Select **Add Owner**.
5. Specify the user's Docker ID to search for the user.
6. After you find the user, select **Add Company Owner**.
@y
1. Sign in to the [Admin Console](https://admin.docker.com).
2. In the left navigation, select your company in the drop-down menu.
3. Select **Company Owners**.
4. Select **Add Owner**.
5. Specify the user's Docker ID to search for the user.
6. After you find the user, select **Add Company Owner**.
@z

@x
## Remove a company owner
@y
## Remove a company owner
@z

@x
1. Sign in to the [Admin Console](https://admin.docker.com).
2. In the left navigation, select your company in the drop-down menu.
3. Select **Company Owners**.
4. Select the **Action** icon in the row of the company owner that your want to remove.
5. Select **Remove as Company Owner**.
@y
1. Sign in to the [Admin Console](https://admin.docker.com).
2. In the left navigation, select your company in the drop-down menu.
3. Select **Company Owners**.
4. Select the **Action** icon in the row of the company owner that your want to remove.
5. Select **Remove as Company Owner**.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
