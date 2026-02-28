%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker desktop logs
short: Print log entries for Docker Desktop
usage: docker desktop logs [OPTIONS]
@y
command: docker desktop logs
short: Print log entries for Docker Desktop
usage: docker desktop logs [OPTIONS]
@z

% options:

@x boot
      description: Show logs from a specified boot. Zero means the current or boot, one the second last boot, and so on
@y
      description: Show logs from a specified boot. Zero means the current or boot, one the second last boot, and so on
@z

@x color
      description: Enable colored output. Priority levels are highlighted.
@y
      description: Enable colored output. Priority levels are highlighted.
@z

@x color-mode
      description: Color mode to use. Can be `default` or `priority`
@y
      description: Color mode to use. Can be `default` or `priority`
@z

@x directory
      description: Specifies a custom directory to search for log entries
@y
      description: Specifies a custom directory to search for log entries
@z

@x priority
      description: Filter output by log priorities. `-1` is all, `0` is info or above, `1` filters for warnings or above, `2` filters for errors.
@y
      description: Filter output by log priorities. `-1` is all, `0` is info or above, `1` filters for warnings or above, `2` filters for errors.
@z

@x since
      description: Start showing entries on or newer than the specified date and time. Uses the systemd.time(7) format.
@y
      description: Start showing entries on or newer than the specified date and time. Uses the systemd.time(7) format.
@z

@x unit
      description: Filter by one or more categories (e.g. `--unit=com.docker.backend.ipc`, `com.docker.backend.apiproxy`)
@y
      description: Filter by one or more categories (e.g. `--unit=com.docker.backend.ipc`, `com.docker.backend.apiproxy`)
@z

@x until
      description: Start showing entries on or before the specified date and time. Uses the systemd.time(7) format.
@y
      description: Start showing entries on or before the specified date and time. Uses the systemd.time(7) format.
@z

% snip directives...
