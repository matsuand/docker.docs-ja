%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Network and HTTP rule syntax
linkTitle: Network rules
@y
title: Network and HTTP rule syntax
linkTitle: Network rules
@z

@x
description: Syntax for sandbox network rules, including hostname patterns, CIDR ranges, ports, and HTTP method and path rules.
keywords: docker sandboxes, network rules, rule syntax, wildcards, CIDR, HTTP rules, method and path
@y
description: Syntax for sandbox network rules, including hostname patterns, CIDR ranges, ports, and HTTP method and path rules.
keywords: docker sandboxes, network rules, rule syntax, wildcards, CIDR, HTTP rules, method and path
@z

@x
A network rule matches a destination. There are two kinds:
@y
A network rule matches a destination. There are two kinds:
@z

@x
- A host rule names no method or path, so it matches all traffic to the
  destination. The Docker Home composer calls it an **All traffic** rule.
- An HTTP rule also names an HTTP method and URL path, with optional
  query-parameter restrictions, so a policy can allow selected API requests.
@y
- A host rule names no method or path, so it matches all traffic to the
  destination. The Docker Home composer calls it an **All traffic** rule.
- An HTTP rule also names an HTTP method and URL path, with optional
  query-parameter restrictions, so a policy can allow selected API requests.
@z

@x
For how to write destinations, see [Destinations](#destinations).
@y
For how to write destinations, see [Destinations](#destinations).
@z

@x
## HTTP method and path
@y
## HTTP method and path
@z

@x
An HTTP rule names one or more methods, a destination, and path patterns. What
each part accepts depends on where you configure the rule:
@y
An HTTP rule names one or more methods, a destination, and path patterns. What
each part accepts depends on where you configure the rule:
@z

@x
| Part        | Organization policy                        | Local policy                      |
| ----------- | ------------------------------------------ | --------------------------------- |
| Method      | One or more listed methods                 | `ANY`, or one or more methods     |
| Destination | A host or IP address                       | A host                            |
| Path        | One or more absolute path patterns         | One absolute path pattern         |
@y
| Part        | Organization policy                        | Local policy                      |
| ----------- | ------------------------------------------ | --------------------------------- |
| Method      | One or more listed methods                 | `ANY`, or one or more methods     |
| Destination | A host or IP address                       | A host                            |
| Path        | One or more absolute path patterns         | One absolute path pattern         |
@z

@x
A destination can include a port, and a path pattern looks like `/api/**`.
@y
A destination can include a port, and a path pattern looks like `/api/**`.
@z

@x
A local HTTP rule accepts only a host pattern, not an IP address or a CIDR
range. To match an IP address or a CIDR range, use a network rule without
`--method` or `--path`. A local HTTP rule also takes one path, so add a separate
rule for each path.
@y
A local HTTP rule accepts only a host pattern, not an IP address or a CIDR
range. To match an IP address or a CIDR range, use a network rule without
`--method` or `--path`. A local HTTP rule also takes one path, so add a separate
rule for each path.
@z

@x
Every rule applies to at least one method. On the CLI, `--method ANY` covers
every HTTP method. In the composer, select at least one method. A rule with no
methods selected fails validation. For the methods you can select individually,
see
[What a network rule can match](../organization/policies/network.md#what-a-network-rule-can-match)
for an organization policy and
[Allow or block HTTP methods and paths](../local/network-rules.md#allow-or-block-http-methods-and-paths)
for a local one.
@y
Every rule applies to at least one method. On the CLI, `--method ANY` covers
every HTTP method. In the composer, select at least one method. A rule with no
methods selected fails validation. For the methods you can select individually,
see
[What a network rule can match](../organization/policies/network.md#what-a-network-rule-can-match)
for an organization policy and
[Allow or block HTTP methods and paths](../local/network-rules.md#allow-or-block-http-methods-and-paths)
for a local one.
@z

@x
HTTP path matching ignores ASCII letter case: `/API/**` matches `/api/items`.
Non-ASCII characters remain case-sensitive. This applies to both allow and deny
rules.
@y
HTTP path matching ignores ASCII letter case: `/API/**` matches `/api/items`.
Non-ASCII characters remain case-sensitive. This applies to both allow and deny
rules.
@z

@x
Path patterns use the same wildcards as filesystem paths, where `*`
matches within one path segment and `**` matches any depth. A pattern without a
wildcard matches that path exactly, so `/repos` matches `/repos` and nothing
below it. Every pattern must start with `/` and can't contain a query string, a
fragment, or a `..` segment. A local rule's path must also be canonical, so it
can't contain percent-encoding, control characters, surrounding whitespace,
repeated or trailing slashes, or a `.` segment.
@y
Path patterns use the same wildcards as filesystem paths, where `*`
matches within one path segment and `**` matches any depth. A pattern without a
wildcard matches that path exactly, so `/repos` matches `/repos` and nothing
below it. Every pattern must start with `/` and can't contain a query string, a
fragment, or a `..` segment. A local rule's path must also be canonical, so it
can't contain percent-encoding, control characters, surrounding whitespace,
repeated or trailing slashes, or a `.` segment.
@z

@x
### Query parameters
@y
### Query parameters
@z

@x
An HTTP rule can also restrict query parameters independently of the path.
@y
An HTTP rule can also restrict query parameters independently of the path.
@z

@x
Use exact parameter names and values, or a single `*` at the start or end of a
value to match a suffix or prefix. A value of `*` matches any value, including
an empty one. Names cannot contain wildcards. Names and values ignore ASCII
letter case, so `Tag=PROD` matches `tag=prod`. Non-ASCII characters remain
case-sensitive.
@y
Use exact parameter names and values, or a single `*` at the start or end of a
value to match a suffix or prefix. A value of `*` matches any value, including
an empty one. Names cannot contain wildcards. Names and values ignore ASCII
letter case, so `Tag=PROD` matches `tag=prod`. Non-ASCII characters remain
case-sensitive.
@z

@x
Every specified parameter must match.
Parameter order doesn't matter, and requests may include additional
parameters. Repeating a parameter name in the rule requires separate matching
occurrences in the request. A rule without query restrictions matches
regardless of query parameters.
@y
Every specified parameter must match.
Parameter order doesn't matter, and requests may include additional
parameters. Repeating a parameter name in the rule requires separate matching
occurrences in the request. A rule without query restrictions matches
regardless of query parameters.
@z

@x
Write names and value patterns using URL query encoding: `+` or `%20` for a
space, `%2B` for a literal plus, and `%2A` for a literal asterisk. Keep query
parameters out of `--path`. For CLI examples, see
[Allow or block HTTP methods and paths](../local/network-rules.md#allow-or-block-http-methods-and-paths).
For the **Query parameters** field in an organization policy, see
[HTTP rules](../organization/policies/network.md#http-rules).
@y
Write names and value patterns using URL query encoding: `+` or `%20` for a
space, `%2B` for a literal plus, and `%2A` for a literal asterisk. Keep query
parameters out of `--path`. For CLI examples, see
[Allow or block HTTP methods and paths](../local/network-rules.md#allow-or-block-http-methods-and-paths).
For the **Query parameters** field in an organization policy, see
[HTTP rules](../organization/policies/network.md#http-rules).
@z

@x
### Combine HTTP and host rules
@y
### Combine HTTP and host rules
@z

@x
HTTP requests are evaluated against both kinds of rule. A host rule sets the
baseline for a host, and HTTP rules narrow access by method, path, and query
parameters:
@y
HTTP requests are evaluated against both kinds of rule. A host rule sets the
baseline for a host, and HTTP rules narrow access by method, path, and query
parameters:
@z

@x
| Rules that cover the host | Result for an HTTP request                                                                              |
| ------------------------- | ------------------------------------------------------------------------------------------------------- |
| Host allow only           | Allowed at any method and path                                                                          |
| HTTP allow only           | Allowed only where a rule matches the method, path, and any query restrictions. Anything else is denied |
| Host allow and HTTP deny  | Requests matching the HTTP deny are blocked. The rest stay allowed                                      |
| Host deny                 | Blocked. An HTTP allow can't reopen a denied host                                                       |
@y
| Rules that cover the host | Result for an HTTP request                                                                              |
| ------------------------- | ------------------------------------------------------------------------------------------------------- |
| Host allow only           | Allowed at any method and path                                                                          |
| HTTP allow only           | Allowed only where a rule matches the method, path, and any query restrictions. Anything else is denied |
| Host allow and HTTP deny  | Requests matching the HTTP deny are blocked. The rest stay allowed                                      |
| Host deny                 | Blocked. An HTTP allow can't reopen a denied host                                                       |
@z

@x
A host deny is therefore a floor that HTTP rules can't raise, while a host
allow is a ceiling that HTTP rules can carve into.
@y
A host deny is therefore a floor that HTTP rules can't raise, while a host
allow is a ceiling that HTTP rules can carve into.
@z

@x
When a rule requires an HTTP decision, the sandbox HTTP proxy
evaluates each request separately instead of deciding once per connection.
@y
When a rule requires an HTTP decision, the sandbox HTTP proxy
evaluates each request separately instead of deciding once per connection.
@z

@x
Those requests have to go through the proxy. A connection it can't inspect,
such as one it handles transparently, is blocked rather than evaluated.
Traffic that isn't HTTP, such as SSH, carries no method or path, so HTTP rules
never match it. Control those destinations with host rules.
@y
Those requests have to go through the proxy. A connection it can't inspect,
such as one it handles transparently, is blocked rather than evaluated.
Traffic that isn't HTTP, such as SSH, carries no method or path, so HTTP rules
never match it. Control those destinations with host rules.
@z

@x
## Destinations
@y
## Destinations
@z

@x
Network rules use `connect:tcp` for TCP and `connect:udp` for UDP. Resources are
hostnames, CIDR ranges, or ports. UDP requires
[experimental outbound UDP](../local/network-rules.md#allow-outbound-udp).
ICMP is blocked.
@y
Network rules use `connect:tcp` for TCP and `connect:udp` for UDP. Resources are
hostnames, CIDR ranges, or ports. UDP requires
[experimental outbound UDP](../local/network-rules.md#allow-outbound-udp).
ICMP is blocked.
@z

@x
### Hostname patterns
@y
### Hostname patterns
@z

@x
Hostname matching is case-insensitive: `EXAMPLE.com` matches `example.com`.
@y
Hostname matching is case-insensitive: `EXAMPLE.com` matches `example.com`.
@z

@x
| Pattern               | Example           | Matches                                                      |
| --------------------- | ----------------- | ------------------------------------------------------------- |
| Exact hostname        | `example.com`     | `example.com` on any port, not subdomains                     |
| Single-level wildcard | `*.example.com`   | One subdomain level, any port: `api.example.com`              |
| Multi-level wildcard  | `**.example.com`  | Any depth, any port: `api.example.com`, `v2.api.example.com`  |
| Hostname with port    | `example.com:443` | `example.com` on port 443 only                                |
@y
| Pattern               | Example           | Matches                                                      |
| --------------------- | ----------------- | ------------------------------------------------------------- |
| Exact hostname        | `example.com`     | `example.com` on any port, not subdomains                     |
| Single-level wildcard | `*.example.com`   | One subdomain level, any port: `api.example.com`              |
| Multi-level wildcard  | `**.example.com`  | Any depth, any port: `api.example.com`, `v2.api.example.com`  |
| Hostname with port    | `example.com:443` | `example.com` on port 443 only                                |
@z

@x
`example.com` and `*.example.com` don't cover each other. Specify both if you
need to match the root domain and its subdomains.
@y
`example.com` and `*.example.com` don't cover each other. Specify both if you
need to match the root domain and its subdomains.
@z

@x
### CIDR ranges
@y
### CIDR ranges
@z

@x
Both IPv4 and IPv6 notation are supported: `10.0.0.0/8`, `192.168.1.0/24`,
`2001:db8::/32`.
@y
Both IPv4 and IPv6 notation are supported: `10.0.0.0/8`, `192.168.1.0/24`,
`2001:db8::/32`.
@z
