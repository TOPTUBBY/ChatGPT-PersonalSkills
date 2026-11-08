---
name: windows-automation-scripting
description: Create and troubleshoot small Windows automation utilities in Python, batch, or PowerShell for repetitive file processing, CSV cleanup, scheduled backups, persistent console status, countdowns, folder pairs, and safe output handling. Use for lightweight tools that should be easy to run without a full application stack.
---

# Windows Automation Scripting

Prefer simple, inspectable scripts with explicit configuration, clear logs, and safe file handling.

## CSV batch processing

When cleaning many CSV files:
- define which row contains the real header
- preserve encoding/delimiter when possible
- identify columns by header name rather than fixed index when layout may change
- write to a separate destination folder by default
- preserve original filename unless renaming is requested
- report missing requested columns instead of silently ignoring unexpected format changes

If the header is on row 2, preserve or intentionally handle the preceding metadata row rather than assuming row 1 is the header.

## Scheduled backup loop

For a console script that runs daily:
1. perform one backup immediately at startup if requested
2. calculate next scheduled run, e.g. 06:00 local time
3. show `Waiting for next backup` plus countdown
4. sleep in short intervals so display remains responsive
5. run every source→destination pair
6. show per-pair status and overall status
7. return to waiting mode rather than exiting

## Multiple copy pairs

Represent pairs as data/config, for example:

```text
A -> B
C -> D
```

Loop through pairs using the same copy function so adding a third pair does not duplicate logic.

## Robustness

- create destination folders when appropriate
- handle locked/missing source files
- do not overwrite unexpectedly unless policy is explicit
- log timestamp and error detail
- distinguish partial success from full success
- catch exceptions at task level so one failed pair does not necessarily terminate the scheduler

## Testing scheduled behavior

Do not wait until the next morning. Make schedule time configurable for test mode, or temporarily set the next run a few minutes ahead. Verify immediate run, wait state, scheduled run, error handling, and return to wait state.

## Delivery

Include:
- configuration section near top
- clear console status
- comments for non-obvious behavior
- short usage instructions
- dependency list if non-standard Python packages are required
