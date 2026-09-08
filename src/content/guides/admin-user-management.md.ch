%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Mastering user and access management
summary: Simplify user access while ensuring security and efficiency in Docker.
description: A guide for managing roles, provisioning users, and optimizing Docker access with tools like SSO and activity logs.
keywords: admin, user management, roles, permissions, sso, provisioning, access control
@y
title: Mastering user and access management
summary: Simplify user access while ensuring security and efficiency in Docker.
description: A guide for managing roles, provisioning users, and optimizing Docker access with tools like SSO and activity logs.
keywords: admin, user management, roles, permissions, sso, provisioning, access control
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
Managing roles and permissions is key to securing your Docker environment while enabling easy collaboration and operational efficiency. This guide walks IT administrators through the essentials of user and access management, offering strategies for assigning roles, provisioning users, and using tools like activity logs and Insights to monitor and optimize Docker usage.
@y
Managing roles and permissions is key to securing your Docker environment while enabling easy collaboration and operational efficiency. This guide walks IT administrators through the essentials of user and access management, offering strategies for assigning roles, provisioning users, and using tools like activity logs and Insights to monitor and optimize Docker usage.
@z

@x
## Who's this for?
@y
## Who's this for?
@z

@x
- IT teams tasked with configuring and maintaining secure user access
- Security professionals focused on enforcing secure access practices
- Project managers overseeing team collaboration and resource management
@y
- IT teams tasked with configuring and maintaining secure user access
- Security professionals focused on enforcing secure access practices
- Project managers overseeing team collaboration and resource management
@z

@x
## What you'll learn
@y
## What you'll learn
@z

@x
- How to assess and manage Docker user access and align accounts with organizational needs
- When to use team configurations for scalable access control
- How to automate and streamline user provisioning with SSO, SCIM, and JIT
- How to get the most out of Docker's monitoring tools
@y
- How to assess and manage Docker user access and align accounts with organizational needs
- When to use team configurations for scalable access control
- How to automate and streamline user provisioning with SSO, SCIM, and JIT
- How to get the most out of Docker's monitoring tools
@z

@x
## Tools integration
@y
## Tools integration
@z

@x
This guide covers integration with:
@y
This guide covers integration with:
@z

@x
- Okta
- Entra ID SAML 2.0
- Azure Connect (OIDC)
@y
- Okta
- Entra ID SAML 2.0
- Azure Connect (OIDC)
@z

@x
## Setting up roles and permissions in Docker
@y
## Setting up roles and permissions in Docker
@z

@x
With the right configurations, you can ensure your developers have easy access to necessary resources while preventing unauthorized access. This page guides you through identifying Docker users so you can allocate subscription seats efficiently within your Docker organization, and assigning roles to align with your organization's structure.
@y
With the right configurations, you can ensure your developers have easy access to necessary resources while preventing unauthorized access. This page guides you through identifying Docker users so you can allocate subscription seats efficiently within your Docker organization, and assigning roles to align with your organization's structure.
@z

@x
### Identify your Docker users and accounts
@y
### Identify your Docker users and accounts
@z

@x
Before setting up roles and permissions, it's important to have a clear understanding of who in your organization requires Docker access. Focus on gathering a comprehensive view of active users, their roles within projects, and how they interact with Docker resources. This process can be supported by tools like device management software or manual assessments. Encourage all users to update their Docker accounts to use organizational email addresses, ensuring seamless integration with your subscription.
@y
Before setting up roles and permissions, it's important to have a clear understanding of who in your organization requires Docker access. Focus on gathering a comprehensive view of active users, their roles within projects, and how they interact with Docker resources. This process can be supported by tools like device management software or manual assessments. Encourage all users to update their Docker accounts to use organizational email addresses, ensuring seamless integration with your subscription.
@z

@x
For steps on how you can do this, see [step 1 of onboarding your organization](/manuals/admin/organization/setup/onboard.md).
@y
For steps on how you can do this, see [step 1 of onboarding your organization](manuals/admin/organization/setup/onboard.md).
@z

@x
### Assign roles strategically
@y
### Assign roles strategically
@z

@x
When you invite members to join your Docker organization, you assign them a role.
@y
When you invite members to join your Docker organization, you assign them a role.
@z

@x
Docker's predefined roles offer flexibility for various organizational needs. Assigning roles effectively ensures a balance of accessibility and security.
@y
Docker's predefined roles offer flexibility for various organizational needs. Assigning roles effectively ensures a balance of accessibility and security.
@z

@x
- Member: Non-administrative role. Members can view other members that are in the same organization.
- Editor: Partial administrative access to the organization. Editors can create, edit, and delete repositories. They can also edit an existing team's access permissions.
- Owner: Full organization administrative access. Owners can manage organization repositories, teams, members, settings, and billing.
@y
- Member: Non-administrative role. Members can view other members that are in the same organization.
- Editor: Partial administrative access to the organization. Editors can create, edit, and delete repositories. They can also edit an existing team's access permissions.
- Owner: Full organization administrative access. Owners can manage organization repositories, teams, members, settings, and billing.
@z

@x
For more information, see [Roles and permissions](/manuals/enterprise/security/roles-and-permissions.md).
@y
For more information, see [Roles and permissions](manuals/enterprise/security/roles-and-permissions.md).
@z

@x
#### Enhance with teams
@y
#### Enhance with teams
@z

@x
Teams in Docker provide a structured way to manage member access and they provide an additional level of permissions. They simplify permission management and enable consistent application of policies.
@y
Teams in Docker provide a structured way to manage member access and they provide an additional level of permissions. They simplify permission management and enable consistent application of policies.
@z

@x
- Organize users into teams aligned with projects, departments, or functional roles. This approach helps streamline resource allocation and ensures clarity in access control.
- Assign permissions at the team level rather than individually. For instance, a development team might have "Read & Write" access to certain repositories, while a QA team has "Read-only" access.
- As teams grow or responsibilities shift, you can easily update permissions or add new members, maintaining consistency without reconfiguring individual settings.
@y
- Organize users into teams aligned with projects, departments, or functional roles. This approach helps streamline resource allocation and ensures clarity in access control.
- Assign permissions at the team level rather than individually. For instance, a development team might have "Read & Write" access to certain repositories, while a QA team has "Read-only" access.
- As teams grow or responsibilities shift, you can easily update permissions or add new members, maintaining consistency without reconfiguring individual settings.
@z

@x
For more information, see [Create and manage a team](/manuals/admin/organization/manage/manage-a-team.md).
@y
For more information, see [Create and manage a team](manuals/admin/organization/manage/manage-a-team.md).
@z

@x
#### Example scenarios
@y
#### Example scenarios
@z

@x
- Development teams: Assign the member role to developers, granting access to the repositories needed for coding and testing.
- Team leads: Assign the editor role to team leads for resource management and repository control within their teams.
- Organizational oversight: Restrict the organization owner or company owner roles to a select few trusted individuals responsible for billing and security settings.
@y
- Development teams: Assign the member role to developers, granting access to the repositories needed for coding and testing.
- Team leads: Assign the editor role to team leads for resource management and repository control within their teams.
- Organizational oversight: Restrict the organization owner or company owner roles to a select few trusted individuals responsible for billing and security settings.
@z

@x
#### Best practices
@y
#### Best practices
@z

@x
- Apply the principle of least privilege. Assign users only the minimum permissions necessary for their roles.
- Conduct regular reviews of role assignments to ensure they align with evolving team structures and organizational responsibilities.
@y
- Apply the principle of least privilege. Assign users only the minimum permissions necessary for their roles.
- Conduct regular reviews of role assignments to ensure they align with evolving team structures and organizational responsibilities.
@z

@x
## Onboarding and managing roles and permissions in Docker
@y
## Onboarding and managing roles and permissions in Docker
@z

@x
This page guides you through onboarding owners and members, and using tools like SSO and SCIM to future-proof onboarding going forward.
@y
This page guides you through onboarding owners and members, and using tools like SSO and SCIM to future-proof onboarding going forward.
@z

@x
### Invite owners
@y
### Invite owners
@z

@x
When you create a Docker organization, you automatically become its sole owner. While optional, adding additional owners can significantly ease the process of onboarding and managing your organization by distributing administrative responsibilities. It also ensures continuity and prevents blockers if the primary owner is unavailable.
@y
When you create a Docker organization, you automatically become its sole owner. While optional, adding additional owners can significantly ease the process of onboarding and managing your organization by distributing administrative responsibilities. It also ensures continuity and prevents blockers if the primary owner is unavailable.
@z

@x
For detailed information on owners, see [Roles and permissions](/manuals/enterprise/security/roles-and-permissions.md).
@y
For detailed information on owners, see [Roles and permissions](manuals/enterprise/security/roles-and-permissions.md).
@z

@x
### Invite members and assign roles
@y
### Invite members and assign roles
@z

@x
Members are granted controlled access to resources and enjoy enhanced organizational benefits. When you invite members to join your Docker organization, you immediately assign them a role.
@y
Members are granted controlled access to resources and enjoy enhanced organizational benefits. When you invite members to join your Docker organization, you immediately assign them a role.
@z

@x
#### Benefits of inviting members
@y
#### Benefits of inviting members
@z

@x
- Enhanced visibility: Gain insights into user activity, making it easier to monitor access and enforce security policies.
- Streamlined collaboration: Help members collaborate effectively by granting access to shared resources and repositories.
- Improved resource management: Organize and track users within your organization, ensuring optimal allocation of resources.
- Access to enhanced features: Members benefit from organization-wide perks, such as increased pull limits and access to premium Docker features.
- Security control: Apply and enforce security settings at an organizational level, reducing risks associated with unmanaged accounts.
@y
- Enhanced visibility: Gain insights into user activity, making it easier to monitor access and enforce security policies.
- Streamlined collaboration: Help members collaborate effectively by granting access to shared resources and repositories.
- Improved resource management: Organize and track users within your organization, ensuring optimal allocation of resources.
- Access to enhanced features: Members benefit from organization-wide perks, such as increased pull limits and access to premium Docker features.
- Security control: Apply and enforce security settings at an organizational level, reducing risks associated with unmanaged accounts.
@z

@x
For detailed information, see [Manage organization members](/manuals/admin/organization/manage/members.md).
@y
For detailed information, see [Manage organization members](manuals/admin/organization/manage/members.md).
@z

@x
### Future-proof user management
@y
### Future-proof user management
@z

@x
A robust, future-proof approach to user management combines automated provisioning, centralized authentication, and dynamic access control. Implementing these practices ensures a scalable, secure, and efficient environment.
@y
A robust, future-proof approach to user management combines automated provisioning, centralized authentication, and dynamic access control. Implementing these practices ensures a scalable, secure, and efficient environment.
@z

@x
#### Secure user authentication with single sign-on (SSO)
@y
#### Secure user authentication with single sign-on (SSO)
@z

@x
Integrating Docker with your identity provider streamlines user access and enhances security.
@y
Integrating Docker with your identity provider streamlines user access and enhances security.
@z

@x
SSO:
@y
SSO:
@z

@x
- Simplifies sign in, as users sign in with their organizational credentials.
- Reduces password-related vulnerabilities.
- Simplifies onboarding as it works seamlessly with SCIM and group mapping for automated provisioning.
@y
- Simplifies sign in, as users sign in with their organizational credentials.
- Reduces password-related vulnerabilities.
- Simplifies onboarding as it works seamlessly with SCIM and group mapping for automated provisioning.
@z

@x
For more information, see the [SSO documentation](/manuals/enterprise/security/single-sign-on/_index.md).
@y
For more information, see the [SSO documentation](manuals/enterprise/security/single-sign-on/_index.md).
@z

@x
#### Automate onboarding with SCIM and JIT provisioning
@y
#### Automate onboarding with SCIM and JIT provisioning
@z

@x
Streamline user provisioning and role management with [SCIM](/manuals/enterprise/security/provisioning/scim/_index.md) and [Just-in-Time (JIT) provisioning](/manuals/enterprise/security/provisioning/just-in-time.md).
@y
Streamline user provisioning and role management with [SCIM](manuals/enterprise/security/provisioning/scim/_index.md) and [Just-in-Time (JIT) provisioning](manuals/enterprise/security/provisioning/just-in-time.md).
@z

@x
With SCIM you can:
@y
With SCIM you can:
@z

@x
- Sync users and roles automatically with your identity provider.
- Automate adding, updating, or removing users based on directory changes.
@y
- Sync users and roles automatically with your identity provider.
- Automate adding, updating, or removing users based on directory changes.
@z

@x
With JIT provisioning you can:
@y
With JIT provisioning you can:
@z

@x
- Automatically add users upon first sign in based on [group mapping](#simplify-access-with-group-mapping).
- Reduce overhead by eliminating pre-invite steps.
@y
- Automatically add users upon first sign in based on [group mapping](#simplify-access-with-group-mapping).
- Reduce overhead by eliminating pre-invite steps.
@z

@x
#### Simplify access with group mapping
@y
#### Simplify access with group mapping
@z

@x
Group mapping automates permissions management by linking identity provider groups to Docker roles and teams.
@y
Group mapping automates permissions management by linking identity provider groups to Docker roles and teams.
@z

@x
It also:
@y
It also:
@z

@x
- Reduces manual errors in role assignments.
- Ensures consistent access control policies.
- Help you scale permissions as teams grow or change.
@y
- Reduces manual errors in role assignments.
- Ensures consistent access control policies.
- Help you scale permissions as teams grow or change.
@z

@x
For more information on how it works, see [Group mapping](/manuals/enterprise/security/provisioning/scim/group-mapping.md).
@y
For more information on how it works, see [Group mapping](manuals/enterprise/security/provisioning/scim/group-mapping.md).
@z

@x
## Monitoring and insights
@y
## Monitoring and insights
@z

@x
Activity logs and Insights are useful tools for user and access management in Docker. They provide visibility into user actions, team workflows, and organizational trends, helping enhance security, ensure compliance, and boost productivity.
@y
Activity logs and Insights are useful tools for user and access management in Docker. They provide visibility into user actions, team workflows, and organizational trends, helping enhance security, ensure compliance, and boost productivity.
@z

@x
### Activity logs
@y
### Activity logs
@z

@x
Activity logs track events at the organization and repository levels, offering a clear view of activities like repository changes, team updates, and billing adjustments.
@y
Activity logs track events at the organization and repository levels, offering a clear view of activities like repository changes, team updates, and billing adjustments.
@z

@x
Activity logs are available for Docker Team or Docker Business plans, with data retained for three months.
@y
Activity logs are available for Docker Team or Docker Business plans, with data retained for three months.
@z

@x
#### Key features
@y
#### Key features
@z

@x
- Change tracking: View what changed, who made the change, and when.
- Comprehensive reporting: Monitor critical events such as repository creation, deletion, privacy changes, and role assignments.
@y
- Change tracking: View what changed, who made the change, and when.
- Comprehensive reporting: Monitor critical events such as repository creation, deletion, privacy changes, and role assignments.
@z

@x
#### Example scenarios
@y
#### Example scenarios
@z

@x
- Audit trail for security: A repository’s privacy settings were updated unexpectedly. The activity logs reveal which user made the change and when, helping administrators address potential security risks.
- Team collaboration review: Logs show which team members pushed updates to a critical repository, ensuring accountability during a development sprint.
- Billing adjustments: Track who added or removed subscription seats to maintain budgetary control and compliance.
@y
- Audit trail for security: A repository’s privacy settings were updated unexpectedly. The activity logs reveal which user made the change and when, helping administrators address potential security risks.
- Team collaboration review: Logs show which team members pushed updates to a critical repository, ensuring accountability during a development sprint.
- Billing adjustments: Track who added or removed subscription seats to maintain budgetary control and compliance.
@z

@x
For more information, see [Activity logs](/manuals/admin/activity-logs.md).
@y
For more information, see [Activity logs](manuals/admin/activity-logs.md).
@z

@x
### Insights
@y
### Insights
@z

@x
Insights provide data-driven views of Docker usage to improve team productivity and resource allocation.
@y
Insights provide data-driven views of Docker usage to improve team productivity and resource allocation.
@z

@x
#### Key benefits
@y
#### Key benefits
@z

@x
- Standardized environments: Ensure consistent configurations and enforce best practices across teams.
- Improved visibility: Monitor metrics like Docker Desktop usage, builds, and container activity to understand team workflows and engagement.
- Optimized resources: Track license usage and feature adoption to maximize the value of your Docker subscription.
@y
- Standardized environments: Ensure consistent configurations and enforce best practices across teams.
- Improved visibility: Monitor metrics like Docker Desktop usage, builds, and container activity to understand team workflows and engagement.
- Optimized resources: Track license usage and feature adoption to maximize the value of your Docker subscription.
@z

@x
#### Example scenarios
@y
#### Example scenarios
@z

@x
- Usage trends: Identify underutilized licenses or resources, allowing reallocation to more active teams.
- Build efficiency: Track average build times and success rates to pinpoint bottlenecks in development processes.
- Container utilization: Analyze container activity across departments to ensure proper resource distribution and cost efficiency.
@y
- Usage trends: Identify underutilized licenses or resources, allowing reallocation to more active teams.
- Build efficiency: Track average build times and success rates to pinpoint bottlenecks in development processes.
- Container utilization: Analyze container activity across departments to ensure proper resource distribution and cost efficiency.
@z

@x
For more information, see [Insights](/manuals/admin/insights.md).
@y
For more information, see [Insights](manuals/admin/insights.md).
@z

@x
### Next steps
@y
### Next steps
@z

@x
Now that you've mastered user and access management in Docker, you can:
@y
Now that you've mastered user and access management in Docker, you can:
@z

@x
- Review your [activity logs](/manuals/admin/activity-logs.md) regularly to maintain security awareness
- Check your [Insights dashboard](/manuals/admin/insights.md) to identify opportunities for optimization
- Explore [advanced security features](/manuals/enterprise/security/_index.md) to further enhance your Docker environment
- Share best practices with your team to ensure consistent adoption of security policies
@y
- Review your [activity logs](manuals/admin/activity-logs.md) regularly to maintain security awareness
- Check your [Insights dashboard](manuals/admin/insights.md) to identify opportunities for optimization
- Explore [advanced security features](manuals/enterprise/security/_index.md) to further enhance your Docker environment
- Share best practices with your team to ensure consistent adoption of security policies
@z
