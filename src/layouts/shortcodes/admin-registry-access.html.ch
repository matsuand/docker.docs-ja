%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応。

% snip code...

@x
To configure Registry Access Management permissions, perform the following steps:
@y
To configure Registry Access Management permissions, perform the following steps:
@z

@x
1. Sign in to {{ $product_link }}.
2. Select **Organizations**, your organization, then in the **Access management** menu, select **Registry access**.
3. Enable Registry Access Management to set the permissions for your registry.
@y
1. Sign in to {{ $product_link }}.
2. Select **Organizations**, your organization, then in the **Access management** menu, select **Registry access**.
3. Enable Registry Access Management to set the permissions for your registry.
@z

@x
   > **Note**
   >
   > When enabled, the Docker Hub registry is set by default, however you can also restrict this registry for your developers.
@y
   > **Note**
   >
   > When enabled, the Docker Hub registry is set by default, however you can also restrict this registry for your developers.
@z

@x
4. Select **Add registry** and enter your registry details in the applicable fields, and then select **Create** to add the registry to your list.
5. Verify that the registry appears in your list and select **Save changes**.
@y
4. Select **Add registry** and enter your registry details in the applicable fields, and then select **Create** to add the registry to your list.
5. Verify that the registry appears in your list and select **Save changes**.
@z

@x
   > **Note**
   >
   > Once you add a registry, it can take up to 24 hours for the changes to be enforced on your developers’ machines. If you want to apply the changes sooner, you must force a Docker logout on your developers’ machine and have the developers re-authenticate for Docker Desktop. Also, there is no limit on the number of registries you can add. See the Caveats section below to learn more about limitations when using this feature.
@y
   > **Note**
   >
   > Once you add a registry, it can take up to 24 hours for the changes to be enforced on your developers’ machines. If you want to apply the changes sooner, you must force a Docker logout on your developers’ machine and have the developers re-authenticate for Docker Desktop. Also, there is no limit on the number of registries you can add. See the Caveats section below to learn more about limitations when using this feature.
@z

@x
   > **Tip**
   >
   > Since RAM sets policies about where content can be fetched from, the [ADD](/reference/dockerfile/#add) instruction of the Dockerfile, when the parameter of the ADD instruction is a URL, is also subject to registry restrictions. It's recommended that you add the domains of URL parameters to the list of allowed registry addresses under the Registry Access Management settings of your organization.
   { .tip }
@y
   > **Tip**
   >
   > Since RAM sets policies about where content can be fetched from, the [ADD](__SUBDIR__/reference/dockerfile/#add) instruction of the Dockerfile, when the parameter of the ADD instruction is a URL, is also subject to registry restrictions. It's recommended that you add the domains of URL parameters to the list of allowed registry addresses under the Registry Access Management settings of your organization.
   { .tip }
@z
