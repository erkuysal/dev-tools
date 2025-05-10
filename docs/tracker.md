# Dev Tools Improvement Tracker

This tracker organizes and prioritizes improvements for the Devtools system. Each task includes a status, owner, and notes section for progress tracking.

| Priority | Area                  | Task                                                                 | Status   | Owner  | Notes |
|----------|----------------------|----------------------------------------------------------------------|----------|--------|-------|
| 1        | Core Architecture    | Split into "Core" vs. "Plugins" architecture                        | [~]      |        | Documented in ARCHITECTURE.md as devtools |
| 2        | Core Architecture    | Implement `commands.d` pattern for modular CLI commands               | [x]      |        | Implemented: bin/devtools dispatches commands.d/*.sh |
| 3        | Configuration        | Document 3-tier config precedence (CLI > env > project > global)      | [~]      |        | Documented in commands.d/config.sh help output |
| 4        | Configuration        | Add `devtools config show` to print merged config                    | [~]      |        | commands.d/config.sh implemented |
| 5        | User Experience      | Add `devtools version` and `devtools self-update` commands          | [~]      |        | commands.d/version.sh and commands.d/self-update.sh implemented |
| 6        | User Experience      | Implement `devtools help` and `devtools list` for discovery         | [~]      |        | Enhanced dispatcher: help <command> supported; commands.d/list.sh implemented |
| 7        | Quality & Reliability| Integrate ShellCheck and Bats tests for core behaviors                | [ ]      |        |       |
| 8        | Quality & Reliability| Centralize error handling with `trap '...' ERR` logic                 | [ ]      |        |       |
| 9        | Extensibility        | Support Homebrew, APT, and Docker image distribution                  | [ ]      |        |       |
| 10       | Extensibility        | Define and open-source plugin standard                                | [ ]      |        |       |
| 11       | Documentation        | Auto-generate docs from `usage()` blocks                              | [ ]      |        |       |
| 12       | Documentation        | Create interactive `devtools tutorial` command                       | [ ]      |        |       |
| 13       | Project Automation   | Expand template support (web, backend, full-stack, monorepo, etc.)    | [ ]      |        |       |
| 14       | Containerization     | Enhance Dockerfile/Compose generation for all environments            | [ ]      |        |       |
| 15       | Deployment Pipeline  | Add advanced deployment strategies (rolling, blue-green, canary)      | [ ]      |        |       |
| 16       | Monitoring & Backup  | Integrate health checks, metrics, log aggregation, and backups        | [ ]      |        |       |
| 17       | Security             | Implement secret management, scanning, and compliance checks          | [ ]      |        |       |

**Legend:**
- [ ] = Not started
- [~] = In progress
- [x] = Complete

Feel free to update the status, assign owners, and add notes as work progresses. 