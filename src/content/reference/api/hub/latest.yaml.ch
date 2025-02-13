%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# yaml-language-server: $schema=https://raw.githubusercontent.com/OAI/OpenAPI-Specification/refs/heads/main/schemas/v3.0/schema.yaml
@y
# yaml-language-server: $schema=https://raw.githubusercontent.com/OAI/OpenAPI-Specification/refs/heads/main/schemas/v3.0/schema.yaml
@z

@x
openapi: 3.0.3
info:
  title: Docker HUB API
  version: beta
  x-logo:
    url: https://docs.docker.com/assets/images/logo-docker-main.png
    href: /reference
  description: |
    Docker Hub is a service provided by Docker for finding and sharing container images with your team.
@y
openapi: 3.0.3
info:
  title: Docker HUB API
  version: beta
  x-logo:
    url: https://docs.docker.com/assets/images/logo-docker-main.png
    href: /reference
  description: |
    Docker Hub is a service provided by Docker for finding and sharing container images with your team.
@z

@x
    It is the world's largest library and community for container images.
@y
    It is the world's largest library and community for container images.
@z

@x
    In addition to the [Docker Hub UI](https://docs.docker.com/docker-hub/) and [Docker Hub CLI tool](https://github.com/docker/hub-tool#readme) (currently experimental), Docker provides an API that allows you to interact with Docker Hub.
@y
    In addition to the [Docker Hub UI](https://docs.docker.com/docker-hub/) and [Docker Hub CLI tool](https://github.com/docker/hub-tool#readme) (currently experimental), Docker provides an API that allows you to interact with Docker Hub.
@z

@x
    Browse through the Docker Hub API documentation to explore the supported endpoints.
servers:
  - description: Docker HUB API
    x-audience: public
    url: https://hub.docker.com
tags:
  - name: resources
    x-displayName: Resources
    description: |
      The following resources are available to interact with the documented API:
      - [Docker Hub CLI tool](https://github.com/docker/hub-tool#readme) (currently experimental)
  - name: rate-limiting
    x-displayName: Rate Limiting
    description: |
      The Docker Hub API is limited on the amount of requests you can perform per minute against it.
@y
    Browse through the Docker Hub API documentation to explore the supported endpoints.
servers:
  - description: Docker HUB API
    x-audience: public
    url: https://hub.docker.com
tags:
  - name: resources
    x-displayName: Resources
    description: |
      The following resources are available to interact with the documented API:
      - [Docker Hub CLI tool](https://github.com/docker/hub-tool#readme) (currently experimental)
  - name: rate-limiting
    x-displayName: Rate Limiting
    description: |
      The Docker Hub API is limited on the amount of requests you can perform per minute against it.
@z

@x
      If you haven't hit the limit, each request to the API will return the following headers in the response.
@y
      If you haven't hit the limit, each request to the API will return the following headers in the response.
@z

@x
      - `X-RateLimit-Limit` - The limit of requests per minute.
      - `X-RateLimit-Remaining` - The remaining amount of calls within the limit period.
      - `X-RateLimit-Reset` - The unix timestamp of when the remaining resets.
@y
      - `X-RateLimit-Limit` - The limit of requests per minute.
      - `X-RateLimit-Remaining` - The remaining amount of calls within the limit period.
      - `X-RateLimit-Reset` - The unix timestamp of when the remaining resets.
@z

@x
      If you have hit the limit, you will receive a response status of `429` and the `X-Retry-After` header in the response.
@y
      If you have hit the limit, you will receive a response status of `429` and the `X-Retry-After` header in the response.
@z

@x
      The `X-Retry-After` header is a unix timestamp of when you can call the API again.
@y
      The `X-Retry-After` header is a unix timestamp of when you can call the API again.
@z

@x
      **Note**: These rate limits are separate from anti-abuse and Docker Hub download, or pull rate limiting.
      To learn more about Docker Hub pull rate limiting, see [Usage and limits](https://docs.docker.com/docker-hub/usage/).
  - name: authentication
    x-displayName: Authentication
    description: |
      Most Docker Hub API endpoints require you to authenticate using your Docker credentials before using them.
@y
      **Note**: These rate limits are separate from anti-abuse and Docker Hub download, or pull rate limiting.
      To learn more about Docker Hub pull rate limiting, see [Usage and limits](https://docs.docker.com/docker-hub/usage/).
  - name: authentication
    x-displayName: Authentication
    description: |
      Most Docker Hub API endpoints require you to authenticate using your Docker credentials before using them.
@z

@x
      Additionally, similar to the Docker Hub UI features, API endpoint responses may vary depending on your plan (Personal, Pro, or Team) and your account's permissions.
@y
      Additionally, similar to the Docker Hub UI features, API endpoint responses may vary depending on your plan (Personal, Pro, or Team) and your account's permissions.
@z

@x
      To learn more about the features available in each plan and to upgrade your existing plan, see [Docker Pricing](https://www.docker.com/pricing).
  - name: access-tokens
    x-displayName: Personal Access Tokens
    description: |
      The Personal Access Token endpoints lets you manage personal access tokens. For more information, see [Access Tokens](https://docs.docker.com/security/for-developers/access-tokens/).
@y
      To learn more about the features available in each plan and to upgrade your existing plan, see [Docker Pricing](https://www.docker.com/pricing).
  - name: access-tokens
    x-displayName: Personal Access Tokens
    description: |
      The Personal Access Token endpoints lets you manage personal access tokens. For more information, see [Access Tokens](https://docs.docker.com/security/for-developers/access-tokens/).
@z

@x
      You can use a personal access token instead of a password in the [Docker CLI](https://docs.docker.com/engine/reference/commandline/cli/) or in the [Create an authentication token](#operation/PostUsersLogin) route to obtain a bearer token.
@y
      You can use a personal access token instead of a password in the [Docker CLI](https://docs.docker.com/engine/reference/commandline/cli/) or in the [Create an authentication token](#operation/PostUsersLogin) route to obtain a bearer token.
@z

@x
      ### Scopes
@y
      ### Scopes
@z

@x
      For each scope grouping (in this case "repo"), you only need to define 1 scope as any lower scopes are assumed.
      For example: If you define `repo:write`, the API assumes the scope of both `repo:read` *and* `repo:public_read` as well.
      If you were to define both `repo:write` *and* `repo:read`, then `repo:read` is assumed by `repo:write` and ignored.
@y
      For each scope grouping (in this case "repo"), you only need to define 1 scope as any lower scopes are assumed.
      For example: If you define `repo:write`, the API assumes the scope of both `repo:read` *and* `repo:public_read` as well.
      If you were to define both `repo:write` *and* `repo:read`, then `repo:read` is assumed by `repo:write` and ignored.
@z

@x
      ***Treat your personal access token like your password and keep it secret. You cannot retrieve your token after it is generated.***
  - name: audit-logs
    x-displayName: Audit Logs
    description: |
      The Audit Logs API endpoints allow you to query audit log events across a namespace.
@y
      ***Treat your personal access token like your password and keep it secret. You cannot retrieve your token after it is generated.***
  - name: audit-logs
    x-displayName: Audit Logs
    description: |
      The Audit Logs API endpoints allow you to query audit log events across a namespace.
@z

@x
      For more information, see [Audit Log](https://docs.docker.com/admin/organization/activity-logs/).
  - name: org-settings
    x-displayName: Org Settings
    description: |
      The Org Settings API endpoints allow you to manage your organization's settings.
  - name: repositories
    x-displayName: Repositories
    description: |
      The repository endpoints allow you to access your repository's tags.
  - name: orgs
    x-displayName: Organizations
    x-audience: public
    description: |
      The organization endpoints allow you to interact with and manage your organizations.
@y
      For more information, see [Audit Log](https://docs.docker.com/admin/organization/activity-logs/).
  - name: org-settings
    x-displayName: Org Settings
    description: |
      The Org Settings API endpoints allow you to manage your organization's settings.
  - name: repositories
    x-displayName: Repositories
    description: |
      The repository endpoints allow you to access your repository's tags.
  - name: orgs
    x-displayName: Organizations
    x-audience: public
    description: |
      The organization endpoints allow you to interact with and manage your organizations.
@z

@x
      For more information, see [Organization administration overview](https://docs.docker.com/admin/organization/).
  - name: groups
    x-displayName: Groups (Teams)
    x-audience: public
    description: |
      The groups endpoints allow you to manage your organization's teams and their members.
@y
      For more information, see [Organization administration overview](https://docs.docker.com/admin/organization/).
  - name: groups
    x-displayName: Groups (Teams)
    x-audience: public
    description: |
      The groups endpoints allow you to manage your organization's teams and their members.
@z

@x
      For more information, seee [Create and manage a team](https://docs.docker.com/admin/organization/manage-a-team/).
  - name: invites
    x-displayName: Invites
    x-audience: public
    description: |
      The invites endpoints allow you to manage invites for users to join your Docker organization.
@y
      For more information, seee [Create and manage a team](https://docs.docker.com/admin/organization/manage-a-team/).
  - name: invites
    x-displayName: Invites
    x-audience: public
    description: |
      The invites endpoints allow you to manage invites for users to join your Docker organization.
@z

@x
      For more information, see [Invite members](https://docs.docker.com/admin/organization/members/#invite-members).
  - name: scim
    x-displayName: SCIM
    x-audience: public
    description: |
      SCIM is a provisioning system that lets you manage users within your identity provider (IdP).
@y
      For more information, see [Invite members](https://docs.docker.com/admin/organization/members/#invite-members).
  - name: scim
    x-displayName: SCIM
    x-audience: public
    description: |
      SCIM is a provisioning system that lets you manage users within your identity provider (IdP).
@z

@x
      For more information, see [System for Cross-domain Identity management](https://docs.docker.com/security/for-admins/provisioning/scim/).
paths:
  /v2/users/login:
    post:
      tags:
        - authentication
      summary: Create an authentication token
      operationId: PostUsersLogin
      security: []
      deprecated: true
      description: |
        Creates and returns a bearer token in JWT format that you can use to authenticate with Docker Hub APIs.
@y
      For more information, see [System for Cross-domain Identity management](https://docs.docker.com/security/for-admins/provisioning/scim/).
paths:
  /v2/users/login:
    post:
      tags:
        - authentication
      summary: Create an authentication token
      operationId: PostUsersLogin
      security: []
      deprecated: true
      description: |
        Creates and returns a bearer token in JWT format that you can use to authenticate with Docker Hub APIs.
@z

@x
        The returned token is used in the HTTP Authorization header like `Authorization: Bearer {TOKEN}`.
@y
        The returned token is used in the HTTP Authorization header like `Authorization: Bearer {TOKEN}`.
@z

@x
        _**As of September 16, 2024, this route requires a personal access token (PAT) instead of a password if your organization has SSO enforced.**_
@y
        _**As of September 16, 2024, this route requires a personal access token (PAT) instead of a password if your organization has SSO enforced.**_
@z

@x
        <div style="background-color:rgb(255, 165, 0, .25); padding:5px; border-radius:4px">
          <strong>Deprecated</strong>: Use [<a href="#tag/authentication/operation/AuthCreateAccessToken">Create access token</a>] instead.
        </div>
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/UsersLoginRequest'
        description: Login details.
        required: true
      responses:
        '200':
          description: Authentication successful
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/PostUsersLoginSuccessResponse'
        '401':
          description: Authentication failed or second factor required
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/PostUsersLoginErrorResponse'
  /v2/users/2fa-login:
    post:
      tags:
        - authentication
      summary: Second factor authentication
      operationId: PostUsers2FALogin
      security: []
      description: |
        When a user has two-factor authentication (2FA) enabled, this is the second call to perform after `/v2/users/login` call.
@y
        <div style="background-color:rgb(255, 165, 0, .25); padding:5px; border-radius:4px">
          <strong>Deprecated</strong>: Use [<a href="#tag/authentication/operation/AuthCreateAccessToken">Create access token</a>] instead.
        </div>
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/UsersLoginRequest'
        description: Login details.
        required: true
      responses:
        '200':
          description: Authentication successful
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/PostUsersLoginSuccessResponse'
        '401':
          description: Authentication failed or second factor required
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/PostUsersLoginErrorResponse'
  /v2/users/2fa-login:
    post:
      tags:
        - authentication
      summary: Second factor authentication
      operationId: PostUsers2FALogin
      security: []
      description: |
        When a user has two-factor authentication (2FA) enabled, this is the second call to perform after `/v2/users/login` call.
@z

@x
        Creates and returns a bearer token in JWT format that you can use to authenticate with Docker Hub APIs.
@y
        Creates and returns a bearer token in JWT format that you can use to authenticate with Docker Hub APIs.
@z

@x
        The returned token is used in the HTTP Authorization header like `Authorization: Bearer {TOKEN}`.
@y
        The returned token is used in the HTTP Authorization header like `Authorization: Bearer {TOKEN}`.
@z

@x
        Most Docker Hub APIs require this token either to consume or to get detailed information. For example, to list images in a private repository.
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Users2FALoginRequest'
        description: Login details.
        required: true
      responses:
        '200':
          description: Authentication successful
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/PostUsersLoginSuccessResponse'
        '401':
          description: Authentication failed
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/PostUsers2FALoginErrorResponse'
  /v2/auth/token:
    post:
      tags:
        - authentication
      security: []
      summary: Create access token
      operationId: AuthCreateAccessToken
      description: |
        Creates and returns a short-lived access token in JWT format for use as a bearer when calling Docker APIs.
@y
        Most Docker Hub APIs require this token either to consume or to get detailed information. For example, to list images in a private repository.
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Users2FALoginRequest'
        description: Login details.
        required: true
      responses:
        '200':
          description: Authentication successful
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/PostUsersLoginSuccessResponse'
        '401':
          description: Authentication failed
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/PostUsers2FALoginErrorResponse'
  /v2/auth/token:
    post:
      tags:
        - authentication
      security: []
      summary: Create access token
      operationId: AuthCreateAccessToken
      description: |
        Creates and returns a short-lived access token in JWT format for use as a bearer when calling Docker APIs.
@z

@x
        If successful, the access token returned should be used in the HTTP Authorization header like 
        `Authorization: Bearer {access_token}`.
@y
        If successful, the access token returned should be used in the HTTP Authorization header like 
        `Authorization: Bearer {access_token}`.
@z

@x
        _**If your organization has SSO enforced, you must use a personal access token (PAT) instead of a password.**_
      requestBody:
        content:
          application/json:
            schema:
              description: Request to create access token
              type: object
              required:
                - identifier
                - secret
              properties:
                identifier:
                  description: |
                    The identifier of the account to create an access token for. If using a password or personal access token,
                    this must be a username. If using an organization access token, this must be an organization name.
                  type: string
                  example: myusername
                secret:
                  description: |
                    The secret of the account to create an access token for. This can be a password, personal access token, or
                    organization access token.
                  type: string
                  example: dckr_pat_124509ugsdjga93
      responses:
        '200':
          description: Token created
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/AuthCreateTokenResponse'
        '401':
          description: Authentication failed
          $ref: '#/components/responses/unauthorized'
  /v2/access-tokens:
    post:
      summary: Create a personal access token
      description: Creates and returns a personal access token.
      tags:
        - access-tokens
      security:
        - bearerAuth: []
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/createAccessTokenRequest'
        required: true
      responses:
        '201':
          description: Created
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/createAccessTokensResponse'
        '400':
          $ref: '#/components/responses/BadRequest'
        '401':
          $ref: '#/components/responses/Unauthorized'
    get:
      summary: Get a list of personal access tokens
      description: Returns a paginated list of personal access tokens.
      tags:
        - access-tokens
      security: 
        - bearerAuth: []
      parameters:
        - in: query
          name: page
          schema:
            type: number
            default: 1
        - in: query
          name: page_size
          schema:
            type: number
            default: 10
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/getAccessTokensResponse'
        '400':
          $ref: '#/components/responses/BadRequest'
        '401':
          $ref: '#/components/responses/Unauthorized'
  /v2/access-tokens/{uuid}:
    parameters:
      - in: path
        name: uuid
        required: true
        schema:
          type: string
    patch:
      summary: Update a personal access token
      description: |
        Updates a personal access token partially. You can either update the token's label or enable/disable it.
      tags:
        - access-tokens
      security: 
        - bearerAuth: []
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/patchAccessTokenRequest'
        required: true
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/patchAccessTokenResponse'
        '400':
          $ref: '#/components/responses/BadRequest'
        '401':
          $ref: '#/components/responses/Unauthorized'
    get:
      summary: Get a personal access token
      description: Returns a personal access token by UUID.
      tags:
        - access-tokens
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                allOf:
                  - $ref: '#/components/schemas/accessToken'
                  - type: object
                    properties:
                      token:
                        type: string
                        example: ''
        '401':
          $ref: '#/components/responses/Unauthorized'
        '404':
          $ref: '#/components/responses/NotFound'
    delete:
      summary: Delete a personal access token
      description: |
        Deletes a personal access token permanently. This cannot be undone.
      tags:
        - access-tokens
      security: 
        - bearerAuth: []
      responses:
        '204':
          description: A successful response.
        '401':
          $ref: '#/components/responses/Unauthorized'
        '404':
          $ref: '#/components/responses/NotFound'
  /v2/auditlogs/{account}:
    get:
      summary: Returns list of audit log events
      description: Get audit log events for a given namespace.
      operationId: AuditLogs_GetAuditLogs
      security:
        - bearerAuth: []
      responses:
        '200':
          description: A successful response.
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/GetAuditLogsResponse'
              examples:
                response:
                  value:
                    logs:
                      - account: docker
                        action: repo.tag.push
                        name: docker/example
                        actor: docker
                        data:
                          digest: sha256:c1ae9c435032a276f80220c7d9b40f76266bbe79243d34f9cda30b76fe114dfa
                          tag: latest
                        timestamp: '2021-02-19T01:34:35Z'
                        action_description: |
                          pushed the tag latest with the digest sha256:c1ae9c435032a to the repository docker/example
        '429':
          description: ''
          content:
            application/json:
              schema: {}
              examples:
                response:
                  value:
                    detail: Rate limit exceeded
                    error: false
        '500':
          description: ''
          content:
            application/json:
              schema: {}
        default:
          description: An unexpected error response.
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/rpcStatus'
      parameters:
        - name: account
          description: Namespace to query audit logs for.
          in: path
          required: true
          schema:
            type: string
        - name: action
          description: |
            action name one of ["repo.tag.push", ...]. Optional parameter to filter specific audit log actions.
          in: query
          required: false
          schema:
            type: string
        - name: name
          description: |
            name. Optional parameter to filter audit log events to a specific name. For repository events, this is the name of the repository. For organization events, this is the name of the organization. For team member events, this is the username of the team member.
          in: query
          required: false
          schema:
            type: string
        - name: actor
          description: |
            actor name. Optional parameter to filter audit log events to the specific user who triggered the event.
          in: query
          required: false
          schema:
            type: string
        - name: from
          description: Start of the time window you wish to query audit events for.
          in: query
          required: false
          schema:
            type: string
            format: date-time
        - name: to
          description: End of the time window you wish to query audit events for.
          in: query
          required: false
          schema:
            type: string
            format: date-time
        - name: page
          description: page - specify page number. Page number to get.
          in: query
          required: false
          schema:
            type: integer
            format: int32
            default: 1
        - name: page_size
          description: page_size - specify page size. Number of events to return per page.
          in: query
          required: false
          schema:
            type: integer
            format: int32
            default: 25
      tags:
        - audit-logs
  /v2/auditlogs/{account}/actions:
    get:
      summary: Returns list of audit log actions
      description: |
        Get audit log actions for a namespace to be used as a filter for querying audit events.
      operationId: AuditLogs_GetAuditActions
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: A successful response.
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/GetAuditActionsResponse'
              examples:
                response:
                  value:
                    actions:
                      org:
                        actions:
                          - name: team.create
                            description: contains team create events
                            label: Team Created
                          - name: team.delete
                            description: contains team delete events
                            label: Team Deleted
                          - name: team.member.add
                            description: contains team member add events
                            label: Team Member Added
                          - name: team.member.remove
                            description: contains team member remove events
                            label: Team Member Removed
                          - name: team.member.invite
                            description: contains team member invite events
                            label: Team Member Invited
                          - name: member.removed
                            description: contains org member remove events
                            label: Organization Member Removed
                          - name: create
                            description: contains organization create events
                            label: Organization Created
                        label: Organization
                      repo:
                        actions:
                          - name: create
                            description: contains repository create events
                            label: Repository Created
                          - name: delete
                            description: contains repository delete events
                            label: Repository Deleted
                          - name: change_privacy
                            description: contains repository privacy change events
                            label: Privacy Changed
                          - name: tag.push
                            description: contains image tag push events
                            label: Tag Pushed
                          - name: tag.delete
                            description: contains image tag delete events
                            label: Tag Deleted
                        label: Repository
        '429':
          description: ''
          content:
            application/json:
              schema: {}
              examples:
                response:
                  value:
                    detail: Rate limit exceeded
                    error: false
        '500':
          description: ''
          content:
            application/json:
              schema: {}
        default:
          description: An unexpected error response.
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/rpcStatus'
      parameters:
        - name: account
          description: Namespace to query audit log actions for.
          in: path
          required: true
          schema:
            type: string
      tags:
        - audit-logs
  /v2/orgs/{name}/settings:
    parameters:
      - in: path
        name: name
        description: Name of the organization.
        required: true
        schema:
          type: string
    get:
      summary: Get organization settings
      description: |
        Returns organization settings by name.
      tags:
        - org-settings
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/orgSettings'
        '401':
          $ref: '#/components/responses/Unauthorized'
        '403':
          $ref: '#/components/responses/Forbidden'
        '404':
          $ref: '#/components/responses/NotFound'
    put:
      summary: Update organization settings
      description: |
        Updates an organization's settings. Some settings are only used when the organization is on a business plan.
@y
        _**If your organization has SSO enforced, you must use a personal access token (PAT) instead of a password.**_
      requestBody:
        content:
          application/json:
            schema:
              description: Request to create access token
              type: object
              required:
                - identifier
                - secret
              properties:
                identifier:
                  description: |
                    The identifier of the account to create an access token for. If using a password or personal access token,
                    this must be a username. If using an organization access token, this must be an organization name.
                  type: string
                  example: myusername
                secret:
                  description: |
                    The secret of the account to create an access token for. This can be a password, personal access token, or
                    organization access token.
                  type: string
                  example: dckr_pat_124509ugsdjga93
      responses:
        '200':
          description: Token created
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/AuthCreateTokenResponse'
        '401':
          description: Authentication failed
          $ref: '#/components/responses/unauthorized'
  /v2/access-tokens:
    post:
      summary: Create a personal access token
      description: Creates and returns a personal access token.
      tags:
        - access-tokens
      security:
        - bearerAuth: []
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/createAccessTokenRequest'
        required: true
      responses:
        '201':
          description: Created
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/createAccessTokensResponse'
        '400':
          $ref: '#/components/responses/BadRequest'
        '401':
          $ref: '#/components/responses/Unauthorized'
    get:
      summary: Get a list of personal access tokens
      description: Returns a paginated list of personal access tokens.
      tags:
        - access-tokens
      security: 
        - bearerAuth: []
      parameters:
        - in: query
          name: page
          schema:
            type: number
            default: 1
        - in: query
          name: page_size
          schema:
            type: number
            default: 10
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/getAccessTokensResponse'
        '400':
          $ref: '#/components/responses/BadRequest'
        '401':
          $ref: '#/components/responses/Unauthorized'
  /v2/access-tokens/{uuid}:
    parameters:
      - in: path
        name: uuid
        required: true
        schema:
          type: string
    patch:
      summary: Update a personal access token
      description: |
        Updates a personal access token partially. You can either update the token's label or enable/disable it.
      tags:
        - access-tokens
      security: 
        - bearerAuth: []
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/patchAccessTokenRequest'
        required: true
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/patchAccessTokenResponse'
        '400':
          $ref: '#/components/responses/BadRequest'
        '401':
          $ref: '#/components/responses/Unauthorized'
    get:
      summary: Get a personal access token
      description: Returns a personal access token by UUID.
      tags:
        - access-tokens
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                allOf:
                  - $ref: '#/components/schemas/accessToken'
                  - type: object
                    properties:
                      token:
                        type: string
                        example: ''
        '401':
          $ref: '#/components/responses/Unauthorized'
        '404':
          $ref: '#/components/responses/NotFound'
    delete:
      summary: Delete a personal access token
      description: |
        Deletes a personal access token permanently. This cannot be undone.
      tags:
        - access-tokens
      security: 
        - bearerAuth: []
      responses:
        '204':
          description: A successful response.
        '401':
          $ref: '#/components/responses/Unauthorized'
        '404':
          $ref: '#/components/responses/NotFound'
  /v2/auditlogs/{account}:
    get:
      summary: Returns list of audit log events
      description: Get audit log events for a given namespace.
      operationId: AuditLogs_GetAuditLogs
      security:
        - bearerAuth: []
      responses:
        '200':
          description: A successful response.
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/GetAuditLogsResponse'
              examples:
                response:
                  value:
                    logs:
                      - account: docker
                        action: repo.tag.push
                        name: docker/example
                        actor: docker
                        data:
                          digest: sha256:c1ae9c435032a276f80220c7d9b40f76266bbe79243d34f9cda30b76fe114dfa
                          tag: latest
                        timestamp: '2021-02-19T01:34:35Z'
                        action_description: |
                          pushed the tag latest with the digest sha256:c1ae9c435032a to the repository docker/example
        '429':
          description: ''
          content:
            application/json:
              schema: {}
              examples:
                response:
                  value:
                    detail: Rate limit exceeded
                    error: false
        '500':
          description: ''
          content:
            application/json:
              schema: {}
        default:
          description: An unexpected error response.
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/rpcStatus'
      parameters:
        - name: account
          description: Namespace to query audit logs for.
          in: path
          required: true
          schema:
            type: string
        - name: action
          description: |
            action name one of ["repo.tag.push", ...]. Optional parameter to filter specific audit log actions.
          in: query
          required: false
          schema:
            type: string
        - name: name
          description: |
            name. Optional parameter to filter audit log events to a specific name. For repository events, this is the name of the repository. For organization events, this is the name of the organization. For team member events, this is the username of the team member.
          in: query
          required: false
          schema:
            type: string
        - name: actor
          description: |
            actor name. Optional parameter to filter audit log events to the specific user who triggered the event.
          in: query
          required: false
          schema:
            type: string
        - name: from
          description: Start of the time window you wish to query audit events for.
          in: query
          required: false
          schema:
            type: string
            format: date-time
        - name: to
          description: End of the time window you wish to query audit events for.
          in: query
          required: false
          schema:
            type: string
            format: date-time
        - name: page
          description: page - specify page number. Page number to get.
          in: query
          required: false
          schema:
            type: integer
            format: int32
            default: 1
        - name: page_size
          description: page_size - specify page size. Number of events to return per page.
          in: query
          required: false
          schema:
            type: integer
            format: int32
            default: 25
      tags:
        - audit-logs
  /v2/auditlogs/{account}/actions:
    get:
      summary: Returns list of audit log actions
      description: |
        Get audit log actions for a namespace to be used as a filter for querying audit events.
      operationId: AuditLogs_GetAuditActions
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: A successful response.
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/GetAuditActionsResponse'
              examples:
                response:
                  value:
                    actions:
                      org:
                        actions:
                          - name: team.create
                            description: contains team create events
                            label: Team Created
                          - name: team.delete
                            description: contains team delete events
                            label: Team Deleted
                          - name: team.member.add
                            description: contains team member add events
                            label: Team Member Added
                          - name: team.member.remove
                            description: contains team member remove events
                            label: Team Member Removed
                          - name: team.member.invite
                            description: contains team member invite events
                            label: Team Member Invited
                          - name: member.removed
                            description: contains org member remove events
                            label: Organization Member Removed
                          - name: create
                            description: contains organization create events
                            label: Organization Created
                        label: Organization
                      repo:
                        actions:
                          - name: create
                            description: contains repository create events
                            label: Repository Created
                          - name: delete
                            description: contains repository delete events
                            label: Repository Deleted
                          - name: change_privacy
                            description: contains repository privacy change events
                            label: Privacy Changed
                          - name: tag.push
                            description: contains image tag push events
                            label: Tag Pushed
                          - name: tag.delete
                            description: contains image tag delete events
                            label: Tag Deleted
                        label: Repository
        '429':
          description: ''
          content:
            application/json:
              schema: {}
              examples:
                response:
                  value:
                    detail: Rate limit exceeded
                    error: false
        '500':
          description: ''
          content:
            application/json:
              schema: {}
        default:
          description: An unexpected error response.
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/rpcStatus'
      parameters:
        - name: account
          description: Namespace to query audit log actions for.
          in: path
          required: true
          schema:
            type: string
      tags:
        - audit-logs
  /v2/orgs/{name}/settings:
    parameters:
      - in: path
        name: name
        description: Name of the organization.
        required: true
        schema:
          type: string
    get:
      summary: Get organization settings
      description: |
        Returns organization settings by name.
      tags:
        - org-settings
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/orgSettings'
        '401':
          $ref: '#/components/responses/Unauthorized'
        '403':
          $ref: '#/components/responses/Forbidden'
        '404':
          $ref: '#/components/responses/NotFound'
    put:
      summary: Update organization settings
      description: |
        Updates an organization's settings. Some settings are only used when the organization is on a business plan.
@z

@x
        ***Only users with administrative privileges for the organization (owner role) can modify these settings.***
@y
        ***Only users with administrative privileges for the organization (owner role) can modify these settings.***
@z

@x
        The following settings are only used on a business plan:
        - `restricted_images`
      tags:
        - org-settings
      security: 
        - bearerAuth: []
      requestBody:
        content:
          application/json:
            schema:
              required:
                - restricted_images
              properties:
                restricted_images:
                  allOf:
                    - $ref: '#/components/schemas/restricted_images'
                    - type: object
                      required:
                        - enabled
                        - allow_official_images
                        - allow_verified_publishers
        required: true
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/orgSettings'
        '401':
          $ref: '#/components/responses/Unauthorized'
        '403':
          $ref: '#/components/responses/Forbidden'
        '404':
          $ref: '#/components/responses/NotFound'
  /v2/namespaces/{namespace}/repositories/{repository}/tags:
    parameters:
      - $ref: '#/components/parameters/namespace'
      - $ref: '#/components/parameters/repository'
    get:
      summary: List repository tags
      tags:
        - repositories
      security: 
        - bearerAuth: []
      parameters:
        - in: query
          name: page
          required: false
          schema:
            type: integer
          description: Page number to get. Defaults to 1.
        - in: query
          name: page_size
          required: false
          schema:
            type: integer
          description: Number of items to get per page. Defaults to 10. Max of 100.
      responses:
        '200':
          $ref: '#/components/responses/list_tags'
        '403':
          $ref: '#/components/responses/Forbidden'
        '404':
          $ref: '#/components/responses/NotFound'
    head:
      summary: Check repository tags
      tags:
        - repositories
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: Repository contains tags
        '403':
          $ref: '#/components/responses/Forbidden'
        '404':
          $ref: '#/components/responses/NotFound'
  /v2/namespaces/{namespace}/repositories/{repository}/tags/{tag}:
    parameters:
      - $ref: '#/components/parameters/namespace'
      - $ref: '#/components/parameters/repository'
      - $ref: '#/components/parameters/tag'
    get:
      summary: Read repository tag
      tags:
        - repositories
      security: 
        - bearerAuth: []
      responses:
        '200':
          $ref: '#/components/responses/get_tag'
        '403':
          $ref: '#/components/responses/Forbidden'
        '404':
          $ref: '#/components/responses/NotFound'
    head:
      summary: Check repository tag
      tags:
        - repositories
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: Repository tag exists
        '403':
          $ref: '#/components/responses/Forbidden'
        '404':
          $ref: '#/components/responses/NotFound'
  /v2/orgs/{org_name}/members:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/org_name'
      - $ref: '#/components/parameters/search'
      - $ref: '#/components/parameters/page'
      - $ref: '#/components/parameters/page_size'
      - $ref: '#/components/parameters/invites'
      - $ref: '#/components/parameters/type'
      - $ref: '#/components/parameters/role'
    get:
      summary: List org members
      description: |
        Returns a list of members for an organization"
      tags:
        - orgs
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: List of members
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/org_member_paginated'
        '400':
          $ref: '#/components/responses/bad_request'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/orgs/{org_name}/members/export:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/org_name'
    get:
      summary: Export org members CSV
      description: |
        Export members of an organization as a CSV
      tags:
        - orgs
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: Exported members
          content:
            text/csv:
              schema:
                type: array
                items:
                  type: object
                  required:
                    - Name
                    - Username
                    - Email
                    - Type
                    - Role
                    - Date Joined
                  properties:
                    Name:
                      type: string
                      description: First and last name of the member
                    Username:
                      type: string
                      description: Username of the member
                    Email:
                      type: string
                      description: Email address of the member
                    Type:
                      type: string
                      description: Type of the member
                      enum:
                        - Invitee
                        - User
                    Permission:
                      type: string
                      description: Permission of the member
                      enum:
                        - Owner
                        - Member
                    Teams:
                      type: string
                      description: Comma-separated list of teams the member is part of
                      example: team-1, team-2
                    Date Joined:
                      type: string
                      description: Date the member joined the organization
                      example: 2020-01-01 15:00:51.193355 +0000 UTC
          headers:
            Content-Disposition:
              schema:
                type: string
              example: attachment;filename="{org_name}-members-{timestamp}.csv"
        '400':
          $ref: '#/components/responses/bad_request'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/orgs/{org_name}/members/{username}:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/org_name'
      - $ref: '#/components/parameters/username'
    put:
      summary: Update org member (role)
      description: |
        Updates the role of a member in the organization.
        ***Only users in the "owners" group of the organization can use this endpoint.***
      tags:
        - orgs
      security: 
        - bearerAuth: []
      requestBody:
        required: true
        content:
          application/json:
            schema:
              required:
                - role
              properties:
                role:
                  type: string
                  description: Role of the member
                  enum:
                    - owner
                    - editor
                    - member
      responses:
        '200':
          description: Member role updated
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/org_member'
        '400':
          $ref: '#/components/responses/bad_request'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
    delete:
      summary: Remove member from org
      description: |
        Removes the member from the org, ie. all groups in the org, unless they're the last owner
      tags:
        - orgs
      security: 
        - bearerAuth: []
      responses:
        '204':
          description: Member removed successfully
        '400':
          $ref: '#/components/responses/bad_request'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/orgs/{org_name}/invites:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/org_name'
    get:
      summary: List org invites
      description: |
        Return all pending invites for a given org, only team owners can call this endpoint
      tags:
        - invites
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: ''
          content:
            application/json:
              schema:
                type: object
                properties:
                  data:
                    type: array
                    items:
                      $ref: '#/components/schemas/invite'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/orgs/{org_name}/groups:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/org_name'
    get:
      summary: Get groups of an organization
      tags:
        - groups
      security: 
        - bearerAuth: []
      parameters:
        - $ref: '#/components/parameters/page'
        - $ref: '#/components/parameters/page_size'
        - in: query
          name: username
          schema:
            type: string
          description: Get groups for the specified username in the organization.
        - in: query
          name: search
          schema:
            type: string
          description: Get groups for the specified group in the organization.
      responses:
        '200':
          description: ''
          content:
            application/json:
              schema:
                properties:
                  count:
                    type: number
                    example: 1
                  next:
                    type: string
                    example: null
                  previous:
                    type: string
                    example: null
                  results:
                    type: array
                    items:
                      $ref: '#/components/schemas/org_group'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
    post:
      summary: Create a new group
      description: Create a new group within an organization.
      tags:
        - groups
      security: 
        - bearerAuth: []
      requestBody:
        content:
          application/json:
            schema:
              required:
                - name
              properties:
                name:
                  type: string
                description:
                  type: string
      responses:
        '201':
          description: Group created successfully
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/org_group'
        '400':
          $ref: '#/components/responses/bad_request'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
  /v2/orgs/{org_name}/groups/{group_name}:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/org_name'
      - $ref: '#/components/parameters/group_name'
    get:
      summary: Get a group of an organization
      tags:
        - groups
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: ''
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/org_group'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
    put:
      summary: Update the details for an organization group
      tags:
        - groups
      security: 
        - bearerAuth: []
      requestBody:
        content:
          application/json:
            schema:
              required:
                - name
              properties:
                name:
                  type: string
                description:
                  type: string
      responses:
        '200':
          description: ''
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/org_group'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
    patch:
      summary: Update some details for an organization group
      tags:
        - groups
      security: 
        - bearerAuth: []
      requestBody:
        content:
          application/json:
            schema:
              properties:
                name:
                  type: string
                description:
                  type: string
      responses:
        '200':
          description: ''
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/org_group'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
    delete:
      summary: Delete an organization group
      tags:
        - groups
      security: 
        - bearerAuth: []
      responses:
        '204':
          description: Group deleted successfully
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/orgs/{org_name}/groups/{group_name}/members:
    x-audience: public
    get:
      security: 
        - bearerAuth: []
      parameters:
        - $ref: '#/components/parameters/org_name'
        - $ref: '#/components/parameters/group_name'
        - $ref: '#/components/parameters/page'
        - $ref: '#/components/parameters/page_size'
        - in: query
          name: search
          schema:
            type: string
          description: Search members by username, full_name or email.
      summary: List members of a group
      description: |
        List the members (users) that are in a group.
        If user is owner of the org or has otherwise elevated permissions, they can search by email and the result will also contain emails.
      tags:
        - groups
      responses:
        '200':
          description: ''
          content:
            application/json:
              schema:
                properties:
                  count:
                    type: number
                    example: 1
                  next:
                    type: string
                    example: null
                  previous:
                    type: string
                    example: null
                  results:
                    type: array
                    items:
                      $ref: '#/components/schemas/group_member'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
    post:
      parameters:
        - $ref: '#/components/parameters/org_name'
        - $ref: '#/components/parameters/group_name'
      summary: Adds a member to a group
      tags:
        - groups
      security: 
        - bearerAuth: []
      requestBody:
        $ref: '#/components/requestBodies/add_member_to_org_group'
      responses:
        '200':
          description: OK
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
        '500':
          $ref: '#/components/responses/internal_error'
  /v2/orgs/{org_name}/groups/{group_name}/members/{username}:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/org_name'
      - $ref: '#/components/parameters/group_name'
      - $ref: '#/components/parameters/username'
    delete:
      summary: Removes a user from a group
      tags:
        - groups
      security: 
        - bearerAuth: []
      responses:
        '204':
          description: User removed successfully
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/invites/{id}:
    x-audience: public
    parameters:
      - in: path
        name: id
        required: true
        schema:
          type: string
    delete:
      summary: Cancel an invite
      description: |
        Mark the invite as cancelled so it doesn't show up on the list of pending invites
      tags:
        - invites
      security: 
        - bearerAuth: []
      responses:
        '204':
          description: ''
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/invites/{id}/resend:
    x-audience: public
    parameters:
      - in: path
        name: id
        schema:
          type: string
        required: true
    patch:
      summary: Resend an invite
      description: |
        Resend a pending invite to the user, any org owner can resend an invite
      tags:
        - invites
      security: 
        - bearerAuth: []
      responses:
        '204':
          description: ''
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/invites/bulk:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/bulk_invite'
    post:
      summary: Bulk create invites
      description: |
        Create multiple invites by emails or DockerIDs. Only a team owner can create invites.
      tags:
        - invites
      requestBody:
        $ref: '#/components/requestBodies/bulk_invite_request'
      security: 
        - bearerAuth: []
      responses:
        '202':
          description: Accepted
          content:
            application/json:
              schema:
                type: object
                properties:
                  invitees:
                    $ref: '#/components/schemas/bulk_invite'
        '400':
          $ref: '#/components/responses/bad_request'
        '409':
          $ref: '#/components/responses/conflict'
  /v2/scim/2.0/ServiceProviderConfig:
    x-audience: public
    get:
      summary: Get service provider config
      description: |
        Returns a service provider config for Docker's configuration.
      tags:
        - scim
      security:
        - bearerSCIMAuth: []
      responses:
        '200':
          $ref: '#/components/responses/scim_get_service_provider_config_resp'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '500':
          $ref: '#/components/responses/scim_error'
  /v2/scim/2.0/ResourceTypes:
    x-audience: public
    get:
      summary: List resource types
      description: |
        Returns all resource types supported for the SCIM configuration.
      tags:
        - scim
      security:
        - bearerSCIMAuth: []
      responses:
        '200':
          $ref: '#/components/responses/scim_get_resource_types_resp'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '500':
          $ref: '#/components/responses/scim_error'
  /v2/scim/2.0/ResourceTypes/{name}:
    x-audience: public
    get:
      summary: Get a resource type
      description: |
        Returns a resource type by name.
      tags:
        - scim
      parameters:
        - name: name
          in: path
          schema:
            type: string
          example: User
          required: true
      security:
        - bearerSCIMAuth: []
      responses:
        '200':
          $ref: '#/components/responses/scim_get_resource_type_resp'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '404':
          $ref: '#/components/responses/scim_not_found'
        '500':
          $ref: '#/components/responses/scim_error'
  /v2/scim/2.0/Schemas:
    x-audience: public
    get:
      summary: List schemas
      description: |
        Returns all schemas supported for the SCIM configuration.
      tags:
        - scim
      security:
        - bearerSCIMAuth: []
      responses:
        '200':
          $ref: '#/components/responses/scim_get_schemas_resp'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '500':
          $ref: '#/components/responses/scim_error'
  /v2/scim/2.0/Schemas/{id}:
    x-audience: public
    get:
      summary: Get a schema
      description: |
        Returns a schema by ID.
      tags:
        - scim
      parameters:
        - name: id
          in: path
          schema:
            type: string
          example: urn:ietf:params:scim:schemas:core:2.0:User
          required: true
      security:
        - bearerSCIMAuth: []
      responses:
        '200':
          $ref: '#/components/responses/scim_get_schema_resp'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '404':
          $ref: '#/components/responses/scim_not_found'
        '500':
          $ref: '#/components/responses/scim_error'
  /v2/scim/2.0/Users:
    x-audience: public
    get:
      summary: List users
      description: |
        Returns paginated users for an organization. Use `startIndex` and `count` query parameters to receive paginated results.
@y
        The following settings are only used on a business plan:
        - `restricted_images`
      tags:
        - org-settings
      security: 
        - bearerAuth: []
      requestBody:
        content:
          application/json:
            schema:
              required:
                - restricted_images
              properties:
                restricted_images:
                  allOf:
                    - $ref: '#/components/schemas/restricted_images'
                    - type: object
                      required:
                        - enabled
                        - allow_official_images
                        - allow_verified_publishers
        required: true
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/orgSettings'
        '401':
          $ref: '#/components/responses/Unauthorized'
        '403':
          $ref: '#/components/responses/Forbidden'
        '404':
          $ref: '#/components/responses/NotFound'
  /v2/namespaces/{namespace}/repositories/{repository}/tags:
    parameters:
      - $ref: '#/components/parameters/namespace'
      - $ref: '#/components/parameters/repository'
    get:
      summary: List repository tags
      tags:
        - repositories
      security: 
        - bearerAuth: []
      parameters:
        - in: query
          name: page
          required: false
          schema:
            type: integer
          description: Page number to get. Defaults to 1.
        - in: query
          name: page_size
          required: false
          schema:
            type: integer
          description: Number of items to get per page. Defaults to 10. Max of 100.
      responses:
        '200':
          $ref: '#/components/responses/list_tags'
        '403':
          $ref: '#/components/responses/Forbidden'
        '404':
          $ref: '#/components/responses/NotFound'
    head:
      summary: Check repository tags
      tags:
        - repositories
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: Repository contains tags
        '403':
          $ref: '#/components/responses/Forbidden'
        '404':
          $ref: '#/components/responses/NotFound'
  /v2/namespaces/{namespace}/repositories/{repository}/tags/{tag}:
    parameters:
      - $ref: '#/components/parameters/namespace'
      - $ref: '#/components/parameters/repository'
      - $ref: '#/components/parameters/tag'
    get:
      summary: Read repository tag
      tags:
        - repositories
      security: 
        - bearerAuth: []
      responses:
        '200':
          $ref: '#/components/responses/get_tag'
        '403':
          $ref: '#/components/responses/Forbidden'
        '404':
          $ref: '#/components/responses/NotFound'
    head:
      summary: Check repository tag
      tags:
        - repositories
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: Repository tag exists
        '403':
          $ref: '#/components/responses/Forbidden'
        '404':
          $ref: '#/components/responses/NotFound'
  /v2/orgs/{org_name}/members:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/org_name'
      - $ref: '#/components/parameters/search'
      - $ref: '#/components/parameters/page'
      - $ref: '#/components/parameters/page_size'
      - $ref: '#/components/parameters/invites'
      - $ref: '#/components/parameters/type'
      - $ref: '#/components/parameters/role'
    get:
      summary: List org members
      description: |
        Returns a list of members for an organization"
      tags:
        - orgs
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: List of members
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/org_member_paginated'
        '400':
          $ref: '#/components/responses/bad_request'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/orgs/{org_name}/members/export:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/org_name'
    get:
      summary: Export org members CSV
      description: |
        Export members of an organization as a CSV
      tags:
        - orgs
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: Exported members
          content:
            text/csv:
              schema:
                type: array
                items:
                  type: object
                  required:
                    - Name
                    - Username
                    - Email
                    - Type
                    - Role
                    - Date Joined
                  properties:
                    Name:
                      type: string
                      description: First and last name of the member
                    Username:
                      type: string
                      description: Username of the member
                    Email:
                      type: string
                      description: Email address of the member
                    Type:
                      type: string
                      description: Type of the member
                      enum:
                        - Invitee
                        - User
                    Permission:
                      type: string
                      description: Permission of the member
                      enum:
                        - Owner
                        - Member
                    Teams:
                      type: string
                      description: Comma-separated list of teams the member is part of
                      example: team-1, team-2
                    Date Joined:
                      type: string
                      description: Date the member joined the organization
                      example: 2020-01-01 15:00:51.193355 +0000 UTC
          headers:
            Content-Disposition:
              schema:
                type: string
              example: attachment;filename="{org_name}-members-{timestamp}.csv"
        '400':
          $ref: '#/components/responses/bad_request'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/orgs/{org_name}/members/{username}:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/org_name'
      - $ref: '#/components/parameters/username'
    put:
      summary: Update org member (role)
      description: |
        Updates the role of a member in the organization.
        ***Only users in the "owners" group of the organization can use this endpoint.***
      tags:
        - orgs
      security: 
        - bearerAuth: []
      requestBody:
        required: true
        content:
          application/json:
            schema:
              required:
                - role
              properties:
                role:
                  type: string
                  description: Role of the member
                  enum:
                    - owner
                    - editor
                    - member
      responses:
        '200':
          description: Member role updated
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/org_member'
        '400':
          $ref: '#/components/responses/bad_request'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
    delete:
      summary: Remove member from org
      description: |
        Removes the member from the org, ie. all groups in the org, unless they're the last owner
      tags:
        - orgs
      security: 
        - bearerAuth: []
      responses:
        '204':
          description: Member removed successfully
        '400':
          $ref: '#/components/responses/bad_request'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/orgs/{org_name}/invites:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/org_name'
    get:
      summary: List org invites
      description: |
        Return all pending invites for a given org, only team owners can call this endpoint
      tags:
        - invites
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: ''
          content:
            application/json:
              schema:
                type: object
                properties:
                  data:
                    type: array
                    items:
                      $ref: '#/components/schemas/invite'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/orgs/{org_name}/groups:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/org_name'
    get:
      summary: Get groups of an organization
      tags:
        - groups
      security: 
        - bearerAuth: []
      parameters:
        - $ref: '#/components/parameters/page'
        - $ref: '#/components/parameters/page_size'
        - in: query
          name: username
          schema:
            type: string
          description: Get groups for the specified username in the organization.
        - in: query
          name: search
          schema:
            type: string
          description: Get groups for the specified group in the organization.
      responses:
        '200':
          description: ''
          content:
            application/json:
              schema:
                properties:
                  count:
                    type: number
                    example: 1
                  next:
                    type: string
                    example: null
                  previous:
                    type: string
                    example: null
                  results:
                    type: array
                    items:
                      $ref: '#/components/schemas/org_group'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
    post:
      summary: Create a new group
      description: Create a new group within an organization.
      tags:
        - groups
      security: 
        - bearerAuth: []
      requestBody:
        content:
          application/json:
            schema:
              required:
                - name
              properties:
                name:
                  type: string
                description:
                  type: string
      responses:
        '201':
          description: Group created successfully
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/org_group'
        '400':
          $ref: '#/components/responses/bad_request'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
  /v2/orgs/{org_name}/groups/{group_name}:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/org_name'
      - $ref: '#/components/parameters/group_name'
    get:
      summary: Get a group of an organization
      tags:
        - groups
      security: 
        - bearerAuth: []
      responses:
        '200':
          description: ''
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/org_group'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
    put:
      summary: Update the details for an organization group
      tags:
        - groups
      security: 
        - bearerAuth: []
      requestBody:
        content:
          application/json:
            schema:
              required:
                - name
              properties:
                name:
                  type: string
                description:
                  type: string
      responses:
        '200':
          description: ''
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/org_group'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
    patch:
      summary: Update some details for an organization group
      tags:
        - groups
      security: 
        - bearerAuth: []
      requestBody:
        content:
          application/json:
            schema:
              properties:
                name:
                  type: string
                description:
                  type: string
      responses:
        '200':
          description: ''
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/org_group'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
    delete:
      summary: Delete an organization group
      tags:
        - groups
      security: 
        - bearerAuth: []
      responses:
        '204':
          description: Group deleted successfully
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/orgs/{org_name}/groups/{group_name}/members:
    x-audience: public
    get:
      security: 
        - bearerAuth: []
      parameters:
        - $ref: '#/components/parameters/org_name'
        - $ref: '#/components/parameters/group_name'
        - $ref: '#/components/parameters/page'
        - $ref: '#/components/parameters/page_size'
        - in: query
          name: search
          schema:
            type: string
          description: Search members by username, full_name or email.
      summary: List members of a group
      description: |
        List the members (users) that are in a group.
        If user is owner of the org or has otherwise elevated permissions, they can search by email and the result will also contain emails.
      tags:
        - groups
      responses:
        '200':
          description: ''
          content:
            application/json:
              schema:
                properties:
                  count:
                    type: number
                    example: 1
                  next:
                    type: string
                    example: null
                  previous:
                    type: string
                    example: null
                  results:
                    type: array
                    items:
                      $ref: '#/components/schemas/group_member'
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
    post:
      parameters:
        - $ref: '#/components/parameters/org_name'
        - $ref: '#/components/parameters/group_name'
      summary: Adds a member to a group
      tags:
        - groups
      security: 
        - bearerAuth: []
      requestBody:
        $ref: '#/components/requestBodies/add_member_to_org_group'
      responses:
        '200':
          description: OK
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
        '500':
          $ref: '#/components/responses/internal_error'
  /v2/orgs/{org_name}/groups/{group_name}/members/{username}:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/org_name'
      - $ref: '#/components/parameters/group_name'
      - $ref: '#/components/parameters/username'
    delete:
      summary: Removes a user from a group
      tags:
        - groups
      security: 
        - bearerAuth: []
      responses:
        '204':
          description: User removed successfully
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/invites/{id}:
    x-audience: public
    parameters:
      - in: path
        name: id
        required: true
        schema:
          type: string
    delete:
      summary: Cancel an invite
      description: |
        Mark the invite as cancelled so it doesn't show up on the list of pending invites
      tags:
        - invites
      security: 
        - bearerAuth: []
      responses:
        '204':
          description: ''
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/invites/{id}/resend:
    x-audience: public
    parameters:
      - in: path
        name: id
        schema:
          type: string
        required: true
    patch:
      summary: Resend an invite
      description: |
        Resend a pending invite to the user, any org owner can resend an invite
      tags:
        - invites
      security: 
        - bearerAuth: []
      responses:
        '204':
          description: ''
        '401':
          $ref: '#/components/responses/unauthorized'
        '403':
          $ref: '#/components/responses/forbidden'
        '404':
          $ref: '#/components/responses/not_found'
  /v2/invites/bulk:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/bulk_invite'
    post:
      summary: Bulk create invites
      description: |
        Create multiple invites by emails or DockerIDs. Only a team owner can create invites.
      tags:
        - invites
      requestBody:
        $ref: '#/components/requestBodies/bulk_invite_request'
      security: 
        - bearerAuth: []
      responses:
        '202':
          description: Accepted
          content:
            application/json:
              schema:
                type: object
                properties:
                  invitees:
                    $ref: '#/components/schemas/bulk_invite'
        '400':
          $ref: '#/components/responses/bad_request'
        '409':
          $ref: '#/components/responses/conflict'
  /v2/scim/2.0/ServiceProviderConfig:
    x-audience: public
    get:
      summary: Get service provider config
      description: |
        Returns a service provider config for Docker's configuration.
      tags:
        - scim
      security:
        - bearerSCIMAuth: []
      responses:
        '200':
          $ref: '#/components/responses/scim_get_service_provider_config_resp'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '500':
          $ref: '#/components/responses/scim_error'
  /v2/scim/2.0/ResourceTypes:
    x-audience: public
    get:
      summary: List resource types
      description: |
        Returns all resource types supported for the SCIM configuration.
      tags:
        - scim
      security:
        - bearerSCIMAuth: []
      responses:
        '200':
          $ref: '#/components/responses/scim_get_resource_types_resp'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '500':
          $ref: '#/components/responses/scim_error'
  /v2/scim/2.0/ResourceTypes/{name}:
    x-audience: public
    get:
      summary: Get a resource type
      description: |
        Returns a resource type by name.
      tags:
        - scim
      parameters:
        - name: name
          in: path
          schema:
            type: string
          example: User
          required: true
      security:
        - bearerSCIMAuth: []
      responses:
        '200':
          $ref: '#/components/responses/scim_get_resource_type_resp'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '404':
          $ref: '#/components/responses/scim_not_found'
        '500':
          $ref: '#/components/responses/scim_error'
  /v2/scim/2.0/Schemas:
    x-audience: public
    get:
      summary: List schemas
      description: |
        Returns all schemas supported for the SCIM configuration.
      tags:
        - scim
      security:
        - bearerSCIMAuth: []
      responses:
        '200':
          $ref: '#/components/responses/scim_get_schemas_resp'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '500':
          $ref: '#/components/responses/scim_error'
  /v2/scim/2.0/Schemas/{id}:
    x-audience: public
    get:
      summary: Get a schema
      description: |
        Returns a schema by ID.
      tags:
        - scim
      parameters:
        - name: id
          in: path
          schema:
            type: string
          example: urn:ietf:params:scim:schemas:core:2.0:User
          required: true
      security:
        - bearerSCIMAuth: []
      responses:
        '200':
          $ref: '#/components/responses/scim_get_schema_resp'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '404':
          $ref: '#/components/responses/scim_not_found'
        '500':
          $ref: '#/components/responses/scim_error'
  /v2/scim/2.0/Users:
    x-audience: public
    get:
      summary: List users
      description: |
        Returns paginated users for an organization. Use `startIndex` and `count` query parameters to receive paginated results.
@z

@x
        **Sorting:**
@y
        **Sorting:**
@z

@x
        Sorting allows you to specify the order in which resources are returned by specifying a combination of `sortBy` and `sortOrder` query parameters.
@y
        Sorting allows you to specify the order in which resources are returned by specifying a combination of `sortBy` and `sortOrder` query parameters.
@z

@x
        The `sortBy` parameter specifies the attribute whose value will be used to order the returned responses. The `sortOrder` parameter defines the order in which the `sortBy` parameter is applied. Allowed values are "ascending" and "descending".
@y
        The `sortBy` parameter specifies the attribute whose value will be used to order the returned responses. The `sortOrder` parameter defines the order in which the `sortBy` parameter is applied. Allowed values are "ascending" and "descending".
@z

@x
        **Filtering:**
@y
        **Filtering:**
@z

@x
        You can request a subset of resources by specifying the `filter` query parameter containing a filter expression. Attribute names and attribute operators used in filters are case insensitive. The filter parameter must contain at least one valid expression. Each expression must contain an attribute name followed by an attribute operator and an optional value.
@y
        You can request a subset of resources by specifying the `filter` query parameter containing a filter expression. Attribute names and attribute operators used in filters are case insensitive. The filter parameter must contain at least one valid expression. Each expression must contain an attribute name followed by an attribute operator and an optional value.
@z

@x
        Supported operators are listed below.
@y
        Supported operators are listed below.
@z

@x
        - `eq` equal
        - `ne` not equal
        - `co` contains
        - `sw` starts with
        - `and` Logical "and"
        - `or` Logical "or"
        - `not` "Not" function
        - `()` Precedence grouping
      tags:
        - scim
      security:
        - bearerSCIMAuth: []
      parameters:
        - name: startIndex
          in: query
          schema:
            type: integer
            minimum: 1
          description: ''
          example: 1
        - name: count
          in: query
          schema:
            type: integer
            minimum: 1
            maximum: 200
          description: ''
          example: 10
        - name: filter
          in: query
          schema:
            type: string
          description: ''
          example: userName eq "jon.snow@docker.com"
        - $ref: '#/components/parameters/scim_attributes'
        - name: sortOrder
          in: query
          schema:
            type: string
            enum:
              - ascending
              - descending
        - name: sortBy
          in: query
          schema:
            type: string
          description: User attribute to sort by.
          example: userName
      responses:
        '200':
          $ref: '#/components/responses/scim_get_users_resp'
        '400':
          $ref: '#/components/responses/scim_bad_request'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '403':
          $ref: '#/components/responses/scim_forbidden'
        '404':
          $ref: '#/components/responses/scim_not_found'
        '500':
          $ref: '#/components/responses/scim_error'
    post:
      summary: Create user
      description: |
        Creates a user. If the user already exists by email, they are assigned to the organization on the "company" team.
      tags:
        - scim
      security:
        - bearerSCIMAuth: []
      requestBody:
        $ref: '#/components/requestBodies/scim_create_user_request'
      responses:
        '201':
          $ref: '#/components/responses/scim_create_user_resp'
        '400':
          $ref: '#/components/responses/scim_bad_request'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '403':
          $ref: '#/components/responses/scim_forbidden'
        '404':
          $ref: '#/components/responses/scim_not_found'
        '409':
          $ref: '#/components/responses/scim_conflict'
        '500':
          $ref: '#/components/responses/scim_error'
  /v2/scim/2.0/Users/{id}:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/scim_user_id'
    get:
      summary: Get a user
      description: |
        Returns a user by ID.
      tags:
        - scim
      security:
        - bearerSCIMAuth: []
      responses:
        '200':
          $ref: '#/components/responses/scim_get_user_resp'
        '400':
          $ref: '#/components/responses/scim_bad_request'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '403':
          $ref: '#/components/responses/scim_forbidden'
        '404':
          $ref: '#/components/responses/scim_not_found'
        '500':
          $ref: '#/components/responses/scim_error'
    put:
      summary: Update a user
      description: |
        Updates a user. This route is used to change the user's name, activate, and deactivate the user.
      tags:
        - scim
      security:
        - bearerSCIMAuth: []
      requestBody:
        $ref: '#/components/requestBodies/scim_update_user_request'
      responses:
        '200':
          $ref: '#/components/responses/scim_update_user_resp'
        '400':
          $ref: '#/components/responses/scim_bad_request'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '403':
          $ref: '#/components/responses/scim_forbidden'
        '404':
          $ref: '#/components/responses/scim_not_found'
        '409':
          $ref: '#/components/responses/scim_conflict'
        '500':
          $ref: '#/components/responses/scim_error'
components:
  responses:
    BadRequest:
      description: Bad Request
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/ValueError'
    Unauthorized:
      description: Unauthorized
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
    Forbidden:
      description: Forbidden
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
    NotFound:
      description: Not Found
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
    list_tags:
      description: list repository tags
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/paginated_tags'
    get_tag:
      description: repository tag
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/tag'
    bad_request:
      description: Bad Request
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/error'
    unauthorized:
      description: Unauthorized
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/error'
    forbidden:
      description: Forbidden
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/error'
    not_found:
      description: Not Found
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/error'
    conflict:
      description: Conflict
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/error'
    internal_error:
      description: Internal
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/error'
    scim_bad_request:
      description: Bad Request
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: '#/components/schemas/scim_error'
              - properties:
                  status:
                    example: '400'
                  scimType:
                    type: string
                    description: Some types of errors will return this per the specification.
    scim_unauthorized:
      description: Unauthorized
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: '#/components/schemas/scim_error'
              - properties:
                  status:
                    example: '401'
    scim_forbidden:
      description: Forbidden
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: '#/components/schemas/scim_error'
              - properties:
                  status:
                    example: '403'
    scim_not_found:
      description: Not Found
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: '#/components/schemas/scim_error'
              - properties:
                  status:
                    example: '404'
    scim_conflict:
      description: Conflict
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: '#/components/schemas/scim_error'
              - properties:
                  status:
                    example: '409'
    scim_error:
      description: Internal Error
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: '#/components/schemas/scim_error'
              - properties:
                  status:
                    example: '500'
    scim_get_service_provider_config_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            $ref: '#/components/schemas/scim_service_provider_config'
    scim_get_resource_types_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            type: object
            properties:
              schemas:
                type: array
                items:
                  type: string
                  example: urn:ietf:params:scim:api:messages:2.0:ListResponse
              totalResults:
                type: integer
                example: 1
              resources:
                type: array
                items:
                  $ref: '#/components/schemas/scim_resource_type'
    scim_get_resource_type_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            $ref: '#/components/schemas/scim_resource_type'
    scim_get_schemas_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            type: object
            properties:
              schemas:
                type: array
                items:
                  type: string
                  example: urn:ietf:params:scim:api:messages:2.0:ListResponse
              totalResults:
                type: integer
                example: 1
              resources:
                type: array
                items:
                  $ref: '#/components/schemas/scim_schema'
    scim_get_schema_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            $ref: '#/components/schemas/scim_schema'
    scim_get_users_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            type: object
            properties:
              schemas:
                type: array
                items:
                  type: string
                example:
                  - urn:ietf:params:scim:api:messages:2.0:ListResponse
              totalResults:
                type: integer
                example: 1
              startIndex:
                type: integer
                example: 1
              itemsPerPage:
                type: integer
                example: 10
              resources:
                type: array
                items:
                  $ref: '#/components/schemas/scim_user'
    scim_create_user_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            $ref: '#/components/schemas/scim_user'
    scim_get_user_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            $ref: '#/components/schemas/scim_user'
    scim_update_user_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            $ref: '#/components/schemas/scim_user'
  schemas:
    UsersLoginRequest:
      description: User login details
      type: object
      required:
        - username
        - password
      properties:
        username:
          description: The username of the Docker Hub account to authenticate with.
          type: string
          example: myusername
        password:
          description: |
            The password or personal access token (PAT) of the Docker Hub account to authenticate with.
          type: string
          example: p@ssw0rd
    AuthCreateTokenResponse:
      description: successful access token response
      type: object
      properties:
        access_token:
          description: The created access token. This expires in 10 minutes.
          type: string
          example: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
    PostUsersLoginSuccessResponse:
      description: successful user login response
      type: object
      properties:
        token:
          description: |
            Created authentication token.
            This token can be used in the HTTP Authorization header as a JWT to authenticate with the Docker Hub APIs.
          type: string
          example: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
          nullable: false
    PostUsersLoginErrorResponse:
      description: failed user login response or second factor required
      type: object
      required:
        - detail
      properties:
        detail:
          description: Description of the error.
          type: string
          example: Incorrect authentication credentials
          nullable: false
        login_2fa_token:
          description: |
            Short time lived token to be used on `/v2/users/2fa-login` to complete the authentication. This field is present only if 2FA is enabled.
          type: string
          example: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
          nullable: true
    Users2FALoginRequest:
      description: Second factor user login details
      type: object
      required:
        - login_2fa_token
        - code
      properties:
        login_2fa_token:
          description: The intermediate 2FA token returned from `/v2/users/login` API.
          type: string
          example: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
        code:
          description: |
            The Time-based One-Time Password of the Docker Hub account to authenticate with.
          type: string
          example: 123456
    PostUsers2FALoginErrorResponse:
      description: failed second factor login response.
      type: object
      properties:
        detail:
          description: Description of the error.
          type: string
          example: Incorrect authentication credentials
          nullable: false
    protobufAny:
      type: object
      properties:
        type_url:
          type: string
        value:
          type: string
          format: byte
    rpcStatus:
      type: object
      properties:
        code:
          type: integer
          format: int32
        message:
          type: string
        details:
          type: array
          items:
            $ref: '#/components/schemas/protobufAny'
    AuditLogAction:
      type: object
      properties:
        name:
          type: string
          description: Name of audit log action.
        description:
          type: string
          description: Description of audit log action.
        label:
          type: string
          description: Label for audit log action.
      description: Audit Log action
    AuditLogActions:
      type: object
      properties:
        actions:
          type: array
          items:
            $ref: '#/components/schemas/AuditLogAction'
          description: List of audit log actions.
        label:
          type: string
          description: Grouping label for a particular set of audit log actions.
    GetAuditActionsResponse:
      type: object
      properties:
        actions:
          type: object
          additionalProperties:
            $ref: '#/components/schemas/AuditLogActions'
          description: Map of audit log actions.
      description: GetAuditActions response.
    GetAuditLogsResponse:
      type: object
      properties:
        logs:
          type: array
          items:
            $ref: '#/components/schemas/AuditLog'
          description: List of audit log events.
      description: GetAuditLogs response.
    AuditLog:
      type: object
      properties:
        account:
          type: string
        action:
          type: string
        name:
          type: string
        actor:
          type: string
        data:
          type: object
          additionalProperties:
            type: string
        timestamp:
          type: string
          format: date-time
        action_description:
          type: string
      description: Audit log event.
    ValueError:
      type: object
      description: Used to error if input validation fails.
      properties:
        fields:
          type: object
          items:
            type: string
        text:
          type: string
    Error:
      type: object
      properties:
        detail:
          type: string
        message:
          type: string
    accessToken:
      type: object
      properties:
        uuid:
          type: string
          example: b30bbf97-506c-4ecd-aabc-842f3cb484fb
        client_id:
          type: string
          example: HUB
        creator_ip:
          type: string
          example: 127.0.0.1
        creator_ua:
          type: string
          example: some user agent
        created_at:
          type: string
          example: '2021-07-20T12:00:00.000000Z'
        last_used:
          type: string
          example: null
          nullable: true
        generated_by:
          type: string
          example: manual
        is_active:
          type: boolean
          example: true
        token:
          type: string
          example: a7a5ef25-8889-43a0-8cc7-f2a94268e861
        token_label:
          type: string
          example: My read only token
        scopes:
          type: array
          example:
            - repo:read
          items:
            type: string
    createAccessTokenRequest:
      type: object
      required:
        - token_label
        - scopes
      properties:
        token_label:
          type: string
          description: Friendly name for you to identify the token.
          example: My read only token
          minLength: 1
          maxLength: 100
        scopes:
          type: array
          description: |
            Valid scopes: "repo:admin", "repo:write", "repo:read", "repo:public_read"
          example:
            - repo:read
          items:
            type: string
    createAccessTokensResponse:
      $ref: '#/components/schemas/accessToken'
    getAccessTokensResponse:
      type: object
      properties:
        count:
          type: number
          example: 1
        next:
          type: string
          example: null
        previous:
          type: string
          example: null
        active_count:
          type: number
          example: 1
        results:
          type: array
          items:
            allOf:
              - $ref: '#/components/schemas/accessToken'
              - type: object
                properties:
                  token:
                    type: string
                    example: ''
    patchAccessTokenRequest:
      type: object
      properties:
        token_label:
          type: string
          example: My read only token
          minLength: 1
          maxLength: 100
        is_active:
          type: boolean
          example: false
    patchAccessTokenResponse:
      $ref: '#/components/schemas/accessToken'
    orgSettings:
      type: object
      properties:
        restricted_images:
          $ref: '#/components/schemas/restricted_images'
    restricted_images:
      type: object
      properties:
        enabled:
          type: boolean
          description: Whether or not to restrict image usage for users in the organization.
          example: true
        allow_official_images:
          type: boolean
          description: Allow usage of official images if "enabled" is `true`.
          example: true
        allow_verified_publishers:
          type: boolean
          description: Allow usage of verified publisher images if "enabled" is `true`.
          example: true
    layer:
      type: object
      properties:
        digest:
          type: string
          description: image layer digest
          nullable: true
        size:
          type: integer
          description: size of the layer
        instruction:
          type: string
          description: Dockerfile instruction
    image:
      type: object
      properties:
        architecture:
          type: string
          description: CPU architecture
        features:
          type: string
          description: CPU features
        variant:
          type: string
          description: CPU variant
        digest:
          type: string
          description: image digest
          nullable: true
        layers:
          type: array
          items:
            $ref: '#/components/schemas/layer'
        os:
          type: string
          description: operating system
        os_features:
          type: string
          description: OS features
        os_version:
          type: string
          description: OS version
        size:
          type: integer
          description: size of the image
        status:
          type: string
          enum:
            - active
            - inactive
          description: Status of the image
        last_pulled:
          type: string
          example: '2021-01-05T21:06:53.506400Z'
          description: datetime of last pull
          nullable: true
        last_pushed:
          type: string
          example: '2021-01-05T21:06:53.506400Z'
          description: datetime of last push
          nullable: true
    tag:
      type: object
      properties:
        id:
          type: integer
          description: tag ID
        images:
          type: object
          $ref: '#/components/schemas/image'
        creator:
          type: integer
          description: ID of the user that pushed the tag
        last_updated:
          type: string
          example: '2021-01-05T21:06:53.506400Z'
          description: datetime of last update
          nullable: true
        last_updater:
          type: integer
          description: ID of the last user that updated the tag
        last_updater_username:
          type: string
          description: Hub username of the user that updated the tag
        name:
          type: string
          description: name of the tag
        repository:
          type: integer
          description: repository ID
        full_size:
          type: integer
          description: compressed size (sum of all layers) of the tagged image
        v2:
          type: string
          description: repository API version
        status:
          type: string
          enum:
            - active
            - inactive
          description: whether a tag has been pushed to or pulled in the past month
        tag_last_pulled:
          type: string
          example: '2021-01-05T21:06:53.506400Z'
          description: datetime of last pull
          nullable: true
        tag_last_pushed:
          type: string
          example: '2021-01-05T21:06:53.506400Z'
          description: datetime of last push
          nullable: true
    paginated_tags:
      allOf:
        - $ref: '#/components/schemas/page'
        - type: object
          properties:
            results:
              type: array
              items:
                $ref: '#/components/schemas/tag'
    page:
      type: object
      properties:
        count:
          type: integer
          description: total number of results available across all pages
        next:
          type: string
          description: link to next page of results if any
          nullable: true
        previous:
          type: string
          description: link to previous page of results  if any
          nullable: true
    scim_schema_attribute:
      type: object
      properties:
        name:
          type: string
          example: userName
        type:
          enum:
            - string
            - boolean
            - complex
          type: string
          example: string
        multiValued:
          type: boolean
          example: false
        description:
          type: string
          example: Unique identifier for the User, typically used by the user to directly authenticate to the service provider. Each User MUST include a non-empty userName value. This identifier MUST be unique across the service provider's entire set of Users.
        required:
          type: boolean
          example: true
        caseExact:
          type: boolean
          example: false
        mutability:
          type: string
          example: readWrite
        returned:
          type: string
          example: default
        uniqueness:
          type: string
          example: server
    scim_schema_parent_attribute:
      allOf:
        - $ref: '#/components/schemas/scim_schema_attribute'
        - type: object
          properties:
            subAttributes:
              type: array
              items:
                $ref: '#/components/schemas/scim_schema_attribute'
    invite:
      type: object
      properties:
        id:
          type: string
          description: uuid representing the invite id
          example: e36eca69-4cc8-4f17-9845-ae8c2b832691
        inviter_username:
          type: string
          example: moby
        invitee:
          type: string
          description: can either be a dockerID for registred users or an email for non-registred users
          example: invitee@docker.com
        org:
          type: string
          description: name of the org to join
          example: docker
        team:
          type: string
          description: name of the team (user group) to join
          example: owners
        created_at:
          type: string
          example: '2021-10-28T18:30:19.520861Z'
    bulk_invite:
      type: object
      properties:
        invitees:
          type: array
          description: A list of invitees
          items:
            type: object
            properties:
              invitee:
                type: string
                description: invitee email or Docker ID
              status:
                type: string
                description: status of the invite or validation error
              invite:
                description: Invite data if successfully invited
                $ref: '#/components/schemas/invite'
      example:
        invitees:
          - invitee: invitee@docker.com
            status: invited
            invite:
              id: e36eca69-4cc8-4f17-9845-ae8c2b832691
              inviter_username: moby
              invitee: invitee@docker.com
              org: docker
              team: owners
              created_at: '2021-10-28T18:30:19.520861Z'
          - invitee: invitee2@docker.com
            status: existing_org_member
          - invitee: invitee3@docker.com
            status: invalid_email_or_docker_id
    error:
      type: object
      properties:
        errinfo:
          type: object
          items:
            type: string
        detail:
          type: string
        message:
          type: string
    scim_error:
      type: object
      properties:
        status:
          type: string
          description: The status code for the response in string format.
        schemas:
          type: array
          items:
            type: string
            default: urn:ietf:params:scim:api:messages:2.0:Error
        detail:
          type: string
          description: Details about why the request failed.
    user:
      type: object
      properties:
        id:
          type: string
          example: 0ab70deb065a43fcacd55d48caa945d8
          description: The UUID trimmed
        company:
          type: string
          example: Docker Inc
        date_joined:
          type: string
          example: '2021-01-05T21:06:53.506400Z'
        full_name:
          type: string
          example: Jon Snow
        gravatar_email:
          type: string
        gravatar_url:
          type: string
        location:
          type: string
        profile_url:
          type: string
        type:
          type: string
          enum:
            - User
            - Org
          example: User
        username:
          type: string
          example: dockeruser
    org_member:
      allOf:
        - $ref: '#/components/schemas/user'
      properties:
        email:
          type: string
          description: User's email address
          example: example@docker.com
        role:
          type: string
          description: User's role in the Organization
          enum:
            - Owner
            - Member
            - Invitee
          example: Owner
        groups:
          type: array
          description: Groups (Teams) that the user is member of
          items:
            type: string
          example:
            - developers
            - owners
        is_guest:
          type: boolean
          description: If the organization has verfied domains, members that have email addresses outside of those domains will be flagged as Guest member
          example: false
        primary_email:
          type: string
          description: User's email primary address
          example: example@docker.com
          deprecated: true
    org_member_paginated:
      type: object
      properties:
        count:
          type: number
          description: The total number of items that match with the search.
          example: 120
        previous:
          type: string
          description: The URL or link for the previous page of items.
          example: https://hub.docker.com/v2/some/resources/items?page=1&page_size=20
        next:
          type: string
          description: The URL or link for the next page of items.
          example: https://hub.docker.com/v2/some/resources/items?page=3&page_size=20
        results:
          type: array
          description: List of accounts.
          items:
            $ref: '#/components/schemas/org_member'
    org_group:
      type: object
      properties:
        id:
          type: number
          example: 10
          description: Group ID
        uuid:
          type: string
          description: UUID for the group
        name:
          type: string
          example: mygroup
          description: Name of the group
        description:
          type: string
          example: Groups description
          description: Description of the group
        member_count:
          type: number
          example: 10
          description: Member count of the group
    group_member:
      type: object
      properties:
        id:
          type: string
          example: 0ab70deb065a43fcacd55d48caa945d8
          description: The UUID trimmed
        company:
          type: string
          example: Docker Inc
        date_joined:
          type: string
          example: '2021-01-05T21:06:53.506400Z'
        full_name:
          type: string
          example: John Snow
        gravatar_email:
          type: string
        gravatar_url:
          type: string
        location:
          type: string
        profile_url:
          type: string
        type:
          type: string
          enum:
            - User
            - Org
          example: User
        username:
          type: string
          example: dockeruser
        email:
          type: string
          example: dockeruser@docker.com
    email_address:
      type: object
      properties:
        id:
          type: number
        user_id:
          type: number
        email:
          type: string
          example: dockeruser@docker.com
        verified:
          type: boolean
        primary:
          type: boolean
    legacy_email_address:
      allOf:
        - $ref: '#/components/schemas/email_address'
        - type: object
          properties:
            user:
              type: string
              example: dockeruser
    email_with_username:
      allOf:
        - $ref: '#/components/schemas/email_address'
        - type: object
          properties:
            username:
              type: string
              example: dockeruser
    scim_service_provider_config:
      type: object
      properties:
        schemas:
          type: array
          items:
            type: string
          example:
            - urn:ietf:params:scim:schemas:core:2.0:ServiceProviderConfig
        documentationUri:
          type: string
          example: ''
        patch:
          properties:
            supported:
              type: boolean
              example: false
        bulk:
          type: object
          properties:
            supported:
              type: boolean
              example: false
            maxOperations:
              type: integer
            maxPayloadSize:
              type: integer
        filter:
          type: object
          properties:
            supported:
              type: boolean
              example: true
            maxResults:
              type: integer
              example: 99999
        changePassword:
          type: object
          properties:
            supported:
              type: boolean
              example: false
        sort:
          type: object
          properties:
            supported:
              type: boolean
              example: true
        etag:
          type: object
          properties:
            supported:
              type: boolean
              example: false
        authenticationSchemes:
          type: object
          properties:
            name:
              type: string
              example: OAuth 2.0 Bearer Token
            description:
              type: string
              example: The OAuth 2.0 Bearer Token Authentication scheme. OAuth enables clients to access protected resources by obtaining an access token, which is defined in RFC 6750 as "a string representing an access authorization issued to the client", rather than using the resource owner's credentials directly.
            specUri:
              type: string
              example: http://tools.ietf.org/html/rfc6750
            type:
              type: string
              example: oauthbearertoken
    scim_resource_type:
      type: object
      properties:
        schemas:
          type: array
          items:
            type: string
          example:
            - urn:ietf:params:scim:schemas:core:2.0:ResourceType
        id:
          type: string
          example: User
        name:
          type: string
          example: User
        description:
          type: string
          example: User
        endpoint:
          type: string
          example: /Users
        schema:
          type: string
          example: urn:ietf:params:scim:schemas:core:2.0:User
    scim_schema:
      type: object
      properties:
        schemas:
          type: array
          items:
            type: string
          example:
            - urn:ietf:params:scim:schemas:core:2.0:Schema
        id:
          type: string
          example: urn:ietf:params:scim:schemas:core:2.0:User
        name:
          type: string
          example: User
        description:
          type: string
          example: User Account
        attributes:
          type: array
          example: []
          items:
            $ref: '#/components/schemas/scim_schema_parent_attribute'
    scim_email:
      type: object
      properties:
        value:
          type: string
          example: jon.snow@docker.com
        display:
          type: string
          example: jon.snow@docker.com
        primary:
          type: boolean
          example: true
    scim_group:
      type: object
      properties:
        value:
          type: string
          example: nightswatch
        display:
          type: string
          example: nightswatch
    scim_user_username:
      type: string
      description: The user's email address. This must be reachable via email.
      example: jon.snow@docker.com
    scim_user_name:
      type: object
      properties:
        givenName:
          type: string
          example: Jon
        familyName:
          type: string
          example: Snow
    scim_user_display_name:
      type: string
      description: The username in Docker. Also known as the "Docker ID".
      example: jonsnow
    scim_user_schemas:
      type: array
      items:
        type: string
        example: urn:ietf:params:scim:schemas:core:2.0:User
        minItems: 1
    scim_user_id:
      type: string
      example: d80f7c79-7730-49d8-9a41-7c42fb622d9c
      description: The unique identifier for the user. A v4 UUID.
    scim_user:
      type: object
      properties:
        schemas:
          $ref: '#/components/schemas/scim_user_schemas'
        id:
          $ref: '#/components/schemas/scim_user_id'
        userName:
          $ref: '#/components/schemas/scim_user_username'
        name:
          $ref: '#/components/schemas/scim_user_name'
        displayName:
          $ref: '#/components/schemas/scim_user_display_name'
        active:
          type: boolean
          example: true
        emails:
          type: array
          items:
            $ref: '#/components/schemas/scim_email'
        groups:
          type: array
          items:
            $ref: '#/components/schemas/scim_group'
        meta:
          type: object
          properties:
            resourceType:
              type: string
              example: User
            location:
              type: string
              example: https://hub.docker.com/v2/scim/2.0/Users/d80f7c79-7730-49d8-9a41-7c42fb622d9c
            created:
              type: string
              description: The creation date for the user as a RFC3339 formatted string.
              example: '2022-05-20T00:54:18Z'
            lastModified:
              type: string
              description: The date the user was last modified as a RFC3339 formatted string.
              example: '2022-05-20T00:54:18Z'
  parameters:
    namespace:
      in: path
      name: namespace
      required: true
      schema:
        type: string
    repository:
      in: path
      name: repository
      required: true
      schema:
        type: string
    tag:
      in: path
      name: tag
      required: true
      schema:
        type: string
    org_name:
      in: path
      name: org_name
      description: Name of the organization (namespace).
      schema:
        type: string
      example: myorganization
      required: true
    group_name:
      in: path
      name: group_name
      description: Name of the group (team) in the organization.
      schema:
        type: string
        example: developers
      required: true
    username:
      in: path
      name: username
      description: Username, identifier for the user (namespace, DockerID).
      schema:
        type: string
        example: jonsnow
      required: true
    page:
      in: query
      name: page
      description: Page number (starts on 1).
      schema:
        type: integer
    page_size:
      in: query
      name: page_size
      description: Number of items (rows) per page.
      schema:
        type: integer
    invites:
      in: query
      name: invites
      description: Include invites in the response.
      schema:
        type: boolean
    search:
      in: query
      name: search
      schema:
        type: integer
      description: Search term.
    scim_attributes:
      in: query
      name: attributes
      schema:
        type: string
      description: Comma delimited list of attributes to limit to in the response.
      example: userName,displayName
    scim_user_id:
      name: id
      in: path
      schema:
        type: string
      description: The user ID.
      example: d80f7c79-7730-49d8-9a41-7c42fb622d9c
      required: true
    type:
      in: query
      name: type
      schema:
        type: string
        enum:
          - all
          - invitee
          - member
      example: all
    role:
      in: query
      name: role
      schema:
        type: string
        enum:
          - owner
          - editor
          - member
      example: owner
    bulk_invite:
      in: header
      name: X-Analytics-Client-Feature
      description: Optional string that indicates the feature used to submit the bulk invites (e.g.'file', 'web')
      schema:
        type: string
  requestBodies:
    bulk_invite_request:
      required: true
      content:
        application/json:
          schema:
            type: object
            required:
              - org
              - invitees
            properties:
              org:
                type: string
                description: organization name
                example: docker
              team:
                type: string
                description: team name
                example: owners
              role:
                type: string
                description: role for invitees
                example: member
              invitees:
                type: array
                description: list of invitees emails or Docker Ids
                items:
                  type: string
                  description: invitee email or Docker ID
                example:
                  - invitee1DockerId
                  - invitee2@docker.com
                  - invitee3@docker.com
              dry_run:
                type: boolean
                description: Optional, run through validation but don't actually change data.
                example: true
    scim_create_user_request:
      required: true
      content:
        application/scim+json:
          schema:
            type: object
            required:
              - schemas
              - userName
            properties:
              schemas:
                $ref: '#/components/schemas/scim_user_schemas'
              userName:
                $ref: '#/components/schemas/scim_user_username'
              name:
                $ref: '#/components/schemas/scim_user_name'
    scim_update_user_request:
      required: true
      content:
        application/scim+json:
          schema:
            type: object
            required:
              - schemas
            properties:
              schemas:
                $ref: '#/components/schemas/scim_user_schemas'
              name:
                allOf:
                  - $ref: '#/components/schemas/scim_user_name'
                  - description: If this is omitted from the request, the update will skip the update on it. We will only ever change the name, but not clear it.
              enabled:
                type: boolean
                default: false
                description: If this is omitted from the request, it will default to false resulting in a deactivated user.
    add_member_to_org_group:
      required: true
      content:
        application/json:
          schema:
            type: object
            required:
              - member
            properties:
              member:
                type: string
                example: jonsnow
  securitySchemes:
    bearerAuth:
      type: http
      scheme: bearer
      bearerFormat: JWT
    bearerSCIMAuth:
      type: http
      scheme: bearer
x-tagGroups:
  - name: General
    tags:
      - resources
      - rate-limiting
  - name: API
    tags:
      - authentication
      - access-tokens
      - images
      - audit-logs
      - org-settings
      - repositories
      - scim
      - orgs 
      - groups
      - invites
@y
        - `eq` equal
        - `ne` not equal
        - `co` contains
        - `sw` starts with
        - `and` Logical "and"
        - `or` Logical "or"
        - `not` "Not" function
        - `()` Precedence grouping
      tags:
        - scim
      security:
        - bearerSCIMAuth: []
      parameters:
        - name: startIndex
          in: query
          schema:
            type: integer
            minimum: 1
          description: ''
          example: 1
        - name: count
          in: query
          schema:
            type: integer
            minimum: 1
            maximum: 200
          description: ''
          example: 10
        - name: filter
          in: query
          schema:
            type: string
          description: ''
          example: userName eq "jon.snow@docker.com"
        - $ref: '#/components/parameters/scim_attributes'
        - name: sortOrder
          in: query
          schema:
            type: string
            enum:
              - ascending
              - descending
        - name: sortBy
          in: query
          schema:
            type: string
          description: User attribute to sort by.
          example: userName
      responses:
        '200':
          $ref: '#/components/responses/scim_get_users_resp'
        '400':
          $ref: '#/components/responses/scim_bad_request'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '403':
          $ref: '#/components/responses/scim_forbidden'
        '404':
          $ref: '#/components/responses/scim_not_found'
        '500':
          $ref: '#/components/responses/scim_error'
    post:
      summary: Create user
      description: |
        Creates a user. If the user already exists by email, they are assigned to the organization on the "company" team.
      tags:
        - scim
      security:
        - bearerSCIMAuth: []
      requestBody:
        $ref: '#/components/requestBodies/scim_create_user_request'
      responses:
        '201':
          $ref: '#/components/responses/scim_create_user_resp'
        '400':
          $ref: '#/components/responses/scim_bad_request'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '403':
          $ref: '#/components/responses/scim_forbidden'
        '404':
          $ref: '#/components/responses/scim_not_found'
        '409':
          $ref: '#/components/responses/scim_conflict'
        '500':
          $ref: '#/components/responses/scim_error'
  /v2/scim/2.0/Users/{id}:
    x-audience: public
    parameters:
      - $ref: '#/components/parameters/scim_user_id'
    get:
      summary: Get a user
      description: |
        Returns a user by ID.
      tags:
        - scim
      security:
        - bearerSCIMAuth: []
      responses:
        '200':
          $ref: '#/components/responses/scim_get_user_resp'
        '400':
          $ref: '#/components/responses/scim_bad_request'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '403':
          $ref: '#/components/responses/scim_forbidden'
        '404':
          $ref: '#/components/responses/scim_not_found'
        '500':
          $ref: '#/components/responses/scim_error'
    put:
      summary: Update a user
      description: |
        Updates a user. This route is used to change the user's name, activate, and deactivate the user.
      tags:
        - scim
      security:
        - bearerSCIMAuth: []
      requestBody:
        $ref: '#/components/requestBodies/scim_update_user_request'
      responses:
        '200':
          $ref: '#/components/responses/scim_update_user_resp'
        '400':
          $ref: '#/components/responses/scim_bad_request'
        '401':
          $ref: '#/components/responses/scim_unauthorized'
        '403':
          $ref: '#/components/responses/scim_forbidden'
        '404':
          $ref: '#/components/responses/scim_not_found'
        '409':
          $ref: '#/components/responses/scim_conflict'
        '500':
          $ref: '#/components/responses/scim_error'
components:
  responses:
    BadRequest:
      description: Bad Request
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/ValueError'
    Unauthorized:
      description: Unauthorized
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
    Forbidden:
      description: Forbidden
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
    NotFound:
      description: Not Found
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
    list_tags:
      description: list repository tags
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/paginated_tags'
    get_tag:
      description: repository tag
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/tag'
    bad_request:
      description: Bad Request
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/error'
    unauthorized:
      description: Unauthorized
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/error'
    forbidden:
      description: Forbidden
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/error'
    not_found:
      description: Not Found
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/error'
    conflict:
      description: Conflict
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/error'
    internal_error:
      description: Internal
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/error'
    scim_bad_request:
      description: Bad Request
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: '#/components/schemas/scim_error'
              - properties:
                  status:
                    example: '400'
                  scimType:
                    type: string
                    description: Some types of errors will return this per the specification.
    scim_unauthorized:
      description: Unauthorized
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: '#/components/schemas/scim_error'
              - properties:
                  status:
                    example: '401'
    scim_forbidden:
      description: Forbidden
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: '#/components/schemas/scim_error'
              - properties:
                  status:
                    example: '403'
    scim_not_found:
      description: Not Found
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: '#/components/schemas/scim_error'
              - properties:
                  status:
                    example: '404'
    scim_conflict:
      description: Conflict
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: '#/components/schemas/scim_error'
              - properties:
                  status:
                    example: '409'
    scim_error:
      description: Internal Error
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: '#/components/schemas/scim_error'
              - properties:
                  status:
                    example: '500'
    scim_get_service_provider_config_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            $ref: '#/components/schemas/scim_service_provider_config'
    scim_get_resource_types_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            type: object
            properties:
              schemas:
                type: array
                items:
                  type: string
                  example: urn:ietf:params:scim:api:messages:2.0:ListResponse
              totalResults:
                type: integer
                example: 1
              resources:
                type: array
                items:
                  $ref: '#/components/schemas/scim_resource_type'
    scim_get_resource_type_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            $ref: '#/components/schemas/scim_resource_type'
    scim_get_schemas_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            type: object
            properties:
              schemas:
                type: array
                items:
                  type: string
                  example: urn:ietf:params:scim:api:messages:2.0:ListResponse
              totalResults:
                type: integer
                example: 1
              resources:
                type: array
                items:
                  $ref: '#/components/schemas/scim_schema'
    scim_get_schema_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            $ref: '#/components/schemas/scim_schema'
    scim_get_users_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            type: object
            properties:
              schemas:
                type: array
                items:
                  type: string
                example:
                  - urn:ietf:params:scim:api:messages:2.0:ListResponse
              totalResults:
                type: integer
                example: 1
              startIndex:
                type: integer
                example: 1
              itemsPerPage:
                type: integer
                example: 10
              resources:
                type: array
                items:
                  $ref: '#/components/schemas/scim_user'
    scim_create_user_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            $ref: '#/components/schemas/scim_user'
    scim_get_user_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            $ref: '#/components/schemas/scim_user'
    scim_update_user_resp:
      description: ''
      content:
        application/scim+json:
          schema:
            $ref: '#/components/schemas/scim_user'
  schemas:
    UsersLoginRequest:
      description: User login details
      type: object
      required:
        - username
        - password
      properties:
        username:
          description: The username of the Docker Hub account to authenticate with.
          type: string
          example: myusername
        password:
          description: |
            The password or personal access token (PAT) of the Docker Hub account to authenticate with.
          type: string
          example: p@ssw0rd
    AuthCreateTokenResponse:
      description: successful access token response
      type: object
      properties:
        access_token:
          description: The created access token. This expires in 10 minutes.
          type: string
          example: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
    PostUsersLoginSuccessResponse:
      description: successful user login response
      type: object
      properties:
        token:
          description: |
            Created authentication token.
            This token can be used in the HTTP Authorization header as a JWT to authenticate with the Docker Hub APIs.
          type: string
          example: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
          nullable: false
    PostUsersLoginErrorResponse:
      description: failed user login response or second factor required
      type: object
      required:
        - detail
      properties:
        detail:
          description: Description of the error.
          type: string
          example: Incorrect authentication credentials
          nullable: false
        login_2fa_token:
          description: |
            Short time lived token to be used on `/v2/users/2fa-login` to complete the authentication. This field is present only if 2FA is enabled.
          type: string
          example: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
          nullable: true
    Users2FALoginRequest:
      description: Second factor user login details
      type: object
      required:
        - login_2fa_token
        - code
      properties:
        login_2fa_token:
          description: The intermediate 2FA token returned from `/v2/users/login` API.
          type: string
          example: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
        code:
          description: |
            The Time-based One-Time Password of the Docker Hub account to authenticate with.
          type: string
          example: 123456
    PostUsers2FALoginErrorResponse:
      description: failed second factor login response.
      type: object
      properties:
        detail:
          description: Description of the error.
          type: string
          example: Incorrect authentication credentials
          nullable: false
    protobufAny:
      type: object
      properties:
        type_url:
          type: string
        value:
          type: string
          format: byte
    rpcStatus:
      type: object
      properties:
        code:
          type: integer
          format: int32
        message:
          type: string
        details:
          type: array
          items:
            $ref: '#/components/schemas/protobufAny'
    AuditLogAction:
      type: object
      properties:
        name:
          type: string
          description: Name of audit log action.
        description:
          type: string
          description: Description of audit log action.
        label:
          type: string
          description: Label for audit log action.
      description: Audit Log action
    AuditLogActions:
      type: object
      properties:
        actions:
          type: array
          items:
            $ref: '#/components/schemas/AuditLogAction'
          description: List of audit log actions.
        label:
          type: string
          description: Grouping label for a particular set of audit log actions.
    GetAuditActionsResponse:
      type: object
      properties:
        actions:
          type: object
          additionalProperties:
            $ref: '#/components/schemas/AuditLogActions'
          description: Map of audit log actions.
      description: GetAuditActions response.
    GetAuditLogsResponse:
      type: object
      properties:
        logs:
          type: array
          items:
            $ref: '#/components/schemas/AuditLog'
          description: List of audit log events.
      description: GetAuditLogs response.
    AuditLog:
      type: object
      properties:
        account:
          type: string
        action:
          type: string
        name:
          type: string
        actor:
          type: string
        data:
          type: object
          additionalProperties:
            type: string
        timestamp:
          type: string
          format: date-time
        action_description:
          type: string
      description: Audit log event.
    ValueError:
      type: object
      description: Used to error if input validation fails.
      properties:
        fields:
          type: object
          items:
            type: string
        text:
          type: string
    Error:
      type: object
      properties:
        detail:
          type: string
        message:
          type: string
    accessToken:
      type: object
      properties:
        uuid:
          type: string
          example: b30bbf97-506c-4ecd-aabc-842f3cb484fb
        client_id:
          type: string
          example: HUB
        creator_ip:
          type: string
          example: 127.0.0.1
        creator_ua:
          type: string
          example: some user agent
        created_at:
          type: string
          example: '2021-07-20T12:00:00.000000Z'
        last_used:
          type: string
          example: null
          nullable: true
        generated_by:
          type: string
          example: manual
        is_active:
          type: boolean
          example: true
        token:
          type: string
          example: a7a5ef25-8889-43a0-8cc7-f2a94268e861
        token_label:
          type: string
          example: My read only token
        scopes:
          type: array
          example:
            - repo:read
          items:
            type: string
    createAccessTokenRequest:
      type: object
      required:
        - token_label
        - scopes
      properties:
        token_label:
          type: string
          description: Friendly name for you to identify the token.
          example: My read only token
          minLength: 1
          maxLength: 100
        scopes:
          type: array
          description: |
            Valid scopes: "repo:admin", "repo:write", "repo:read", "repo:public_read"
          example:
            - repo:read
          items:
            type: string
    createAccessTokensResponse:
      $ref: '#/components/schemas/accessToken'
    getAccessTokensResponse:
      type: object
      properties:
        count:
          type: number
          example: 1
        next:
          type: string
          example: null
        previous:
          type: string
          example: null
        active_count:
          type: number
          example: 1
        results:
          type: array
          items:
            allOf:
              - $ref: '#/components/schemas/accessToken'
              - type: object
                properties:
                  token:
                    type: string
                    example: ''
    patchAccessTokenRequest:
      type: object
      properties:
        token_label:
          type: string
          example: My read only token
          minLength: 1
          maxLength: 100
        is_active:
          type: boolean
          example: false
    patchAccessTokenResponse:
      $ref: '#/components/schemas/accessToken'
    orgSettings:
      type: object
      properties:
        restricted_images:
          $ref: '#/components/schemas/restricted_images'
    restricted_images:
      type: object
      properties:
        enabled:
          type: boolean
          description: Whether or not to restrict image usage for users in the organization.
          example: true
        allow_official_images:
          type: boolean
          description: Allow usage of official images if "enabled" is `true`.
          example: true
        allow_verified_publishers:
          type: boolean
          description: Allow usage of verified publisher images if "enabled" is `true`.
          example: true
    layer:
      type: object
      properties:
        digest:
          type: string
          description: image layer digest
          nullable: true
        size:
          type: integer
          description: size of the layer
        instruction:
          type: string
          description: Dockerfile instruction
    image:
      type: object
      properties:
        architecture:
          type: string
          description: CPU architecture
        features:
          type: string
          description: CPU features
        variant:
          type: string
          description: CPU variant
        digest:
          type: string
          description: image digest
          nullable: true
        layers:
          type: array
          items:
            $ref: '#/components/schemas/layer'
        os:
          type: string
          description: operating system
        os_features:
          type: string
          description: OS features
        os_version:
          type: string
          description: OS version
        size:
          type: integer
          description: size of the image
        status:
          type: string
          enum:
            - active
            - inactive
          description: Status of the image
        last_pulled:
          type: string
          example: '2021-01-05T21:06:53.506400Z'
          description: datetime of last pull
          nullable: true
        last_pushed:
          type: string
          example: '2021-01-05T21:06:53.506400Z'
          description: datetime of last push
          nullable: true
    tag:
      type: object
      properties:
        id:
          type: integer
          description: tag ID
        images:
          type: object
          $ref: '#/components/schemas/image'
        creator:
          type: integer
          description: ID of the user that pushed the tag
        last_updated:
          type: string
          example: '2021-01-05T21:06:53.506400Z'
          description: datetime of last update
          nullable: true
        last_updater:
          type: integer
          description: ID of the last user that updated the tag
        last_updater_username:
          type: string
          description: Hub username of the user that updated the tag
        name:
          type: string
          description: name of the tag
        repository:
          type: integer
          description: repository ID
        full_size:
          type: integer
          description: compressed size (sum of all layers) of the tagged image
        v2:
          type: string
          description: repository API version
        status:
          type: string
          enum:
            - active
            - inactive
          description: whether a tag has been pushed to or pulled in the past month
        tag_last_pulled:
          type: string
          example: '2021-01-05T21:06:53.506400Z'
          description: datetime of last pull
          nullable: true
        tag_last_pushed:
          type: string
          example: '2021-01-05T21:06:53.506400Z'
          description: datetime of last push
          nullable: true
    paginated_tags:
      allOf:
        - $ref: '#/components/schemas/page'
        - type: object
          properties:
            results:
              type: array
              items:
                $ref: '#/components/schemas/tag'
    page:
      type: object
      properties:
        count:
          type: integer
          description: total number of results available across all pages
        next:
          type: string
          description: link to next page of results if any
          nullable: true
        previous:
          type: string
          description: link to previous page of results  if any
          nullable: true
    scim_schema_attribute:
      type: object
      properties:
        name:
          type: string
          example: userName
        type:
          enum:
            - string
            - boolean
            - complex
          type: string
          example: string
        multiValued:
          type: boolean
          example: false
        description:
          type: string
          example: Unique identifier for the User, typically used by the user to directly authenticate to the service provider. Each User MUST include a non-empty userName value. This identifier MUST be unique across the service provider's entire set of Users.
        required:
          type: boolean
          example: true
        caseExact:
          type: boolean
          example: false
        mutability:
          type: string
          example: readWrite
        returned:
          type: string
          example: default
        uniqueness:
          type: string
          example: server
    scim_schema_parent_attribute:
      allOf:
        - $ref: '#/components/schemas/scim_schema_attribute'
        - type: object
          properties:
            subAttributes:
              type: array
              items:
                $ref: '#/components/schemas/scim_schema_attribute'
    invite:
      type: object
      properties:
        id:
          type: string
          description: uuid representing the invite id
          example: e36eca69-4cc8-4f17-9845-ae8c2b832691
        inviter_username:
          type: string
          example: moby
        invitee:
          type: string
          description: can either be a dockerID for registred users or an email for non-registred users
          example: invitee@docker.com
        org:
          type: string
          description: name of the org to join
          example: docker
        team:
          type: string
          description: name of the team (user group) to join
          example: owners
        created_at:
          type: string
          example: '2021-10-28T18:30:19.520861Z'
    bulk_invite:
      type: object
      properties:
        invitees:
          type: array
          description: A list of invitees
          items:
            type: object
            properties:
              invitee:
                type: string
                description: invitee email or Docker ID
              status:
                type: string
                description: status of the invite or validation error
              invite:
                description: Invite data if successfully invited
                $ref: '#/components/schemas/invite'
      example:
        invitees:
          - invitee: invitee@docker.com
            status: invited
            invite:
              id: e36eca69-4cc8-4f17-9845-ae8c2b832691
              inviter_username: moby
              invitee: invitee@docker.com
              org: docker
              team: owners
              created_at: '2021-10-28T18:30:19.520861Z'
          - invitee: invitee2@docker.com
            status: existing_org_member
          - invitee: invitee3@docker.com
            status: invalid_email_or_docker_id
    error:
      type: object
      properties:
        errinfo:
          type: object
          items:
            type: string
        detail:
          type: string
        message:
          type: string
    scim_error:
      type: object
      properties:
        status:
          type: string
          description: The status code for the response in string format.
        schemas:
          type: array
          items:
            type: string
            default: urn:ietf:params:scim:api:messages:2.0:Error
        detail:
          type: string
          description: Details about why the request failed.
    user:
      type: object
      properties:
        id:
          type: string
          example: 0ab70deb065a43fcacd55d48caa945d8
          description: The UUID trimmed
        company:
          type: string
          example: Docker Inc
        date_joined:
          type: string
          example: '2021-01-05T21:06:53.506400Z'
        full_name:
          type: string
          example: Jon Snow
        gravatar_email:
          type: string
        gravatar_url:
          type: string
        location:
          type: string
        profile_url:
          type: string
        type:
          type: string
          enum:
            - User
            - Org
          example: User
        username:
          type: string
          example: dockeruser
    org_member:
      allOf:
        - $ref: '#/components/schemas/user'
      properties:
        email:
          type: string
          description: User's email address
          example: example@docker.com
        role:
          type: string
          description: User's role in the Organization
          enum:
            - Owner
            - Member
            - Invitee
          example: Owner
        groups:
          type: array
          description: Groups (Teams) that the user is member of
          items:
            type: string
          example:
            - developers
            - owners
        is_guest:
          type: boolean
          description: If the organization has verfied domains, members that have email addresses outside of those domains will be flagged as Guest member
          example: false
        primary_email:
          type: string
          description: User's email primary address
          example: example@docker.com
          deprecated: true
    org_member_paginated:
      type: object
      properties:
        count:
          type: number
          description: The total number of items that match with the search.
          example: 120
        previous:
          type: string
          description: The URL or link for the previous page of items.
          example: https://hub.docker.com/v2/some/resources/items?page=1&page_size=20
        next:
          type: string
          description: The URL or link for the next page of items.
          example: https://hub.docker.com/v2/some/resources/items?page=3&page_size=20
        results:
          type: array
          description: List of accounts.
          items:
            $ref: '#/components/schemas/org_member'
    org_group:
      type: object
      properties:
        id:
          type: number
          example: 10
          description: Group ID
        uuid:
          type: string
          description: UUID for the group
        name:
          type: string
          example: mygroup
          description: Name of the group
        description:
          type: string
          example: Groups description
          description: Description of the group
        member_count:
          type: number
          example: 10
          description: Member count of the group
    group_member:
      type: object
      properties:
        id:
          type: string
          example: 0ab70deb065a43fcacd55d48caa945d8
          description: The UUID trimmed
        company:
          type: string
          example: Docker Inc
        date_joined:
          type: string
          example: '2021-01-05T21:06:53.506400Z'
        full_name:
          type: string
          example: John Snow
        gravatar_email:
          type: string
        gravatar_url:
          type: string
        location:
          type: string
        profile_url:
          type: string
        type:
          type: string
          enum:
            - User
            - Org
          example: User
        username:
          type: string
          example: dockeruser
        email:
          type: string
          example: dockeruser@docker.com
    email_address:
      type: object
      properties:
        id:
          type: number
        user_id:
          type: number
        email:
          type: string
          example: dockeruser@docker.com
        verified:
          type: boolean
        primary:
          type: boolean
    legacy_email_address:
      allOf:
        - $ref: '#/components/schemas/email_address'
        - type: object
          properties:
            user:
              type: string
              example: dockeruser
    email_with_username:
      allOf:
        - $ref: '#/components/schemas/email_address'
        - type: object
          properties:
            username:
              type: string
              example: dockeruser
    scim_service_provider_config:
      type: object
      properties:
        schemas:
          type: array
          items:
            type: string
          example:
            - urn:ietf:params:scim:schemas:core:2.0:ServiceProviderConfig
        documentationUri:
          type: string
          example: ''
        patch:
          properties:
            supported:
              type: boolean
              example: false
        bulk:
          type: object
          properties:
            supported:
              type: boolean
              example: false
            maxOperations:
              type: integer
            maxPayloadSize:
              type: integer
        filter:
          type: object
          properties:
            supported:
              type: boolean
              example: true
            maxResults:
              type: integer
              example: 99999
        changePassword:
          type: object
          properties:
            supported:
              type: boolean
              example: false
        sort:
          type: object
          properties:
            supported:
              type: boolean
              example: true
        etag:
          type: object
          properties:
            supported:
              type: boolean
              example: false
        authenticationSchemes:
          type: object
          properties:
            name:
              type: string
              example: OAuth 2.0 Bearer Token
            description:
              type: string
              example: The OAuth 2.0 Bearer Token Authentication scheme. OAuth enables clients to access protected resources by obtaining an access token, which is defined in RFC 6750 as "a string representing an access authorization issued to the client", rather than using the resource owner's credentials directly.
            specUri:
              type: string
              example: http://tools.ietf.org/html/rfc6750
            type:
              type: string
              example: oauthbearertoken
    scim_resource_type:
      type: object
      properties:
        schemas:
          type: array
          items:
            type: string
          example:
            - urn:ietf:params:scim:schemas:core:2.0:ResourceType
        id:
          type: string
          example: User
        name:
          type: string
          example: User
        description:
          type: string
          example: User
        endpoint:
          type: string
          example: /Users
        schema:
          type: string
          example: urn:ietf:params:scim:schemas:core:2.0:User
    scim_schema:
      type: object
      properties:
        schemas:
          type: array
          items:
            type: string
          example:
            - urn:ietf:params:scim:schemas:core:2.0:Schema
        id:
          type: string
          example: urn:ietf:params:scim:schemas:core:2.0:User
        name:
          type: string
          example: User
        description:
          type: string
          example: User Account
        attributes:
          type: array
          example: []
          items:
            $ref: '#/components/schemas/scim_schema_parent_attribute'
    scim_email:
      type: object
      properties:
        value:
          type: string
          example: jon.snow@docker.com
        display:
          type: string
          example: jon.snow@docker.com
        primary:
          type: boolean
          example: true
    scim_group:
      type: object
      properties:
        value:
          type: string
          example: nightswatch
        display:
          type: string
          example: nightswatch
    scim_user_username:
      type: string
      description: The user's email address. This must be reachable via email.
      example: jon.snow@docker.com
    scim_user_name:
      type: object
      properties:
        givenName:
          type: string
          example: Jon
        familyName:
          type: string
          example: Snow
    scim_user_display_name:
      type: string
      description: The username in Docker. Also known as the "Docker ID".
      example: jonsnow
    scim_user_schemas:
      type: array
      items:
        type: string
        example: urn:ietf:params:scim:schemas:core:2.0:User
        minItems: 1
    scim_user_id:
      type: string
      example: d80f7c79-7730-49d8-9a41-7c42fb622d9c
      description: The unique identifier for the user. A v4 UUID.
    scim_user:
      type: object
      properties:
        schemas:
          $ref: '#/components/schemas/scim_user_schemas'
        id:
          $ref: '#/components/schemas/scim_user_id'
        userName:
          $ref: '#/components/schemas/scim_user_username'
        name:
          $ref: '#/components/schemas/scim_user_name'
        displayName:
          $ref: '#/components/schemas/scim_user_display_name'
        active:
          type: boolean
          example: true
        emails:
          type: array
          items:
            $ref: '#/components/schemas/scim_email'
        groups:
          type: array
          items:
            $ref: '#/components/schemas/scim_group'
        meta:
          type: object
          properties:
            resourceType:
              type: string
              example: User
            location:
              type: string
              example: https://hub.docker.com/v2/scim/2.0/Users/d80f7c79-7730-49d8-9a41-7c42fb622d9c
            created:
              type: string
              description: The creation date for the user as a RFC3339 formatted string.
              example: '2022-05-20T00:54:18Z'
            lastModified:
              type: string
              description: The date the user was last modified as a RFC3339 formatted string.
              example: '2022-05-20T00:54:18Z'
  parameters:
    namespace:
      in: path
      name: namespace
      required: true
      schema:
        type: string
    repository:
      in: path
      name: repository
      required: true
      schema:
        type: string
    tag:
      in: path
      name: tag
      required: true
      schema:
        type: string
    org_name:
      in: path
      name: org_name
      description: Name of the organization (namespace).
      schema:
        type: string
      example: myorganization
      required: true
    group_name:
      in: path
      name: group_name
      description: Name of the group (team) in the organization.
      schema:
        type: string
        example: developers
      required: true
    username:
      in: path
      name: username
      description: Username, identifier for the user (namespace, DockerID).
      schema:
        type: string
        example: jonsnow
      required: true
    page:
      in: query
      name: page
      description: Page number (starts on 1).
      schema:
        type: integer
    page_size:
      in: query
      name: page_size
      description: Number of items (rows) per page.
      schema:
        type: integer
    invites:
      in: query
      name: invites
      description: Include invites in the response.
      schema:
        type: boolean
    search:
      in: query
      name: search
      schema:
        type: integer
      description: Search term.
    scim_attributes:
      in: query
      name: attributes
      schema:
        type: string
      description: Comma delimited list of attributes to limit to in the response.
      example: userName,displayName
    scim_user_id:
      name: id
      in: path
      schema:
        type: string
      description: The user ID.
      example: d80f7c79-7730-49d8-9a41-7c42fb622d9c
      required: true
    type:
      in: query
      name: type
      schema:
        type: string
        enum:
          - all
          - invitee
          - member
      example: all
    role:
      in: query
      name: role
      schema:
        type: string
        enum:
          - owner
          - editor
          - member
      example: owner
    bulk_invite:
      in: header
      name: X-Analytics-Client-Feature
      description: Optional string that indicates the feature used to submit the bulk invites (e.g.'file', 'web')
      schema:
        type: string
  requestBodies:
    bulk_invite_request:
      required: true
      content:
        application/json:
          schema:
            type: object
            required:
              - org
              - invitees
            properties:
              org:
                type: string
                description: organization name
                example: docker
              team:
                type: string
                description: team name
                example: owners
              role:
                type: string
                description: role for invitees
                example: member
              invitees:
                type: array
                description: list of invitees emails or Docker Ids
                items:
                  type: string
                  description: invitee email or Docker ID
                example:
                  - invitee1DockerId
                  - invitee2@docker.com
                  - invitee3@docker.com
              dry_run:
                type: boolean
                description: Optional, run through validation but don't actually change data.
                example: true
    scim_create_user_request:
      required: true
      content:
        application/scim+json:
          schema:
            type: object
            required:
              - schemas
              - userName
            properties:
              schemas:
                $ref: '#/components/schemas/scim_user_schemas'
              userName:
                $ref: '#/components/schemas/scim_user_username'
              name:
                $ref: '#/components/schemas/scim_user_name'
    scim_update_user_request:
      required: true
      content:
        application/scim+json:
          schema:
            type: object
            required:
              - schemas
            properties:
              schemas:
                $ref: '#/components/schemas/scim_user_schemas'
              name:
                allOf:
                  - $ref: '#/components/schemas/scim_user_name'
                  - description: If this is omitted from the request, the update will skip the update on it. We will only ever change the name, but not clear it.
              enabled:
                type: boolean
                default: false
                description: If this is omitted from the request, it will default to false resulting in a deactivated user.
    add_member_to_org_group:
      required: true
      content:
        application/json:
          schema:
            type: object
            required:
              - member
            properties:
              member:
                type: string
                example: jonsnow
  securitySchemes:
    bearerAuth:
      type: http
      scheme: bearer
      bearerFormat: JWT
    bearerSCIMAuth:
      type: http
      scheme: bearer
x-tagGroups:
  - name: General
    tags:
      - resources
      - rate-limiting
  - name: API
    tags:
      - authentication
      - access-tokens
      - images
      - audit-logs
      - org-settings
      - repositories
      - scim
      - orgs 
      - groups
      - invites
@z
