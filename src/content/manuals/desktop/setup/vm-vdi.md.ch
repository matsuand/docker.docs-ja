%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Instructions on how to enable nested virtualization
keywords: nested virtualization, Docker Desktop, windows, VM, VDI environment
title: Run Docker Desktop for Windows in a VM or VDI environment
@y
description: Instructions on how to enable nested virtualization
keywords: nested virtualization, Docker Desktop, windows, VM, VDI environment
title: VM、VDI 環境内での Docker Desktop for Windows の実行
@z

@x
Docker recommends running Docker Desktop natively on Mac, Linux, or Windows.  However, Docker Desktop for Windows can run inside a virtual desktop provided the virtual desktop is properly configured. 
@y
Docker Desktop では、Mac、Linux、Windows のいずれかにおいてネイティブに実行することをお勧めします。
ただし仮想デスクトップが適切に設定できていれば、Docker Desktop for Windows を仮想デスクトップ内で実行することも可能です。
@z

@x
To run Docker Desktop in a virtual desktop environment, it is essential nested virtualization is enabled on the virtual machine that provides the virtual desktop. This is because, under the hood, Docker Desktop is using a Linux VM in which it runs Docker Engine and the containers.
@y
仮想デスクトップ環境内において Docker Desktop を実行するには、仮想マシン上へのネストした仮想環境が実現できるように、仮想デスクトップが機能していることが重要です。
というのも Docker Desktop は背後に Linux VM を利用しており、その環境内にて Docker Engine やコンテナーを動作させているためです。
@z

@x
## Virtual desktop support
@y
## 仮想デスクトップサポート {#virtual-desktop-support}
@z

@x
> [!NOTE]
>
> Support for running Docker Desktop on a virtual desktop is available to Docker Business customers, on VMware ESXi or Azure VMs only.
@y
> [!NOTE]
>
> Docker Business 利用者は、VMware ESXi または Azure VM についてのみ、仮想デスクトップ上での Docker Desktop の実行がサポートされています。
@z

@x
Docker support includes installing and running Docker Desktop within the VM, provided that nested virtualization is correctly enabled. The only hypervisors successfully tested are VMware ESXi and Azure, and there is no support for other VMs. For more information on Docker Desktop support, see [Get support](/manuals/desktop/troubleshoot-and-support/support.md).
@y
Docker support includes installing and running Docker Desktop within the VM, provided that nested virtualization is correctly enabled. The only hypervisors successfully tested are VMware ESXi and Azure, and there is no support for other VMs. For more information on Docker Desktop support, see [Get support](manuals/desktop/troubleshoot-and-support/support.md).
@z

@x
For troubleshooting problems and intermittent failures that are outside of Docker's control, you should contact your hypervisor vendor. Each hypervisor vendor offers different levels of support. For example, Microsoft supports running nested Hyper-V both on-prem and on Azure, with some version constraints. This may not be the case for VMware ESXi.
@y
For troubleshooting problems and intermittent failures that are outside of Docker's control, you should contact your hypervisor vendor. Each hypervisor vendor offers different levels of support. For example, Microsoft supports running nested Hyper-V both on-prem and on Azure, with some version constraints. This may not be the case for VMware ESXi.
@z

@x
Docker does not support running multiple instances of Docker Desktop on the same machine in a VM or VDI environment. 
@y
Docker does not support running multiple instances of Docker Desktop on the same machine in a VM or VDI environment. 
@z

@x
> [!TIP]
>
> If you're running Docker Desktop inside a Citrix VDI, note that Citrix can be used with a variety of underlying hypervisors, for example VMware, Hyper-V, Citrix Hypervisor/XenServer. Docker Desktop requires nested virtualization, which is not supported by Citrix Hypervisor/XenServer.
>
> Check with your Citrix administrator or VDI infrastructure team to confirm which hypervisor is being used, and whether nested virtualization is enabled.
@y
> [!TIP]
>
> If you're running Docker Desktop inside a Citrix VDI, note that Citrix can be used with a variety of underlying hypervisors, for example VMware, Hyper-V, Citrix Hypervisor/XenServer. Docker Desktop requires nested virtualization, which is not supported by Citrix Hypervisor/XenServer.
>
> Check with your Citrix administrator or VDI infrastructure team to confirm which hypervisor is being used, and whether nested virtualization is enabled.
@z

@x
## Turn on nested virtualization
@y
## Turn on nested virtualization
@z

@x
You must turn on nested virtualization before you install Docker Desktop on a virtual machine.
@y
You must turn on nested virtualization before you install Docker Desktop on a virtual machine.
@z

@x
### Turn on nested virtualization on VMware ESXi
@y
### Turn on nested virtualization on VMware ESXi
@z

@x
Nested virtualization of other hypervisors like Hyper-V inside a vSphere VM [is not a supported scenario](https://kb.vmware.com/s/article/2009916). However, running Hyper-V VM in a VMware ESXi VM is technically possible and, depending on the version, ESXi includes hardware-assisted virtualization as a supported feature. A VM that had 1 CPU with 4 cores and 12GB of memory was used for internal testing.
@y
Nested virtualization of other hypervisors like Hyper-V inside a vSphere VM [is not a supported scenario](https://kb.vmware.com/s/article/2009916). However, running Hyper-V VM in a VMware ESXi VM is technically possible and, depending on the version, ESXi includes hardware-assisted virtualization as a supported feature. A VM that had 1 CPU with 4 cores and 12GB of memory was used for internal testing.
@z

@x
For steps on how to expose hardware-assisted virtualization to the guest OS, [see VMware's documentation](https://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere.vm_admin.doc/GUID-2A98801C-68E8-47AF-99ED-00C63E4857F6.html).
@y
For steps on how to expose hardware-assisted virtualization to the guest OS, [see VMware's documentation](https://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere.vm_admin.doc/GUID-2A98801C-68E8-47AF-99ED-00C63E4857F6.html).
@z

@x
### Turn on nested virtualization on an Azure Virtual Machine
@y
### Turn on nested virtualization on an Azure Virtual Machine
@z

@x
Nested virtualization is supported by Microsoft for running Hyper-V inside an Azure VM.
@y
Nested virtualization is supported by Microsoft for running Hyper-V inside an Azure VM.
@z

@x
For Azure virtual machines, [check that the VM size chosen supports nested virtualization](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes). Microsoft provides [a helpful list on Azure VM sizes](https://docs.microsoft.com/en-us/azure/virtual-machines/acu) and highlights the sizes that currently support nested virtualization. D4s_v5 machines were used for internal testing. Use this specification or above for optimal performance of Docker Desktop.
@y
For Azure virtual machines, [check that the VM size chosen supports nested virtualization](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes). Microsoft provides [a helpful list on Azure VM sizes](https://docs.microsoft.com/en-us/azure/virtual-machines/acu) and highlights the sizes that currently support nested virtualization. D4s_v5 machines were used for internal testing. Use this specification or above for optimal performance of Docker Desktop.
@z

@x
## Docker Desktop support on Nutanix-powered VDI
@y
## Docker Desktop support on Nutanix-powered VDI
@z

@x
Docker Desktop can be used within Nutanix-powered VDI environments provided that the underlying Windows environment supports WSL 2 or Windows container mode. Since Nutanix officially supports WSL 2, Docker Desktop should function as expected, as long as WSL 2 operates correctly within the VDI environment.
@y
Docker Desktop can be used within Nutanix-powered VDI environments provided that the underlying Windows environment supports WSL 2 or Windows container mode. Since Nutanix officially supports WSL 2, Docker Desktop should function as expected, as long as WSL 2 operates correctly within the VDI environment.
@z

@x
If using Windows container mode, confirm that the Nutanix environment supports Hyper-V or alternative Windows container backends.
@y
If using Windows container mode, confirm that the Nutanix environment supports Hyper-V or alternative Windows container backends.
@z

@x
### Supported configurations
@y
### Supported configurations
@z

@x
Docker Desktop follows the VDI support definitions outlined [previously](#virtual-desktop-support):
@y
Docker Desktop follows the VDI support definitions outlined [previously](#virtual-desktop-support):
@z

@x
 - Persistent VDI environments (Supported): You receive the same virtual desktop instance across sessions, preserving installed software and configurations.
@y
 - Persistent VDI environments (Supported): You receive the same virtual desktop instance across sessions, preserving installed software and configurations.
@z

@x
 - Non-persistent VDI environments (Not supported): Docker Desktop does not support environments where the OS resets between sessions, requiring re-installation or reconfiguration each time. 
@y
 - Non-persistent VDI environments (Not supported): Docker Desktop does not support environments where the OS resets between sessions, requiring re-installation or reconfiguration each time. 
@z

@x
### Support scope and responsibilities
@y
### Support scope and responsibilities
@z

@x
For WSL 2-related issues, contact Nutanix support. For Docker Desktop-specific issues, contact Docker support.
@y
For WSL 2-related issues, contact Nutanix support. For Docker Desktop-specific issues, contact Docker support.
@z
