%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Learn how to troubleshoot common SSO issues.
keywords: sso, troubleshoot, single sign-on
title: Troubleshoot single sign-on
linkTitle: Troubleshoot SSO
@y
description: Learn how to troubleshoot common SSO issues.
keywords: sso, troubleshoot, single sign-on
title: Troubleshoot single sign-on
linkTitle: Troubleshoot SSO
@z

@x
While configuring or using single sign-on (SSO), you may encounter issues that
can stem from your identity provider (IdP) or Docker configuration. The
following sections describe some common SSO errors and possible solutions.
@y
While configuring or using single sign-on (SSO), you may encounter issues that
can stem from your identity provider (IdP) or Docker configuration. The
following sections describe some common SSO errors and possible solutions.
@z

@x
## Check for errors
@y
## Check for errors
@z

@x
If you experience issues with SSO, check both the Docker Admin Console and your identity provider (IdP) for errors first.
@y
If you experience issues with SSO, check both the Docker Admin Console and your identity provider (IdP) for errors first.
@z

@x
#### Check Docker error logs
@y
#### Check Docker error logs
@z

@x
1. Sign in to the [Admin Console](https://app.docker.com/admin/) and select your organization.
2. Select **SSO and SCIM**.
3. In the SSO connections table, select the **Action** menu and then **View error logs**.
4. For more details on specific errors, select **View error details** next to an error message.
5. Note any errors you see on this page for further troubleshooting.
@y
1. Sign in to the [Admin Console](https://app.docker.com/admin/) and select your organization.
2. Select **SSO and SCIM**.
3. In the SSO connections table, select the **Action** menu and then **View error logs**.
4. For more details on specific errors, select **View error details** next to an error message.
5. Note any errors you see on this page for further troubleshooting.
@z

@x
#### Check for errors in your IdP
@y
#### Check for errors in your IdP
@z

@x
1. Review your IdP’s logs or audit trails for any failed authentication or provisioning attempts.
2. Confirm that your IdP’s SSO settings match the values provided in Docker.
3. If applicable, confirm that you have configured user provisioning correctly and that it is enabled in your IdP.
4. If applicable, verify that your IdP correctly maps Docker's required user attributes.
5. Try provisioning a test user from your IdP and verify if they appear in Docker.
@y
1. Review your IdP’s logs or audit trails for any failed authentication or provisioning attempts.
2. Confirm that your IdP’s SSO settings match the values provided in Docker.
3. If applicable, confirm that you have configured user provisioning correctly and that it is enabled in your IdP.
4. If applicable, verify that your IdP correctly maps Docker's required user attributes.
5. Try provisioning a test user from your IdP and verify if they appear in Docker.
@z

@x
For further troubleshooting, check your IdP’s documentation. You can also contact their support team for guidance on error messages.
@y
For further troubleshooting, check your IdP’s documentation. You can also contact their support team for guidance on error messages.
@z

@x
## Groups are not formatted correctly
@y
## Groups are not formatted correctly
@z

@x
#### Error message
@y
#### Error message
@z

@x
When this issue occurs, the following error message is common:
```text
Some of the groups assigned to the user are not formatted as '<organization name>:<team name>'. Directory groups will be ignored and user will be provisioned into the default organization and team.
```
@y
When this issue occurs, the following error message is common:
```text
Some of the groups assigned to the user are not formatted as '<organization name>:<team name>'. Directory groups will be ignored and user will be provisioned into the default organization and team.
```
@z

@x
#### Possible causes
@y
#### Possible causes
@z

@x
- Incorrect group name formatting in your identity provider (IdP): Docker requires groups to follow the format `<organization>:<team>`. If the groups assigned to a user do not follow this format, they will be ignored.
- Non-matching groups between IdP and Docker organization: If a group in your IdP does not have a corresponding team in Docker, it will not be recognized, and the user will be placed in the default organization and team.
@y
- Incorrect group name formatting in your identity provider (IdP): Docker requires groups to follow the format `<organization>:<team>`. If the groups assigned to a user do not follow this format, they will be ignored.
- Non-matching groups between IdP and Docker organization: If a group in your IdP does not have a corresponding team in Docker, it will not be recognized, and the user will be placed in the default organization and team.
@z

@x
#### Affected environments
@y
#### Affected environments
@z

@x
- Docker single sign-on setup using IdPs such as Okta or Azure AD
- Organizations using group-based role assignments in Docker
@y
- Docker single sign-on setup using IdPs such as Okta or Azure AD
- Organizations using group-based role assignments in Docker
@z

@x
#### Steps to replicate
@y
#### Steps to replicate
@z

@x
To replicate this issue:
1. Attempt to sign in to Docker using SSO.
2. The user is assigned groups in the IdP but does not get placed in the expected Docker Team.
3. Review Docker logs or IdP logs to find the error message.
@y
To replicate this issue:
1. Attempt to sign in to Docker using SSO.
2. The user is assigned groups in the IdP but does not get placed in the expected Docker Team.
3. Review Docker logs or IdP logs to find the error message.
@z

@x
#### Solutions
@y
#### Solutions
@z

@x
Update group names in your IdP:
1. Go to your IdP's group management section.
2. Check the groups assigned to the affected user.
3. Ensure each group follows the required format: `<organization>:<team>`
4. Update any incorrectly formatted groups to match this pattern.
5. Save changes and retry signing in with SSO.
@y
Update group names in your IdP:
1. Go to your IdP's group management section.
2. Check the groups assigned to the affected user.
3. Ensure each group follows the required format: `<organization>:<team>`
4. Update any incorrectly formatted groups to match this pattern.
5. Save changes and retry signing in with SSO.
@z

@x
## User is not assigned to the organization
@y
## User is not assigned to the organization
@z

@x
#### Error message
@y
#### Error message
@z

@x
When this issue occurs, the following error message is common:
```text
User '$username' is not assigned to this SSO organization. Contact your administrator. TraceID: XXXXXXXXXXXXX
```
@y
When this issue occurs, the following error message is common:
```text
User '$username' is not assigned to this SSO organization. Contact your administrator. TraceID: XXXXXXXXXXXXX
```
@z

@x
#### Possible causes
@y
#### Possible causes
@z

@x
- User is not assigned to the organization: If Just-in-Time (JIT) provisioning is disabled, the user may not be assigned to your organization.
- User is not invited to the organization: If JIT is disabled and you do not want to enable it, the user must be manually invited.
- SCIM provisioning is misconfigured: If you use SCIM for user provisioning, it may not be correctly syncing users from your IdP.
@y
- User is not assigned to the organization: If Just-in-Time (JIT) provisioning is disabled, the user may not be assigned to your organization.
- User is not invited to the organization: If JIT is disabled and you do not want to enable it, the user must be manually invited.
- SCIM provisioning is misconfigured: If you use SCIM for user provisioning, it may not be correctly syncing users from your IdP.
@z

@x
#### Solutions
@y
#### Solutions
@z

@x
**Enable JIT provisioning**
@y
**Enable JIT provisioning**
@z

@x
JIT is enabled by default when you enable SSO. If you have JIT disabled and need
to re-enable it:
@y
JIT is enabled by default when you enable SSO. If you have JIT disabled and need
to re-enable it:
@z

@x
1. Sign in to the [Admin Console](https://app.docker.com/admin) and select your organization.
2. Select **SSO and SCIM**.
3. In the SSO connections table, select the **Action** menu and then **Enable JIT provisioning**.
4. Select **Enable** to confirm.
@y
1. Sign in to the [Admin Console](https://app.docker.com/admin) and select your organization.
2. Select **SSO and SCIM**.
3. In the SSO connections table, select the **Action** menu and then **Enable JIT provisioning**.
4. Select **Enable** to confirm.
@z

@x
**Manually invite users**
@y
**Manually invite users**
@z

@x
When JIT is disabled, users are not automatically added to your organization when they authenticate through SSO.
To manually invite users, see [Invite members](/manuals/admin/organization/members.md#invite-members)
@y
When JIT is disabled, users are not automatically added to your organization when they authenticate through SSO.
To manually invite users, see [Invite members](manuals/admin/organization/members.md#invite-members)
@z

@x
**Configure SCIM provisioning**
@y
**Configure SCIM provisioning**
@z

@x
If you have SCIM enabled, troubleshoot your SCIM connection using the following steps:
@y
If you have SCIM enabled, troubleshoot your SCIM connection using the following steps:
@z

@x
1. Sign in to the [Admin Console](https://app.docker.com/admin) and select your organization.
2. Select **SSO and SCIM**.
3. In the SSO connections table, select the **Action** menu and then **View error logs**. For more details on specific errors, select **View error details** next to an error message. Note any errors you see on this page.
4. Navigate back to the **SSO and SCIM** page of the Admin Console and verify your SCIM configuration:
    - Ensure that the SCIM Base URL and API Token in your IdP match those provided in the Docker Admin Console.
    - Verify that SCIM is enabled in both Docker and your IdP.
5. Ensure that the attributes being synced from your IdP match Docker's [supported attributes](/manuals/security/for-admins/provisioning/scim.md#supported-attributes) for SCIM.
6. Test user provisioning by trying to provision a test user through your IdP and verify if they appear in Docker.
@y
1. Sign in to the [Admin Console](https://app.docker.com/admin) and select your organization.
2. Select **SSO and SCIM**.
3. In the SSO connections table, select the **Action** menu and then **View error logs**. For more details on specific errors, select **View error details** next to an error message. Note any errors you see on this page.
4. Navigate back to the **SSO and SCIM** page of the Admin Console and verify your SCIM configuration:
    - Ensure that the SCIM Base URL and API Token in your IdP match those provided in the Docker Admin Console.
    - Verify that SCIM is enabled in both Docker and your IdP.
5. Ensure that the attributes being synced from your IdP match Docker's [supported attributes](manuals/security/for-admins/provisioning/scim.md#supported-attributes) for SCIM.
6. Test user provisioning by trying to provision a test user through your IdP and verify if they appear in Docker.
@z

@x
## IdP-initiated sign in is not enabled for connection
@y
## IdP-initiated sign in is not enabled for connection
@z

@x
#### Error message
@y
#### Error message
@z

@x
When this issue occurs, the following error message is common:
```text
IdP-Initiated sign in is not enabled for connection '$ssoConnection'.
```
@y
When this issue occurs, the following error message is common:
```text
IdP-Initiated sign in is not enabled for connection '$ssoConnection'.
```
@z

@x
#### Possible causes
@y
#### Possible causes
@z

@x
Docker does not support an IdP-initiated SAML flow. This error occurs when a user attempts to authenticate from your IdP, such as using the Docker SSO app tile on the sign in page.
@y
Docker does not support an IdP-initiated SAML flow. This error occurs when a user attempts to authenticate from your IdP, such as using the Docker SSO app tile on the sign in page.
@z

@x
#### Solutions
@y
#### Solutions
@z

@x
**Authenticate from Docker apps**
@y
**Authenticate from Docker apps**
@z

@x
The user must initiate authentication from Docker applications (Hub, Desktop, etc). The user needs to enter their email address in a Docker app and they will get redirected to the configured SSO IdP for their domain.
@y
The user must initiate authentication from Docker applications (Hub, Desktop, etc). The user needs to enter their email address in a Docker app and they will get redirected to the configured SSO IdP for their domain.
@z

@x
**Hide the Docker SSO app**
@y
**Hide the Docker SSO app**
@z

@x
You can hide the Docker SSO app from users in your IdP. This prevents users from attempting to start authentication from the IdP dashboard. You must hide and configure this in your IdP.
@y
You can hide the Docker SSO app from users in your IdP. This prevents users from attempting to start authentication from the IdP dashboard. You must hide and configure this in your IdP.
@z

@x
## Not enough seats in organization
@y
## Not enough seats in organization
@z

@x
#### Error message
@y
#### Error message
@z

@x
When this issue occurs, the following error message is common:
```text
Not enough seats in organization '$orgName'. Add more seats or contact your administrator.
```
@y
When this issue occurs, the following error message is common:
```text
Not enough seats in organization '$orgName'. Add more seats or contact your administrator.
```
@z

@x
#### Possible causes
@y
#### Possible causes
@z

@x
This error occurs when the organization has no available seats for the user when provisioning via Just-in-Time (JIT) provisioning or SCIM.
@y
This error occurs when the organization has no available seats for the user when provisioning via Just-in-Time (JIT) provisioning or SCIM.
@z

@x
#### Solutions
@y
#### Solutions
@z

@x
**Add more seats to the organization**
@y
**Add more seats to the organization**
@z

@x
Purchase additional Docker Business subscription seats. For details, see [Manage subscription seats](/manuals/subscription/manage-seats.md).
@y
Purchase additional Docker Business subscription seats. For details, see [Manage subscription seats](manuals/subscription/manage-seats.md).
@z

@x
**Remove users or pending invitations**
@y
**Remove users or pending invitations**
@z

@x
Review your organization members and pending invitations. Remove inactive users or pending invitations to free up seats. For more details, see [Manage organization members](/manuals/admin/organization/members.md).
@y
Review your organization members and pending invitations. Remove inactive users or pending invitations to free up seats. For more details, see [Manage organization members](manuals/admin/organization/members.md).
@z

@x
## Domain is not verified for SSO connection
@y
## Domain is not verified for SSO connection
@z

@x
#### Error message
@y
#### Error message
@z

@x
When this issue occurs, the following error message is common:
```text
Domain '$emailDomain' is not verified for your SSO connection. Contact your company administrator. TraceID: XXXXXXXXXXXXXX
```
@y
When this issue occurs, the following error message is common:
```text
Domain '$emailDomain' is not verified for your SSO connection. Contact your company administrator. TraceID: XXXXXXXXXXXXXX
```
@z

@x
#### Possible causes
@y
#### Possible causes
@z

@x
This error occurs if the IdP authenticated a user through SSO and the User Principal Name (UPN)
returned to Docker doesn’t match any of the verified domains associated to the
SSO connection configured in Docker.
@y
This error occurs if the IdP authenticated a user through SSO and the User Principal Name (UPN)
returned to Docker doesn’t match any of the verified domains associated to the
SSO connection configured in Docker.
@z

@x
#### Solutions
@y
#### Solutions
@z

@x
**Verify UPN attribute mapping**
@y
**Verify UPN attribute mapping**
@z

@x
Ensure that the IdP SSO connection is returning the correct UPN value in the assertion attributes.
@y
Ensure that the IdP SSO connection is returning the correct UPN value in the assertion attributes.
@z

@x
**Add and verify all domains**
@y
**Add and verify all domains**
@z

@x
Add and verify all domains and subdomains used as UPN by your IdP and associate them with your Docker SSO connection. For details, see [Configure single sign-on](/manuals/security/for-admins/single-sign-on/configure.md).
@y
Add and verify all domains and subdomains used as UPN by your IdP and associate them with your Docker SSO connection. For details, see [Configure single sign-on](manuals/security/for-admins/single-sign-on/configure.md).
@z

@x
## Unable to find session
@y
## Unable to find session
@z

@x
#### Error message
@y
#### Error message
@z

@x
When this issue occurs, the following error message is common:
```text
We couldn't find your session. You may have pressed the back button, refreshed the page, opened too many sign-in dialogs, or there is some issue with cookies. Try signing in again. If the issue persists, contact your administrator.
```
@y
When this issue occurs, the following error message is common:
```text
We couldn't find your session. You may have pressed the back button, refreshed the page, opened too many sign-in dialogs, or there is some issue with cookies. Try signing in again. If the issue persists, contact your administrator.
```
@z

@x
#### Possible causes
@y
#### Possible causes
@z

@x
The following causes may create this issue:
- The user pressed the back or refresh button during authentication.
- The authentication flow lost track of the initial request, preventing completion.
@y
The following causes may create this issue:
- The user pressed the back or refresh button during authentication.
- The authentication flow lost track of the initial request, preventing completion.
@z

@x
#### Solutions
@y
#### Solutions
@z

@x
**Do not disrupt the authentication flow**
@y
**Do not disrupt the authentication flow**
@z

@x
Do not press the back or refresh button during sign-in.
@y
Do not press the back or refresh button during sign-in.
@z

@x
**Restart authentication**
@y
**Restart authentication**
@z

@x
Close the browser tab and restart the authentication flow from the Docker application (Desktop, Hub, etc).
@y
Close the browser tab and restart the authentication flow from the Docker application (Desktop, Hub, etc).
@z

@x
## Name ID is not an email address
@y
## Name ID is not an email address
@z

@x
#### Error message
@y
#### Error message
@z

@x
When this issue occurs, the following error message is common:
```text
The name ID sent by the identity provider is not an email address. Contact your company administrator.
```
@y
When this issue occurs, the following error message is common:
```text
The name ID sent by the identity provider is not an email address. Contact your company administrator.
```
@z

@x
#### Possible causes
@y
#### Possible causes
@z

@x
The following causes may create this issue:
- The IdP sends a Name ID (UPN) that does not comply with the email format required by Docker.
- Docker SSO requires the Name ID to be the primary email address of the user.
@y
The following causes may create this issue:
- The IdP sends a Name ID (UPN) that does not comply with the email format required by Docker.
- Docker SSO requires the Name ID to be the primary email address of the user.
@z

@x
#### Solutions
@y
#### Solutions
@z

@x
In your IdP, ensure the Name ID attribute format is correct:
1. Verify that the Name ID attribute format in your IdP is set to `EmailAddress`.
2. Adjust your IdP settings to return the correct Name ID format.
@y
In your IdP, ensure the Name ID attribute format is correct:
1. Verify that the Name ID attribute format in your IdP is set to `EmailAddress`.
2. Adjust your IdP settings to return the correct Name ID format.
@z
