%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn about activity logs.
keywords: team, organization, activity, log, audit, activities
title: Activity logs
aliases:
- /docker-hub/audit-log/
---
@y
---
description: Learn about activity logs.
keywords: team, organization, activity, log, audit, activities
title: Activity logs
aliases:
- /docker-hub/audit-log/
---
@z

@x
Activity logs display a chronological list of activities that occur at organization and repository levels. It provides a report to owners on all their member activities.
@y
Activity logs display a chronological list of activities that occur at organization and repository levels. It provides a report to owners on all their member activities.
@z

@x
With activity logs, owners can view and track:
 - What changes were made
 - The date when a change was made
 - Who initiated the change
@y
With activity logs, owners can view and track:
 - What changes were made
 - The date when a change was made
 - Who initiated the change
@z

@x
For example, activity logs display activities such as the date when a repository was created or deleted, the member who created the repository, the name of the repository, and when there was a change to the privacy settings.
@y
For example, activity logs display activities such as the date when a repository was created or deleted, the member who created the repository, the name of the repository, and when there was a change to the privacy settings.
@z

@x
Owners can also see the activity logs for their repository if the repository is part of the organization subscribed to a Docker Business or Team plan.
@y
Owners can also see the activity logs for their repository if the repository is part of the organization subscribed to a Docker Business or Team plan.
@z

@x
> **Note**
>
> Activity logs requires a [Docker Team or Business subscription](../../subscription/_index.md).
@y
> **Note**
>
> Activity logs requires a [Docker Team or Business subscription](../../subscription/_index.md).
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
{{% admin-org-audit-log product="hub" %}}
@y
{{% admin-org-audit-log product="hub" %}}
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
{{% admin-org-audit-log product="admin" %}}
@y
{{% admin-org-audit-log product="admin" %}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
