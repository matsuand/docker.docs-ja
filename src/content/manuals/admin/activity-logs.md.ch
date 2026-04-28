%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Activity logs
@y
title: Activity logs
@z

@x
description: Learn how to access and interpret Docker activity logs for organizations and repositories.
keywords: audit log, organization activity, Docker business logs, repository activity, track changes Docker, security logs Docker, filter logs, log Docker events
@y
description: Learn how to access and interpret Docker activity logs for organizations and repositories.
keywords: audit log, organization activity, Docker business logs, repository activity, track changes Docker, security logs Docker, filter logs, log Docker events
@z

@x
{{< summary-bar feature_name="Activity logs" >}}
@y
{{< summary-bar feature_name="Activity logs" >}}
@z

@x
Activity logs display a chronological list of activities that occur at organization and repository levels. The activity log provides organization owners with a record of all
member activities.
@y
Activity logs display a chronological list of activities that occur at organization and repository levels. The activity log provides organization owners with a record of all
member activities.
@z

@x
With activity logs, owners can view and track:
@y
With activity logs, owners can view and track:
@z

@x
 - What changes were made
 - The date when a change was made
 - Who initiated the change
@y
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
Owners can also see the activity logs for their repository if the repository is part of the organization subscribed to a Docker Business or Team subscription.
@y
Owners can also see the activity logs for their repository if the repository is part of the organization subscribed to a Docker Business or Team subscription.
@z

@x
## Access activity logs
@y
## Access activity logs
@z

@x
{{< tabs >}}
{{< tab name="Docker Home">}}
@y
{{< tabs >}}
{{< tab name="Docker Home">}}
@z

@x
To view activity logs in Docker Home:
@y
To view activity logs in Docker Home:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your
organization.
1. Select **Admin Console**, then **Activity logs**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your
organization.
1. Select **Admin Console**, then **Activity logs**.
@z

@x
{{< /tab >}}
{{< tab name="API">}}
@y
{{< /tab >}}
{{< tab name="API">}}
@z

@x
To view activity logs using the Docker Hub API, use the [Audit logs endpoints](https://docs.docker.com/reference/api/hub/latest/#tag/audit-logs).
@y
To view activity logs using the Docker Hub API, use the [Audit logs endpoints](https://docs.docker.com/reference/api/hub/latest/#tag/audit-logs).
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Filter and customize activity logs
@y
## Filter and customize activity logs
@z

@x
> [!IMPORTANT]
>
> Docker Home retains activity logs for 30 days. To retrieve
activities beyond 30 days, you must use the
[Docker Hub API](https://docs.docker.com/reference/api/hub/latest/#tag/audit-logs).
@y
> [!IMPORTANT]
>
> Docker Home retains activity logs for 30 days. To retrieve
activities beyond 30 days, you must use the
[Docker Hub API](https://docs.docker.com/reference/api/hub/latest/#tag/audit-logs).
@z

@x
By default, the **Activity** tab displays all recorded events within
the last 30 days. To narrow your view, use the calendar to select a specific
date range. The log updates to show only the activities that occurred during
that period.
@y
By default, the **Activity** tab displays all recorded events within
the last 30 days. To narrow your view, use the calendar to select a specific
date range. The log updates to show only the activities that occurred during
that period.
@z

@x
You can also filter by activity type. Use the **All Activities** drop-down to
focus on organization-level, repository-level, or billing-related events.
In Docker Hub, when viewing a repository, the **Activities** tab only shows
events for that repository.
@y
You can also filter by activity type. Use the **All Activities** drop-down to
focus on organization-level, repository-level, or billing-related events.
In Docker Hub, when viewing a repository, the **Activities** tab only shows
events for that repository.
@z

@x
After selecting a category—**Organization**, **Repository**, or **Billing**—use
the **All Actions** drop-down to refine the results even further by specific
event type.
@y
After selecting a category—**Organization**, **Repository**, or **Billing**—use
the **All Actions** drop-down to refine the results even further by specific
event type.
@z

@x
> [!NOTE]
>
> Events triggered by Docker Support appear under the username **dockersupport**.
@y
> [!NOTE]
>
> Events triggered by Docker Support appear under the username **dockersupport**.
@z

@x
## Types of activity log events
@y
## Types of activity log events
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
| Access token created | Access token created in organization |
| Access token updated | Access token updated in organization |
| Access token deleted | Access token deleted in organization |
| Policy created | Details of adding a settings policy |
| Policy updated | Details of updating a settings policy |
| Policy deleted | Details of deleting a settings policy |
| Policy transferred | Details of transferring a settings policy to another owner |
| Create SSO Connection | Details of creating a new org/company SSO connection |
| Update SSO Connection | Details of updating an existing org/company SSO connection |
| Delete SSO Connection | Details of deleting an existing org/company SSO connection |
| Enforce SSO | Details of toggling enforcement on an existing org/company SSO connection |
| Enforce SCIM | Details of toggling SCIM on an existing org/company SSO connection |
| Refresh SCIM Token | Details of a SCIM token refresh on an existing org/company SSO connection |
| Change SSO Connection Type | Details of a connection type change on an existing org/company SSO connection |
| Toggle JIT provisioning | Details of a JIT toggle on an existing org/company SSO connection |
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
| Access token created | Access token created in organization |
| Access token updated | Access token updated in organization |
| Access token deleted | Access token deleted in organization |
| Policy created | Details of adding a settings policy |
| Policy updated | Details of updating a settings policy |
| Policy deleted | Details of deleting a settings policy |
| Policy transferred | Details of transferring a settings policy to another owner |
| Create SSO Connection | Details of creating a new org/company SSO connection |
| Update SSO Connection | Details of updating an existing org/company SSO connection |
| Delete SSO Connection | Details of deleting an existing org/company SSO connection |
| Enforce SSO | Details of toggling enforcement on an existing org/company SSO connection |
| Enforce SCIM | Details of toggling SCIM on an existing org/company SSO connection |
| Refresh SCIM Token | Details of a SCIM token refresh on an existing org/company SSO connection |
| Change SSO Connection Type | Details of a connection type change on an existing org/company SSO connection |
| Toggle JIT provisioning | Details of a JIT toggle on an existing org/company SSO connection |
@z

@x
### Repository events
@y
### Repository events
@z

@x
> [!NOTE]
>
> Event descriptions that include a user action can refer to a Docker username, personal access token (PAT) or organization access token (OAT). For example, if a user pushes a tag to a repository, the event would include the description: `<user-access-token>` pushed the tag to the repository.
@y
> [!NOTE]
>
> Event descriptions that include a user action can refer to a Docker username, personal access token (PAT) or organization access token (OAT). For example, if a user pushes a tag to a repository, the event would include the description: `<user-access-token>` pushed the tag to the repository.
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
| Plan Upgrade Requested | Occurs when a user in your organization requests a plan upgrade. |
| Plan Downgrade Requested | Occurs when a user in your organization requests a plan downgrade. |
| Seat Addition Requested | Occurs when a user in your organization requests an increase in the number of seats. |
| Seat Removal Requested | Occurs when a user in your organization requests a decrease in the number of seats. |
| Billing Cycle Change Requested | Occurs when a user in your organization requests a change in the billing cycle. |
| Plan Downgrade Cancellation Requested | Occurs when a user in your organization requests a cancellation of a scheduled plan downgrade. |
| Seat Removal Cancellation Requested | Occurs when a user in your organization requests a cancellation of a scheduled seat removal. |
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
| Plan Upgrade Requested | Occurs when a user in your organization requests a plan upgrade. |
| Plan Downgrade Requested | Occurs when a user in your organization requests a plan downgrade. |
| Seat Addition Requested | Occurs when a user in your organization requests an increase in the number of seats. |
| Seat Removal Requested | Occurs when a user in your organization requests a decrease in the number of seats. |
| Billing Cycle Change Requested | Occurs when a user in your organization requests a change in the billing cycle. |
| Plan Downgrade Cancellation Requested | Occurs when a user in your organization requests a cancellation of a scheduled plan downgrade. |
| Seat Removal Cancellation Requested | Occurs when a user in your organization requests a cancellation of a scheduled seat removal. |
@z
