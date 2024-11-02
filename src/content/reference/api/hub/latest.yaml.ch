%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
openapi: 3.0.0
info:
  title: Docker HUB API
  version: beta
  x-logo:
    url: https://docs.docker.com/assets/images/logo-docker-main.png
    href: /reference
  description: |
    Docker Hub is a service provided by Docker for finding and sharing container
    images with your team.
@y
openapi: 3.0.0
info:
  title: Docker HUB API
  version: beta
  x-logo:
    url: https://docs.docker.com/assets/images/logo-docker-main.png
    href: /reference
  description: |
    Docker Hub is a service provided by Docker for finding and sharing container
    images with your team.
@z

@x
    It is the world's largest library and community for container images.
@y
    It is the world's largest library and community for container images.
@z

@x
    In addition to the [Docker Hub UI](https://docs.docker.com/docker-hub/) and [Docker Hub CLI tool](https://github.com/docker/hub-tool#readme) (currently experimental),
@y
    In addition to the [Docker Hub UI](https://docs.docker.com/docker-hub/) and [Docker Hub CLI tool](https://github.com/docker/hub-tool#readme) (currently experimental),
@z

@x
    Docker provides an API that allows you to interact with Docker Hub.
@y
    Docker provides an API that allows you to interact with Docker Hub.
@z

@x
    Browse through the Docker Hub API documentation to explore the supported endpoints.
@y
    Browse through the Docker Hub API documentation to explore the supported endpoints.
@z

@x
tags:
  - name: resources
    x-displayName: Resources
    description: |
      The following resources are available to interact with the documented API:
@y
tags:
  - name: resources
    x-displayName: Resources
    description: |
      The following resources are available to interact with the documented API:
@z

@x
      - <a href="https://github.com/docker/hub-tool#readme">Docker Hub CLI tool</a> (currently experimental)
  - name: rate-limiting
    x-displayName: Rate Limiting
    description: |
      The Docker Hub API is limited on the amount of requests you can perform per minute against it.
@y
      - <a href="https://github.com/docker/hub-tool#readme">Docker Hub CLI tool</a> (currently experimental)
  - name: rate-limiting
    x-displayName: Rate Limiting
    description: |
      The Docker Hub API is limited on the amount of requests you can perform per minute against it.
@z

@x
      If you haven't hit the limit, each request to the API will return the
@y
      If you haven't hit the limit, each request to the API will return the
@z

@x
      following headers in the response.
@y
      following headers in the response.
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
      If you have hit the limit, you will receive a response status of `429` and the `X-Retry-After` 
      header in the response.
@y
      If you have hit the limit, you will receive a response status of `429` and the `X-Retry-After` 
      header in the response.
@z

@x
      The `X-Retry-After` header is a unix timestamp of when you can call the API again.
@y
      The `X-Retry-After` header is a unix timestamp of when you can call the API again.
@z

@x
      **Note**: These rate limits are separate from anti-abuse and Docker Hub
@y
      **Note**: These rate limits are separate from anti-abuse and Docker Hub
@z

@x
      download, or pull rate limiting. To learn more about Docker Hub pull rate
@y
      download, or pull rate limiting. To learn more about Docker Hub pull rate
@z

@x
      limiting, see [Docker Hub download rate limit](https://docs.docker.com/docker-hub/download-rate-limit/).
  - name: authentication
    x-displayName: Authentication
    description: |
      Most Docker Hub API endpoints require you to authenticate using your
      Docker credentials before using them.
@y
      limiting, see [Docker Hub download rate limit](https://docs.docker.com/docker-hub/download-rate-limit/).
  - name: authentication
    x-displayName: Authentication
    description: |
      Most Docker Hub API endpoints require you to authenticate using your
      Docker credentials before using them.
@z

@x
      Additionally, similar to the Docker Hub UI features, API endpoint responses may vary depending 
      on your plan (Personal, Pro, or Team) and your account's permissions.
@y
      Additionally, similar to the Docker Hub UI features, API endpoint responses may vary depending 
      on your plan (Personal, Pro, or Team) and your account's permissions.
@z

@x
      To learn more about the features available in each plan and to upgrade your existing plan, see [Docker Pricing](https://www.docker.com/pricing).
  - name: access-tokens
    x-displayName: Personal Access Tokens
    description: |
      The Personal Access Token endpoints lets you manage personal access tokens. For more 
      information, see [Access Tokens](https://docs.docker.com/security/for-developers/access-tokens/).
@y
      To learn more about the features available in each plan and to upgrade your existing plan, see [Docker Pricing](https://www.docker.com/pricing).
  - name: access-tokens
    x-displayName: Personal Access Tokens
    description: |
      The Personal Access Token endpoints lets you manage personal access tokens. For more 
      information, see [Access Tokens](https://docs.docker.com/security/for-developers/access-tokens/).
@z

@x
      You can use a personal access token instead of a password in the [Docker CLI](https://docs.docker.com/engine/reference/commandline/cli/) 
      or in the [Create an authentication token](#operation/PostUsersLogin) route to obtain a bearer 
      token.
@y
      You can use a personal access token instead of a password in the [Docker CLI](https://docs.docker.com/engine/reference/commandline/cli/) 
      or in the [Create an authentication token](#operation/PostUsersLogin) route to obtain a bearer 
      token.
@z

@x
      ### Scopes
@y
      ### Scopes
@z

@x
      For each scope grouping (in this case "repo"), you only need to define 1 scope as any lower 
      scopes are assumed. For example: If you define `repo:write`, the API assumes the scope of both 
      `repo:read` *and* `repo:public_read` as well. If you were to define both `repo:write` *and* 
      `repo:read`, then `repo:read` is assumed by `repo:write` and ignored.
@y
      For each scope grouping (in this case "repo"), you only need to define 1 scope as any lower 
      scopes are assumed. For example: If you define `repo:write`, the API assumes the scope of both 
      `repo:read` *and* `repo:public_read` as well. If you were to define both `repo:write` *and* 
      `repo:read`, then `repo:read` is assumed by `repo:write` and ignored.
@z

@x
      ***Treat your personal access token like your password and keep it secret. You cannot retrieve 
      your token after it is generated.***
  - name: audit-logs
    x-displayName: Audit Logs
    description: |
      The Audit Logs API endpoints allow you to query audit log events across a
      namespace.
@y
      ***Treat your personal access token like your password and keep it secret. You cannot retrieve 
      your token after it is generated.***
  - name: audit-logs
    x-displayName: Audit Logs
    description: |
      The Audit Logs API endpoints allow you to query audit log events across a
      namespace.
@z

@x
      For more information, see [Audit Log](https://docs.docker.com/admin/organization/activity-logs/).
  - name: org-settings
    x-displayName: Org Settings
    description: |
      The Org Settings API endpoints allow you to manage your organization's
      settings.
  - name: repositories
    x-displayName: Repositories
    description: |
      The repository endpoints allow you to access your repository's
      tags.
  - name: scim
    x-displayName: SCIM
    description: |
      SCIM is a provisioning system that lets you manage users within your identity provider (IdP).
      For more information, see [System for Cross-domain Identity management](https://docs.docker.com/security/for-admins/provisioning/scim/).
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
paths:
  /v2/users/login:
    post:
      tags:
        - authentication
      summary: Create an authentication token
      operationId: PostUsersLogin
      description: |
        Creates and returns a bearer token in JWT format that you can use to
        authenticate with Docker Hub APIs.
@y
      For more information, see [Audit Log](https://docs.docker.com/admin/organization/activity-logs/).
  - name: org-settings
    x-displayName: Org Settings
    description: |
      The Org Settings API endpoints allow you to manage your organization's
      settings.
  - name: repositories
    x-displayName: Repositories
    description: |
      The repository endpoints allow you to access your repository's
      tags.
  - name: scim
    x-displayName: SCIM
    description: |
      SCIM is a provisioning system that lets you manage users within your identity provider (IdP).
      For more information, see [System for Cross-domain Identity management](https://docs.docker.com/security/for-admins/provisioning/scim/).
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
paths:
  /v2/users/login:
    post:
      tags:
        - authentication
      summary: Create an authentication token
      operationId: PostUsersLogin
      description: |
        Creates and returns a bearer token in JWT format that you can use to
        authenticate with Docker Hub APIs.
@z

@x
        The returned token is used in the HTTP Authorization header like `Authorization: Bearer {TOKEN}`.
@y
        The returned token is used in the HTTP Authorization header like `Authorization: Bearer {TOKEN}`.
@z

@x
        Most Docker Hub APIs require this token either to consume or to get detailed information. For example, to list 
        images in a private repository.
@y
        Most Docker Hub APIs require this token either to consume or to get detailed information. For example, to list 
        images in a private repository.
@z

@x
        _**As of Monday, September 16, 2024, this route requires a PAT instead of a password if your organization has 
        SSO enforced.**_
      requestBody:
        content:
          application/json:
            schema:
              $ref: "#/components/schemas/UsersLoginRequest"
        description: Login details.
        required: true
      responses:
        200:
          description: Authentication successful
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/PostUsersLoginSuccessResponse"
        401:
          description: Authentication failed or second factor required
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/PostUsersLoginErrorResponse"
  /v2/users/2fa-login:
    post:
      tags:
        - authentication
      summary: Second factor authentication
      operationId: PostUsers2FALogin
      description: |
        When a user has two-factor authentication (2FA) enabled, this is the second call to perform after
        `/v2/users/login` call.
@y
        _**As of Monday, September 16, 2024, this route requires a PAT instead of a password if your organization has 
        SSO enforced.**_
      requestBody:
        content:
          application/json:
            schema:
              $ref: "#/components/schemas/UsersLoginRequest"
        description: Login details.
        required: true
      responses:
        200:
          description: Authentication successful
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/PostUsersLoginSuccessResponse"
        401:
          description: Authentication failed or second factor required
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/PostUsersLoginErrorResponse"
  /v2/users/2fa-login:
    post:
      tags:
        - authentication
      summary: Second factor authentication
      operationId: PostUsers2FALogin
      description: |
        When a user has two-factor authentication (2FA) enabled, this is the second call to perform after
        `/v2/users/login` call.
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
              $ref: "#/components/schemas/Users2FALoginRequest"
        description: Login details.
        required: true
      responses:
        200:
          description: Authentication successful
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/PostUsersLoginSuccessResponse"
        401:
          description: Authentication failed or second factor required
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/PostUsers2FALoginErrorResponse"
  /v2/access-tokens:
    post:
      summary: Create a personal access token
      description: Creates and returns a personal access token.
      tags:
        - access-tokens
      requestBody:
        content:
          application/json:
            schema:
              $ref: "#/components/schemas/createAccessTokenRequest"
        required: true
      responses:
        201:
          description: Created
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/createAccessTokensResponse"
        400:
          $ref: "#/components/responses/BadRequest"
        401:
          $ref: "#/components/responses/Unauthorized"
    get:
      summary: Get a list of personal access tokens
      description: Returns a paginated list of personal access tokens.
      tags:
        - access-tokens
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
        200:
          description: OK
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/getAccessTokensResponse"
        400:
          $ref: "#/components/responses/BadRequest"
        401:
          $ref: "#/components/responses/Unauthorized"
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
        Updates a personal access token partially. You can either update the
        token's label or enable/disable it.
      tags:
        - access-tokens
      requestBody:
        content:
          application/json:
            schema:
              $ref: "#/components/schemas/patchAccessTokenRequest"
        required: true
      responses:
        200:
          description: OK
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/patchAccessTokenResponse"
        400:
          $ref: "#/components/responses/BadRequest"
        401:
          $ref: "#/components/responses/Unauthorized"
    get:
      summary: Get a personal access token
      description: Returns a personal access token by UUID.
      tags:
        - access-tokens
      responses:
        200:
          description: OK
          content:
            application/json:
              schema:
                allOf:
                  - $ref: "#/components/schemas/accessToken"
                  - type: object
                    properties:
                      token:
                        type: string
                        example: ""
        401:
          $ref: "#/components/responses/Unauthorized"
        404:
          $ref: "#/components/responses/NotFound"
    delete:
      summary: Delete a personal access token
      description: |
        Deletes a personal access token permanently. This cannot be undone.
      tags:
        - access-tokens
      responses:
        204:
          description: A successful response.
        401:
          $ref: "#/components/responses/Unauthorized"
        404:
          $ref: "#/components/responses/NotFound"
  /v2/auditlogs/{account}:
    get:
      summary: Returns list of audit log events
      description: Get audit log events for a given namespace.
      operationId: AuditLogs_GetAuditLogs
      responses:
        200:
          description: A successful response.
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/GetAuditLogsResponse"
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
                        timestamp: 2021-02-19T01:34:35Z
                        action_description:
                          pushed the tag latest with the digest
                          sha256:c1ae9c435032a to the repository docker/example
        429:
          description: ""
          content:
            application/json:
              schema: {}
              examples:
                response:
                  value:
                    detail: Rate limit exceeded
                    error: false
        500:
          description: ""
          content:
            application/json:
              schema: {}
        default:
          description: An unexpected error response.
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/rpcStatus"
      parameters:
        - name: account
          description: Namespace to query audit logs for.
          in: path
          required: true
          schema:
            type: string
        - name: action
          description:
            action name one of ["repo.tag.push", ...]. Optional parameter to
            filter specific audit log actions.
          in: query
          required: false
          schema:
            type: string
        - name: name
          description:
            name. Optional parameter to filter audit log events to a specific
            name. For repository events, this is the name of the repository. For
            organization events, this is the name of the organization. For team
            member events, this is the username of the team member.
          in: query
          required: false
          schema:
            type: string
        - name: actor
          description:
            actor name. Optional parameter to filter audit log events to the
            specific user who triggered the event.
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
      description:
        Get audit log actions for a namespace to be used as a filter for
        querying audit events.
      operationId: AuditLogs_GetAuditActions
      responses:
        200:
          description: A successful response.
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/GetAuditActionsResponse"
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
        429:
          description: ""
          content:
            application/json:
              schema: {}
              examples:
                response:
                  value:
                    detail: Rate limit exceeded
                    error: false
        500:
          description: ""
          content:
            application/json:
              schema: {}
        default:
          description: An unexpected error response.
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/rpcStatus"
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
      responses:
        200:
          description: OK
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/orgSettings"
        401:
          $ref: "#/components/responses/Unauthorized"
        403:
          $ref: "#/components/responses/Forbidden"
        404:
          $ref: "#/components/responses/NotFound"
    put:
      summary: Update organization settings
      description: |
        Updates an organization's settings. Some settings are only used when the
        organization is on a business plan.
@y
        Most Docker Hub APIs require this token either to consume or to get detailed information. For example, to list images in a private repository.
      requestBody:
        content:
          application/json:
            schema:
              $ref: "#/components/schemas/Users2FALoginRequest"
        description: Login details.
        required: true
      responses:
        200:
          description: Authentication successful
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/PostUsersLoginSuccessResponse"
        401:
          description: Authentication failed or second factor required
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/PostUsers2FALoginErrorResponse"
  /v2/access-tokens:
    post:
      summary: Create a personal access token
      description: Creates and returns a personal access token.
      tags:
        - access-tokens
      requestBody:
        content:
          application/json:
            schema:
              $ref: "#/components/schemas/createAccessTokenRequest"
        required: true
      responses:
        201:
          description: Created
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/createAccessTokensResponse"
        400:
          $ref: "#/components/responses/BadRequest"
        401:
          $ref: "#/components/responses/Unauthorized"
    get:
      summary: Get a list of personal access tokens
      description: Returns a paginated list of personal access tokens.
      tags:
        - access-tokens
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
        200:
          description: OK
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/getAccessTokensResponse"
        400:
          $ref: "#/components/responses/BadRequest"
        401:
          $ref: "#/components/responses/Unauthorized"
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
        Updates a personal access token partially. You can either update the
        token's label or enable/disable it.
      tags:
        - access-tokens
      requestBody:
        content:
          application/json:
            schema:
              $ref: "#/components/schemas/patchAccessTokenRequest"
        required: true
      responses:
        200:
          description: OK
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/patchAccessTokenResponse"
        400:
          $ref: "#/components/responses/BadRequest"
        401:
          $ref: "#/components/responses/Unauthorized"
    get:
      summary: Get a personal access token
      description: Returns a personal access token by UUID.
      tags:
        - access-tokens
      responses:
        200:
          description: OK
          content:
            application/json:
              schema:
                allOf:
                  - $ref: "#/components/schemas/accessToken"
                  - type: object
                    properties:
                      token:
                        type: string
                        example: ""
        401:
          $ref: "#/components/responses/Unauthorized"
        404:
          $ref: "#/components/responses/NotFound"
    delete:
      summary: Delete a personal access token
      description: |
        Deletes a personal access token permanently. This cannot be undone.
      tags:
        - access-tokens
      responses:
        204:
          description: A successful response.
        401:
          $ref: "#/components/responses/Unauthorized"
        404:
          $ref: "#/components/responses/NotFound"
  /v2/auditlogs/{account}:
    get:
      summary: Returns list of audit log events
      description: Get audit log events for a given namespace.
      operationId: AuditLogs_GetAuditLogs
      responses:
        200:
          description: A successful response.
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/GetAuditLogsResponse"
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
                        timestamp: 2021-02-19T01:34:35Z
                        action_description:
                          pushed the tag latest with the digest
                          sha256:c1ae9c435032a to the repository docker/example
        429:
          description: ""
          content:
            application/json:
              schema: {}
              examples:
                response:
                  value:
                    detail: Rate limit exceeded
                    error: false
        500:
          description: ""
          content:
            application/json:
              schema: {}
        default:
          description: An unexpected error response.
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/rpcStatus"
      parameters:
        - name: account
          description: Namespace to query audit logs for.
          in: path
          required: true
          schema:
            type: string
        - name: action
          description:
            action name one of ["repo.tag.push", ...]. Optional parameter to
            filter specific audit log actions.
          in: query
          required: false
          schema:
            type: string
        - name: name
          description:
            name. Optional parameter to filter audit log events to a specific
            name. For repository events, this is the name of the repository. For
            organization events, this is the name of the organization. For team
            member events, this is the username of the team member.
          in: query
          required: false
          schema:
            type: string
        - name: actor
          description:
            actor name. Optional parameter to filter audit log events to the
            specific user who triggered the event.
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
      description:
        Get audit log actions for a namespace to be used as a filter for
        querying audit events.
      operationId: AuditLogs_GetAuditActions
      responses:
        200:
          description: A successful response.
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/GetAuditActionsResponse"
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
        429:
          description: ""
          content:
            application/json:
              schema: {}
              examples:
                response:
                  value:
                    detail: Rate limit exceeded
                    error: false
        500:
          description: ""
          content:
            application/json:
              schema: {}
        default:
          description: An unexpected error response.
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/rpcStatus"
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
      responses:
        200:
          description: OK
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/orgSettings"
        401:
          $ref: "#/components/responses/Unauthorized"
        403:
          $ref: "#/components/responses/Forbidden"
        404:
          $ref: "#/components/responses/NotFound"
    put:
      summary: Update organization settings
      description: |
        Updates an organization's settings. Some settings are only used when the
        organization is on a business plan.
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
      requestBody:
        content:
          application/json:
            schema:
              required:
                - restricted_images
              properties:
                restricted_images:
                  allOf:
                    - $ref: "#/components/schemas/restricted_images"
                    - type: object
                      required:
                        - enabled
                        - allow_official_images
                        - allow_verified_publishers
        required: true
      responses:
        200:
          description: OK
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/orgSettings"
        401:
          $ref: "#/components/responses/Unauthorized"
        403:
          $ref: "#/components/responses/Forbidden"
        404:
          $ref: "#/components/responses/NotFound"
@y
        The following settings are only used on a business plan:
        - `restricted_images`
      tags:
        - org-settings
      requestBody:
        content:
          application/json:
            schema:
              required:
                - restricted_images
              properties:
                restricted_images:
                  allOf:
                    - $ref: "#/components/schemas/restricted_images"
                    - type: object
                      required:
                        - enabled
                        - allow_official_images
                        - allow_verified_publishers
        required: true
      responses:
        200:
          description: OK
          content:
            application/json:
              schema:
                $ref: "#/components/schemas/orgSettings"
        401:
          $ref: "#/components/responses/Unauthorized"
        403:
          $ref: "#/components/responses/Forbidden"
        404:
          $ref: "#/components/responses/NotFound"
@z

@x
  /v2/namespaces/{namespace}/repositories/{repository}/tags:
    parameters:
      - $ref: "#/components/parameters/namespace"
      - $ref: "#/components/parameters/repository"
    get:
      summary: "List repository tags"
      tags: [ repositories ]
      parameters:
        - $ref: "#/components/parameters/page"
        - $ref: "#/components/parameters/page_size"
      responses:
        200:
          $ref: "#/components/responses/list_tags"
        403:
          $ref: "#/components/responses/Forbidden"
        404:
          $ref: "#/components/responses/NotFound"
    head:
      summary: "Check repository tags"
      tags: [ repositories ]
      responses:
        200:
          description: "Repository contains tags"
        403:
          $ref: "#/components/responses/Forbidden"
        404:
          $ref: "#/components/responses/NotFound"
@y
  /v2/namespaces/{namespace}/repositories/{repository}/tags:
    parameters:
      - $ref: "#/components/parameters/namespace"
      - $ref: "#/components/parameters/repository"
    get:
      summary: "List repository tags"
      tags: [ repositories ]
      parameters:
        - $ref: "#/components/parameters/page"
        - $ref: "#/components/parameters/page_size"
      responses:
        200:
          $ref: "#/components/responses/list_tags"
        403:
          $ref: "#/components/responses/Forbidden"
        404:
          $ref: "#/components/responses/NotFound"
    head:
      summary: "Check repository tags"
      tags: [ repositories ]
      responses:
        200:
          description: "Repository contains tags"
        403:
          $ref: "#/components/responses/Forbidden"
        404:
          $ref: "#/components/responses/NotFound"
@z

@x
  /v2/namespaces/{namespace}/repositories/{repository}/tags/{tag}:
    parameters:
      - $ref: "#/components/parameters/namespace"
      - $ref: "#/components/parameters/repository"
      - $ref: "#/components/parameters/tag"
    get:
      summary: "Read repository tag"
      tags: [ repositories ]
      responses:
        200:
          $ref: "#/components/responses/get_tag"
        403:
          $ref: "#/components/responses/Forbidden"
        404:
          $ref: "#/components/responses/NotFound"
    head:
      summary: "Check repository tag"
      tags: [ repositories ]
      responses:
        200:
          description: "Repository tag exists"
        403:
          $ref: "#/components/responses/Forbidden"
        404:
          $ref: "#/components/responses/NotFound"
@y
  /v2/namespaces/{namespace}/repositories/{repository}/tags/{tag}:
    parameters:
      - $ref: "#/components/parameters/namespace"
      - $ref: "#/components/parameters/repository"
      - $ref: "#/components/parameters/tag"
    get:
      summary: "Read repository tag"
      tags: [ repositories ]
      responses:
        200:
          $ref: "#/components/responses/get_tag"
        403:
          $ref: "#/components/responses/Forbidden"
        404:
          $ref: "#/components/responses/NotFound"
    head:
      summary: "Check repository tag"
      tags: [ repositories ]
      responses:
        200:
          description: "Repository tag exists"
        403:
          $ref: "#/components/responses/Forbidden"
        404:
          $ref: "#/components/responses/NotFound"
@z

@x
  /v2/scim/2.0/ServiceProviderConfig:
    get:
      summary: Get service provider config
      description: |
        Returns a service provider config for Docker's configuration.
      tags: [ scim ]
      security:
        - bearerSCIMAuth: [ ]
      responses:
        200:
          $ref: '#/components/responses/scim_get_service_provider_config_resp'
        401:
          $ref: "#/components/responses/scim_unauthorized"
        500:
          $ref: "#/components/responses/scim_error"
@y
  /v2/scim/2.0/ServiceProviderConfig:
    get:
      summary: Get service provider config
      description: |
        Returns a service provider config for Docker's configuration.
      tags: [ scim ]
      security:
        - bearerSCIMAuth: [ ]
      responses:
        200:
          $ref: '#/components/responses/scim_get_service_provider_config_resp'
        401:
          $ref: "#/components/responses/scim_unauthorized"
        500:
          $ref: "#/components/responses/scim_error"
@z

@x
  /v2/scim/2.0/ResourceTypes:
    get:
      summary: List resource types
      description: |
        Returns all resource types supported for the SCIM configuration.
      tags: [ scim ]
      security:
        - bearerSCIMAuth: [ ]
      responses:
        200:
          $ref: "#/components/responses/scim_get_resource_types_resp"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        500:
          $ref: "#/components/responses/scim_error"
@y
  /v2/scim/2.0/ResourceTypes:
    get:
      summary: List resource types
      description: |
        Returns all resource types supported for the SCIM configuration.
      tags: [ scim ]
      security:
        - bearerSCIMAuth: [ ]
      responses:
        200:
          $ref: "#/components/responses/scim_get_resource_types_resp"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        500:
          $ref: "#/components/responses/scim_error"
@z

@x
  /v2/scim/2.0/ResourceTypes/{name}:
    get:
      summary: Get a resource type
      description: |
        Returns a resource type by name.
      tags: [ scim ]
      parameters:
        - name: name
          in: path
          schema:
            type: string
          example: User
      security:
        - bearerSCIMAuth: [ ]
      responses:
        200:
          $ref: "#/components/responses/scim_get_resource_type_resp"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        404:
          $ref: "#/components/responses/scim_not_found"
        500:
          $ref: "#/components/responses/scim_error"
@y
  /v2/scim/2.0/ResourceTypes/{name}:
    get:
      summary: Get a resource type
      description: |
        Returns a resource type by name.
      tags: [ scim ]
      parameters:
        - name: name
          in: path
          schema:
            type: string
          example: User
      security:
        - bearerSCIMAuth: [ ]
      responses:
        200:
          $ref: "#/components/responses/scim_get_resource_type_resp"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        404:
          $ref: "#/components/responses/scim_not_found"
        500:
          $ref: "#/components/responses/scim_error"
@z

@x
  /v2/scim/2.0/Schemas:
    get:
      summary: List schemas
      description: |
        Returns all schemas supported for the SCIM configuration.
      tags: [ scim ]
      security:
        - bearerSCIMAuth: [ ]
      responses:
        200:
          $ref: "#/components/responses/scim_get_schemas_resp"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        500:
          $ref: "#/components/responses/scim_error"
@y
  /v2/scim/2.0/Schemas:
    get:
      summary: List schemas
      description: |
        Returns all schemas supported for the SCIM configuration.
      tags: [ scim ]
      security:
        - bearerSCIMAuth: [ ]
      responses:
        200:
          $ref: "#/components/responses/scim_get_schemas_resp"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        500:
          $ref: "#/components/responses/scim_error"
@z

@x
  /v2/scim/2.0/Schemas/{id}:
    get:
      summary: Get a schema
      description: |
        Returns a schema by ID.
      tags: [ scim ]
      parameters:
        - name: id
          in: path
          schema:
            type: string
          example: urn:ietf:params:scim:schemas:core:2.0:User
      security:
        - bearerSCIMAuth: [ ]
      responses:
        200:
          $ref: "#/components/responses/scim_get_schema_resp"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        404:
          $ref: "#/components/responses/scim_not_found"
        500:
          $ref: "#/components/responses/scim_error"
@y
  /v2/scim/2.0/Schemas/{id}:
    get:
      summary: Get a schema
      description: |
        Returns a schema by ID.
      tags: [ scim ]
      parameters:
        - name: id
          in: path
          schema:
            type: string
          example: urn:ietf:params:scim:schemas:core:2.0:User
      security:
        - bearerSCIMAuth: [ ]
      responses:
        200:
          $ref: "#/components/responses/scim_get_schema_resp"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        404:
          $ref: "#/components/responses/scim_not_found"
        500:
          $ref: "#/components/responses/scim_error"
@z

@x
  /v2/scim/2.0/Users:
    get:
      summary: List users
      description: |
        List users, returns paginated users for an organization. Use `startIndex`
        and `count` query parameters to receive paginated results.
@y
  /v2/scim/2.0/Users:
    get:
      summary: List users
      description: |
        List users, returns paginated users for an organization. Use `startIndex`
        and `count` query parameters to receive paginated results.
@z

@x
        **Sorting:**<br>
        Sorting lets you specify the order of returned resources by specifying
        a combination of `sortBy` and `sortOrder` query parameters.
@y
        **Sorting:**<br>
        Sorting lets you specify the order of returned resources by specifying
        a combination of `sortBy` and `sortOrder` query parameters.
@z

@x
        The `sortBy` parameter specifies the attribute whose value will be used
        to order the returned responses. The `sortOrder` parameter defines the
        order in which the `sortBy` parameter is applied. Allowed values are
        "ascending" and "descending".
@y
        The `sortBy` parameter specifies the attribute whose value will be used
        to order the returned responses. The `sortOrder` parameter defines the
        order in which the `sortBy` parameter is applied. Allowed values are
        "ascending" and "descending".
@z

@x
        **Filtering:**<br>
        You can request a subset of resources by specifying the `filter` query
        parameter containing a filter expression. Attribute names and attribute
        operators used in filters are case insensitive. The filter parameter
        must contain at least one valid expression. Each expression must contain
        an attribute name followed by an attribute operator and an optional
        value.
@y
        **Filtering:**<br>
        You can request a subset of resources by specifying the `filter` query
        parameter containing a filter expression. Attribute names and attribute
        operators used in filters are case insensitive. The filter parameter
        must contain at least one valid expression. Each expression must contain
        an attribute name followed by an attribute operator and an optional
        value.
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
      tags: [ scim ]
      security:
        - bearerSCIMAuth: [ ]
      parameters:
        - name: startIndex
          in: query
          schema:
            type: integer
            minimum: 1
          description: ""
          example: 1
        - name: count
          in: query
          schema:
            type: integer
            minimum: 1
            maximum: 200
          description: ""
          example: 10
        - name: filter
          in: query
          schema:
            type: string
          description: ""
          example: userName eq "jon.snow@docker.com"
        - $ref: "#/components/parameters/scim_attributes"
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
          description: "User attribute to sort by."
          example: userName
      responses:
        200:
          $ref: "#/components/responses/scim_get_users_resp"
        400:
          $ref: "#/components/responses/scim_bad_request"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        403:
          $ref: "#/components/responses/scim_forbidden"
        404:
          $ref: "#/components/responses/scim_not_found"
        500:
          $ref: "#/components/responses/scim_error"
@y
        - `eq` equal
        - `ne` not equal
        - `co` contains
        - `sw` starts with
        - `and` Logical "and"
        - `or` Logical "or"
        - `not` "Not" function
        - `()` Precedence grouping
      tags: [ scim ]
      security:
        - bearerSCIMAuth: [ ]
      parameters:
        - name: startIndex
          in: query
          schema:
            type: integer
            minimum: 1
          description: ""
          example: 1
        - name: count
          in: query
          schema:
            type: integer
            minimum: 1
            maximum: 200
          description: ""
          example: 10
        - name: filter
          in: query
          schema:
            type: string
          description: ""
          example: userName eq "jon.snow@docker.com"
        - $ref: "#/components/parameters/scim_attributes"
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
          description: "User attribute to sort by."
          example: userName
      responses:
        200:
          $ref: "#/components/responses/scim_get_users_resp"
        400:
          $ref: "#/components/responses/scim_bad_request"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        403:
          $ref: "#/components/responses/scim_forbidden"
        404:
          $ref: "#/components/responses/scim_not_found"
        500:
          $ref: "#/components/responses/scim_error"
@z

@x
    post:
      summary: Create user
      description: |
        Creates a user. If the user already exists by email, they are assigned
        to the organization on the "company" team.
      tags: [ scim ]
      security:
        - bearerSCIMAuth: [ ]
      requestBody:
        $ref: "#/components/requestBodies/scim_create_user_request"
      responses:
        201:
          $ref: "#/components/responses/scim_create_user_resp"
        400:
          $ref: "#/components/responses/scim_bad_request"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        403:
          $ref: "#/components/responses/scim_forbidden"
        404:
          $ref: "#/components/responses/scim_not_found"
        409:
          $ref: "#/components/responses/scim_conflict"
        500:
          $ref: "#/components/responses/scim_error"
@y
    post:
      summary: Create user
      description: |
        Creates a user. If the user already exists by email, they are assigned
        to the organization on the "company" team.
      tags: [ scim ]
      security:
        - bearerSCIMAuth: [ ]
      requestBody:
        $ref: "#/components/requestBodies/scim_create_user_request"
      responses:
        201:
          $ref: "#/components/responses/scim_create_user_resp"
        400:
          $ref: "#/components/responses/scim_bad_request"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        403:
          $ref: "#/components/responses/scim_forbidden"
        404:
          $ref: "#/components/responses/scim_not_found"
        409:
          $ref: "#/components/responses/scim_conflict"
        500:
          $ref: "#/components/responses/scim_error"
@z

@x
  /v2/scim/2.0/Users/{id}:
    parameters:
      - $ref: "#/components/parameters/scim_user_id"
    get:
      summary: Get a user
      description: |
        Returns a user by ID.
      tags: [ scim ]
      security:
        - bearerSCIMAuth: [ ]
      responses:
        200:
          $ref: "#/components/responses/scim_get_user_resp"
        400:
          $ref: "#/components/responses/scim_bad_request"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        403:
          $ref: "#/components/responses/scim_forbidden"
        404:
          $ref: "#/components/responses/scim_not_found"
        500:
          $ref: "#/components/responses/scim_error"
    put:
      summary: Update a user
      description: |
        Updates a user. Use this route to change the user's name, activate,
        and deactivate the user.
      tags: [ scim ]
      security:
        - bearerSCIMAuth: [ ]
      requestBody:
        $ref: "#/components/requestBodies/scim_update_user_request"
      responses:
        200:
          $ref: "#/components/responses/scim_update_user_resp"
        400:
          $ref: "#/components/responses/scim_bad_request"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        403:
          $ref: "#/components/responses/scim_forbidden"
        404:
          $ref: "#/components/responses/scim_not_found"
        409:
          $ref: "#/components/responses/scim_conflict"
        500:
          $ref: "#/components/responses/scim_error"
@y
  /v2/scim/2.0/Users/{id}:
    parameters:
      - $ref: "#/components/parameters/scim_user_id"
    get:
      summary: Get a user
      description: |
        Returns a user by ID.
      tags: [ scim ]
      security:
        - bearerSCIMAuth: [ ]
      responses:
        200:
          $ref: "#/components/responses/scim_get_user_resp"
        400:
          $ref: "#/components/responses/scim_bad_request"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        403:
          $ref: "#/components/responses/scim_forbidden"
        404:
          $ref: "#/components/responses/scim_not_found"
        500:
          $ref: "#/components/responses/scim_error"
    put:
      summary: Update a user
      description: |
        Updates a user. Use this route to change the user's name, activate,
        and deactivate the user.
      tags: [ scim ]
      security:
        - bearerSCIMAuth: [ ]
      requestBody:
        $ref: "#/components/requestBodies/scim_update_user_request"
      responses:
        200:
          $ref: "#/components/responses/scim_update_user_resp"
        400:
          $ref: "#/components/responses/scim_bad_request"
        401:
          $ref: "#/components/responses/scim_unauthorized"
        403:
          $ref: "#/components/responses/scim_forbidden"
        404:
          $ref: "#/components/responses/scim_not_found"
        409:
          $ref: "#/components/responses/scim_conflict"
        500:
          $ref: "#/components/responses/scim_error"
@z

@x
servers:
  - url: https://hub.docker.com/
components:
  responses:
    BadRequest:
      description: Bad Request
      content:
        application/json:
          schema:
            $ref: "#/components/schemas/ValueError"
    Unauthorized:
      description: Unauthorized
      content:
        application/json:
          schema:
            $ref: "#/components/schemas/Error"
    Forbidden:
      description: Forbidden
      content:
        application/json:
          schema:
            $ref: "#/components/schemas/Error"
    NotFound:
      description: Not Found
      content:
        application/json:
          schema:
            $ref: "#/components/schemas/Error"
@y
servers:
  - url: https://hub.docker.com/
components:
  responses:
    BadRequest:
      description: Bad Request
      content:
        application/json:
          schema:
            $ref: "#/components/schemas/ValueError"
    Unauthorized:
      description: Unauthorized
      content:
        application/json:
          schema:
            $ref: "#/components/schemas/Error"
    Forbidden:
      description: Forbidden
      content:
        application/json:
          schema:
            $ref: "#/components/schemas/Error"
    NotFound:
      description: Not Found
      content:
        application/json:
          schema:
            $ref: "#/components/schemas/Error"
@z

@x
    scim_bad_request:
      description: Bad Request
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: "#/components/schemas/scim_error"
              - properties:
                  status:
                    example: "400"
                  scimType:
                    type: string
                    description: Some types of errors will return this per the
                      specification.
    scim_unauthorized:
      description: Unauthorized
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: "#/components/schemas/scim_error"
              - properties:
                  status:
                    example: "401"
    scim_forbidden:
      description: Forbidden
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: "#/components/schemas/scim_error"
              - properties:
                  status:
                    example: "403"
    scim_not_found:
      description: Not Found
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: "#/components/schemas/scim_error"
              - properties:
                  status:
                    example: "404"
    scim_conflict:
      description: Conflict
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: "#/components/schemas/scim_error"
              - properties:
                  status:
                    example: "409"
    scim_error:
      description: Internal Error
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: "#/components/schemas/scim_error"
              - properties:
                  status:
                    example: "500"
@y
    scim_bad_request:
      description: Bad Request
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: "#/components/schemas/scim_error"
              - properties:
                  status:
                    example: "400"
                  scimType:
                    type: string
                    description: Some types of errors will return this per the
                      specification.
    scim_unauthorized:
      description: Unauthorized
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: "#/components/schemas/scim_error"
              - properties:
                  status:
                    example: "401"
    scim_forbidden:
      description: Forbidden
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: "#/components/schemas/scim_error"
              - properties:
                  status:
                    example: "403"
    scim_not_found:
      description: Not Found
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: "#/components/schemas/scim_error"
              - properties:
                  status:
                    example: "404"
    scim_conflict:
      description: Conflict
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: "#/components/schemas/scim_error"
              - properties:
                  status:
                    example: "409"
    scim_error:
      description: Internal Error
      content:
        application/scim+json:
          schema:
            allOf:
              - $ref: "#/components/schemas/scim_error"
              - properties:
                  status:
                    example: "500"
@z

@x
    scim_get_service_provider_config_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            $ref: "#/components/schemas/scim_service_provider_config"
@y
    scim_get_service_provider_config_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            $ref: "#/components/schemas/scim_service_provider_config"
@z

@x
    scim_get_resource_types_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            type: object
            properties:
              schemas:
                type: array
                items:
                  type: string
                example: [ "urn:ietf:params:scim:api:messages:2.0:ListResponse" ]
              totalResults:
                type: integer
                example: 1
              resources:
                type: array
                items:
                  $ref: "#/components/schemas/scim_resource_type"
@y
    scim_get_resource_types_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            type: object
            properties:
              schemas:
                type: array
                items:
                  type: string
                example: [ "urn:ietf:params:scim:api:messages:2.0:ListResponse" ]
              totalResults:
                type: integer
                example: 1
              resources:
                type: array
                items:
                  $ref: "#/components/schemas/scim_resource_type"
@z

@x
    scim_get_resource_type_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            $ref: "#/components/schemas/scim_resource_type"
@y
    scim_get_resource_type_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            $ref: "#/components/schemas/scim_resource_type"
@z

@x
    scim_get_schemas_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            type: object
            properties:
              schemas:
                type: array
                items:
                  type: string
                example: [ "urn:ietf:params:scim:api:messages:2.0:ListResponse" ]
              totalResults:
                type: integer
                example: 1
              resources:
                type: array
                items:
                  $ref: "#/components/schemas/scim_schema"
@y
    scim_get_schemas_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            type: object
            properties:
              schemas:
                type: array
                items:
                  type: string
                example: [ "urn:ietf:params:scim:api:messages:2.0:ListResponse" ]
              totalResults:
                type: integer
                example: 1
              resources:
                type: array
                items:
                  $ref: "#/components/schemas/scim_schema"
@z

@x
    scim_get_schema_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            $ref: "#/components/schemas/scim_schema"
@y
    scim_get_schema_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            $ref: "#/components/schemas/scim_schema"
@z

@x
    scim_get_users_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            type: object
            properties:
              schemas:
                type: array
                items:
                  type: string
                example: [ "urn:ietf:params:scim:api:messages:2.0:ListResponse" ]
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
                  $ref: "#/components/schemas/scim_user"
@y
    scim_get_users_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            type: object
            properties:
              schemas:
                type: array
                items:
                  type: string
                example: [ "urn:ietf:params:scim:api:messages:2.0:ListResponse" ]
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
                  $ref: "#/components/schemas/scim_user"
@z

@x
    scim_create_user_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            $ref: "#/components/schemas/scim_user"
@y
    scim_create_user_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            $ref: "#/components/schemas/scim_user"
@z

@x
    scim_get_user_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            $ref: "#/components/schemas/scim_user"
@y
    scim_get_user_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            $ref: "#/components/schemas/scim_user"
@z

@x
    scim_update_user_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            $ref: "#/components/schemas/scim_user"
@y
    scim_update_user_resp:
      description: ""
      content:
        application/scim+json:
          schema:
            $ref: "#/components/schemas/scim_user"
@z

@x
    list_tags:
      description: "list repository tags"
      content:
        application/json:
          schema:
            $ref: "#/components/schemas/paginated_tags"
@y
    list_tags:
      description: "list repository tags"
      content:
        application/json:
          schema:
            $ref: "#/components/schemas/paginated_tags"
@z

@x
    get_tag:
      description: "repository tag"
      content:
        application/json:
          schema:
            $ref: "#/components/schemas/tag"
@y
    get_tag:
      description: "repository tag"
      content:
        application/json:
          schema:
            $ref: "#/components/schemas/tag"
@z

@x
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
          description:
            The password or personal access token (PAT) of the Docker Hub
            account to authenticate with.
          type: string
          example: hunter2
    PostUsersLoginSuccessResponse:
      description: successful user login response
      type: object
      properties:
        token:
          description: |
            Created authentication token.
@y
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
          description:
            The password or personal access token (PAT) of the Docker Hub
            account to authenticate with.
          type: string
          example: hunter2
    PostUsersLoginSuccessResponse:
      description: successful user login response
      type: object
      properties:
        token:
          description: |
            Created authentication token.
@z

@x
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
          description:
            Short time lived token to be used on `/v2/users/2fa-login` to
            complete the authentication. This field is present only if 2FA is
            enabled.
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
          description:
            The Time-based One-Time Password of the Docker Hub account to
            authenticate with.
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
    ErrorInfo:
      description: Context information for an error used for diagnostics.
      type: object
      properties:
        api_call_docker_id:
          description: ID of docker user.
          type: string
        api_call_name:
          description: Name of the API operation called.
          type: string
        api_call_start:
          description: Date/time of call start.
          type: string
        api_call_txnid:
          description: Unique ID for this call.
          type: string
    ErrorResponse:
      description: Represents an error.
      type: object
      properties:
        txnid:
          description: Unique ID for this call.
          type: string
        message:
          description: The error message.
          type: string
        errinfo:
          $ref: "#/components/schemas/ErrorInfo"
    ErrorDetail:
      description: Error with a detail field.
      type: object
      properties:
        detail:
          description: The error message.
          type: string
    GetNamespaceRepositoryImagesSummaryResponse:
      description: Summary information for images in a repository.
      type: object
      properties:
        active_from:
          description:
            Time from which an image must have been pushed or pulled to be
            counted as active.
          type: string
          example: 2021-01-25T14:25:37.076343059Z
        statistics:
          type: object
          properties:
            total:
              description: Number of images in this repository.
              type: integer
              example: 3
            active:
              description: Number of images counted as active in this repository.
              type: integer
              example: 2
            inactive:
              description: Number of images counted as inactive in this repository.
              type: integer
              example: 1
    GetNamespaceRepositoryImagesResponse:
      description: Paginated list of images in a repository.
      type: object
      properties:
        count:
          description: Total count of images in the repository.
          type: integer
          example: 100
        next:
          description:
            Link to the next page with the same query parameters if there are
            more images.
          type: string
          example: https://hub.docker.com/v2/namespaces/mynamespace/repositories/myrepo/images?&page=4&page_size=20
          nullable: true
        previous:
          description:
            Link to the previous page with the same query parameters if not on
            first page.
          type: string
          example: https://hub.docker.com/v2/namespaces/mynamespace/repositories/myrepo/images?&page=2&page_size=20
          nullable: true
        results:
          type: array
          description: Image details.
          items:
            type: object
            properties:
              namespace:
                description: The repository namespace.
                type: string
                example: mynamespace
              repository:
                description: The repository name.
                type: string
                example: myrepo
              digest:
                description: The image's digest.
                type: string
                example: sha256:1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqr
              tags:
                description: The current and historical tags for this image.
                type: array
                items:
                  type: object
                  properties:
                    tag:
                      description: The tag.
                      type: string
                      example: latest
                    is_current:
                      description: |
                        `true` if the tag currently points to this image.
@y
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
          description:
            Short time lived token to be used on `/v2/users/2fa-login` to
            complete the authentication. This field is present only if 2FA is
            enabled.
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
          description:
            The Time-based One-Time Password of the Docker Hub account to
            authenticate with.
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
    ErrorInfo:
      description: Context information for an error used for diagnostics.
      type: object
      properties:
        api_call_docker_id:
          description: ID of docker user.
          type: string
        api_call_name:
          description: Name of the API operation called.
          type: string
        api_call_start:
          description: Date/time of call start.
          type: string
        api_call_txnid:
          description: Unique ID for this call.
          type: string
    ErrorResponse:
      description: Represents an error.
      type: object
      properties:
        txnid:
          description: Unique ID for this call.
          type: string
        message:
          description: The error message.
          type: string
        errinfo:
          $ref: "#/components/schemas/ErrorInfo"
    ErrorDetail:
      description: Error with a detail field.
      type: object
      properties:
        detail:
          description: The error message.
          type: string
    GetNamespaceRepositoryImagesSummaryResponse:
      description: Summary information for images in a repository.
      type: object
      properties:
        active_from:
          description:
            Time from which an image must have been pushed or pulled to be
            counted as active.
          type: string
          example: 2021-01-25T14:25:37.076343059Z
        statistics:
          type: object
          properties:
            total:
              description: Number of images in this repository.
              type: integer
              example: 3
            active:
              description: Number of images counted as active in this repository.
              type: integer
              example: 2
            inactive:
              description: Number of images counted as inactive in this repository.
              type: integer
              example: 1
    GetNamespaceRepositoryImagesResponse:
      description: Paginated list of images in a repository.
      type: object
      properties:
        count:
          description: Total count of images in the repository.
          type: integer
          example: 100
        next:
          description:
            Link to the next page with the same query parameters if there are
            more images.
          type: string
          example: https://hub.docker.com/v2/namespaces/mynamespace/repositories/myrepo/images?&page=4&page_size=20
          nullable: true
        previous:
          description:
            Link to the previous page with the same query parameters if not on
            first page.
          type: string
          example: https://hub.docker.com/v2/namespaces/mynamespace/repositories/myrepo/images?&page=2&page_size=20
          nullable: true
        results:
          type: array
          description: Image details.
          items:
            type: object
            properties:
              namespace:
                description: The repository namespace.
                type: string
                example: mynamespace
              repository:
                description: The repository name.
                type: string
                example: myrepo
              digest:
                description: The image's digest.
                type: string
                example: sha256:1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqr
              tags:
                description: The current and historical tags for this image.
                type: array
                items:
                  type: object
                  properties:
                    tag:
                      description: The tag.
                      type: string
                      example: latest
                    is_current:
                      description: |
                        `true` if the tag currently points to this image.
@z

@x
                        `false` if it has been overwritten to point at a different image.
                      type: boolean
                      example: true
              last_pushed:
                description: Time when this image was last pushed.
                type: string
                example: 2021-02-24T22:05:27.526308Z
                nullable: true
              last_pulled:
                description:
                  Time when this image was last pulled. Note this is updated at
                  most once per hour.
                type: string
                example: 2021-02-24T23:16:10.200008Z
                nullable: true
              status:
                description:
                  The status of the image based on its last activity against the
                  `active_from` time.
                type: string
                enum:
                  - active
                  - inactive
                example: active
    GetNamespaceRepositoryImagesTagsResponse:
      description: Paginated list of tags for this repository.
      type: object
      properties:
        count:
          description: Total count of tags for this image.
          type: integer
          example: 100
        next:
          description: Link to the next page if there are more tags.
          type: string
          example: https://hub.docker.com/v2/namespaces/mynamespace/repositories/myrepo/images/sha256:mydigest/tags?&page=4&page_size=20
          nullable: true
        previous:
          description: Link to the previous page if not on first page.
          type: string
          example: https://hub.docker.com/v2/namespaces/mynamespace/repositories/myrepo/images/sha256:mydigest/tags?&page=2&page_size=20
          nullable: true
        results:
          description: The current and historical tags for this image.
          type: array
          items:
            type: object
            properties:
              tag:
                description: The tag.
                type: string
                example: latest
              is_current:
                description: |
                  `true` if the tag currently points to this image.
@y
                        `false` if it has been overwritten to point at a different image.
                      type: boolean
                      example: true
              last_pushed:
                description: Time when this image was last pushed.
                type: string
                example: 2021-02-24T22:05:27.526308Z
                nullable: true
              last_pulled:
                description:
                  Time when this image was last pulled. Note this is updated at
                  most once per hour.
                type: string
                example: 2021-02-24T23:16:10.200008Z
                nullable: true
              status:
                description:
                  The status of the image based on its last activity against the
                  `active_from` time.
                type: string
                enum:
                  - active
                  - inactive
                example: active
    GetNamespaceRepositoryImagesTagsResponse:
      description: Paginated list of tags for this repository.
      type: object
      properties:
        count:
          description: Total count of tags for this image.
          type: integer
          example: 100
        next:
          description: Link to the next page if there are more tags.
          type: string
          example: https://hub.docker.com/v2/namespaces/mynamespace/repositories/myrepo/images/sha256:mydigest/tags?&page=4&page_size=20
          nullable: true
        previous:
          description: Link to the previous page if not on first page.
          type: string
          example: https://hub.docker.com/v2/namespaces/mynamespace/repositories/myrepo/images/sha256:mydigest/tags?&page=2&page_size=20
          nullable: true
        results:
          description: The current and historical tags for this image.
          type: array
          items:
            type: object
            properties:
              tag:
                description: The tag.
                type: string
                example: latest
              is_current:
                description: |
                  `true` if the tag currently points to this image.
@z

@x
                  `false` if it has been overwritten to point at a different image.
                type: boolean
                example: true
    PostNamespacesDeleteImagesRequest:
      description: Delete images request.
      type: object
      properties:
        dry_run:
          description:
            If `true` then will check and return errors and unignored warnings
            for the deletion request but will not delete any images.
          type: boolean
          example: false
        active_from:
          description: |
            Sets the time from which an image must have been pushed or pulled to
            be counted as active.
@y
                  `false` if it has been overwritten to point at a different image.
                type: boolean
                example: true
    PostNamespacesDeleteImagesRequest:
      description: Delete images request.
      type: object
      properties:
        dry_run:
          description:
            If `true` then will check and return errors and unignored warnings
            for the deletion request but will not delete any images.
          type: boolean
          example: false
        active_from:
          description: |
            Sets the time from which an image must have been pushed or pulled to
            be counted as active.
@z

@x
            Defaults to 1 month before the current time.
          type: string
          example: 2020-12-01T12:00:00Z
        manifests:
          description: Image manifests to delete.
          type: array
          items:
            type: object
            required:
              - repository
              - digest
            properties:
              repository:
                description: Name of the repository to delete the image from.
                type: string
                example: myrepo
              digest:
                description: Digest of the image to delete.
                type: string
                example: sha256:1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqr
        ignore_warnings:
          description: |
            Warnings to ignore. If a warning is not ignored then no deletions will happen and the 
            warning is returned in the response.
@y
            Defaults to 1 month before the current time.
          type: string
          example: 2020-12-01T12:00:00Z
        manifests:
          description: Image manifests to delete.
          type: array
          items:
            type: object
            required:
              - repository
              - digest
            properties:
              repository:
                description: Name of the repository to delete the image from.
                type: string
                example: myrepo
              digest:
                description: Digest of the image to delete.
                type: string
                example: sha256:1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqr
        ignore_warnings:
          description: |
            Warnings to ignore. If a warning is not ignored then no deletions will happen and the 
            warning is returned in the response.
@z

@x
            These warnings include:
@y
            These warnings include:
@z

@x
            - is_active: warning when attempting to delete an image that is marked as active.
            - current_tag: warning when attempting to delete an image that has one or more current 
            tags in the repository.
@y
            - is_active: warning when attempting to delete an image that is marked as active.
            - current_tag: warning when attempting to delete an image that has one or more current 
            tags in the repository.
@z

@x
            Warnings can be copied from the response to the request.
          type: array
          items:
            type: object
            required:
              - repository
              - digest
              - warning
            properties:
              repository:
                description: Name of the repository of the image to ignore the warning for.
                type: string
                example: myrepo
              digest:
                description: Digest of the image to ignore the warning for.
                type: string
                example: sha256:1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqr
              warning:
                description: Warning to ignore.
                type: string
                enum:
                  - is_active
                  - current_tag
                example: current_tag
              tags:
                description: Current tags to ignore.
                type: array
                items:
                  type: string
                  example: latest
    PostNamespacesDeleteImagesResponseSuccess:
      description: Successful delete images response.
      type: object
      properties:
        dry_run:
          description: Whether the request was a dry run or not.
          type: boolean
          example: false
        metrics:
          type: object
          properties:
            manifest_deletes:
              description: Number of manifests deleted.
              type: integer
              example: 3
            manifest_errors:
              description: Number of manifests that failed to delete.
              type: integer
              example: 0
            tag_deletes:
              description: Number of tags deleted.
              type: integer
              example: 1
            tag_errors:
              description: Number of tags that failed to delete.
              type: integer
              example: 0
    PostNamespacesDeleteImagesResponseError:
      description: Deletion not possible.
      type: object
      properties:
        txnid:
          description: Unique ID for this call.
          type: string
        message:
          description: The error message.
          type: string
        errinfo:
          allOf:
            - $ref: "#/components/schemas/ErrorInfo"
            - type: object
              properties:
                type:
                  description: Type of error.
                  type: string
                  example: validation
                details:
                  type: object
                  properties:
                    errors:
                      description:
                        Errors from validating delete request. These cannot be
                        ignored.
                      type: array
                      items:
                        type: object
                        properties:
                          repository:
                            description:
                              Name of the repository of the image that caused
                              the error.
                            type: string
                            example: myrepo
                          digest:
                            description: Digest of the image that caused the error.
                            type: string
                            example: sha256:1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqr
                          error:
                            description: Error type.
                            type: string
                            enum:
                              - not_found
                              - unauthorized
                              - child_manifest
                            example: not_found
                    warnings:
                      description: |
                        Warnings that can be ignored.
@y
            Warnings can be copied from the response to the request.
          type: array
          items:
            type: object
            required:
              - repository
              - digest
              - warning
            properties:
              repository:
                description: Name of the repository of the image to ignore the warning for.
                type: string
                example: myrepo
              digest:
                description: Digest of the image to ignore the warning for.
                type: string
                example: sha256:1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqr
              warning:
                description: Warning to ignore.
                type: string
                enum:
                  - is_active
                  - current_tag
                example: current_tag
              tags:
                description: Current tags to ignore.
                type: array
                items:
                  type: string
                  example: latest
    PostNamespacesDeleteImagesResponseSuccess:
      description: Successful delete images response.
      type: object
      properties:
        dry_run:
          description: Whether the request was a dry run or not.
          type: boolean
          example: false
        metrics:
          type: object
          properties:
            manifest_deletes:
              description: Number of manifests deleted.
              type: integer
              example: 3
            manifest_errors:
              description: Number of manifests that failed to delete.
              type: integer
              example: 0
            tag_deletes:
              description: Number of tags deleted.
              type: integer
              example: 1
            tag_errors:
              description: Number of tags that failed to delete.
              type: integer
              example: 0
    PostNamespacesDeleteImagesResponseError:
      description: Deletion not possible.
      type: object
      properties:
        txnid:
          description: Unique ID for this call.
          type: string
        message:
          description: The error message.
          type: string
        errinfo:
          allOf:
            - $ref: "#/components/schemas/ErrorInfo"
            - type: object
              properties:
                type:
                  description: Type of error.
                  type: string
                  example: validation
                details:
                  type: object
                  properties:
                    errors:
                      description:
                        Errors from validating delete request. These cannot be
                        ignored.
                      type: array
                      items:
                        type: object
                        properties:
                          repository:
                            description:
                              Name of the repository of the image that caused
                              the error.
                            type: string
                            example: myrepo
                          digest:
                            description: Digest of the image that caused the error.
                            type: string
                            example: sha256:1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqr
                          error:
                            description: Error type.
                            type: string
                            enum:
                              - not_found
                              - unauthorized
                              - child_manifest
                            example: not_found
                    warnings:
                      description: |
                        Warnings that can be ignored.
@z

@x
                        These warnings include:
@y
                        These warnings include:
@z

@x
                        - is_active: warning when attempting to delete an image that is marked as 
                        active.
                        - current_tag: warning when attempting to delete an image that has one or 
                        more current tags in the repository.
@y
                        - is_active: warning when attempting to delete an image that is marked as 
                        active.
                        - current_tag: warning when attempting to delete an image that has one or 
                        more current tags in the repository.
@z

@x
                        Warnings can be copied from the response to the request.
                      type: array
                      items:
                        type: object
                        properties:
                          repository:
                            description:
                              Name of the repository of the image that caused
                              the warning.
                            type: string
                            example: myrepo
                          digest:
                            description: Digest of the image that caused the warning.
                            type: string
                            example: sha256:1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqr
                          warning:
                            description: Warning type.
                            type: string
                            enum:
                              - is_active
                              - current_tag
                            example: current_tag
                          tags:
                            description: Current tags if warning is `current_tag`.
                            type: array
                            items:
                              type: string
                              example: latest
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
            $ref: "#/components/schemas/protobufAny"
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
            $ref: "#/components/schemas/AuditLogAction"
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
            $ref: "#/components/schemas/AuditLogActions"
          description: Map of audit log actions.
      description: GetAuditActions response.
    GetAuditLogsResponse:
      type: object
      properties:
        logs:
          type: array
          items:
            $ref: "#/components/schemas/AuditLog"
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
          example: 2021-07-20T12:00:00.000000Z
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
      $ref: "#/components/schemas/accessToken"
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
              - $ref: "#/components/schemas/accessToken"
              - type: object
                properties:
                  token:
                    type: string
                    example: ""
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
      $ref: "#/components/schemas/accessToken"
    orgSettings:
      type: object
      properties:
        restricted_images:
          $ref: "#/components/schemas/restricted_images"
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
          description: "image layer digest"
          nullable: true
        size:
          type: integer
          description: "size of the layer"
        instruction:
          type: string
          description: "Dockerfile instruction"
    image:
      type: object
      properties:
        architecture:
          type: string
          description: "CPU architecture"
        features:
          type: string
          description: "CPU features"
        variant:
          type: string
          description: "CPU variant"
        digest:
          type: string
          description: "image digest"
          nullable: true
        layers:
          type: array
          items:
            $ref: '#/components/schemas/layer'
        os:
          type: string
          description: "operating system"
        os_features:
          type: string
          description: "OS features"
        os_version:
          type: string
          description: "OS version"
        size:
          type: integer
          description: "size of the image"
        status:
          type: string
          enum: ["active", "inactive"]
          description: "Status of the image"
        last_pulled:
          type: string
          example: "2021-01-05T21:06:53.506400Z"
          description: "datetime of last pull"
          nullable: true
        last_pushed:
          type: string
          example: "2021-01-05T21:06:53.506400Z"
          description: "datetime of last push"
          nullable: true
    tag:
      type: object
      properties:
        id:
          type: integer
          description: "tag ID"
        images:
          type: object
          $ref: '#/components/schemas/image'
        creator:
          type: integer
          description: "ID of the user that pushed the tag"
        last_updated:
          type: string
          example: "2021-01-05T21:06:53.506400Z"
          description: "datetime of last update"
          nullable: true
        last_updater:
          type: integer
          description: "ID of the last user that updated the tag"
        last_updater_username:
          type: string
          description: "Hub username of the user that updated the tag"
        name:
          type: string
          description: "name of the tag"
        repository:
          type: integer
          description: "repository ID"
        full_size:
          type: integer
          description: "compressed size (sum of all layers) of the tagged image"
        v2:
          type: string
          description: "repository API version"
        status:
          type: string
          enum: ["active", "inactive"]
          description: "whether a tag has been pushed to or pulled in the past month"
        tag_last_pulled:
          type: string
          example: "2021-01-05T21:06:53.506400Z"
          description: "datetime of last pull"
          nullable: true
        tag_last_pushed:
          type: string
          example: "2021-01-05T21:06:53.506400Z"
          description: "datetime of last push"
          nullable: true
@y
                        Warnings can be copied from the response to the request.
                      type: array
                      items:
                        type: object
                        properties:
                          repository:
                            description:
                              Name of the repository of the image that caused
                              the warning.
                            type: string
                            example: myrepo
                          digest:
                            description: Digest of the image that caused the warning.
                            type: string
                            example: sha256:1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqr
                          warning:
                            description: Warning type.
                            type: string
                            enum:
                              - is_active
                              - current_tag
                            example: current_tag
                          tags:
                            description: Current tags if warning is `current_tag`.
                            type: array
                            items:
                              type: string
                              example: latest
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
            $ref: "#/components/schemas/protobufAny"
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
            $ref: "#/components/schemas/AuditLogAction"
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
            $ref: "#/components/schemas/AuditLogActions"
          description: Map of audit log actions.
      description: GetAuditActions response.
    GetAuditLogsResponse:
      type: object
      properties:
        logs:
          type: array
          items:
            $ref: "#/components/schemas/AuditLog"
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
          example: 2021-07-20T12:00:00.000000Z
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
      $ref: "#/components/schemas/accessToken"
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
              - $ref: "#/components/schemas/accessToken"
              - type: object
                properties:
                  token:
                    type: string
                    example: ""
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
      $ref: "#/components/schemas/accessToken"
    orgSettings:
      type: object
      properties:
        restricted_images:
          $ref: "#/components/schemas/restricted_images"
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
          description: "image layer digest"
          nullable: true
        size:
          type: integer
          description: "size of the layer"
        instruction:
          type: string
          description: "Dockerfile instruction"
    image:
      type: object
      properties:
        architecture:
          type: string
          description: "CPU architecture"
        features:
          type: string
          description: "CPU features"
        variant:
          type: string
          description: "CPU variant"
        digest:
          type: string
          description: "image digest"
          nullable: true
        layers:
          type: array
          items:
            $ref: '#/components/schemas/layer'
        os:
          type: string
          description: "operating system"
        os_features:
          type: string
          description: "OS features"
        os_version:
          type: string
          description: "OS version"
        size:
          type: integer
          description: "size of the image"
        status:
          type: string
          enum: ["active", "inactive"]
          description: "Status of the image"
        last_pulled:
          type: string
          example: "2021-01-05T21:06:53.506400Z"
          description: "datetime of last pull"
          nullable: true
        last_pushed:
          type: string
          example: "2021-01-05T21:06:53.506400Z"
          description: "datetime of last push"
          nullable: true
    tag:
      type: object
      properties:
        id:
          type: integer
          description: "tag ID"
        images:
          type: object
          $ref: '#/components/schemas/image'
        creator:
          type: integer
          description: "ID of the user that pushed the tag"
        last_updated:
          type: string
          example: "2021-01-05T21:06:53.506400Z"
          description: "datetime of last update"
          nullable: true
        last_updater:
          type: integer
          description: "ID of the last user that updated the tag"
        last_updater_username:
          type: string
          description: "Hub username of the user that updated the tag"
        name:
          type: string
          description: "name of the tag"
        repository:
          type: integer
          description: "repository ID"
        full_size:
          type: integer
          description: "compressed size (sum of all layers) of the tagged image"
        v2:
          type: string
          description: "repository API version"
        status:
          type: string
          enum: ["active", "inactive"]
          description: "whether a tag has been pushed to or pulled in the past month"
        tag_last_pulled:
          type: string
          example: "2021-01-05T21:06:53.506400Z"
          description: "datetime of last pull"
          nullable: true
        tag_last_pushed:
          type: string
          example: "2021-01-05T21:06:53.506400Z"
          description: "datetime of last push"
          nullable: true
@z

@x
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
@y
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
@z

@x
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
@y
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
@z

@x
    scim_service_provider_config:
      type: object
      properties:
        schemas:
          type: array
          items:
            type: string
          example: [ "urn:ietf:params:scim:schemas:core:2.0:ServiceProviderConfig" ]
        documentationUri:
          type: string
          example: ""
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
              example: "http://tools.ietf.org/html/rfc6750"
            type:
              type: string
              example: oauthbearertoken
@y
    scim_service_provider_config:
      type: object
      properties:
        schemas:
          type: array
          items:
            type: string
          example: [ "urn:ietf:params:scim:schemas:core:2.0:ServiceProviderConfig" ]
        documentationUri:
          type: string
          example: ""
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
              example: "http://tools.ietf.org/html/rfc6750"
            type:
              type: string
              example: oauthbearertoken
@z

@x
    scim_resource_type:
      type: object
      properties:
        schemas:
          type: array
          items:
            type: string
          example: "urn:ietf:params:scim:schemas:core:2.0:ResourceType"
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
          example: "/Users"
        schema:
          type: string
          example: "urn:ietf:params:scim:schemas:core:2.0:User"
@y
    scim_resource_type:
      type: object
      properties:
        schemas:
          type: array
          items:
            type: string
          example: "urn:ietf:params:scim:schemas:core:2.0:ResourceType"
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
          example: "/Users"
        schema:
          type: string
          example: "urn:ietf:params:scim:schemas:core:2.0:User"
@z

@x
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
@y
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
@z

@x
    scim_schema_parent_attribute:
      allOf:
        - $ref: "#/components/schemas/scim_schema_attribute"
        - type: object
          properties:
            subAttributes:
              type: array
              items:
                $ref: "#/components/schemas/scim_schema_attribute"
@y
    scim_schema_parent_attribute:
      allOf:
        - $ref: "#/components/schemas/scim_schema_attribute"
        - type: object
          properties:
            subAttributes:
              type: array
              items:
                $ref: "#/components/schemas/scim_schema_attribute"
@z

@x
    scim_schema:
      type: object
      properties:
        schemas:
          type: array
          items:
            type: string
          example: [ "urn:ietf:params:scim:schemas:core:2.0:Schema" ]
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
          example: [ ]
          items:
            $ref: "#/components/schemas/scim_schema_parent_attribute"
@y
    scim_schema:
      type: object
      properties:
        schemas:
          type: array
          items:
            type: string
          example: [ "urn:ietf:params:scim:schemas:core:2.0:Schema" ]
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
          example: [ ]
          items:
            $ref: "#/components/schemas/scim_schema_parent_attribute"
@z

@x
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
@y
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
@z

@x
    scim_group:
      type: object
      properties:
        value:
          type: string
          example: "nightswatch"
        display:
          type: string
          example: "nightswatch"
@y
    scim_group:
      type: object
      properties:
        value:
          type: string
          example: "nightswatch"
        display:
          type: string
          example: "nightswatch"
@z

@x
    scim_user_username:
      type: string
      description: The user's email address. This must be reachable via email.
      example: jon.snow@docker.com
@y
    scim_user_username:
      type: string
      description: The user's email address. This must be reachable via email.
      example: jon.snow@docker.com
@z

@x
    scim_user_name:
      type: object
      properties:
        givenName:
          type: string
          example: Jon
        familyName:
          type: string
          example: Snow
@y
    scim_user_name:
      type: object
      properties:
        givenName:
          type: string
          example: Jon
        familyName:
          type: string
          example: Snow
@z

@x
    scim_user_display_name:
      type: string
      description: The username in Docker. Also known as the "Docker ID".
      example: jonsnow
@y
    scim_user_display_name:
      type: string
      description: The username in Docker. Also known as the "Docker ID".
      example: jonsnow
@z

@x
    scim_user_schemas:
      type: array
      items:
        type: string
        example: "urn:ietf:params:scim:schemas:core:2.0:User"
        minItems: 1
@y
    scim_user_schemas:
      type: array
      items:
        type: string
        example: "urn:ietf:params:scim:schemas:core:2.0:User"
        minItems: 1
@z

@x
    scim_user_id:
      type: string
      example: d80f7c79-7730-49d8-9a41-7c42fb622d9c
      description: The unique identifier for the user. A v4 UUID.
@y
    scim_user_id:
      type: string
      example: d80f7c79-7730-49d8-9a41-7c42fb622d9c
      description: The unique identifier for the user. A v4 UUID.
@z

@x
    scim_user:
      type: object
      properties:
        schemas:
          $ref: "#/components/schemas/scim_user_schemas"
        id:
          $ref: "#/components/schemas/scim_user_id"
        userName:
          $ref: "#/components/schemas/scim_user_username"
        name:
          $ref: "#/components/schemas/scim_user_name"
        displayName:
          $ref: "#/components/schemas/scim_user_display_name"
        active:
          type: boolean
          example: true
        emails:
          type: array
          items:
            $ref: "#/components/schemas/scim_email"
        groups:
          type: array
          items:
            $ref: "#/components/schemas/scim_group"
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
              description: The creation date for the user as a RFC3339 formatted
                string.
              example: 2022-05-20T00:54:18Z
            lastModified:
              type: string
              description: The date the user was last modified as a RFC3339
                formatted string.
              example: 2022-05-20T00:54:18Z
@y
    scim_user:
      type: object
      properties:
        schemas:
          $ref: "#/components/schemas/scim_user_schemas"
        id:
          $ref: "#/components/schemas/scim_user_id"
        userName:
          $ref: "#/components/schemas/scim_user_username"
        name:
          $ref: "#/components/schemas/scim_user_name"
        displayName:
          $ref: "#/components/schemas/scim_user_display_name"
        active:
          type: boolean
          example: true
        emails:
          type: array
          items:
            $ref: "#/components/schemas/scim_email"
        groups:
          type: array
          items:
            $ref: "#/components/schemas/scim_group"
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
              description: The creation date for the user as a RFC3339 formatted
                string.
              example: 2022-05-20T00:54:18Z
            lastModified:
              type: string
              description: The date the user was last modified as a RFC3339
                formatted string.
              example: 2022-05-20T00:54:18Z
@z

@x
  parameters:
    scim_attributes:
      in: query
      name: attributes
      schema:
        type: string
      description: Comma delimited list of attributes to limit to in the
        response.
      example: userName,displayName
    scim_user_id:
      name: id
      in: path
      schema:
        type: string
      description: The user ID.
      example: "d80f7c79-7730-49d8-9a41-7c42fb622d9c"
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
    page:
      in: query
      name: page
      required: false
      schema:
        type: integer
      description: "Page number to get. Defaults to 1."
    page_size:
      in: query
      name: page_size
      required: false
      schema:
        type: integer
      description: "Number of items to get per page. Defaults to 10. Max of 100."
@y
  parameters:
    scim_attributes:
      in: query
      name: attributes
      schema:
        type: string
      description: Comma delimited list of attributes to limit to in the
        response.
      example: userName,displayName
    scim_user_id:
      name: id
      in: path
      schema:
        type: string
      description: The user ID.
      example: "d80f7c79-7730-49d8-9a41-7c42fb622d9c"
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
    page:
      in: query
      name: page
      required: false
      schema:
        type: integer
      description: "Page number to get. Defaults to 1."
    page_size:
      in: query
      name: page_size
      required: false
      schema:
        type: integer
      description: "Number of items to get per page. Defaults to 10. Max of 100."
@z

@x
  requestBodies:
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
                $ref: "#/components/schemas/scim_user_schemas"
              userName:
                $ref: "#/components/schemas/scim_user_username"
              name:
                $ref: "#/components/schemas/scim_user_name"
@y
  requestBodies:
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
                $ref: "#/components/schemas/scim_user_schemas"
              userName:
                $ref: "#/components/schemas/scim_user_username"
              name:
                $ref: "#/components/schemas/scim_user_name"
@z

@x
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
                $ref: "#/components/schemas/scim_user_schemas"
              name:
                allOf:
                  - $ref: "#/components/schemas/scim_user_name"
                  - description: If this is omitted from the request, the
                      update will skip the update on it. We will only ever
                      change the name, but not clear it.
              enabled:
                type: boolean
                default: false
                description: If this is omitted from the request, it will
                  default to false resulting in a deactivated user.
@y
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
                $ref: "#/components/schemas/scim_user_schemas"
              name:
                allOf:
                  - $ref: "#/components/schemas/scim_user_name"
                  - description: If this is omitted from the request, the
                      update will skip the update on it. We will only ever
                      change the name, but not clear it.
              enabled:
                type: boolean
                default: false
                description: If this is omitted from the request, it will
                  default to false resulting in a deactivated user.
@z
