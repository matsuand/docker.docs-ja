%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Use provider services
description: Learn how to use provider services in Docker Compose to integrate external capabilities into your applications
keywords: compose, docker compose, provider, services, platform capabilities, integration, model runner, ai
@y
title: Use provider services
description: Learn how to use provider services in Docker Compose to integrate external capabilities into your applications
keywords: compose, docker compose, provider, services, platform capabilities, integration, model runner, ai
@z

@x
{{< summary-bar feature_name="Compose provider services" >}}
@y
{{< summary-bar feature_name="Compose provider services" >}}
@z

@x
Docker Compose supports provider services, which allow integration with services whose lifecycles are managed by third-party components rather than by Compose itself.  
This feature enables you to define and utilize platform-specific services without the need for manual setup or direct lifecycle management.
@y
Docker Compose supports provider services, which allow integration with services whose lifecycles are managed by third-party components rather than by Compose itself.  
This feature enables you to define and utilize platform-specific services without the need for manual setup or direct lifecycle management.
@z

@x
## What are provider services?
@y
## What are provider services?
@z

@x
Provider services are a special type of service in Compose that represents platform capabilities rather than containers.
They allow you to declare dependencies on specific platform features that your application needs.
@y
Provider services are a special type of service in Compose that represents platform capabilities rather than containers.
They allow you to declare dependencies on specific platform features that your application needs.
@z

@x
When you define a provider service in your Compose file, Compose works with the platform to provision and configure
the requested capability, making it available to your application services.
@y
When you define a provider service in your Compose file, Compose works with the platform to provision and configure
the requested capability, making it available to your application services.
@z

@x
## Using provider services
@y
## Using provider services
@z

@x
To use a provider service in your Compose file, you need to:
@y
To use a provider service in your Compose file, you need to:
@z

@x
1. Define a service with the `provider` attribute
2. Specify the `type` of provider you want to use
3. Configure any provider-specific options
4. Declare dependencies from your application services to the provider service
@y
1. Define a service with the `provider` attribute
2. Specify the `type` of provider you want to use
3. Configure any provider-specific options
4. Declare dependencies from your application services to the provider service
@z

@x
Here's a basic example:
@y
Here's a basic example:
@z

@x
```yaml
services:
  database:
    provider:
      type: awesomecloud
      options:
        type: mysql
        foo: bar  
  app:
    image: myapp 
    depends_on:
       - database
```
@y
```yaml
services:
  database:
    provider:
      type: awesomecloud
      options:
        type: mysql
        foo: bar  
  app:
    image: myapp 
    depends_on:
       - database
```
@z

@x
Notice the dedicated `provider` attribute in the `database` service.
This attribute specifies that the service is managed by a provider and lets you define options specific to that provider type.
@y
Notice the dedicated `provider` attribute in the `database` service.
This attribute specifies that the service is managed by a provider and lets you define options specific to that provider type.
@z

@x
The `depends_on` attribute in the `app` service specifies that it depends on the `database` service.
This means that the `database` service will be started before the `app` service, allowing the provider information
to be injected into the `app` service.
@y
The `depends_on` attribute in the `app` service specifies that it depends on the `database` service.
This means that the `database` service will be started before the `app` service, allowing the provider information
to be injected into the `app` service.
@z

@x
## How it works
@y
## How it works
@z

@x
During the `docker compose up` command execution, Compose identifies services relying on providers and works with them to provision
the requested capabilities. The provider then populates Compose model with information about how to access the provisioned resource.
@y
During the `docker compose up` command execution, Compose identifies services relying on providers and works with them to provision
the requested capabilities. The provider then populates Compose model with information about how to access the provisioned resource.
@z

@x
This information is passed to services that declare a dependency on the provider service, typically through environment
variables. The naming convention for these variables is:
@y
This information is passed to services that declare a dependency on the provider service, typically through environment
variables. The naming convention for these variables is:
@z

@x
```env
<<PROVIDER_SERVICE_NAME>>_<<VARIABLE_NAME>>
```
@y
```env
<<PROVIDER_SERVICE_NAME>>_<<VARIABLE_NAME>>
```
@z

@x
For example, if your provider service is named `database`, your application service might receive environment variables like:
@y
For example, if your provider service is named `database`, your application service might receive environment variables like:
@z

@x
- `DATABASE_URL` with the URL to access the provisioned resource
- `DATABASE_TOKEN` with an authentication token
- Other provider-specific variables
@y
- `DATABASE_URL` with the URL to access the provisioned resource
- `DATABASE_TOKEN` with an authentication token
- Other provider-specific variables
@z

@x
Your application can then use these environment variables to interact with the provisioned resource.
@y
Your application can then use these environment variables to interact with the provisioned resource.
@z

@x
## Provider types
@y
## Provider types
@z

@x
The `type` field in a provider service references the name of either:
@y
The `type` field in a provider service references the name of either:
@z

@x
1. A Docker CLI plugin (e.g., `docker-model`)
2. A binary available in the user's PATH
3. A path to the binary or script to execute
@y
1. A Docker CLI plugin (e.g., `docker-model`)
2. A binary available in the user's PATH
3. A path to the binary or script to execute
@z

@x
When Compose encounters a provider service, it looks for a plugin or binary with the specified name to handle the provisioning of the requested capability.
@y
When Compose encounters a provider service, it looks for a plugin or binary with the specified name to handle the provisioning of the requested capability.
@z

@x
For example, if you specify `type: model`, Compose will look for a Docker CLI plugin named `docker-model` or a binary named `model` in the PATH.
@y
For example, if you specify `type: model`, Compose will look for a Docker CLI plugin named `docker-model` or a binary named `model` in the PATH.
@z

@x
```yaml
services:
  ai-runner:
    provider:
      type: model  # Looks for docker-model plugin or model binary
      options:
        model: ai/example-model
```
@y
```yaml
services:
  ai-runner:
    provider:
      type: model  # Looks for docker-model plugin or model binary
      options:
        model: ai/example-model
```
@z

@x
The plugin or binary is responsible for:
@y
The plugin or binary is responsible for:
@z

@x
1. Interpreting the options provided in the provider service
2. Provisioning the requested capability
3. Returning information about how to access the provisioned resource
@y
1. Interpreting the options provided in the provider service
2. Provisioning the requested capability
3. Returning information about how to access the provisioned resource
@z

@x
This information is then passed to dependent services as environment variables.
@y
This information is then passed to dependent services as environment variables.
@z

@x
> [!TIP]
>
> If you're working with AI models in Compose, use the [`models` top-level element](/manuals/ai/compose/models-and-compose.md) instead.
@y
> [!TIP]
>
> If you're working with AI models in Compose, use the [`models` top-level element](manuals/ai/compose/models-and-compose.md) instead.
@z

@x
## Benefits of using provider services
@y
## Benefits of using provider services
@z

@x
Using provider services in your Compose applications offers several benefits:
@y
Using provider services in your Compose applications offers several benefits:
@z

@x
1. Simplified configuration: You don't need to manually configure and manage platform capabilities
2. Declarative approach: You can declare all your application's dependencies in one place
3. Consistent workflow: You use the same Compose commands to manage your entire application, including platform capabilities
@y
1. Simplified configuration: You don't need to manually configure and manage platform capabilities
2. Declarative approach: You can declare all your application's dependencies in one place
3. Consistent workflow: You use the same Compose commands to manage your entire application, including platform capabilities
@z

@x
## Creating your own provider
@y
## Creating your own provider
@z

@x
If you want to create your own provider to extend Compose with custom capabilities, you can implement a Compose plugin that registers provider types.
@y
If you want to create your own provider to extend Compose with custom capabilities, you can implement a Compose plugin that registers provider types.
@z

@x
For detailed information on how to create and implement your own provider, refer to the [Compose Extensions documentation](https://github.com/docker/compose/blob/main/docs/extension.md).   
This guide explains the extension mechanism that allows you to add new provider types to Compose.
@y
For detailed information on how to create and implement your own provider, refer to the [Compose Extensions documentation](https://github.com/docker/compose/blob/main/docs/extension.md).   
This guide explains the extension mechanism that allows you to add new provider types to Compose.
@z

@x
## Reference
@y
## Reference
@z

@x
- [Docker Model Runner documentation](/manuals/ai/model-runner.md)
- [Compose Extensions documentation](https://github.com/docker/compose/blob/main/docs/extension.md)
@y
- [Docker Model Runner documentation](manuals/ai/model-runner.md)
- [Compose Extensions documentation](https://github.com/docker/compose/blob/main/docs/extension.md)
@z
