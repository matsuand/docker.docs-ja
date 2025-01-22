%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Activity logs
@y
title: Activity logs
@z

@x
description: Learn about activity logs.
keywords: team, organization, activity, log, audit, activities
@y
description: Learn about activity logs.
keywords: team, organization, activity, log, audit, activities
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
## Manage activity logs
@y
## Manage activity logs
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

@x
## Event definitions
@y
## Event definitions
@z

@x
Refer to the following section for a list of events and their descriptions:
@y
Refer to the following section for a list of events and their descriptions:
@z

@x
### Organization events
@y
### Organization events
@z

@x
| Event                                                          | Description                                   |
|:------------------------------------------------------------------|:------------------------------------------------|
| Team Created | Activities related to the creation of a team |
| Team Updated | Activities related to the modification of a team |
| Team Deleted | Activities related to the deletion of a team |
| Team Member Added | Details of the member added to your team |
| Team Member Removed | Details of the member removed from your team |
| Team Member Invited | Details of the member invited to your team |
| Organization Member Added | Details of the member added to your organization |
| Organization Member Removed | Details about the member removed from your organization |
| Member Role Changed | Details about the role changed for a member in your organization |
| Organization Created | Activities related to the creation of a new organization |
| Organization Settings Updated | Details related to the organization setting that was updated |
| Registry Access Management enabled | Activities related to enabling Registry Access Management |
| Registry Access Management disabled | Activities related to disabling Registry Access Management |
| Registry Access Management registry added | Activities related to the addition of a registry |
| Registry Access Management registry removed | Activities related to the removal of a registry |
| Registry Access Management registry updated | Details related to the registry that was updated |
| Single Sign-On domain added | Details of the single sign-on domain added to your organization |
| Single Sign-On domain removed | Details of the single sign-on domain removed from your organization |
| Single Sign-On domain verified | Details of the single sign-on domain verified for your organization |
@y
| Event                                                          | Description                                   |
|:------------------------------------------------------------------|:------------------------------------------------|
| Team Created | Activities related to the creation of a team |
| Team Updated | Activities related to the modification of a team |
| Team Deleted | Activities related to the deletion of a team |
| Team Member Added | Details of the member added to your team |
| Team Member Removed | Details of the member removed from your team |
| Team Member Invited | Details of the member invited to your team |
| Organization Member Added | Details of the member added to your organization |
| Organization Member Removed | Details about the member removed from your organization |
| Member Role Changed | Details about the role changed for a member in your organization |
| Organization Created | Activities related to the creation of a new organization |
| Organization Settings Updated | Details related to the organization setting that was updated |
| Registry Access Management enabled | Activities related to enabling Registry Access Management |
| Registry Access Management disabled | Activities related to disabling Registry Access Management |
| Registry Access Management registry added | Activities related to the addition of a registry |
| Registry Access Management registry removed | Activities related to the removal of a registry |
| Registry Access Management registry updated | Details related to the registry that was updated |
| Single Sign-On domain added | Details of the single sign-on domain added to your organization |
| Single Sign-On domain removed | Details of the single sign-on domain removed from your organization |
| Single Sign-On domain verified | Details of the single sign-on domain verified for your organization |
@z

@x
### Repository events
@y
### Repository events
@z

@x
| Event                                                          | Description                                   |
|:------------------------------------------------------------------|:------------------------------------------------|
| Repository Created | Activities related to the creation of a new repository |
| Repository Deleted | Activities related to the deletion of a repository |
| Repository Updated | Activities related to updating the description, full description, or status of a repository |
| Privacy Changed | Details related to the privacy policies that were updated |
| Tag Pushed | Activities related to the tags pushed |
| Tag Deleted | Activities related to the tags deleted |
| Categories Updated | Activities related to setting or updating categories of a repository |
@y
| Event                                                          | Description                                   |
|:------------------------------------------------------------------|:------------------------------------------------|
| Repository Created | Activities related to the creation of a new repository |
| Repository Deleted | Activities related to the deletion of a repository |
| Repository Updated | Activities related to updating the description, full description, or status of a repository |
| Privacy Changed | Details related to the privacy policies that were updated |
| Tag Pushed | Activities related to the tags pushed |
| Tag Deleted | Activities related to the tags deleted |
| Categories Updated | Activities related to setting or updating categories of a repository |
@z

@x
### Billing events
@y
### Billing events
@z

@x
| Event                                                          | Description                                   |
|:------------------------------------------------------------------|:------------------------------------------------|
| Plan Upgraded | Occurs when your organization’s billing plan is upgraded to a higher tier plan.|
| Plan Downgraded | Occurs when your organization’s billing plan is downgraded to a lower tier plan. |
| Seat Added | Occurs when a seat is added to your organization’s billing plan. |
| Seat Removed | Occurs when a seat is removed from your organization’s billing plan. |
| Billing Cycle Changed | Occurs when there is a change in the recurring interval that your organization is charged.|
| Plan Downgrade Canceled | Occurs when a scheduled plan downgrade for your organization is canceled.|
| Seat Removal Canceled | Occurs when a scheduled seat removal for an organization’s billing plan is canceled. |
@y
| Event                                                          | Description                                   |
|:------------------------------------------------------------------|:------------------------------------------------|
| Plan Upgraded | Occurs when your organization’s billing plan is upgraded to a higher tier plan.|
| Plan Downgraded | Occurs when your organization’s billing plan is downgraded to a lower tier plan. |
| Seat Added | Occurs when a seat is added to your organization’s billing plan. |
| Seat Removed | Occurs when a seat is removed from your organization’s billing plan. |
| Billing Cycle Changed | Occurs when there is a change in the recurring interval that your organization is charged.|
| Plan Downgrade Canceled | Occurs when a scheduled plan downgrade for your organization is canceled.|
| Seat Removal Canceled | Occurs when a scheduled seat removal for an organization’s billing plan is canceled. |
@z
