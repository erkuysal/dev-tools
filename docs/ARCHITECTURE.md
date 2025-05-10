# Dev Tools Architecture

## Core vs. Plugins

### Core
- The core of dev-tools is the minimal dispatcher script: `bin/dev-tools`.
- It is responsible for:
  - Scanning the `commands.d/` directory for available commands.
  - Dispatching user input to the appropriate command script.
  - Providing help and listing available commands.
- The core contains no business logic or feature implementation.

### Plugins (Commands)
- All features and commands are implemented as standalone executable scripts in the `commands.d/` directory.
- Each script corresponds to a command (e.g., `commands.d/snapshot.sh` becomes `dev-tools snapshot`).
- To add a new command, simply drop an executable script into `commands.d/`.
- Commands can be written in any language, but should be executable and follow the naming convention `<command>.sh` (or another extension if appropriate).

## Extending Dev Tools

To add a new command (plugin):
1. Create a new script in `commands.d/`, e.g., `hello.sh`:

```bash
#!/usr/bin/env bash
# hello.sh - Example command
# Usage: dev-tools hello

echo "Hello from dev-tools!"
```

2. Make it executable:
```bash
chmod +x commands.d/hello.sh
```

3. Now you can run:
```bash
dev-tools hello
```

## Example Directory Structure
```
dev-tools/
  bin/
    dev-tools         # Core dispatcher
  commands.d/
    snapshot.sh       # Example command
    config.sh         # Example command
    version.sh        # Example command
    self-update.sh    # Example command
```

## Notes
- The system is designed to be easily extensible: just add or remove scripts in `commands.d/`.
- In the future, more advanced plugin mechanisms can be added (e.g., plugin manifests, plugin directories, etc.). 