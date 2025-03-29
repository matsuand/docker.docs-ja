%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Mocking OAuth services in testing with Dex
description: &desc Mocking OAuth services in testing with Dex
keywords: Dex, container-supported development
linktitle: Mocking OAuth services with Dex
@y
title: Mocking OAuth services in testing with Dex
description: &desc Mocking OAuth services in testing with Dex
keywords: Dex, container-supported development
linktitle: Mocking OAuth services with Dex
@z

@x
  time: 10 minutes
@y
  time: 10 分
@z

@x
Dex is an open-source OpenID Connect (OIDC) and OAuth 2.0 identity provider that can be configured to authenticate against various backend identity providers, such as LDAP, SAML, and OAuth. Running Dex in a Docker container allows developers to simulate an OAuth 2.0 server for testing and development purposes. This guide will walk you through setting up Dex as an OAuth mock server using Docker containers.
@y
Dex is an open-source OpenID Connect (OIDC) and OAuth 2.0 identity provider that can be configured to authenticate against various backend identity providers, such as LDAP, SAML, and OAuth. Running Dex in a Docker container allows developers to simulate an OAuth 2.0 server for testing and development purposes. This guide will walk you through setting up Dex as an OAuth mock server using Docker containers.
@z

@x
Nowadays OAuth is the preferred choice to authenticate in web services, the highest part of them give the possibility to access using popular OAuth services like GitHub, Google or Apple. Using OAuth guarantees a higher level of security and simplification since it is not necessary to create new profiles for each service. This means that, by allowing applications to access resources on behalf of users without sharing passwords, OAuth minimizes the risk of credential exposure.
@y
Nowadays OAuth is the preferred choice to authenticate in web services, the highest part of them give the possibility to access using popular OAuth services like GitHub, Google or Apple. Using OAuth guarantees a higher level of security and simplification since it is not necessary to create new profiles for each service. This means that, by allowing applications to access resources on behalf of users without sharing passwords, OAuth minimizes the risk of credential exposure.
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Use Docker to launch up a Dex container.
- Use mock OAuth in the GitHub Action (GHA) without relying on an external OAuth provider.
@y
- Use Docker to launch up a Dex container.
- Use mock OAuth in the GitHub Action (GHA) without relying on an external OAuth provider.
@z

@x
## Using Dex with Docker
@y
## Using Dex with Docker
@z

@x
The official [Docker image for Dex](https://hub.docker.com/r/dexidp/dex/) provides a convenient way to deploy and manage Dex instances. Dex is available for various CPU architectures, including amd64, armv7, and arm64, ensuring compatibility with different devices and platforms. You can learn more about Dex standalone on the [Dex docs site](https://dexidp.io/docs/getting-started/).
@y
The official [Docker image for Dex](https://hub.docker.com/r/dexidp/dex/) provides a convenient way to deploy and manage Dex instances. Dex is available for various CPU architectures, including amd64, armv7, and arm64, ensuring compatibility with different devices and platforms. You can learn more about Dex standalone on the [Dex docs site](https://dexidp.io/docs/getting-started/).
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
[Docker Compose](/compose/): Recommended for managing multi-container Docker applications.
@y
[Docker Compose](__SUBDIR__/compose/): Recommended for managing multi-container Docker applications.
@z

@x
### Setting Up Dex with Docker
@y
### Setting Up Dex with Docker
@z

@x
Begin by creating a directory for your Dex project:
@y
Begin by creating a directory for your Dex project:
@z

@x
```bash
mkdir dex-mock-server
cd dex-mock-server
```
Organize your project with the following structure:
@y
```bash
mkdir dex-mock-server
cd dex-mock-server
```
Organize your project with the following structure:
@z

@x
```bash
dex-mock-server/
├── config.yaml
└── compose.yaml
```
@y
```bash
dex-mock-server/
├── config.yaml
└── compose.yaml
```
@z

@x
Create the Dex Configuration File:
The config.yaml file defines Dex's settings, including connectors, clients, and storage. For a mock server setup, you can use the following minimal configuration:
@y
Create the Dex Configuration File:
The config.yaml file defines Dex's settings, including connectors, clients, and storage. For a mock server setup, you can use the following minimal configuration:
@z

@x
```yaml
# config.yaml
issuer: http://localhost:5556/dex
storage:
  type: memory
web:
  http: 0.0.0.0:5556
staticClients:
  - id: example-app
    redirectURIs:
      - 'http://localhost:5555/callback'
    name: 'Example App'
    secret: ZXhhbXBsZS1hcHAtc2VjcmV0
enablePasswordDB: true
staticPasswords:
  - email: "admin@example.com"
    hash: "$2a$10$2b2cU8CPhOTaGrs1HRQuAueS7JTT5ZHsHSzYiFPm1leZck7Mc8T4W"
    username: "admin"
    userID: "1234"
```
@y
```yaml
# config.yaml
issuer: http://localhost:5556/dex
storage:
  type: memory
web:
  http: 0.0.0.0:5556
staticClients:
  - id: example-app
    redirectURIs:
      - 'http://localhost:5555/callback'
    name: 'Example App'
    secret: ZXhhbXBsZS1hcHAtc2VjcmV0
enablePasswordDB: true
staticPasswords:
  - email: "admin@example.com"
    hash: "$2a$10$2b2cU8CPhOTaGrs1HRQuAueS7JTT5ZHsHSzYiFPm1leZck7Mc8T4W"
    username: "admin"
    userID: "1234"
```
@z

@x
Explanation:
- issuer: The public URL of Dex.
@y
Explanation:
- issuer: The public URL of Dex.
@z

@x
- storage: Using in-memory storage for simplicity.
@y
- storage: Using in-memory storage for simplicity.
@z

@x
- web: Dex will listen on port 5556.
@y
- web: Dex will listen on port 5556.
@z

@x
- staticClients: Defines a client application (example-app) with its redirect URI and secret.
@y
- staticClients: Defines a client application (example-app) with its redirect URI and secret.
@z

@x
- enablePasswordDB: Enables static password authentication.
@y
- enablePasswordDB: Enables static password authentication.
@z

@x
- staticPasswords: Defines a static user for authentication. The hash is a bcrypt hash of the password.
@y
- staticPasswords: Defines a static user for authentication. The hash is a bcrypt hash of the password.
@z

@x
> [!NOTE]
>
> Ensure the hash is a valid bcrypt hash of your desired password. You can generate this using tools like [bcrypt-generator.com](https://bcrypt-generator.com/).
or use CLI tools like [htpasswd](https://httpd.apache.org/docs/2.4/programs/htpasswd.html) like in this following example:`echo password | htpasswd -BinC 10 admin | cut -d: -f2`
@y
> [!NOTE]
>
> Ensure the hash is a valid bcrypt hash of your desired password. You can generate this using tools like [bcrypt-generator.com](https://bcrypt-generator.com/).
or use CLI tools like [htpasswd](https://httpd.apache.org/docs/2.4/programs/htpasswd.html) like in this following example:`echo password | htpasswd -BinC 10 admin | cut -d: -f2`
@z

@x
With Docker Compose configured, start Dex:
```yaml
# docker-compose.yaml
@y
With Docker Compose configured, start Dex:
```yaml
# docker-compose.yaml
@z

@x
services:
  dex:
    image: dexidp/dex:latest
    container_name: dex
    ports:
      - "5556:5556"
    volumes:
      - ./config.yaml:/etc/dex/config.yaml
    command: ["dex", "serve", "/etc/dex/config.yaml"]
```
@y
services:
  dex:
    image: dexidp/dex:latest
    container_name: dex
    ports:
      - "5556:5556"
    volumes:
      - ./config.yaml:/etc/dex/config.yaml
    command: ["dex", "serve", "/etc/dex/config.yaml"]
```
@z

@x
Now it is possible to run the container using the `docker compose` command.
```bash
docker compose up -d
```
@y
Now it is possible to run the container using the `docker compose` command.
```bash
docker compose up -d
```
@z

@x
This command will download the Dex Docker image (if not already available) and start the container in detached mode.
@y
This command will download the Dex Docker image (if not already available) and start the container in detached mode.
@z

@x
To verify that Dex is running, check the logs to ensure Dex started successfully:
```bash
docker compose logs -f dex
```
You should see output indicating that Dex is listening on the specified port.
@y
To verify that Dex is running, check the logs to ensure Dex started successfully:
```bash
docker compose logs -f dex
```
You should see output indicating that Dex is listening on the specified port.
@z

@x
### Using Dex OAuth testing in GHA
@y
### Using Dex OAuth testing in GHA
@z

@x
To test the OAuth flow, you'll need a client application configured to authenticate against Dex. One of the most typical use cases is to use it inside GitHub Actions. Since Dex supports mock authentication, you can predefine test users as suggested in the [docs](https://dexidp.io/docs). The `config.yaml` file should looks like:
@y
To test the OAuth flow, you'll need a client application configured to authenticate against Dex. One of the most typical use cases is to use it inside GitHub Actions. Since Dex supports mock authentication, you can predefine test users as suggested in the [docs](https://dexidp.io/docs). The `config.yaml` file should looks like:
@z

@x
```yaml
issuer: http://127.0.0.1:5556/dex
@y
```yaml
issuer: http://127.0.0.1:5556/dex
@z

@x
storage:
  type: memory
@y
storage:
  type: memory
@z

@x
web:
  http: 0.0.0.0:5556
@y
web:
  http: 0.0.0.0:5556
@z

@x
oauth2:
  skipApprovalScreen: true
@y
oauth2:
  skipApprovalScreen: true
@z

@x
staticClients:
  - name: TestClient
    id: client_test_id
    secret: client_test_secret
    redirectURIs:
      - http://{ip-your-app}/path/to/callback/ # example: http://localhost:5555/callback
@y
staticClients:
  - name: TestClient
    id: client_test_id
    secret: client_test_secret
    redirectURIs:
      - http://{ip-your-app}/path/to/callback/ # example: http://localhost:5555/callback
@z

@x
connectors:
# mockCallback connector always returns the user 'kilgore@kilgore.trout'.
- type: mockCallback
  id: mock
  name: Mock
```
Now you can insert the Dex service inside your `~/.github/workflows/ci.yaml` file:
@y
connectors:
# mockCallback connector always returns the user 'kilgore@kilgore.trout'.
- type: mockCallback
  id: mock
  name: Mock
```
Now you can insert the Dex service inside your `~/.github/workflows/ci.yaml` file:
@z

@x
```yaml
[...]
jobs:
  test-oauth:
    runs-on: ubuntu-latest
    steps:
      - name: Install Dex
        run: |
          curl -L https://github.com/dexidp/dex/releases/download/v2.37.0/dex_linux_amd64 -o dex
          chmod +x dex
@y
```yaml
[...]
jobs:
  test-oauth:
    runs-on: ubuntu-latest
    steps:
      - name: Install Dex
        run: |
          curl -L https://github.com/dexidp/dex/releases/download/v2.37.0/dex_linux_amd64 -o dex
          chmod +x dex
@z

@x
      - name: Start Dex Server
        run: |
          nohup ./dex serve config.yaml > dex.log 2>&1 &
          sleep 5  # Give Dex time to start
[...]
```
@y
      - name: Start Dex Server
        run: |
          nohup ./dex serve config.yaml > dex.log 2>&1 &
          sleep 5  # Give Dex time to start
[...]
```
@z

@x
### Conclusion
@y
### Conclusion
@z

@x
By following this guide, you've set up Dex as an OAuth mock server using Docker. This setup is invaluable for testing and development, allowing you to simulate OAuth flows without relying on external identity providers. For more advanced configurations and integrations, refer to the [Dex documentation](https://dexidp.io/docs/).
@y
By following this guide, you've set up Dex as an OAuth mock server using Docker. This setup is invaluable for testing and development, allowing you to simulate OAuth flows without relying on external identity providers. For more advanced configurations and integrations, refer to the [Dex documentation](https://dexidp.io/docs/).
@z
