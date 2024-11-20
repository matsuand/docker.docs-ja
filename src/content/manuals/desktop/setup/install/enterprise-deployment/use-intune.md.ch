%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Use Intune
description: Use Intune, Microsoft's cloud-based device management tool, to deploy Docker Desktop
keywords: microsoft, windows, docker desktop, deploy, mdm, enterprise, administrator
@y
title: Use Intune
description: Use Intune, Microsoft's cloud-based device management tool, to deploy Docker Desktop
keywords: microsoft, windows, docker desktop, deploy, mdm, enterprise, administrator
@z

@x
Learn how to deploy Docker Desktop for Windows and Mac using Intune, Microsoft's cloud-based device management tool. 
@y
Learn how to deploy Docker Desktop for Windows and Mac using Intune, Microsoft's cloud-based device management tool. 
@z

@x
{{< tabs >}}
{{< tab name="Windows" >}}
@y
{{< tabs >}}
{{< tab name="Windows" >}}
@z

@x
1. Sign in to your Intune admin center.
2. Add a new app. Select **Apps**, then **Windows**, then **Add**.
3. For the app type, select **Windows app (Win32)**
4. Select the `intunewin` package. 
5. Complete any relevant details such as the description, publisher, or app version and then select **Next**. 
6. Optional: On the **Program** tab, you can update the **Install command** field to suit your needs. The field is pre-populated with `msiexec /i "DockerDesktop.msi" /qn`. See the [Common installation scenarios](msi-install-and-configure.md) for examples on the changes you can make. 
@y
1. Sign in to your Intune admin center.
2. Add a new app. Select **Apps**, then **Windows**, then **Add**.
3. For the app type, select **Windows app (Win32)**
4. Select the `intunewin` package. 
5. Complete any relevant details such as the description, publisher, or app version and then select **Next**. 
6. Optional: On the **Program** tab, you can update the **Install command** field to suit your needs. The field is pre-populated with `msiexec /i "DockerDesktop.msi" /qn`. See the [Common installation scenarios](msi-install-and-configure.md) for examples on the changes you can make. 
@z

@x
   > [!TIP]
   >
   > It's recommended you configure the Intune deployment to schedule a reboot of the machine on successful installs.
   >
   > This is because the Docker Desktop installer installs Windows features depending on your engine selection and also updates the membership of the `docker-users` local group.
   >
   > You may also want to set Intune to determine behaviour based on return codes and watch for a return code of `3010`. 
@y
   > [!TIP]
   >
   > It's recommended you configure the Intune deployment to schedule a reboot of the machine on successful installs.
   >
   > This is because the Docker Desktop installer installs Windows features depending on your engine selection and also updates the membership of the `docker-users` local group.
   >
   > You may also want to set Intune to determine behaviour based on return codes and watch for a return code of `3010`. 
@z

@x
7. Complete the rest of the tabs and then review and create the app. 
@y
7. Complete the rest of the tabs and then review and create the app. 
@z

@x
{{< /tab >}}
{{< tab name="Mac" >}}
@y
{{< /tab >}}
{{< tab name="Mac" >}}
@z

@x
First, upload the package:
@y
First, upload the package:
@z

@x
1. Sign in to your Intune admin center.
2. Add a new app. Select **Apps**, then **macOSs**, then **Add**.
3. Select **Line-of-business app** and then **Select**.
4. Upload the `Docker.pkg` file and fill in the required details.
@y
1. Sign in to your Intune admin center.
2. Add a new app. Select **Apps**, then **macOSs**, then **Add**.
3. Select **Line-of-business app** and then **Select**.
4. Upload the `Docker.pkg` file and fill in the required details.
@z

@x
Next, assign the app:
@y
Next, assign the app:
@z

@x
1. Once the app is added, navigate to **Assignments** in Intune.
2. Select **Add group** and choose the user or device groups you want to assign the app to.
3. Select **Save**.
@y
1. Once the app is added, navigate to **Assignments** in Intune.
2. Select **Add group** and choose the user or device groups you want to assign the app to.
3. Select **Save**.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
- [Explore the FAQs](faq.md).
- Learn how to [Enforce sign-in](/manuals/security/for-admins/enforce-sign-in/_index.md) for your users.
@y
- [Explore the FAQs](faq.md).
- Learn how to [Enforce sign-in](manuals/security/for-admins/enforce-sign-in/_index.md) for your users.
@z
