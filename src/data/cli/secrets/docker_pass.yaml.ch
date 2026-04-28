%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker pass
short: Manage your local OS keychain secrets.
long: "Docker Pass is a helper for securely storing secrets in your local OS keychain and injecting them into containers when needed. \nIt uses platform-specific credential storage:\n\n  - Windows: Windows Credential Manager API\n  - macOS:   Keychain services API\n  - Linux:   org.freedesktop.secrets API (requires DBus + gnome-keyring or kdewallet)\n\nSecrets can be injected into running containers at runtime using the se:// URI scheme."
usage: docker pass set|get|ls|rm
@y
command: docker pass
short: Manage your local OS keychain secrets.
long: "Docker Pass is a helper for securely storing secrets in your local OS keychain and injecting them into containers when needed. \nIt uses platform-specific credential storage:\n\n  - Windows: Windows Credential Manager API\n  - macOS:   Keychain services API\n  - Linux:   org.freedesktop.secrets API (requires DBus + gnome-keyring or kdewallet)\n\nSecrets can be injected into running containers at runtime using the se:// URI scheme."
usage: docker pass set|get|ls|rm
@z

@x
examples: |-
    ### Using keychain secrets in containers
@y
examples: |-
    ### Using keychain secrets in containers
@z

@x
    Create a secret:
@y
    Create a secret:
@z

% snip command...

@x
    Create a secret from STDIN:
@y
    Create a secret from STDIN:
@z

% snip command...

@x
    Run a container that uses the secret:
@y
    Run a container that uses the secret:
@z

% snip command...

@x
    Inspect the secret from inside the container:
@y
    Inspect the secret from inside the container:
@z

% snip command...

@x
    Explicitly assign a secret to a different environment variable:
@y
    Explicitly assign a secret to a different environment variable:
@z

% snip command...

@x
    ### Using keychain secrets in Compose
@y
    ### Using keychain secrets in Compose
@z

@x
    Store the secrets:
@y
    Store the secrets:
@z

% snip command...
% snip code...
