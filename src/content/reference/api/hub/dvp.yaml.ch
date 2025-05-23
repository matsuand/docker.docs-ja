%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
openapi: 3.0.0
info:
  title: DVP Data API
  version: 1.0.0
  x-logo:
    url: https://docs.docker.com/assets/images/logo-docker-main.png
    href: /reference
  description: |
     The Docker DVP Data API allows [Docker Verified Publishers](https://docs.docker.com/docker-hub/publish/) to view image pull analytics data for their namespaces. Analytics data can be retrieved as raw data, or in a summary format.
@y
openapi: 3.0.0
info:
  title: DVP Data API
  version: 1.0.0
  x-logo:
    url: https://docs.docker.com/assets/images/logo-docker-main.png
    href: /reference
  description: |
     The Docker DVP Data API allows [Docker Verified Publishers](https://docs.docker.com/docker-hub/publish/) to view image pull analytics data for their namespaces. Analytics data can be retrieved as raw data, or in a summary format.
@z

@x
     #### Summary data
@y
     #### Summary data
@z

@x
     In your summary data CSV, you will have access to the data points listed below. You can request summary data for a complete week (Monday through Sunday) or for a complete month (available on the first day of the following month). 
@y
     In your summary data CSV, you will have access to the data points listed below. You can request summary data for a complete week (Monday through Sunday) or for a complete month (available on the first day of the following month). 
@z

@x
     There are two levels of summary data:
@y
     There are two levels of summary data:
@z

@x
     - Repository-level, a summary of every namespace and repository
     - Tag- or digest-level, a summary of every namespace, repository, and reference
       (tag or digest)
@y
     - Repository-level, a summary of every namespace and repository
     - Tag- or digest-level, a summary of every namespace, repository, and reference
       (tag or digest)
@z

@x
     The summary data formats contain the following data points:
@y
     The summary data formats contain the following data points:
@z

@x
     - Unique IP address count
     - Pulls by tag count
     - Pulls by digest count
     - Version check count
@y
     - Unique IP address count
     - Pulls by tag count
     - Pulls by digest count
     - Version check count
@z

@x
     #### Raw data
@y
     #### Raw data
@z

@x
     In your raw data CSV you will have access to the data points listed below. You can request raw data for a complete week (Monday through Sunday) or for a complete month (available on the first day of the following month). **Note:** each action is represented as a single row.
@y
     In your raw data CSV you will have access to the data points listed below. You can request raw data for a complete week (Monday through Sunday) or for a complete month (available on the first day of the following month). **Note:** each action is represented as a single row.
@z

@x
     - Type (industry)
     - Host (cloud provider)
     - Country (geolocation)
     - Timestamp
     - Namespace
     - Repository
     - Reference (digest is always included, tag is provided when available)
     - HTTP request method
     - Action, one of the following:
       - Pull by tag
       - Pull by digest
       - Version check
     - User-Agent
@y
     - Type (industry)
     - Host (cloud provider)
     - Country (geolocation)
     - Timestamp
     - Namespace
     - Repository
     - Reference (digest is always included, tag is provided when available)
     - HTTP request method
     - Action, one of the following:
       - Pull by tag
       - Pull by digest
       - Version check
     - User-Agent
@z

@x
servers:
  - url: https://hub.docker.com/api/publisher/analytics/v1
security:
  - HubAuth: []
@y
servers:
  - url: https://hub.docker.com/api/publisher/analytics/v1
security:
  - HubAuth: []
@z

@x
features.openapi:
  schemaDefinitionsTagName: Schemas
@y
features.openapi:
  schemaDefinitionsTagName: Schemas
@z

@x
tags:
  - name: authentication
    x-displayName: Authentication Endpoints
  - name: namespaces
    x-displayName: Namespace data
  - name: discovery
    x-displayName: Discovery
  - name: responseDataFile
    x-displayName: ResponseDataFile
    description: |
      <SchemaDefinition schemaRef="#/components/schemas/ResponseDataFile" />
  - name: yearModel
    x-displayName: Year Data Model
    description: |
      <SchemaDefinition schemaRef="#/components/schemas/YearModel" />
  - name: monthModel
    x-displayName: Month Data Model
    description: |
      <SchemaDefinition schemaRef="#/components/schemas/MonthModel" />
  - name: weekModel
    x-displayName: Week Data Model
    description: |
      <SchemaDefinition schemaRef="#/components/schemas/WeekModel" />
@y
tags:
  - name: authentication
    x-displayName: Authentication Endpoints
  - name: namespaces
    x-displayName: Namespace data
  - name: discovery
    x-displayName: Discovery
  - name: responseDataFile
    x-displayName: ResponseDataFile
    description: |
      <SchemaDefinition schemaRef="#/components/schemas/ResponseDataFile" />
  - name: yearModel
    x-displayName: Year Data Model
    description: |
      <SchemaDefinition schemaRef="#/components/schemas/YearModel" />
  - name: monthModel
    x-displayName: Month Data Model
    description: |
      <SchemaDefinition schemaRef="#/components/schemas/MonthModel" />
  - name: weekModel
    x-displayName: Week Data Model
    description: |
      <SchemaDefinition schemaRef="#/components/schemas/WeekModel" />
@z

@x
x-tagGroups:
  - name: API
    tags:
      - authentication
      - discovery
      - namespaces
  - name: Models
    tags:
      - responseDataFile
      - yearModel
      - monthModel
      - weekModel
@y
x-tagGroups:
  - name: API
    tags:
      - authentication
      - discovery
      - namespaces
  - name: Models
    tags:
      - responseDataFile
      - yearModel
      - monthModel
      - weekModel
@z

@x
paths:
  /v2/users/login:
    security: []
    servers:
      - url: https://hub.docker.com
    post:
      security: []
      tags:
        - authentication
      summary: Create an authentication token
      operationId: PostUsersLogin
      description: |
        Creates and returns a bearer token in JWT format that you can use to
        authenticate with Docker Hub APIs.
@y
paths:
  /v2/users/login:
    security: []
    servers:
      - url: https://hub.docker.com
    post:
      security: []
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
        Most Docker Hub APIs require this token either to consume or to get detailed information. For example, to list images in a private repository.
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
    security: []
    servers:
      - url: https://hub.docker.com
    post:
      security: []
      tags:
        - authentication
      summary: Second factor authentication
      operationId: PostUsers2FALogin
      description: |
        When a user has 2FA enabled, this is the second call to perform after
        `/v2/users/login` call.
@y
        Most Docker Hub APIs require this token either to consume or to get detailed information. For example, to list images in a private repository.
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
    security: []
    servers:
      - url: https://hub.docker.com
    post:
      security: []
      tags:
        - authentication
      summary: Second factor authentication
      operationId: PostUsers2FALogin
      description: |
        When a user has 2FA enabled, this is the second call to perform after
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
@z

@x
  /:
    get:
      tags: [discovery]
      summary: Get namespaces and repos
      description: Gets a list of your namespaces and repos which have data available.
      operationId: getNamespaces
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/NamespaceData'
  /namespaces:
    get:
      tags: [discovery]
      summary: Get user's namespaces
      description: Get metadata associated with the namespaces the user has access to, including extra repos associated with the namespaces.
      operationId: getUserNamespaces
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/NamespaceMetadata'
        '401':
          description: Authentication failed or second factor required
  /namespaces/{namespace}:
    get:
      tags: [discovery]
      summary: Get namespace
      description: Gets metadata associated with specified namespace, including extra repos associated with the namespace.
      operationId: getNamespace
      parameters:
        - in: path
          name: namespace
          schema:
            type: string
          required: true
          description: Namespace to fetch data for
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/NamespaceMetadata'
  /namespaces/{namespace}/pulls:
    get:
      tags: [namespaces]
      summary: Get pull data
      description: Gets pulls for the given namespace.
      operationId: getNamespacePulls
      parameters:
        - in: path
          name: namespace
          schema:
            type: string
          required: true
          description: Namespace to fetch data for
        - in: query
          name: timespan
          schema:
            $ref: '#/components/schemas/TimespanType'
          required: false
          description: Timespan type for fetching data
        - in: query
          name: period
          schema:
            $ref: '#/components/schemas/PeriodType'
          required: false
          description: Relative period of the period to fetch data
        - in: query
          name: group
          schema:
            $ref: '#/components/schemas/GroupType'
          required: false
          description: Field to group the data by
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/PullData'
        '404':
          description: Not found - namespace doesn't exist or user does not have permission to access it
  /namespaces/{namespace}/repos/{repo}/pulls:
    get:
      tags: [namespaces]
      summary: Get pull data
      description: Gets pulls for the given repo.
      operationId: getRepoPulls
      parameters:
        - in: path
          name: namespace
          schema:
            type: string
          required: true
          description: Namespace to fetch data for
        - in: path
          name: repo
          schema:
            type: string
          required: true
          description: Repository to fetch data for
        - in: query
          name: timespan
          schema:
            $ref: '#/components/schemas/TimespanType'
          required: false
          description: Timespan type for fetching data
        - in: query
          name: period
          schema:
            $ref: '#/components/schemas/PeriodType'
          required: false
          description: Relative period of the period to fetch data
        - in: query
          name: group
          schema:
            $ref: '#/components/schemas/GroupType'
          required: false
          description: Field to group the data by
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/PullData'
        '404':
          description: Not found - repo doesn't exist or user does not have permission to access it
  /namespaces/{namespace}/pulls/exports/years:
    get:
      tags: [namespaces]
      summary: Get years with data
      description: Gets a list of years that have data for the given namespace.
      operationId: getNamespaceYears
      parameters:
        - in: path
          name: namespace
          schema:
            type: string
          required: true
          description: Namespace to fetch data for
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/YearData'
  /namespaces/{namespace}/pulls/exports/years/{year}/{timespantype}:
    get:
      tags: [namespaces]
      summary: Get timespans with data
      description: Gets a list of timespans of the given type that have data for the given namespace and year.
      operationId: getNamespaceTimespans
      parameters:
        - in: path
          name: namespace
          schema:
            type: string
          required: true
          description: Namespace to fetch data for
        - in: path
          name: year
          schema:
            type: integer
          required: true
          description: Year to fetch data for
        - in: path
          name: timespantype
          schema:
            $ref: '#/components/schemas/TimespanType'
          required: true
          description: Type of timespan to fetch data for
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/TimespanData'
  /namespaces/{namespace}/pulls/exports/years/{year}/{timespantype}/{timespan}:
    get:
      tags: [namespaces]
      summary: Get namespace metadata for timespan
      description: Gets info about data for the given namespace and timespan.
      operationId: getNamespaceTimespanMetadata
      parameters:
        - in: path
          name: namespace
          schema:
            type: string
          required: true
          description: Namespace to fetch data for
        - in: path
          name: year
          schema:
            type: integer
          required: true
          description: Year to fetch data for
        - in: path
          name: timespantype
          schema:
            $ref: '#/components/schemas/TimespanType'
          required: true
          description: Type of timespan to fetch data for
        - in: path
          name: timespan
          schema:
            type: integer
          required: true
          description: Timespan to fetch data for
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/TimespanModel'
        '404':
          description: Not Found
  /namespaces/{namespace}/pulls/exports/years/{year}/{timespantype}/{timespan}/{dataview}:
    get:
      tags: [namespaces]
      summary: Get namespace data for timespan
      description: Gets a list of URLs that can be used to download the pull data for the given namespace and timespan.
      operationId: getNamespaceDataByTimespan
      parameters:
        - in: path
          name: namespace
          schema:
            type: string
          required: true
          description: Namespace to fetch data for
        - in: path
          name: year
          schema:
            type: integer
          required: true
          description: Year to fetch data for
        - in: path
          name: timespantype
          schema:
            $ref: '#/components/schemas/TimespanType'
          required: true
          description: Type of timespan to fetch data for
        - in: path
          name: timespan
          schema:
            type: integer
          required: true
          description: Timespan to fetch data for
        - in: path
          name: dataview
          schema:
            $ref: '#/components/schemas/DataviewType'
          required: true
          description: Type of data to fetch
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ResponseData'
  /repos/pulls:
    get:
      tags: [namespaces]
      summary: Get pull data for multiple repos
      description: Gets pull for the given repos.
      operationId: getManyReposPulls
      parameters:
        - in: query
          name: repos
          schema:
            type: array
            items:
              type: string
          required: true
          description: Repositories to fetch data for (maximum of 50 repositories per request).
        - in: query
          name: timespan
          schema:
            $ref: '#/components/schemas/TimespanType'
          required: false
          description: Timespan type for fetching data
        - in: query
          name: period
          schema:
            $ref: '#/components/schemas/PeriodType'
          required: false
          description: Relative period of the period to fetch data
        - in: query
          name: group
          schema:
            $ref: '#/components/schemas/GroupType'
          required: false
          description: Field to group the data by
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ReposPullData'
@y
  /:
    get:
      tags: [discovery]
      summary: Get namespaces and repos
      description: Gets a list of your namespaces and repos which have data available.
      operationId: getNamespaces
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/NamespaceData'
  /namespaces:
    get:
      tags: [discovery]
      summary: Get user's namespaces
      description: Get metadata associated with the namespaces the user has access to, including extra repos associated with the namespaces.
      operationId: getUserNamespaces
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/NamespaceMetadata'
        '401':
          description: Authentication failed or second factor required
  /namespaces/{namespace}:
    get:
      tags: [discovery]
      summary: Get namespace
      description: Gets metadata associated with specified namespace, including extra repos associated with the namespace.
      operationId: getNamespace
      parameters:
        - in: path
          name: namespace
          schema:
            type: string
          required: true
          description: Namespace to fetch data for
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/NamespaceMetadata'
  /namespaces/{namespace}/pulls:
    get:
      tags: [namespaces]
      summary: Get pull data
      description: Gets pulls for the given namespace.
      operationId: getNamespacePulls
      parameters:
        - in: path
          name: namespace
          schema:
            type: string
          required: true
          description: Namespace to fetch data for
        - in: query
          name: timespan
          schema:
            $ref: '#/components/schemas/TimespanType'
          required: false
          description: Timespan type for fetching data
        - in: query
          name: period
          schema:
            $ref: '#/components/schemas/PeriodType'
          required: false
          description: Relative period of the period to fetch data
        - in: query
          name: group
          schema:
            $ref: '#/components/schemas/GroupType'
          required: false
          description: Field to group the data by
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/PullData'
        '404':
          description: Not found - namespace doesn't exist or user does not have permission to access it
  /namespaces/{namespace}/repos/{repo}/pulls:
    get:
      tags: [namespaces]
      summary: Get pull data
      description: Gets pulls for the given repo.
      operationId: getRepoPulls
      parameters:
        - in: path
          name: namespace
          schema:
            type: string
          required: true
          description: Namespace to fetch data for
        - in: path
          name: repo
          schema:
            type: string
          required: true
          description: Repository to fetch data for
        - in: query
          name: timespan
          schema:
            $ref: '#/components/schemas/TimespanType'
          required: false
          description: Timespan type for fetching data
        - in: query
          name: period
          schema:
            $ref: '#/components/schemas/PeriodType'
          required: false
          description: Relative period of the period to fetch data
        - in: query
          name: group
          schema:
            $ref: '#/components/schemas/GroupType'
          required: false
          description: Field to group the data by
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/PullData'
        '404':
          description: Not found - repo doesn't exist or user does not have permission to access it
  /namespaces/{namespace}/pulls/exports/years:
    get:
      tags: [namespaces]
      summary: Get years with data
      description: Gets a list of years that have data for the given namespace.
      operationId: getNamespaceYears
      parameters:
        - in: path
          name: namespace
          schema:
            type: string
          required: true
          description: Namespace to fetch data for
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/YearData'
  /namespaces/{namespace}/pulls/exports/years/{year}/{timespantype}:
    get:
      tags: [namespaces]
      summary: Get timespans with data
      description: Gets a list of timespans of the given type that have data for the given namespace and year.
      operationId: getNamespaceTimespans
      parameters:
        - in: path
          name: namespace
          schema:
            type: string
          required: true
          description: Namespace to fetch data for
        - in: path
          name: year
          schema:
            type: integer
          required: true
          description: Year to fetch data for
        - in: path
          name: timespantype
          schema:
            $ref: '#/components/schemas/TimespanType'
          required: true
          description: Type of timespan to fetch data for
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/TimespanData'
  /namespaces/{namespace}/pulls/exports/years/{year}/{timespantype}/{timespan}:
    get:
      tags: [namespaces]
      summary: Get namespace metadata for timespan
      description: Gets info about data for the given namespace and timespan.
      operationId: getNamespaceTimespanMetadata
      parameters:
        - in: path
          name: namespace
          schema:
            type: string
          required: true
          description: Namespace to fetch data for
        - in: path
          name: year
          schema:
            type: integer
          required: true
          description: Year to fetch data for
        - in: path
          name: timespantype
          schema:
            $ref: '#/components/schemas/TimespanType'
          required: true
          description: Type of timespan to fetch data for
        - in: path
          name: timespan
          schema:
            type: integer
          required: true
          description: Timespan to fetch data for
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/TimespanModel'
        '404':
          description: Not Found
  /namespaces/{namespace}/pulls/exports/years/{year}/{timespantype}/{timespan}/{dataview}:
    get:
      tags: [namespaces]
      summary: Get namespace data for timespan
      description: Gets a list of URLs that can be used to download the pull data for the given namespace and timespan.
      operationId: getNamespaceDataByTimespan
      parameters:
        - in: path
          name: namespace
          schema:
            type: string
          required: true
          description: Namespace to fetch data for
        - in: path
          name: year
          schema:
            type: integer
          required: true
          description: Year to fetch data for
        - in: path
          name: timespantype
          schema:
            $ref: '#/components/schemas/TimespanType'
          required: true
          description: Type of timespan to fetch data for
        - in: path
          name: timespan
          schema:
            type: integer
          required: true
          description: Timespan to fetch data for
        - in: path
          name: dataview
          schema:
            $ref: '#/components/schemas/DataviewType'
          required: true
          description: Type of data to fetch
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ResponseData'
  /repos/pulls:
    get:
      tags: [namespaces]
      summary: Get pull data for multiple repos
      description: Gets pull for the given repos.
      operationId: getManyReposPulls
      parameters:
        - in: query
          name: repos
          schema:
            type: array
            items:
              type: string
          required: true
          description: Repositories to fetch data for (maximum of 50 repositories per request).
        - in: query
          name: timespan
          schema:
            $ref: '#/components/schemas/TimespanType'
          required: false
          description: Timespan type for fetching data
        - in: query
          name: period
          schema:
            $ref: '#/components/schemas/PeriodType'
          required: false
          description: Relative period of the period to fetch data
        - in: query
          name: group
          schema:
            $ref: '#/components/schemas/GroupType'
          required: false
          description: Field to group the data by
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ReposPullData'
@z

@x
components:
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
components:
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
            Short-lived token to be used on `/v2/users/2fa-login` to
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
            Short-lived token to be used on `/v2/users/2fa-login` to
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
@z

@x
    ResponseData:
      properties:
        data:
          type: array
          description: |
            List of urls to download the data. When the data is large, the data will be split into multiple files.
          items: 
            $ref: '#/components/schemas/ResponseDataFile'
    ResponseDataFile:
      properties:
        url:
          type: string
        size:
          type: integer
          format: int64
    NamespaceData:
      properties:
        namespaces:
          type: array
          items:
            type: string
    NamespaceMetadata:
      properties:
        namespace:
          type: string
        extraRepos:
          type: array
          items:
            type: string
        datasets:
          type: array
          items:
            $ref: '#/components/schemas/DatasetModel'
    DatasetModel:
      properties:
        name:
          $ref: '#/components/schemas/DatasetType'
        views:
          type: array
          items:
            $ref: '#/components/schemas/DataviewType'
        timespans:
          type: array
          items:
            $ref: '#/components/schemas/TimespanType'
    PullData:
      properties:
        pulls:
          type: array
          items:
            $ref: '#/components/schemas/PullModel'
    ReposPullData:
      properties:
        repos:
          type: object
          additionalProperties:
            $ref: '#/components/schemas/PullData'
    PullModel:
      properties:
        start:
          type: string
        end:
          type: string
        repo:
          type: string
        namespace:
          type: string
        pullCount:
          type: integer
        ipCount:
          type: integer
        country:
          type: string
@y
    ResponseData:
      properties:
        data:
          type: array
          description: |
            List of urls to download the data. When the data is large, the data will be split into multiple files.
          items: 
            $ref: '#/components/schemas/ResponseDataFile'
    ResponseDataFile:
      properties:
        url:
          type: string
        size:
          type: integer
          format: int64
    NamespaceData:
      properties:
        namespaces:
          type: array
          items:
            type: string
    NamespaceMetadata:
      properties:
        namespace:
          type: string
        extraRepos:
          type: array
          items:
            type: string
        datasets:
          type: array
          items:
            $ref: '#/components/schemas/DatasetModel'
    DatasetModel:
      properties:
        name:
          $ref: '#/components/schemas/DatasetType'
        views:
          type: array
          items:
            $ref: '#/components/schemas/DataviewType'
        timespans:
          type: array
          items:
            $ref: '#/components/schemas/TimespanType'
    PullData:
      properties:
        pulls:
          type: array
          items:
            $ref: '#/components/schemas/PullModel'
    ReposPullData:
      properties:
        repos:
          type: object
          additionalProperties:
            $ref: '#/components/schemas/PullData'
    PullModel:
      properties:
        start:
          type: string
        end:
          type: string
        repo:
          type: string
        namespace:
          type: string
        pullCount:
          type: integer
        ipCount:
          type: integer
        country:
          type: string
@z

@x
    YearData:
      properties:
        years:
          type: array
          items:
            $ref: '#/components/schemas/YearModel'
    YearModel:
      properties:
        year:
          type: integer
    MonthData:
      properties:
        months:
          type: array
          items:
            $ref: '#/components/schemas/MonthModel'
    MonthModel:
      properties:
        month:
          type: integer
    WeekData:
      properties:
        weeks:
          type: array
          items:
            $ref: '#/components/schemas/WeekModel'
    WeekModel:
      properties:
        week:
          type: integer
    TimespanType:
      type: string
      enum: [months,weeks]
    PeriodType:
      type: string
      enum: [last-2-months,last-3-months,last-6-months,last-12-months]
    DataviewType:
      type: string
      enum: [raw,summary,repo-summary,namespace-summary]
    DatasetType:
      type: string
      enum: [pulls]
    TimespanModel:
      oneOf:
        - $ref: '#/components/schemas/MonthModel'
        - $ref: '#/components/schemas/WeekModel'
    TimespanData:
      oneOf:
        - $ref: '#/components/schemas/MonthData'
        - $ref: '#/components/schemas/WeekData'
    GroupType:
      type: string
      enum: [repo,namespace]
  securitySchemes:
    HubAuth:
      type: https
      scheme: bearer
      bearerFormat: JWT
      description: |
        JWT Bearer Authentication is required to access the Docker DVP Data API.  
@y
    YearData:
      properties:
        years:
          type: array
          items:
            $ref: '#/components/schemas/YearModel'
    YearModel:
      properties:
        year:
          type: integer
    MonthData:
      properties:
        months:
          type: array
          items:
            $ref: '#/components/schemas/MonthModel'
    MonthModel:
      properties:
        month:
          type: integer
    WeekData:
      properties:
        weeks:
          type: array
          items:
            $ref: '#/components/schemas/WeekModel'
    WeekModel:
      properties:
        week:
          type: integer
    TimespanType:
      type: string
      enum: [months,weeks]
    PeriodType:
      type: string
      enum: [last-2-months,last-3-months,last-6-months,last-12-months]
    DataviewType:
      type: string
      enum: [raw,summary,repo-summary,namespace-summary]
    DatasetType:
      type: string
      enum: [pulls]
    TimespanModel:
      oneOf:
        - $ref: '#/components/schemas/MonthModel'
        - $ref: '#/components/schemas/WeekModel'
    TimespanData:
      oneOf:
        - $ref: '#/components/schemas/MonthData'
        - $ref: '#/components/schemas/WeekData'
    GroupType:
      type: string
      enum: [repo,namespace]
  securitySchemes:
    HubAuth:
      type: https
      scheme: bearer
      bearerFormat: JWT
      description: |
        JWT Bearer Authentication is required to access the Docker DVP Data API.  
@z

@x
        This authentication documentation is duplicated from the [Hub API Authentication docs](https://docs.docker.com/reference/api/hub/#tag/authentication)
      x-displayName: Docker Hub Authentication
@y
        This authentication documentation is duplicated from the [Hub API Authentication docs](https://docs.docker.com/reference/api/hub/#tag/authentication)
      x-displayName: Docker Hub Authentication
@z
