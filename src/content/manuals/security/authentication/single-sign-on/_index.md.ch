%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Single sign-on overview
linkTitle: Single sign-on
description: >-
  How Docker single sign-on works for Business organizations and companies,
  and the steps to configure a domain, IdP connection, and optional
  enforcement.
keywords: single sign-on, SSO, sign-in, admin, Docker Hub, Docker Home,
  security, identity provider, IdP, SSO configuration, SSO setup, Docker
  Business, AI Governance, SAML, domain verification, enforce SSO, JIT
  provisioning, personal access token
@y
title: Single sign-on overview
linkTitle: Single sign-on
description: >-
  How Docker single sign-on works for Business organizations and companies,
  and the steps to configure a domain, IdP connection, and optional
  enforcement.
keywords: single sign-on, SSO, sign-in, admin, Docker Hub, Docker Home,
  security, identity provider, IdP, SSO configuration, SSO setup, Docker
  Business, AI Governance, SAML, domain verification, enforce SSO, JIT
  provisioning, personal access token
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
Single sign-on (SSO) lets users access Docker by authenticating through your
identity provider (IdP). You can configure SSO for an entire company,
including all associated organizations, or for a single organization. SSO
requires a Docker Business subscription or an
[AI Governance](/manuals/accounts/organization/manage/manage-licenses.md)
license.
@y
Single sign-on (SSO) lets users access Docker by authenticating through your
identity provider (IdP). You can configure SSO for an entire company,
including all associated organizations, or for a single organization. SSO
requires a Docker Business subscription or an
[AI Governance](manuals/accounts/organization/manage/manage-licenses.md)
license.
@z

@x
## How SSO works
@y
## How SSO works
@z

@x
When a user signs in to Docker Desktop or Docker Hub, Docker sends them to
your IdP's sign-in page. The IdP accepts or denies the sign-in.
@y
When a user signs in to Docker Desktop or Docker Hub, Docker sends them to
your IdP's sign-in page. The IdP accepts or denies the sign-in.
@z

@x
```mermaid {title="Sign-in when the IdP accepts the user" caption="The user has no Docker session, and the IdP accepts them."}
sequenceDiagram
  actor User
  participant App as Docker Desktop<br/>or<br/>Docker Hub
  participant Login as Docker Login
  participant IdP as Your IdP
@y
```mermaid {title="Sign-in when the IdP accepts the user" caption="The user has no Docker session, and the IdP accepts them."}
sequenceDiagram
  actor User
  participant App as Docker Desktop<br/>or<br/>Docker Hub
  participant Login as Docker Login
  participant IdP as Your IdP
@z

@x
  User->>App: Open the app
  App->>Login: Start authentication
  Login->>IdP: Send the user to your IdP
  IdP->>User: Prompt for credentials
  User->>IdP: Enter credentials
  IdP->>Login: Confirm the user
  Login->>App: Return the user to the app
```
@y
  User->>App: Open the app
  App->>Login: Start authentication
  Login->>IdP: Send the user to your IdP
  IdP->>User: Prompt for credentials
  User->>IdP: Enter credentials
  IdP->>Login: Confirm the user
  Login->>App: Return the user to the app
```
@z

@x
## Set up SSO
@y
## Set up SSO
@z

@x
Setting up SSO is a multi-step procedure that moves between Docker and your
IdP.
@y
Setting up SSO is a multi-step procedure that moves between Docker and your
IdP.
@z

@x
```mermaid {title="SSO setup flow" caption="The hexagon marks the IdP step. After the connection works, complete the post-setup tasks."}
flowchart LR
  %% Link the columns to each other. A link into a step inside a
  %% column makes that column run left to right.
  subgraph configure["Configure SSO"]
    direction TB
    A["1. Add a domain"] --> B["2. Verify your domain"]
    B --> C["3. Create an SSO connection in Docker"]
    C --> D{{"4. Create an SSO connection in your IdP"}}
    D --> E["5. Connect Docker to your IdP"]
    E --> F["6. Test the connection"]
  end
@y
```mermaid {title="SSO setup flow" caption="The hexagon marks the IdP step. After the connection works, complete the post-setup tasks."}
flowchart LR
  %% Link the columns to each other. A link into a step inside a
  %% column makes that column run left to right.
  subgraph configure["Configure SSO"]
    direction TB
    A["1. Add a domain"] --> B["2. Verify your domain"]
    B --> C["3. Create an SSO connection in Docker"]
    C --> D{{"4. Create an SSO connection in your IdP"}}
    D --> E["5. Connect Docker to your IdP"]
    E --> F["6. Test the connection"]
  end
@z

@x
  subgraph post["Post-setup"]
    direction TB
    G["Provision users"]
    H["Optional: Enforce SSO / Desktop sign-in"]
    I["Manage SSO configuration"]
    G --> H --> I
  end
@y
  subgraph post["Post-setup"]
    direction TB
    G["Provision users"]
    H["Optional: Enforce SSO / Desktop sign-in"]
    I["Manage SSO configuration"]
    G --> H --> I
  end
@z

@x
  configure -->|"After the connection works"| post
@y
  configure -->|"After the connection works"| post
@z

@x
  classDef step fill:#ffffff,stroke:#6b7280,color:#111827
  class A,B,C,D,E,F,G,H,I step
  style configure fill:#dbeafe,stroke:#2563eb,stroke-width:2px
  style post fill:#fef9c3,stroke:#ca8a04,stroke-width:2px
```
@y
  classDef step fill:#ffffff,stroke:#6b7280,color:#111827
  class A,B,C,D,E,F,G,H,I step
  style configure fill:#dbeafe,stroke:#2563eb,stroke-width:2px
  style post fill:#fef9c3,stroke:#ca8a04,stroke-width:2px
```
@z

@x
After you finish the setup, users sign in to Docker services with their
company email address. When
[Just-in-Time provisioning](/manuals/security/provisioning/just-in-time.md)
is turned on, which is the default for an SSO connection, Docker adds each
user to your organization and team on first sign-in.
@y
After you finish the setup, users sign in to Docker services with their
company email address. When
[Just-in-Time provisioning](manuals/security/provisioning/just-in-time.md)
is turned on, which is the default for an SSO connection, Docker adds each
user to your organization and team on first sign-in.
@z

@x
> [!IMPORTANT]
>
> When SSO is enforced, the Docker CLI rejects password sign-in. Use a
> personal access token (PAT) to sign in to the CLI.
@y
> [!IMPORTANT]
>
> When SSO is enforced, the Docker CLI rejects password sign-in. Use a
> personal access token (PAT) to sign in to the CLI.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- Start [configuring SSO](connect.md).
- Read the [FAQs](/manuals/faqs/security.md).
- [Troubleshoot SSO issues](troubleshoot-sso.md).
@y
- Start [configuring SSO](connect.md).
- Read the [FAQs](manuals/faqs/security.md).
- [Troubleshoot SSO issues](troubleshoot-sso.md).
@z
