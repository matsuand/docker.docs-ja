%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Setting up roles and permissions in Docker
description: A guide to securely managing access and collaboration in Docker through roles and teams.
keywords: Docker roles, permissions management, access control, IT administration, team collaboration, least privilege, security, Docker teams, role-based access
@y
title: Setting up roles and permissions in Docker
description: A guide to securely managing access and collaboration in Docker through roles and teams.
keywords: Docker roles, permissions management, access control, IT administration, team collaboration, least privilege, security, Docker teams, role-based access
@z

@x
With the right configurations, you can ensure your developers have easy access to necessary resources while preventing unauthorized access. This page guides you through identifying Docker users, so you can allocate subscription seats efficiently within your Docker organization, and assigning roles to align with your organization's structure. 
@y
With the right configurations, you can ensure your developers have easy access to necessary resources while preventing unauthorized access. This page guides you through identifying Docker users, so you can allocate subscription seats efficiently within your Docker organization, and assigning roles to align with your organization's structure. 
@z

@x
## Step 1: Identify your Docker users and accounts
@y
## Step 1: Identify your Docker users and accounts
@z

@x
Before setting up roles and permissions, it’s important to have a clear understanding of who in your organization requires Docker access. Focus on gathering a comprehensive view of active users, their roles within projects, and how they interact with Docker resources. This process can be supported by tools like device management software or manual assessments. Encourage all users to update their Docker accounts to use organizational email addresses, ensuring seamless integration with your subscription.
@y
Before setting up roles and permissions, it’s important to have a clear understanding of who in your organization requires Docker access. Focus on gathering a comprehensive view of active users, their roles within projects, and how they interact with Docker resources. This process can be supported by tools like device management software or manual assessments. Encourage all users to update their Docker accounts to use organizational email addresses, ensuring seamless integration with your subscription.
@z

@x
For steps on how you can do this, see [step 1 of onboarding your organization](/manuals/admin/organization/onboard.md).
@y
For steps on how you can do this, see [step 1 of onboarding your organization](manuals/admin/organization/onboard.md).
@z

@x
## Step 2: Assign roles strategically
@y
## Step 2: Assign roles strategically
@z

@x
When you invite members to join you Docker organization, you assign them a role. 
@y
When you invite members to join you Docker organization, you assign them a role. 
@z

@x
Docker’s predefined roles offer flexibility for various organizational needs. Assigning roles effectively ensures a balance of accessibility and security.
@y
Docker’s predefined roles offer flexibility for various organizational needs. Assigning roles effectively ensures a balance of accessibility and security.
@z

@x
- Member: Non-administrative role. Members can view other members that are in the same organization.
- Editor: Partial administrative access to the organization. Editors can create, edit, and delete repositories. They can also edit an existing team's access permissions.
- Organization owner: Full organization administrative access. Organization owners can manage organization repositories, teams, members, settings, and billing.
- Company owner: In addition to the permissions of an organization owner, company owners can configure settings for their associated organizations.
@y
- Member: Non-administrative role. Members can view other members that are in the same organization.
- Editor: Partial administrative access to the organization. Editors can create, edit, and delete repositories. They can also edit an existing team's access permissions.
- Organization owner: Full organization administrative access. Organization owners can manage organization repositories, teams, members, settings, and billing.
- Company owner: In addition to the permissions of an organization owner, company owners can configure settings for their associated organizations.
@z

@x
For more information, see [Roles and permissions](/manuals/security/for-admins/roles-and-permissions.md).
@y
For more information, see [Roles and permissions](manuals/security/for-admins/roles-and-permissions.md).
@z

@x
### Enhancing with teams
@y
### Enhancing with teams
@z

@x
Teams in Docker provide a structured way to manage member access and they provide an additional level of permissions. They simplify permission management and enable consistent application of policies.
@y
Teams in Docker provide a structured way to manage member access and they provide an additional level of permissions. They simplify permission management and enable consistent application of policies.
@z

@x
- Organize users into teams aligned with projects, departments, or functional roles. This approach helps streamline resource allocation and ensures clarity in access control.
@y
- Organize users into teams aligned with projects, departments, or functional roles. This approach helps streamline resource allocation and ensures clarity in access control.
@z

@x
- Assign permissions at the team level rather than individually. For instance, a development team might have "Read & Write" access to certain repositories, while a QA team has "Read-only" access.
@y
- Assign permissions at the team level rather than individually. For instance, a development team might have "Read & Write" access to certain repositories, while a QA team has "Read-only" access.
@z

@x
- As teams grow or responsibilities shift, you can easily update permissions or add new members, maintaining consistency without reconfiguring individual settings.
@y
- As teams grow or responsibilities shift, you can easily update permissions or add new members, maintaining consistency without reconfiguring individual settings.
@z

@x
For more information, see [Create and manage a team](/manuals/admin/organization/manage-a-team.md).
@y
For more information, see [Create and manage a team](manuals/admin/organization/manage-a-team.md).
@z

@x
### Example scenarios
@y
### Example scenarios
@z

@x
- Development teams: Assign the member role to developers, granting access to the repositories needed for coding and testing.
@y
- Development teams: Assign the member role to developers, granting access to the repositories needed for coding and testing.
@z

@x
- Team leads: Assign the editor role to team leads for resource management and repository control within their teams.
@y
- Team leads: Assign the editor role to team leads for resource management and repository control within their teams.
@z

@x
- Organizational oversight: Restrict the organization owner or company owner roles to a select few trusted individuals responsible for billing and security settings.
@y
- Organizational oversight: Restrict the organization owner or company owner roles to a select few trusted individuals responsible for billing and security settings.
@z

@x
### Best practices
@y
### Best practices
@z

@x
- Apply the principle of least privilege. Assign users only the minimum permissions necessary for their roles.
@y
- Apply the principle of least privilege. Assign users only the minimum permissions necessary for their roles.
@z

@x
- Plan to conduct regulars reviews of role assignments to ensure they align with evolving team structures and organizational responsibilities.
@y
- Plan to conduct regulars reviews of role assignments to ensure they align with evolving team structures and organizational responsibilities.
@z
