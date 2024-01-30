%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Integrate Azure Container Registry with Docker Scout
keywords: docker scout, acr, azure, integration, image analysis, security, cves
title: Azure Container Registry integration
---
@y
---
description: Integrate Azure Container Registry with Docker Scout
keywords: docker scout, acr, azure, integration, image analysis, security, cves
title: Azure Container Registry integration
---
@z

@x
Integrating Docker Scout with Azure Container Registry (ACR) lets you view
image insights for images hosted in ACR repositories. After integrating Docker
Scout with ACR and activating Docker Scout for a repository, pushing an image
to the repository automatically triggers image analysis. You can view image
insights using the Docker Scout Dashboard, or the `docker scout` CLI commands.
@y
Integrating Docker Scout with Azure Container Registry (ACR) lets you view
image insights for images hosted in ACR repositories. After integrating Docker
Scout with ACR and activating Docker Scout for a repository, pushing an image
to the repository automatically triggers image analysis. You can view image
insights using the Docker Scout Dashboard, or the `docker scout` CLI commands.
@z

@x
## How it works
@y
## How it works
@z

@x
To help you integrate your Azure Container Registry with Docker Scout, you can
use a custom Azure Resource Manager (ARM) template that automatically creates
the necessary infrastructure in Azure for you:
@y
To help you integrate your Azure Container Registry with Docker Scout, you can
use a custom Azure Resource Manager (ARM) template that automatically creates
the necessary infrastructure in Azure for you:
@z

@x
- An EventGrid Topic and Subscription for Image push and delete events.
- A read-only authorization token for the registry, used to list repositories,
  and ingest the images.
@y
- An EventGrid Topic and Subscription for Image push and delete events.
- A read-only authorization token for the registry, used to list repositories,
  and ingest the images.
@z

@x
When the resources have been created in Azure, you can enable the integration
for image repositories in the integrated ACR instance. Once you've enabled a
repository, pushing new images triggers image analysis automatically. The
analysis results appear in the Docker Scout Dashboard.
@y
When the resources have been created in Azure, you can enable the integration
for image repositories in the integrated ACR instance. Once you've enabled a
repository, pushing new images triggers image analysis automatically. The
analysis results appear in the Docker Scout Dashboard.
@z

@x
If you enable the integration on a repository that already contains images,
Docker Scout pulls and analyzes the latest image version automatically.
@y
If you enable the integration on a repository that already contains images,
Docker Scout pulls and analyzes the latest image version automatically.
@z

@x
### ARM template
@y
### ARM template
@z

@x
The following table describes the configuration resources.
@y
The following table describes the configuration resources.
@z

@x
> **Note**
>
> Creating these resources incurs a small, recurring cost on the Azure account.
> The **Cost** column in the table represents an estimated monthly cost of the
> resources, when integrating an ACR registry that gets 100 images pushed per
> day.
>
> The Egress cost varies depending on usage, but it’s around $0.1 per GB, and
> the first 100 GB are free.
@y
> **Note**
>
> Creating these resources incurs a small, recurring cost on the Azure account.
> The **Cost** column in the table represents an estimated monthly cost of the
> resources, when integrating an ACR registry that gets 100 images pushed per
> day.
>
> The Egress cost varies depending on usage, but it’s around $0.1 per GB, and
> the first 100 GB are free.
@z

@x
| Azure                   | Resource                                                                                   | Cost                                              |
| ----------------------- | ------------------------------------------------------------------------------------------ | ------------------------------------------------- |
| Event Grid system topic | Subscribe to Azure Container Registry events (image push and image delete)                 | Free                                              |
| Event subscription      | Send Event Grid events to Scout via a Webhook subscription                                 | $0.60 for every 1M messages. First 100k for free. |
| Registry Token          | Read-only token used for Scout to list the repositories, and pull images from the registry | Free                                              |
@y
| Azure                   | Resource                                                                                   | Cost                                              |
| ----------------------- | ------------------------------------------------------------------------------------------ | ------------------------------------------------- |
| Event Grid system topic | Subscribe to Azure Container Registry events (image push and image delete)                 | Free                                              |
| Event subscription      | Send Event Grid events to Scout via a Webhook subscription                                 | $0.60 for every 1M messages. First 100k for free. |
| Registry Token          | Read-only token used for Scout to list the repositories, and pull images from the registry | Free                                              |
@z

@x
The following JSON document shows the ARM template Docker Scout uses to create
the Azure resources.
@y
The following JSON document shows the ARM template Docker Scout uses to create
the Azure resources.
@z

@x
{{< accordion title="JSON template" >}}
@y
{{< accordion title="JSON template" >}}
@z

@x
{{< acr-template.inline >}}
{{ $data := data.GetJSON "https://prod-scout-integration-templates.s3.amazonaws.com/latest/acr_token_template.json" }}
@y
{{< acr-template.inline >}}
{{ $data := data.GetJSON "https://prod-scout-integration-templates.s3.amazonaws.com/latest/acr_token_template.json" }}
@z

@x
```json
{{ transform.Remarshal "json" $data }}
```
@y
```json
{{ transform.Remarshal "json" $data }}
```
@z

@x
{{< /acr-template.inline >}}
@y
{{< /acr-template.inline >}}
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
## Integrate a registry
@y
## Integrate a registry
@z

@x
1. Go to [Integrations](https://scout.docker.com/settings/integrations/) on the
   Docker Scout Dashboard.
2. Select the **Analyze my images from another registry** filter option.
3. Find **Azure Container Registry** in the list, and select **Integrate**.
4. In the **How to integrate** section, enter the **Registry hostname** of the
   registry you want to integrate.
5. Select **Next**.
6. Select **Deploy to Azure** to open the template deployment wizard in Azure.
@y
1. Go to [Integrations](https://scout.docker.com/settings/integrations/) on the
   Docker Scout Dashboard.
2. Select the **Analyze my images from another registry** filter option.
3. Find **Azure Container Registry** in the list, and select **Integrate**.
4. In the **How to integrate** section, enter the **Registry hostname** of the
   registry you want to integrate.
5. Select **Next**.
6. Select **Deploy to Azure** to open the template deployment wizard in Azure.
@z

@x
   You may be prompted to sign in to your Azure account if you're not already
   signed in.
@y
   You may be prompted to sign in to your Azure account if you're not already
   signed in.
@z

@x
7. In the template wizard, configure your deployment:
@y
7. In the template wizard, configure your deployment:
@z

@x
   - **Resource group**: enter the same resource group as you're using for the
     container registry. The Docker Scout resources must be deployed to the
     same resource group as the registry.
@y
   - **Resource group**: enter the same resource group as you're using for the
     container registry. The Docker Scout resources must be deployed to the
     same resource group as the registry.
@z

@x
   - **Registry name**: the field is pre-filled with the subdomain of the
     registry hostname.
@y
   - **Registry name**: the field is pre-filled with the subdomain of the
     registry hostname.
@z

@x
8. Select **Review + create**, and then **Create** to deploy the template.
@y
8. Select **Review + create**, and then **Create** to deploy the template.
@z

@x
9. Wait until the deployment is complete.
10. In the **Deployment details** section click on the newly created resource
    of the type **Container registry token**. Generate a new password for this token.
@y
9. Wait until the deployment is complete.
10. In the **Deployment details** section click on the newly created resource
    of the type **Container registry token**. Generate a new password for this token.
@z

@x
    Alternatively, use the search function in Azure to navigate to the
    **Container registry** resource that you're looking to integrate, and
    generate the new password for the created access token.
@y
    Alternatively, use the search function in Azure to navigate to the
    **Container registry** resource that you're looking to integrate, and
    generate the new password for the created access token.
@z

@x
11. Copy the generated password and head back to the Docker Scout Dashboard to
    finalize the integration.
@y
11. Copy the generated password and head back to the Docker Scout Dashboard to
    finalize the integration.
@z

@x
12. Paste the generated password into the **Registry token** field.
13. Select **Enable integration**.
@y
12. Paste the generated password into the **Registry token** field.
13. Select **Enable integration**.
@z

@x
After selecting **Enable integration**, Docker Scout performs a connection test
to verify the integration. If the verification was successful, you're
redirected to the Azure registry summary page, which shows you all your Azure
integrations for the current organization.
@y
After selecting **Enable integration**, Docker Scout performs a connection test
to verify the integration. If the verification was successful, you're
redirected to the Azure registry summary page, which shows you all your Azure
integrations for the current organization.
@z

@x
Next, activate Docker Scout for the repositories that you want to analyze in
[repository settings](../../dashboard.md#repository-settings).
@y
Next, activate Docker Scout for the repositories that you want to analyze in
[repository settings](../../dashboard.md#repository-settings).
@z

@x
After activating repositories, images that you push are analyzed by Docker
Scout. The analysis results appear in the Docker Scout Dashboard.
If your repository already contains images, Docker Scout pulls and analyzes the
latest image version automatically.
@y
After activating repositories, images that you push are analyzed by Docker
Scout. The analysis results appear in the Docker Scout Dashboard.
If your repository already contains images, Docker Scout pulls and analyzes the
latest image version automatically.
@z

@x
## Remove an integration
@y
## Remove an integration
@z

@x
> **Important**
>
> Removing the integration in the Docker Scout Dashboard doesn't automatically
> remove the resources created in Azure.
{ .important }
@y
> **Important**
>
> Removing the integration in the Docker Scout Dashboard doesn't automatically
> remove the resources created in Azure.
{ .important }
@z

@x
To remove an ACR integration:
@y
To remove an ACR integration:
@z

@x
1. Go to [Integrations](https://scout.docker.com/settings/integrations/) on the
   Docker Scout Dashboard.
2. Select the **Analyze my images from another registry** filter option.
3. Find **Azure Container Registry** in the list, and select **Manage**.
4. Find the ACR integration that you want to remove, and select the **Remove**
   button.
5. In the dialog that opens, confirm by selecting **Remove**.
6. After removing the integration in the Docker Scout Dashboard, also remove
   the Azure resources related to the integration:
@y
1. Go to [Integrations](https://scout.docker.com/settings/integrations/) on the
   Docker Scout Dashboard.
2. Select the **Analyze my images from another registry** filter option.
3. Find **Azure Container Registry** in the list, and select **Manage**.
4. Find the ACR integration that you want to remove, and select the **Remove**
   button.
5. In the dialog that opens, confirm by selecting **Remove**.
6. After removing the integration in the Docker Scout Dashboard, also remove
   the Azure resources related to the integration:
@z

@x
   - The `docker-scout-readonly-token` token for the container registry.
   - The `docker-scout-repository` Event Grid System Topic.
@y
   - The `docker-scout-readonly-token` token for the container registry.
   - The `docker-scout-repository` Event Grid System Topic.
@z
