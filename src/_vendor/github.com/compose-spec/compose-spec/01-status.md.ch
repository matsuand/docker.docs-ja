%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# Status of this document
@y
# Status of this document
@z

@x
This document specifies the Compose file format used to define multi-containers applications. Distribution of this document is unlimited.
@y
This document specifies the Compose file format used to define multi-containers applications. Distribution of this document is unlimited.
@z

@x
## Requirements and optional attributes
@y
## Requirements and optional attributes
@z

@x
The Compose specification includes properties designed to target a local [OCI](https://opencontainers.org/) container runtime,
exposing Linux kernel specific configuration options, but also some Windows container specific properties. It is also designed for cloud platform features related to resource placement on a cluster, replicated application distribution, and scalability.
@y
The Compose specification includes properties designed to target a local [OCI](https://opencontainers.org/) container runtime,
exposing Linux kernel specific configuration options, but also some Windows container specific properties. It is also designed for cloud platform features related to resource placement on a cluster, replicated application distribution, and scalability.
@z

@x
We acknowledge that no Compose implementation is expected to support all attributes, and that support for some properties
is platform dependent and can only be confirmed at runtime. The definition of a versioned schema to control the supported
properties in a Compose file, established by the [docker-compose](https://github.com/docker/compose) tool where the Compose
file format was designed, doesn't offer any guarantee to the end-user that attributes will be actually implemented.
@y
We acknowledge that no Compose implementation is expected to support all attributes, and that support for some properties
is platform dependent and can only be confirmed at runtime. The definition of a versioned schema to control the supported
properties in a Compose file, established by the [docker-compose](https://github.com/docker/compose) tool where the Compose
file format was designed, doesn't offer any guarantee to the end-user that attributes will be actually implemented.
@z

@x
The specification defines the expected configuration syntax and behavior. Unless noted, supporting any of these is optional.
@y
The specification defines the expected configuration syntax and behavior. Unless noted, supporting any of these is optional.
@z

@x
A Compose implementation to parse a Compose file using unsupported attributes should warn users. We recommend the following implementors
to support those running modes:
@y
A Compose implementation to parse a Compose file using unsupported attributes should warn users. We recommend the following implementors
to support those running modes:
@z

@x
* Default: warn the user about unsupported attributes, but ignore them
* Strict: warn the user about unsupported attributes and reject the Compose file
* Loose: ignore unsupported attributes AND unknown attributes (that were not defined by the spec by the time implementation was created)
@y
* Default: warn the user about unsupported attributes, but ignore them
* Strict: warn the user about unsupported attributes and reject the Compose file
* Loose: ignore unsupported attributes AND unknown attributes (that were not defined by the spec by the time implementation was created)
@z

@x
From this point onwards, references made to 'Compose' can be interpreted as 'a Compose implementation'. 
@y
From this point onwards, references made to 'Compose' can be interpreted as 'a Compose implementation'. 
@z
