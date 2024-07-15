%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Use Intune
description: Use Intune, Microsoft's cloud-based device management tool, to deploy Docker Desktop
keywords: microsoft, windows, docker desktop, deploy, mdm, enterprise, administrator,
---
@y
---
title: Use Intune
description: Use Intune, Microsoft's cloud-based device management tool, to deploy Docker Desktop
keywords: microsoft, windows, docker desktop, deploy, mdm, enterprise, administrator,
---
@z

@x
Learn how to deploy Docker Desktop using Intune, Microsoft's cloud-based device management tool. 
@y
Learn how to deploy Docker Desktop using Intune, Microsoft's cloud-based device management tool. 
@z

@x
1. Sign in to your Intune admin center.
2. Add a new app. Select **Apps**, then **Windows**, then **Add**.
3. For the app type, select **Windows app (Win32)**
4. Select the `intunewin` package. 
5. Complete any relevant details such as the description, publisher, or app version and then select **Next**. 
6. Optional: On the **Program** tab, you can update the **Install command** field to suit your needs. The field is pre-populated with `msiexec /i "DockerDesktop.msi" /qn`. See the [Common installation scenarios](install-and-configure.md) for examples on the changes you can make. 
@y
1. Sign in to your Intune admin center.
2. Add a new app. Select **Apps**, then **Windows**, then **Add**.
3. For the app type, select **Windows app (Win32)**
4. Select the `intunewin` package. 
5. Complete any relevant details such as the description, publisher, or app version and then select **Next**. 
6. Optional: On the **Program** tab, you can update the **Install command** field to suit your needs. The field is pre-populated with `msiexec /i "DockerDesktop.msi" /qn`. See the [Common installation scenarios](install-and-configure.md) for examples on the changes you can make. 
@z

@x
   > **Tip**
   >
   > It's recommended you configure the Intune deployment to schedule a reboot of the machine on successful installs.
   >
   > This is because the Docker Desktop installer installs Windows features depending on your engine selection and also updates the membership of the `docker-users` local group.
   >
   > You may also want to set Intune to determine behaviour based on return codes and watch for a return code of `3010`. 
   { .tip }
@y
   > **Tip**
   >
   > It's recommended you configure the Intune deployment to schedule a reboot of the machine on successful installs.
   >
   > This is because the Docker Desktop installer installs Windows features depending on your engine selection and also updates the membership of the `docker-users` local group.
   >
   > You may also want to set Intune to determine behaviour based on return codes and watch for a return code of `3010`. 
   { .tip }
@z

@x
7. Complete the rest of the tabs and then review and create the app. 
@y
7. Complete the rest of the tabs and then review and create the app. 
@z

@x
## Additional resources
@y
## Additional resources
@z

@x
- [Explore the FAQs](faq.md).
@y
- [Explore the FAQs](faq.md).
@z
