%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Export organization repositories to CSV
linkTitle: Export repositories
description: Learn how to export a complete list of your organization's Docker Hub repositories using the API.
keywords: docker hub, organization, repositories, export, csv, api, access token
@y
title: Export organization repositories to CSV
linkTitle: Export repositories
description: Learn how to export a complete list of your organization's Docker Hub repositories using the API.
keywords: docker hub, organization, repositories, export, csv, api, access token
@z

@x
This guide shows you how to export a complete list of repositories from your
Docker Hub organization, including private repositories. You'll use an
Organization Access Token (OAT) to authenticate with the Docker Hub API and
export repository details to a CSV file for reporting or analysis.
@y
This guide shows you how to export a complete list of repositories from your
Docker Hub organization, including private repositories. You'll use an
Organization Access Token (OAT) to authenticate with the Docker Hub API and
export repository details to a CSV file for reporting or analysis.
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
## Create an organization access token
@y
## Create an organization access token
@z

@x
Organization access tokens let you authenticate API requests without
interactive login steps.
@y
Organization access tokens let you authenticate API requests without
interactive login steps.
@z

@x
1. Navigate to your organization in [Docker Home](https://app.docker.com) and select **Admin Console**.
@y
1. Navigate to your organization in [Docker Home](https://app.docker.com) and select **Admin Console**.
@z

@x
2. Select **Access tokens** from the sidebar.
@y
2. Select **Access tokens** from the sidebar.
@z

@x
3. Select **Generate access token**.
@y
3. Select **Generate access token**.
@z

@x
4. Configure the token permissions:
@y
4. Configure the token permissions:
@z

@x
   - Under **Repository permissions**, add every repository you want the
     token to access
   - Assign at least **Image Pull** (read) access to each repository
   - You can add up to 50 repositories per token
@y
   - Under **Repository permissions**, add every repository you want the
     token to access
   - Assign at least **Image Pull** (read) access to each repository
   - You can add up to 50 repositories per token
@z

@x
5. Copy the generated token and store it securely.
@y
5. Copy the generated token and store it securely.
@z

@x
> [!IMPORTANT]
>
> If you only enable **Read public repositories**, the API will only return
> public repositories. To include private repositories in your export, you must
> explicitly add them to the token's repository permissions.
@y
> [!IMPORTANT]
>
> If you only enable **Read public repositories**, the API will only return
> public repositories. To include private repositories in your export, you must
> explicitly add them to the token's repository permissions.
@z

@x
## Authenticate with the Docker Hub API
@y
## Authenticate with the Docker Hub API
@z

@x
Exchange your organization access token for a JWT bearer token that you'll use
for subsequent API requests.
@y
Exchange your organization access token for a JWT bearer token that you'll use
for subsequent API requests.
@z

@x
1. Set your organization name and access token as variables:
@y
1. Set your organization name and access token as variables:
@z

% snip command...

@x
2. Call the authentication endpoint to get a JWT:
@y
2. Call the authentication endpoint to get a JWT:
@z

% snip command...

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

% snip command...

@x
2. Paginate through all results:
@y
2. Paginate through all results:
@z

% snip command...

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

% snip command...

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
Your organization access token may only have **Read public repositories**
enabled, or it lacks permissions for specific private repositories.
@y
Your organization access token may only have **Read public repositories**
enabled, or it lacks permissions for specific private repositories.
@z

@x
To fix this:
@y
To fix this:
@z

@x
1. Navigate to your organization's access tokens in Docker Hub
2. Select the token you created
3. Add private repositories to the token's permissions with at
   least **Image Pull** access
4. Regenerate the JWT and retry the export
@y
1. Navigate to your organization's access tokens in Docker Hub
2. Select the token you created
3. Add private repositories to the token's permissions with at
   least **Image Pull** access
4. Regenerate the JWT and retry the export
@z

@x
### API returns 403 or missing fields
@y
### API returns 403 or missing fields
@z

@x
Ensure you're using the JWT from the `/v2/users/login` endpoint as a
Bearer token in the `Authorization` header, not the organization access
token directly.
@y
Ensure you're using the JWT from the `/v2/users/login` endpoint as a
Bearer token in the `Authorization` header, not the organization access
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

@x
### Need access to all repositories
@y
### Need access to all repositories
@z

@x
Organization access tokens are scoped to specific repositories you select
during token creation. To export all repositories, you have two options:
@y
Organization access tokens are scoped to specific repositories you select
during token creation. To export all repositories, you have two options:
@z

@x
1. Add all repositories to the organization access token (up to 50 repositories)
2. Use a Personal Access Token (PAT) from an administrator account that has
   access across the entire organization
@y
1. Add all repositories to the organization access token (up to 50 repositories)
2. Use a Personal Access Token (PAT) from an administrator account that has
   access across the entire organization
@z

@x
The choice between these approaches depends on your organization's security
policies.
@y
The choice between these approaches depends on your organization's security
policies.
@z
