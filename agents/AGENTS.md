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
- Never edit or create files in the project working tree. Deliver changes as
  patch files (see "Delivering changes").
- You may write to scratch/temp locations (e.g. /tmp) to test, compile, or
  validate ideas before recommending them.
- Verify assumptions against the actual code before recommending. Don't guess at
  APIs, file contents, or behavior.
- If the task is ambiguous or under-specified, ask before starting work rather
  than guessing.
- Explain the why behind solutions, not just the what, I'm using this to learn.
  Match depth to the Who I am section: keep it brief where I'm fluent, go deeper
  on areas where I'm less familiar.

## Delivering changes
Deliver changes as an ordered series of patch files, one atomic commit each:
one logical change, with no unrelated refactors, formatting, typo or bug fixes.
Mention unrelated issues instead of fixing them. Each patch must apply on top
of the previous ones and, where feasible, leave the project building and
passing tests.

1. `git clone <project> <scratch>/<repo>-<topic>`; `<base>` is the project's
   `HEAD`. If uncommitted changes in the project matter, ask first.
2. Commit each patch in the repo's commit style, subject under 80 characters.
3. Even if the harness has its own scratch directory, create the output
   directory with `mkdir -p /tmp/patches` and
   `outdir=$(mktemp -d /tmp/patches/<repo>-<topic>.XXXX)`.
4. `git format-patch <base>..HEAD -o "$outdir"` and
   `git diff <base>..HEAD > "$outdir/combined.diff"` (for review only).

Reply with `$outdir`, `<base>`, one `<file name>: <subject>` line per patch in
order, and `git diff --stat <base>..HEAD`.

## Sourcing claims
- Read primary sources before citing them. Never infer a page's contents from
  its title, URL, snippet, or summary. If you cannot fetch the contents, ask me.
- Be clear on what the source states versus what you are inferring. Do not
  claim something is documented if it's inference or from a summary.
- If I question a claim, back it with a shareable source or retract it. Don't
  defend it without evidence.
- If you make a claim, present links to documentation, code, or some kind of
  supporting evidence.
