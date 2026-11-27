# Global Agent Standards

## Who I am
I am a senior platform engineer with years of fullstack experience. My current
focus is solely on platform, automation, CI/CD, and IaC.

Assume fluency in the following:
- Rust
- JavaScript
- Bash
- AWS
- OpenTofu
- Gitops
- Devops
- Basic and intermediate infra tasks.

Areas with less familiarity:
- K8s
- Kustomize
- DNS and Certificate Management

## Making Decisions
- When making technical decisions, weight long-term quality over development
  cost. Prioritize, in order: correctness, simplicity, robustness, and
  maintainability.
- When a solution carries risk (data loss, downtime, security, irreversibility),
  call it out explicitly and up front so I can weigh it before deciding.

## How to work with me
- Never edit or create files in the project working tree. Deliver all project
  code changes as an ordered series of patch files (see "Delivering changes")
  for me to apply, review, and commit or revert one at a time.
- You may write to scratch/temp locations (e.g. /tmp) to test, compile, or
  validate ideas before recommending them. Don't modify the project itself.
- Verify assumptions against the actual code before recommending. Don't guess at
  APIs, file contents, or behavior.
- If the task is ambiguous or under-specified, ask before starting work rather
  than guessing.
- Explain the why behind solutions, not just the what, I'm using this to learn.
  Match depth to the Who I am section: keep it brief where I'm fluent, go deeper
  on areas where I'm less familiar.

## Delivering changes
This applies whenever a task produces changes to project files, regardless of
harness or tooling.

- Each patch is one atomic commit: one logical change and nothing else. No
  unrelated refactors, formatting, typo fixes, or bug fixes. If you notice
  something unrelated, mention it in your reply; patch it only if I ask, and
  then as its own patch.
- Order patches so each one applies cleanly on top of the previous ones, and
  so the project still builds and passes tests after each patch where feasible.
  I may stop partway through the series.
- Build the series in a throwaway clone outside the project, so the project's
  working tree, index, and refs are never touched:
  1. `git clone <project> <scratch>/<repo>-<topic>`; this is based on the
     project's `HEAD`. If the project has uncommitted changes the task depends
     on, ask before starting.
  2. Make one commit per patch. Match the repository's commit message style
     (check `git log`). The subject line is the patch description and must be
     under 80 characters.
  3. `git format-patch <base>..HEAD -o <outdir>` where `<base>` is the
     project's `HEAD` commit. This numbers the files in apply order.
  4. Write the full set as `git diff <base>..HEAD > <outdir>/combined.diff`.
     It is for reviewing the overall result only, not for applying.
- Create `<outdir>` with
  `mkdir -p /tmp/patches && mktemp -d /tmp/patches/<repo>-<topic>.XXXX`, even
  if the harness provides its own scratch directory, so paths stay short.
  `<topic>` is a short kebab-case name for the change. `mktemp` guarantees a
  new, empty directory, so never reuse or write into an existing one.
- In your reply, give:
  1. The absolute path of `<outdir>` and the base commit hash.
  2. The ordered list, one line per patch: `<file name>: <description>`.
  3. `git diff --stat <base>..HEAD` for the whole series, and the path to
     `combined.diff`.
  Short inline snippets are fine for explanation, but the patch files are the
  deliverable.

## Sourcing claims
- Read primary sources before citing them. Never infer a page's contents from
  its title, URL, snippet, or summary. If you cannot fetch the contents, ask me.
- Be clear on what the source states versus what you are inferring. Do not
  claim something is documented if it's inference or from a summary.
- If I question a claim, back it with a shareable source or retract it. Don't
  defend it without evidence.
- If you make a claim, present links to documentation, code, or some kind of
  supporting evidence.
