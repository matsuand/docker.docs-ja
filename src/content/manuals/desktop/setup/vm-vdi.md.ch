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
In general, we recommend running Docker Desktop natively on either Mac, Linux, or Windows. However, Docker Desktop for Windows can run inside a virtual desktop provided the virtual desktop is properly configured. 
@y
一般的に Docker Desktop は、Mac、Linux、Windows のいずれかにおいてネイティブに実行することをお勧めします。
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
The support available from Docker extends to installing and running Docker Desktop inside the VM, once the nested virtualization is set up correctly. The only hypervisors we have successfully tested are VMware ESXi and Azure, and there is no support for other VMs. For more information on Docker Desktop support, see [Get support](/manuals/desktop/troubleshoot-and-support/support.md).
@y
The support available from Docker extends to installing and running Docker Desktop inside the VM, once the nested virtualization is set up correctly. The only hypervisors we have successfully tested are VMware ESXi and Azure, and there is no support for other VMs. For more information on Docker Desktop support, see [Get support](manuals/desktop/troubleshoot-and-support/support.md).
@z

@x
For troubleshooting problems and intermittent failures that are outside of Docker's control, you should contact your hypervisor vendor. Each hypervisor vendor offers different levels of support. For example, Microsoft supports running nested Hyper-V both on-prem and on Azure, with some version constraints. This may not be the case for VMWare ESXi.
@y
For troubleshooting problems and intermittent failures that are outside of Docker's control, you should contact your hypervisor vendor. Each hypervisor vendor offers different levels of support. For example, Microsoft supports running nested Hyper-V both on-prem and on Azure, with some version constraints. This may not be the case for VMWare ESXi.
@z

@x
## Turn on nested virtualization
@y
## Turn on nested virtualization {#turn-on-nested-virtualization}
@z

@x
You must turn on nested virtualization before you install Docker Desktop on a virtual machine.
@y
You must turn on nested virtualization before you install Docker Desktop on a virtual machine.
@z

@x
### Turn on nested virtualization on VMware ESXi
@y
### Turn on nested virtualization on VMware ESXi {#turn-on-nested-virtualization-on-vmware-esxi}
@z

@x
Nested virtualization of other hypervisors like Hyper-V inside a vSphere VM [is not a supported scenario](https://kb.vmware.com/s/article/2009916). However, running Hyper-V VM in a VMware ESXi VM is technically possible and, depending on the version, ESXi includes hardware-assisted virtualization as a supported feature. For internal testing, we used a VM that had 1 CPU with 4 cores and 12GB of memory.
@y
Nested virtualization of other hypervisors like Hyper-V inside a vSphere VM [is not a supported scenario](https://kb.vmware.com/s/article/2009916). However, running Hyper-V VM in a VMware ESXi VM is technically possible and, depending on the version, ESXi includes hardware-assisted virtualization as a supported feature. For internal testing, we used a VM that had 1 CPU with 4 cores and 12GB of memory.
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
For Azure virtual machines, [check that the VM size chosen supports nested virtualization](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes). Microsoft provides [a helpful list on Azure VM sizes](https://docs.microsoft.com/en-us/azure/virtual-machines/acu) and highlights the sizes that currently support nested virtualization. For internal testing, we used D4s_v5 machines. We recommend this specification or above for optimal performance of Docker Desktop.
@y
For Azure virtual machines, [check that the VM size chosen supports nested virtualization](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes). Microsoft provides [a helpful list on Azure VM sizes](https://docs.microsoft.com/en-us/azure/virtual-machines/acu) and highlights the sizes that currently support nested virtualization. For internal testing, we used D4s_v5 machines. We recommend this specification or above for optimal performance of Docker Desktop.
@z
