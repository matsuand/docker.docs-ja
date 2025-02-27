%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Software Bill of Materials
description: Learn about Software Bill of Materials (SBOM) and how Docker Scout uses it.
keywords: scout, sbom, software bill of materials, analysis, composition
@y
title: Software Bill of Materials
description: Learn about Software Bill of Materials (SBOM) and how Docker Scout uses it.
keywords: scout, sbom, software bill of materials, analysis, composition
@z

@x
{{< youtube-embed PbS4y7C7h4A >}}
@y
{{< youtube-embed PbS4y7C7h4A >}}
@z

@x
A Bill of Materials (BOM) is a list of materials, parts, and the quantities of
each needed to manufacture a product. For example, a BOM for a computer might
list the motherboard, CPU, RAM, power supply, storage devices, case, and other
components, along with the quantities of each that are needed to build the
computer.
@y
A Bill of Materials (BOM) is a list of materials, parts, and the quantities of
each needed to manufacture a product. For example, a BOM for a computer might
list the motherboard, CPU, RAM, power supply, storage devices, case, and other
components, along with the quantities of each that are needed to build the
computer.
@z

@x
A Software Bill of Materials (SBOM) is a list of all the components that make
up a piece of software. This includes open source and third-party components,
as well as any custom code that has been written for the software. An SBOM is
similar to a BOM for a physical product, but for software.
@y
A Software Bill of Materials (SBOM) is a list of all the components that make
up a piece of software. This includes open source and third-party components,
as well as any custom code that has been written for the software. An SBOM is
similar to a BOM for a physical product, but for software.
@z

@x
In the context of software supply chain security, SBOMs can help with
identifying and mitigating security and compliance risks in software. By
knowing exactly what components are used in a piece of software, you can
quickly identify and patch vulnerabilities in your components, or determine if
a component is licensed in a way that is incompatible with your project.
@y
In the context of software supply chain security, SBOMs can help with
identifying and mitigating security and compliance risks in software. By
knowing exactly what components are used in a piece of software, you can
quickly identify and patch vulnerabilities in your components, or determine if
a component is licensed in a way that is incompatible with your project.
@z

@x
## Contents of an SBOM
@y
## Contents of an SBOM
@z

@x
An SBOM typically includes the following information:
@y
An SBOM typically includes the following information:
@z

@x
- The name of the software, such as the name of a library or framework, that
  the SBOM describes.
- The version of the software.
- The license under which the software is distributed.
- A list of other components that the software depends on.
@y
- The name of the software, such as the name of a library or framework, that
  the SBOM describes.
- The version of the software.
- The license under which the software is distributed.
- A list of other components that the software depends on.
@z

@x
## How Docker Scout uses SBOMs
@y
## How Docker Scout uses SBOMs
@z

@x
Docker Scout uses SBOMs to determine the components that are used in a Docker
image. When you analyze an image, Docker Scout will either use the SBOM that is
attached to the image as an attestation, or it will generate an SBOM on the fly
by analyzing the contents of the image.
@y
Docker Scout uses SBOMs to determine the components that are used in a Docker
image. When you analyze an image, Docker Scout will either use the SBOM that is
attached to the image as an attestation, or it will generate an SBOM on the fly
by analyzing the contents of the image.
@z

@x
The SBOM is cross-referenced with the [advisory database](/manuals/scout/deep-dive/advisory-db-sources.md)
to determine if any of the components in the image have known vulnerabilities.
@y
The SBOM is cross-referenced with the [advisory database](manuals/scout/deep-dive/advisory-db-sources.md)
to determine if any of the components in the image have known vulnerabilities.
@z

@x
<div id="scout-lp-survey-anchor"></div>
@y
<div id="scout-lp-survey-anchor"></div>
@z
