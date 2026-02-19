%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Configure Gordon's tools
linkTitle: Configure tools
description: Enable and disable Gordon's built-in tools based on your needs
@y
title: Configure Gordon's tools
linkTitle: Configure tools
description: Enable and disable Gordon's built-in tools based on your needs
@z

@x
{{< summary-bar feature_name="Gordon" >}}
@y
{{< summary-bar feature_name="Gordon" >}}
@z

@x
Gordon includes built-in tools that extend its capabilities. You can configure
which tools Gordon has access to based on your security requirements and
workflow needs.
@y
Gordon includes built-in tools that extend its capabilities. You can configure
which tools Gordon has access to based on your security requirements and
workflow needs.
@z

@x
Tool configuration provides an additional layer of control:
@y
Tool configuration provides an additional layer of control:
@z

@x
- Enabled tools: Gordon can propose actions using these tools (subject to
  your approval)
- Disabled tools: Gordon cannot use these tools, and will not request
  permission to use them
@y
- Enabled tools: Gordon can propose actions using these tools (subject to
  your approval)
- Disabled tools: Gordon cannot use these tools, and will not request
  permission to use them
@z

@x
## Accessing tool settings
@y
## Accessing tool settings
@z

@x
To configure Gordon's tools:
@y
To configure Gordon's tools:
@z

@x
1. Open Docker Desktop.
2. Select **Ask Gordon** in the sidebar.
3. Select the settings icon at the bottom of the text input area.
@y
1. Open Docker Desktop.
2. Select **Ask Gordon** in the sidebar.
3. Select the settings icon at the bottom of the text input area.
@z

@x
   ![Session settings icon](../images/perm_settings.avif?border=true)
@y
   ![Session settings icon](../images/perm_settings.avif?border=true)
@z

@x
The tool settings dialog opens with two tabs: **Basic** and **Advanced**.
@y
The tool settings dialog opens with two tabs: **Basic** and **Advanced**.
@z

@x
## Basic tool settings
@y
## Basic tool settings
@z

@x
In the **Basic** tab, you can enable or disable individual tools globally.
@y
In the **Basic** tab, you can enable or disable individual tools globally.
@z

@x
To disable a tool:
@y
To disable a tool:
@z

@x
1. Find the tool you want to disable in the list.
2. Toggle it off.
3. Select **Save**.
@y
1. Find the tool you want to disable in the list.
2. Toggle it off.
3. Select **Save**.
@z

@x
Disabled tools cannot be used by Gordon, even with your approval.
@y
Disabled tools cannot be used by Gordon, even with your approval.
@z

@x
## Advanced tool settings
@y
## Advanced tool settings
@z

@x
The **Advanced** tab lets you create fine-grained allow-lists and deny-lists
for specific commands or patterns.
@y
The **Advanced** tab lets you create fine-grained allow-lists and deny-lists
for specific commands or patterns.
@z

@x
Allow-lists:
Gordon can use allow-listed commands even when the main tool is disabled. For
example, disable the shell tool but allow `cat`, `grep`, and `ls`.
@y
Allow-lists:
Gordon can use allow-listed commands even when the main tool is disabled. For
example, disable the shell tool but allow `cat`, `grep`, and `ls`.
@z

@x
Deny-lists:
Block specific commands while keeping the tool enabled. For example, allow the
shell tool but deny `chown` and `chmod`.
@y
Deny-lists:
Block specific commands while keeping the tool enabled. For example, allow the
shell tool but deny `chown` and `chmod`.
@z

@x
To configure:
@y
To configure:
@z

@x
1. Switch to the **Advanced** tab.
2. Add commands to **Allow rules** or **Deny rules**.
3. Select **Save**.
@y
1. Switch to the **Advanced** tab.
2. Add commands to **Allow rules** or **Deny rules**.
3. Select **Save**.
@z

@x
![Advanced tool configuration](../images/gordon_advanced_tool_config.avif?w=500px&border=true)
@y
![Advanced tool configuration](../images/gordon_advanced_tool_config.avif?w=500px&border=true)
@z

@x
Gordon still requests approval before running allow-listed tools, unless YOLO
mode (auto-approve mode that bypasses permission checks) is enabled.
@y
Gordon still requests approval before running allow-listed tools, unless YOLO
mode (auto-approve mode that bypasses permission checks) is enabled.
@z

@x
## Organizational controls
@y
## Organizational controls
@z

@x
For Business subscriptions, administrators can control tool access for the
entire organization using Settings Management.
@y
For Business subscriptions, administrators can control tool access for the
entire organization using Settings Management.
@z

@x
Administrators can:
@y
Administrators can:
@z

@x
- Disable specific tools for all users
- Lock tool configuration to prevent users from changing it
- Set organization-wide tool policies
@y
- Disable specific tools for all users
- Lock tool configuration to prevent users from changing it
- Set organization-wide tool policies
@z

@x
See [Settings Management](/enterprise/security/hardened-desktop/settings-management/)
for details.
@y
See [Settings Management](__SUBDIR__/enterprise/security/hardened-desktop/settings-management/)
for details.
@z
