%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Follow an authenticated request
description: Use Next and Previous to follow the request at your own pace, or select a step to jump to it.
@y
title: Follow an authenticated request
description: Use Next and Previous to follow the request at your own pace, or select a step to jump to it.
@z

@x
    label: Host machine
@y
    label: Host machine
@z

@x
    label: Sandbox microVM
@y
    label: Sandbox microVM
@z

@x
    label: AI agent
    description: Sends the API request
@y
    label: AI agent
    description: Sends the API request
@z

@x
    label: Docker Engine
    description: Private to this sandbox
@y
    label: Docker Engine
    description: Private to this sandbox
@z

@x
    label: Workspace
    description: Shared with the host
@y
    label: Workspace
    description: Shared with the host
@z

@x
    label: Network policy
    description: Checks the destination
@y
    label: Network policy
    description: Checks the destination
@z

@x
    label: Host-side proxy
    description: Rewrites the auth header
@y
    label: Host-side proxy
    description: Rewrites the auth header
@z

@x
    label: Credential store
    description: Real token stays here
@y
    label: Credential store
    description: Real token stays here
@z

@x
    label: Model provider
    description: Receives the request
@y
    label: Model provider
    description: Receives the request
@z

@x
  - label: The agent prepares the request
    body: The agent sees a sentinel value instead of the real API credential.
    activeNodes: [agent]
    token:
      node: agent
      label: proxy-managed
      placement: bottom
    state: The sandbox sees only the proxy-managed sentinel.
@y
  - label: The agent prepares the request
    body: The agent sees a sentinel value instead of the real API credential.
    activeNodes: [agent]
    token:
      node: agent
      label: proxy-managed
      placement: bottom
    state: The sandbox sees only the proxy-managed sentinel.
@z

@x
  - label: The request leaves the microVM
    body: Outbound HTTP and HTTPS traffic crosses the sandbox boundary through the host network path.
    activeNodes: [agent, policy]
    activeEdges: [agent-policy]
    token:
      edge: agent-policy
      label: proxy-managed
    state: The real credential remains outside the microVM.
@y
  - label: The request leaves the microVM
    body: Outbound HTTP and HTTPS traffic crosses the sandbox boundary through the host network path.
    activeNodes: [agent, policy]
    activeEdges: [agent-policy]
    token:
      edge: agent-policy
      label: proxy-managed
    state: The real credential remains outside the microVM.
@z

@x
  - label: Network policy checks the destination
    body: The request continues only when an active policy permits the provider domain.
    activeNodes: [policy]
    activeEdges: [agent-policy]
    token:
      node: policy
      label: allowed
      placement: top
    state: Network policy allows the provider destination.
@y
  - label: Network policy checks the destination
    body: The request continues only when an active policy permits the provider domain.
    activeNodes: [policy]
    activeEdges: [agent-policy]
    token:
      node: policy
      label: allowed
      placement: top
    state: Network policy allows the provider destination.
@z

@x
  - label: The proxy retrieves the credential
    body: The host-side proxy resolves the matching credential without copying it into the sandbox.
    activeNodes: [proxy, credentials]
    activeEdges: [policy-proxy, credentials-proxy]
    token:
      edge: credentials-proxy
      label: host lookup
    state: The credential stays in the host credential store.
@y
  - label: The proxy retrieves the credential
    body: The host-side proxy resolves the matching credential without copying it into the sandbox.
    activeNodes: [proxy, credentials]
    activeEdges: [policy-proxy, credentials-proxy]
    token:
      edge: credentials-proxy
      label: host lookup
    state: The credential stays in the host credential store.
@z

@x
  - label: The proxy rewrites the header
    body: The proxy replaces the sentinel with the real credential after the request has left the microVM.
    activeNodes: [proxy, provider]
    activeEdges: [proxy-provider]
    token:
      edge: proxy-provider
      label: Bearer ••••••
    state: The provider receives the rewritten authorization header.
@y
  - label: The proxy rewrites the header
    body: The proxy replaces the sentinel with the real credential after the request has left the microVM.
    activeNodes: [proxy, provider]
    activeEdges: [proxy-provider]
    token:
      edge: proxy-provider
      label: Bearer ••••••
    state: The provider receives the rewritten authorization header.
@z

@x
  - label: The response returns
    body: The provider response returns through the host proxy to the agent. The credential remains on the host.
    activeNodes: [provider, proxy, agent]
    activeEdges: [provider-proxy]
    token:
      edge: provider-proxy
      label: 200 OK
    state: The credential remains on the host after the response.
@y
  - label: The response returns
    body: The provider response returns through the host proxy to the agent. The credential remains on the host.
    activeNodes: [provider, proxy, agent]
    activeEdges: [provider-proxy]
    token:
      edge: provider-proxy
      label: 200 OK
    state: The credential remains on the host after the response.
@z
