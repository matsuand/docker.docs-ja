%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
{{ $invite_button := "**Invite members**" }}
{{ $export_button := "**Export members**" }}
{{ $member_navigation := "Select **My Hub**, your organization, and then **Members**." }}
{{ $remove_button := "**Remove member**" }}
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $role_mapping_link := "[SCIM for role mapping](/security/for-admins/provisioning/scim/)" }}
{{ $export_fields := `The CSV file for an organization contains the following fields:
* **Name**: The user's name.
* **Username**: The user's Docker ID.
* **Email**: The user's email address.
* **Type**: The type of user. For example, **Invitee** for users who have not accepted the organization's invite,
  or **User** for users who are members of the organization.
* **Role**: The user's role in the organization. For example, **Member** or **Owner**.
* **Teams**: The teams where the user is a member. A team is not listed for invitees.
* **Date Joined**: The time and date when the user was invited to the organization.` }}
@y
{{ $invite_button := "**Invite members**" }}
{{ $export_button := "**Export members**" }}
{{ $member_navigation := "Select **My Hub**, your organization, and then **Members**." }}
{{ $remove_button := "**Remove member**" }}
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $role_mapping_link := "[SCIM for role mapping](__SUBDIR__/security/for-admins/provisioning/scim/)" }}
{{ $export_fields := `The CSV file for an organization contains the following fields:
* **Name**: The user's name.
* **Username**: The user's Docker ID.
* **Email**: The user's email address.
* **Type**: The type of user. For example, **Invitee** for users who have not accepted the organization's invite,
  or **User** for users who are members of the organization.
* **Role**: The user's role in the organization. For example, **Member** or **Owner**.
* **Teams**: The teams where the user is a member. A team is not listed for invitees.
* **Date Joined**: The time and date when the user was invited to the organization.` }}
@z

@x
{{ if eq (.Get "product") "admin" }}
{{ $invite_button = "**Invite**" }}
{{ $export_button = "the **Action** icon and then select **Export users as CSV**" }}
{{ $member_navigation = "Select your organization from the **Choose profile** page, and then select **Members**." }}
{{ $remove_button = "**Remove member**" }}
{{ $product_link = "the [Admin Console](https://admin.docker.com)" }}
{{ $role_mapping_link = "[SCIM for role mapping](/security/for-admins/provisioning/scim/)" }}
{{ if eq (.Get "layer") "company" }}
{{ $export_fields = `The CSV file for a company contains the following fields:
* **Name**: The user's name.
* **Username**: The user's Docker ID.
* **Email**: The user's email address.
* **Member of Organizations**: All organizations the user is a member of within a company.
* **Invited to Organizations**: All organizations the user is an invitee of within a company.
* **Account Created**: The time and date when the user account was created.` }}
{{ $member_navigation = "Select your organization from the **Choose profile** page, and then select **Members**." }}
{{ $remove_button = "**Remove user**" }}
{{ $role_mapping_link = "[SCIM for role mapping](/security/for-admins/provisioning/scim/)"}}
{{ end }}
{{ end }}
@y
{{ if eq (.Get "product") "admin" }}
{{ $invite_button = "**Invite**" }}
{{ $export_button = "the **Action** icon and then select **Export users as CSV**" }}
{{ $member_navigation = "Select your organization from the **Choose profile** page, and then select **Members**." }}
{{ $remove_button = "**Remove member**" }}
{{ $product_link = "the [Admin Console](https://admin.docker.com)" }}
{{ $role_mapping_link = "[SCIM for role mapping](__SUBDIR__/security/for-admins/provisioning/scim/)" }}
{{ if eq (.Get "layer") "company" }}
{{ $export_fields = `The CSV file for a company contains the following fields:
* **Name**: The user's name.
* **Username**: The user's Docker ID.
* **Email**: The user's email address.
* **Member of Organizations**: All organizations the user is a member of within a company.
* **Invited to Organizations**: All organizations the user is an invitee of within a company.
* **Account Created**: The time and date when the user account was created.` }}
{{ $member_navigation = "Select your organization from the **Choose profile** page, and then select **Members**." }}
{{ $remove_button = "**Remove user**" }}
{{ $role_mapping_link = "[SCIM for role mapping](__SUBDIR__/security/for-admins/provisioning/scim/)"}}
{{ end }}
{{ end }}
@z

@x
Owners can invite new members to an organization via Docker ID, email address, or with a CSV file containing email
addresses. If an invitee does not have a Docker account, they must create an account and verify their email address
before they can accept an invitation to join the organization. When inviting members, their pending invitation occupies
a seat.
@y
Owners can invite new members to an organization via Docker ID, email address, or with a CSV file containing email
addresses. If an invitee does not have a Docker account, they must create an account and verify their email address
before they can accept an invitation to join the organization. When inviting members, their pending invitation occupies
a seat.
@z

@x
### Invite members via Docker ID or email address
@y
### Invite members via Docker ID or email address
@z

@x
Use the following steps to invite members to your organization via Docker ID or email address. To invite a large amount
of members to your organization via CSV file, see the next section.
@y
Use the following steps to invite members to your organization via Docker ID or email address. To invite a large amount
of members to your organization via CSV file, see the next section.
@z

@x
1. Sign in to {{ $product_link }}.
2. {{ $member_navigation }}
3. Select {{ $invite_button }}.
4. Select **Emails or usernames**.
5. Follow the on-screen instructions to invite members.
   Invite a maximum of 1000 members and separate multiple entries by comma, semicolon, or space.
@y
1. Sign in to {{ $product_link }}.
2. {{ $member_navigation }}
3. Select {{ $invite_button }}.
4. Select **Emails or usernames**.
5. Follow the on-screen instructions to invite members.
   Invite a maximum of 1000 members and separate multiple entries by comma, semicolon, or space.
@z

@x
   > [!NOTE]
   >
   > When you invite members, you assign them a role.
   > See [Roles and permissions](/security/for-admins/roles-and-permissions/)
   > for details about the access permissions for each role.
@y
   > [!NOTE]
   >
   > When you invite members, you assign them a role.
   > See [Roles and permissions](__SUBDIR__/security/for-admins/roles-and-permissions/)
   > for details about the access permissions for each role.
@z

@x
   Pending invitations appear in the table. The invitees receive an email with a link to Docker Hub where they can accept
   or decline the invitation.
@y
   Pending invitations appear in the table. The invitees receive an email with a link to Docker Hub where they can accept
   or decline the invitation.
@z

@x
### Invite members via CSV file
@y
### Invite members via CSV file
@z

@x
To invite multiple members to an organization via a CSV file containing email addresses:
@y
To invite multiple members to an organization via a CSV file containing email addresses:
@z

@x
1. Sign in to {{ $product_link }}.
2. {{ $member_navigation }}
3. Select {{ $invite_button }}.
4. Select **CSV upload**.
5. Select **Download the template CSV file** to optionally download an example CSV file.
   The following is an example of the contents of a valid CSV file.
@y
1. Sign in to {{ $product_link }}.
2. {{ $member_navigation }}
3. Select {{ $invite_button }}.
4. Select **CSV upload**.
5. Select **Download the template CSV file** to optionally download an example CSV file.
   The following is an example of the contents of a valid CSV file.
@z

@x
   ```text
   email
   docker.user-0@example.com
   docker.user-1@example.com
   ```
@y
   ```text
   email
   docker.user-0@example.com
   docker.user-1@example.com
   ```
@z

@x
   CSV file requirements:
@y
   CSV file requirements:
@z

@x
   - The file must contain a header row with at least one heading named `email`. Additional columns are allowed and are
   ignored in the import.
   - The file must contain a maximum of 1000 email addresses (rows). To invite more than 1000 users, create multiple CSV
   files and perform all steps in this task for each file.
@y
   - The file must contain a header row with at least one heading named `email`. Additional columns are allowed and are
   ignored in the import.
   - The file must contain a maximum of 1000 email addresses (rows). To invite more than 1000 users, create multiple CSV
   files and perform all steps in this task for each file.
@z

@x
6. Create a new CSV file or export a CSV file from another application.
@y
6. Create a new CSV file or export a CSV file from another application.
@z

@x
   - To export a CSV file from another application, see the application’s documentation.
   - To create a new CSV file, open a new file in a text editor, type `email` on the first line, type the user email
     addresses one per line on the following lines, and then save the file with a .csv extension.
@y
   - To export a CSV file from another application, see the application’s documentation.
   - To create a new CSV file, open a new file in a text editor, type `email` on the first line, type the user email
     addresses one per line on the following lines, and then save the file with a .csv extension.
@z

@x
7. Select **Browse files** and then select your CSV file, or drag and drop the CSV file into the **Select a CSV file to
   upload** box. You can only select one CSV file at a time.
@y
7. Select **Browse files** and then select your CSV file, or drag and drop the CSV file into the **Select a CSV file to
   upload** box. You can only select one CSV file at a time.
@z

@x
   > [!NOTE]
   >
   > If the amount of email addresses in your CSV file exceeds the number of available seats in your organization, you
   > cannot continue to invite members. To invite members, you can purchase more seats, or remove some email addresses from
   > the CSV file and re-select the new file. To purchase more seats, see [Add seats to your
   > subscription](/subscription/add-seats/) or [Contact sales](https://www.docker.com/pricing/contact-sales/).
@y
   > [!NOTE]
   >
   > If the amount of email addresses in your CSV file exceeds the number of available seats in your organization, you
   > cannot continue to invite members. To invite members, you can purchase more seats, or remove some email addresses from
   > the CSV file and re-select the new file. To purchase more seats, see [Add seats to your
   > subscription](__SUBDIR__/subscription/add-seats/) or [Contact sales](https://www.docker.com/pricing/contact-sales/).
@z

@x
8. After the CSV file has been uploaded, select **Review**.
@y
8. After the CSV file has been uploaded, select **Review**.
@z

@x
   Valid email addresses and any email addresses that have issues appear.
   Email addresses may have the following issues:
@y
   Valid email addresses and any email addresses that have issues appear.
   Email addresses may have the following issues:
@z

@x
   - Invalid email: The email address is not a valid address.
     The email address will be ignored if you send invites.
     You can correct the email address in the CSV file and re-import the file.
   - Already invited: The user has already been sent an invite email and another invite email will not be sent.
   - Member: The user is already a member of your organization and an invite email will not be sent.
   - Duplicate: The CSV file has multiple occurrences of the same email address.
     The user will be sent only one invite email.
@y
   - Invalid email: The email address is not a valid address.
     The email address will be ignored if you send invites.
     You can correct the email address in the CSV file and re-import the file.
   - Already invited: The user has already been sent an invite email and another invite email will not be sent.
   - Member: The user is already a member of your organization and an invite email will not be sent.
   - Duplicate: The CSV file has multiple occurrences of the same email address.
     The user will be sent only one invite email.
@z

@x
9. Follow the on-screen instructions to invite members.
@y
9. Follow the on-screen instructions to invite members.
@z

@x
   > [!NOTE]
   >
   > When you invite members, you assign them a role.
   > See [Roles and permissions](/security/for-admins/roles-and-permissions/)
   > for details about the access permissions for each role.
@y
   > [!NOTE]
   >
   > When you invite members, you assign them a role.
   > See [Roles and permissions](__SUBDIR__/security/for-admins/roles-and-permissions/)
   > for details about the access permissions for each role.
@z

@x
Pending invitations appear in the table. The invitees receive an email with a link to Docker Hub where they can accept
or decline the invitation.
@y
Pending invitations appear in the table. The invitees receive an email with a link to Docker Hub where they can accept
or decline the invitation.
@z
