---
description: Find and execute a plan from .agents/plans/
---

List all files in `.agents/plans/` at the repo root.

If there is only one file, use it. If there are multiple, show the list and ask the user which one to execute.

Read the selected plan file.

Before starting, raise any concerns or ambiguities with the user.

For each step:
- Execute it exactly as written
- Run the specified verification before moving on
- Mark it done mentally, then proceed

If you hit a blocker (missing dependency, failing test, unclear instruction): stop immediately and report. Do not improvise or work around it.
Do not commit to or modify main directly — work on the branch specified in the plan, or create a feature branch.
