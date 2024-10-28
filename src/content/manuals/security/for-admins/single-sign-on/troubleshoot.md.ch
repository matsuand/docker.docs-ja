%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Learn how to troubleshoot common SSO issues.
keywords: sso, troubleshoot, single sign-on
title: Troubleshoot single sign-on
@y
description: Learn how to troubleshoot common SSO issues.
keywords: sso, troubleshoot, single sign-on
title: Troubleshoot single sign-on
@z

@x
While configuring or using single sign-on (SSO), you may encounter issues that
can stem from your identity provider (IdP) or Docker configuration. The
following sections describe how to view the error messages in the Docker Admin
Console as well as some common errors and possible solutions. You can also see
your identity provider's documentation to learn if you can view error logs in
their service.
@y
While configuring or using single sign-on (SSO), you may encounter issues that
can stem from your identity provider (IdP) or Docker configuration. The
following sections describe how to view the error messages in the Docker Admin
Console as well as some common errors and possible solutions. You can also see
your identity provider's documentation to learn if you can view error logs in
their service.
@z

@x
## View SSO and SCIM error logs
@y
## View SSO and SCIM error logs
@z

@x
1. Sign in to the [Admin Console](https://app.docker.com/admin/).
2. Select your organization or company in the left navigation drop-down menu,
   and then select **SSO and SCIM**.
@y
1. Sign in to the [Admin Console](https://app.docker.com/admin/).
2. Select your organization or company in the left navigation drop-down menu,
   and then select **SSO and SCIM**.
@z

@x
   > [!NOTE]
   >
   > When an organization is part of a company, you must select the company and
   > view the SSO connection for that organization at the company level.
@y
   > [!NOTE]
   >
   > When an organization is part of a company, you must select the company and
   > view the SSO connection for that organization at the company level.
@z

@x
3. In the SSO connections table, select the **Actions** icon and **View error
   logs**. The **Connection errors** page appears with a list of errors that
   have occurred in the past 7 days.
4. In the **Connection errors** page, select **View error details** next to an
   error message for more details. A modal appears with a JSON object containing
   more details.
@y
3. In the SSO connections table, select the **Actions** icon and **View error
   logs**. The **Connection errors** page appears with a list of errors that
   have occurred in the past 7 days.
4. In the **Connection errors** page, select **View error details** next to an
   error message for more details. A modal appears with a JSON object containing
   more details.
@z

@x
## Common SSO errors and solutions
@y
## Common SSO errors and solutions
@z

@x
[View the SSO and SCIM error logs](#view-sso-and-scim-error-logs) and then use
the following sections for solutions to common configuration errors.
@y
[View the SSO and SCIM error logs](#view-sso-and-scim-error-logs) and then use
the following sections for solutions to common configuration errors.
@z

@x
### IdP-initiated sign in is not enabled for connection
@y
### IdP-initiated sign in is not enabled for connection
@z

@x
An error message, similar to the following, appears in the error logs for this
issue.
@y
An error message, similar to the following, appears in the error logs for this
issue.
@z

@x
```text
IdP-Initiated sign in is not enabled for connection '$ssoConnection'.
```
@y
```text
IdP-Initiated sign in is not enabled for connection '$ssoConnection'.
```
@z

@x
Docker doesn't support an IdP-initiated SAML flow. This error can occur when a
user attempts to authenticate from the IdP, for example using the Docker SSO App
tile on the dashboard.
@y
Docker doesn't support an IdP-initiated SAML flow. This error can occur when a
user attempts to authenticate from the IdP, for example using the Docker SSO App
tile on the dashboard.
@z

@x
Possible solutions:
@y
Possible solutions:
@z

@x
 * The user must initiate authentication from Docker apps (Hub, Desktop, etc).
   The user needs to enter their email address and they will get redirected to
   the configured SSO IdP for their domain.
 * (Optional) Configure the Docker SSO App as not visible to users on your IdP
   so users don’t attempt to start authentication from there.
@y
 * The user must initiate authentication from Docker apps (Hub, Desktop, etc).
   The user needs to enter their email address and they will get redirected to
   the configured SSO IdP for their domain.
 * (Optional) Configure the Docker SSO App as not visible to users on your IdP
   so users don’t attempt to start authentication from there.
@z

@x
### Not enough seats in organization
@y
### Not enough seats in organization
@z

@x
An error message, similar to the following, appears in the error logs for this
issue.
@y
An error message, similar to the following, appears in the error logs for this
issue.
@z

@x
```text
Not enough seats in organization '$orgName'. Add more seats or contact your administrator.
```
@y
```text
Not enough seats in organization '$orgName'. Add more seats or contact your administrator.
```
@z

@x
This error can occur when attempting to provision a user into the organization
via SSO Just-in-Time provisioning or SCIM, but the organization has no available
seats for the user.
@y
This error can occur when attempting to provision a user into the organization
via SSO Just-in-Time provisioning or SCIM, but the organization has no available
seats for the user.
@z

@x
Possible solutions:
@y
Possible solutions:
@z

@x
 * Add more Docker Business subscription seats to the organization. For details,
   see [Add seats to your
  subscription](/subscription/core-subscription/add-seats/).
 * Remove some users or pending invitations from your organization to make more
   seats available. For more details, see [Manage organization
   members](/admin/organization/members/).
@y
 * Add more Docker Business subscription seats to the organization. For details,
   see [Add seats to your
  subscription](__SUBDIR__/subscription/core-subscription/add-seats/).
 * Remove some users or pending invitations from your organization to make more
   seats available. For more details, see [Manage organization
   members](__SUBDIR__/admin/organization/members/).
@z

@x
### Domain is not verified for SSO connection
@y
### Domain is not verified for SSO connection
@z

@x
An error message, similar to the following, appears in the error logs for this
issue.
@y
An error message, similar to the following, appears in the error logs for this
issue.
@z

@x
```text
Domain '$emailDomain' is not verified for your SSO connection. Contact your company administrator. TraceID: XXXXXXXXXXXXXX
```
@y
```text
Domain '$emailDomain' is not verified for your SSO connection. Contact your company administrator. TraceID: XXXXXXXXXXXXXX
```
@z

@x
This error occurs if the IdP authenticated a user through SSO and the UPN
returned to Docker doesn’t match any of the verified domains associated to the
SSO connection configured in Docker.
@y
This error occurs if the IdP authenticated a user through SSO and the UPN
returned to Docker doesn’t match any of the verified domains associated to the
SSO connection configured in Docker.
@z

@x
Possible solutions:
@y
Possible solutions:
@z

@x
 * Make sure the IdP SSO connection is returning the correct UPN value as part
   of the assertion attributes (attributes mapping).
 * Add and verify all domains and subdomains that are used as UPN by your IdP
   and associate them to your Docker SSO connection. For more details, see [Configure single sign-on](../single-sign-on/configure.md).
@y
 * Make sure the IdP SSO connection is returning the correct UPN value as part
   of the assertion attributes (attributes mapping).
 * Add and verify all domains and subdomains that are used as UPN by your IdP
   and associate them to your Docker SSO connection. For more details, see [Configure single sign-on](../single-sign-on/configure.md).
@z

@x
### Unable to find session
@y
### Unable to find session
@z

@x
An error message, similar to the following, appears in the error logs for this
issue.
@y
An error message, similar to the following, appears in the error logs for this
issue.
@z

@x
```text
We couldn't find your session. You may have pressed the back button, refreshed the page, opened too many sign-in dialogs, or there is some issue with cookies. Try signing in again. If the issue persists, contact your administrator.
```
@y
```text
We couldn't find your session. You may have pressed the back button, refreshed the page, opened too many sign-in dialogs, or there is some issue with cookies. Try signing in again. If the issue persists, contact your administrator.
```
@z

@x
This error typically occurs during the authentication flow when a user presses
the back or the refresh button on the browser. This causes the sign-in flow to
lose track of the initial authentication request, which is required to complete
all authentication flows.
@y
This error typically occurs during the authentication flow when a user presses
the back or the refresh button on the browser. This causes the sign-in flow to
lose track of the initial authentication request, which is required to complete
all authentication flows.
@z

@x
Possible solutions:
@y
Possible solutions:
@z

@x
 * Avoid pressing the back or refresh buttons during sign in.
 * Close the browser’s tab and start the authentication flow from the beginning
   in the app (Docker Desktop, Hub, etc.)
@y
 * Avoid pressing the back or refresh buttons during sign in.
 * Close the browser’s tab and start the authentication flow from the beginning
   in the app (Docker Desktop, Hub, etc.)
@z

@x
### User is not assigned to the organization
@y
### User is not assigned to the organization
@z

@x
An error message, similar to the following, appears in the error logs for this
issue.
@y
An error message, similar to the following, appears in the error logs for this
issue.
@z

@x
```text
User '$username' is not assigned to this SSO organization. Contact your administrator. TraceID: XXXXXXXXXXXXX
```
@y
```text
User '$username' is not assigned to this SSO organization. Contact your administrator. TraceID: XXXXXXXXXXXXX
```
@z

@x
This error occurs if SSO Just-In-Time (JIT) provisioning is disabled. JIT
provisioning ensures that a user is added to an organization after they
authenticate via SSO. JIT provisioning can be optionally disabled to prevent
users taking seats in the organization automatically or when SCIM is used as
the only option for user provisioning.
@y
This error occurs if SSO Just-In-Time (JIT) provisioning is disabled. JIT
provisioning ensures that a user is added to an organization after they
authenticate via SSO. JIT provisioning can be optionally disabled to prevent
users taking seats in the organization automatically or when SCIM is used as
the only option for user provisioning.
@z

@x
Possible solutions:
@y
Possible solutions:
@z

@x
 * Review your SSO connection configuration and enable JIT provisioning to add
   all users to the organization after authenticating via SSO. For more details,
   see [Just-in-Time
   provisioning](/security/for-admins/provisioning/just-in-time/).
 * If JIT provisioning should remain disabled, then add the user to the
   organization by manually inviting them. Next time the user authenticates via
   SSO they will get added to the org because they are invited. For more
   details, see [Manage organization members](/admin/organization/members/).
 * If SCIM should provision the user, then ensure that the IdP controlling SCIM
   provisioning is properly configured to synchronize users with Docker as soon
   as they get assigned to the app. For more details, refer to your identity
   provider's documentation.
@y
 * Review your SSO connection configuration and enable JIT provisioning to add
   all users to the organization after authenticating via SSO. For more details,
   see [Just-in-Time
   provisioning](__SUBDIR__/security/for-admins/provisioning/just-in-time/).
 * If JIT provisioning should remain disabled, then add the user to the
   organization by manually inviting them. Next time the user authenticates via
   SSO they will get added to the org because they are invited. For more
   details, see [Manage organization members](__SUBDIR__/admin/organization/members/).
 * If SCIM should provision the user, then ensure that the IdP controlling SCIM
   provisioning is properly configured to synchronize users with Docker as soon
   as they get assigned to the app. For more details, refer to your identity
   provider's documentation.
@z

@x
### Name ID is not an email address
@y
### Name ID is not an email address
@z

@x
An error message, similar to the following, appears in the error logs for this
issue.
@y
An error message, similar to the following, appears in the error logs for this
issue.
@z

@x
```text
The name ID sent by the identity provider is not an email address. Contact your company administrator.
```
@y
```text
The name ID sent by the identity provider is not an email address. Contact your company administrator.
```
@z

@x
This error can occur during SAML authentication, when your IdP sends back a Name
ID (UPN) that doesn't comply with the email address format required. The Docker
SSO app requires a name identifier to be the primary email address of the user.
@y
This error can occur during SAML authentication, when your IdP sends back a Name
ID (UPN) that doesn't comply with the email address format required. The Docker
SSO app requires a name identifier to be the primary email address of the user.
@z

@x
Possible solutions:
@y
Possible solutions:
@z

@x
 * Ensure that the Name ID attribute format is `EmailAddress`.
@y
 * Ensure that the Name ID attribute format is `EmailAddress`.
@z
