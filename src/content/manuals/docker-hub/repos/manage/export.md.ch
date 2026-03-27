%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Export organization repositories to CSV
linkTitle: Export repositories
description: Learn how to export a complete list of your organization's Docker Hub repositories using the API.
keywords: docker hub, organization, repositories, export, csv, api, personal access token, pat
@y
title: Export organization repositories to CSV
linkTitle: Export repositories
description: Learn how to export a complete list of your organization's Docker Hub repositories using the API.
keywords: docker hub, organization, repositories, export, csv, api, personal access token, pat
@z

@x
This guide shows you how to export a complete list of repositories from your
Docker Hub organization, including private repositories. You'll use a
Personal Access Token (PAT) from an administrator account to authenticate with
the Docker Hub API and export repository details to a CSV file for reporting or
analysis.
@y
This guide shows you how to export a complete list of repositories from your
Docker Hub organization, including private repositories. You'll use a
Personal Access Token (PAT) from an administrator account to authenticate with
the Docker Hub API and export repository details to a CSV file for reporting or
analysis.
@z

@x
The exported data includes repository name, visibility status, last updated
date, pull count, and star count.
@y
The exported data includes repository name, visibility status, last updated
date, pull count, and star count.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you begin, ensure you have:
@y
Before you begin, ensure you have:
@z

@x
- Administrator access to a Docker Hub organization
- `curl` installed for making API requests
- `jq` installed for JSON parsing
- A spreadsheet application to view the CSV
@y
- Administrator access to a Docker Hub organization
- `curl` installed for making API requests
- `jq` installed for JSON parsing
- A spreadsheet application to view the CSV
@z

@x
## Create a personal access token
@y
## Create a personal access token
@z

@x
[Create a personal access token](/security/access-tokens/) from
a user account that has access to the organization's repositories. When creating
the token, select at minimum **Read-only** access permissions to list
repositories.
@y
[Create a personal access token](/security/access-tokens/) from
a user account that has access to the organization's repositories. When creating
the token, select at minimum **Read-only** access permissions to list
repositories.
@z

@x
> [!IMPORTANT]
>
> Use a PAT from a user account that is a member of the organization. Users
> with owner roles can export all organization repositories. Members can only
> export repositories they have permission to access.
@y
> [!IMPORTANT]
>
> Use a PAT from a user account that is a member of the organization. Users
> with owner roles can export all organization repositories. Members can only
> export repositories they have permission to access.
@z

@x
## Authenticate with the Docker Hub API
@y
## Authenticate with the Docker Hub API
@z

@x
Exchange your personal access token for a JWT bearer token that you'll use
for subsequent API requests.
@y
Exchange your personal access token for a JWT bearer token that you'll use
for subsequent API requests.
@z

@x
1. Set your Docker Hub username, organization name, and personal access token as variables:
@y
1. Set your Docker Hub username, organization name, and personal access token as variables:
@z

% snip code...

@x
2. Call the authentication endpoint to get a JWT:
@y
2. Call the authentication endpoint to get a JWT:
@z

% snip code...

@x
3. Verify the token was retrieved successfully:
@y
3. Verify the token was retrieved successfully:
@z

% snip command...

@x
You'll use this JWT as a Bearer token in the `Authorization` header for all
subsequent API calls.
@y
You'll use this JWT as a Bearer token in the `Authorization` header for all
subsequent API calls.
@z

@x
## Retrieve all repositories
@y
## Retrieve all repositories
@z

@x
The Docker Hub API paginates repository lists. This script retrieves all pages
and combines the results.
@y
The Docker Hub API paginates repository lists. This script retrieves all pages
and combines the results.
@z

@x
1. Set the page size and initial API endpoint:
@y
1. Set the page size and initial API endpoint:
@z

% snip code...

@x
2. Paginate through all results:
@y
2. Paginate through all results:
@z

% snip code...

@x
3. Verify the number of repositories retrieved:
@y
3. Verify the number of repositories retrieved:
@z

% snip command...

@x
The script continues requesting the `next` URL from each response until
pagination is complete.
@y
The script continues requesting the `next` URL from each response until
pagination is complete.
@z

@x
## Export to CSV
@y
## Export to CSV
@z

@x
Generate a CSV file with repository details that you can open in
spreadsheet applications.
@y
Generate a CSV file with repository details that you can open in
spreadsheet applications.
@z

@x
Run the following command to create `repos.csv`:
@y
Run the following command to create `repos.csv`:
@z

% snip code...

@x
Verify the export completed:
@y
Verify the export completed:
@z

% snip command...

@x
Open the `repos.csv` file in your preferred
spreadsheet application to view and analyze your repository data.
@y
Open the `repos.csv` file in your preferred
spreadsheet application to view and analyze your repository data.
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
### Only public repositories appear
@y
### Only public repositories appear
@z

@x
The Docker Hub account associated with your personal access token may not have
access to private repositories in the organization.
@y
The Docker Hub account associated with your personal access token may not have
access to private repositories in the organization.
@z

@x
To fix this:
@y
To fix this:
@z

@x
1. Verify the account is a member of the organization
2. Check that the account has appropriate permissions (owner or member role)
3. Ensure the personal access token has sufficient access permissions
4. Regenerate the JWT and retry the export
@y
1. Verify the account is a member of the organization
2. Check that the account has appropriate permissions (owner or member role)
3. Ensure the personal access token has sufficient access permissions
4. Regenerate the JWT and retry the export
@z

@x
### API returns 403 or missing fields
@y
### API returns 403 or missing fields
@z

@x
Ensure you're using the JWT from the `/v2/auth/token` endpoint as a
Bearer token in the `Authorization` header, not the personal access
token directly.
@y
Ensure you're using the JWT from the `/v2/auth/token` endpoint as a
Bearer token in the `Authorization` header, not the personal access
token directly.
@z

@x
Verify your authentication:
@y
Verify your authentication:
@z

% snip command...

@x
If this returns an error, re-run the authentication step to get a fresh JWT.
@y
If this returns an error, re-run the authentication step to get a fresh JWT.
@z
