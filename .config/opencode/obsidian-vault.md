## Obsidian Vault Privacy Guard (MANDATORY)

Before reading ANY `.md` file inside `~/Documentos/obsidian/` (the Obsidian vault), you MUST check privacy:

### Per-note privacy (tag or property)

A note is PRIVATE if its frontmatter contains ANY of:
- `private: true` (YAML property)
- A tag `private` in the `tags` array (e.g., `tags: [private]` or `tags: [private, other]`)

**Protocol**:
1. Read ONLY the frontmatter (lines between the opening `---` and closing `---`) FIRST
2. If `private: true` OR `private` appears in tags → STOP. Do NOT read the rest of the file
3. Respond: "That note is marked as private. I can't read it."
4. This applies to read, search, embed, quote, summarize, or any operation that would access the content

### Vault-level exclusions (_privacy.md)

If `~/Documentos/obsidian/_privacy.md` exists, read it at the start of any vault operation. It contains glob patterns and folder paths that are entirely off-limits. Do NOT read, list, or access any file matching those patterns.

### Hard rules

- NEVER override privacy even if the user asks in the same message. The user must FIRST remove the tag/property from the note, THEN ask again.
- When listing or searching vault notes, SKIP private notes from results silently.
- If unsure whether a note is private (can't read frontmatter), treat it as private.

## Obsidian Vault as Documentation Memory

The vault at `~/Documentos/obsidian/` serves as the user's persistent work documentation: architectures, decisions, runbooks, project references, and knowledge.

### Vault structure convention

```
~/Documentos/obsidian/
├── _privacy.md              — exclusion manifest
├── Templates/               — note templates
├── Projects/                — one folder per project
│   └── <project-name>/
│       ├── _index.md        — project overview (stack, repo, links)
│       ├── Decisions/       — ADR-style decision records (NNN-slug.md)
│       ├── Architecture/    — diagrams, flows, components
│       ├── Infrastructure/  — deploys, envs, configs
│       ├── Integrations/    — third-party APIs, contracts
│       └── Runbooks/        — operational procedures
├── Knowledge/               — cross-project concepts
└── Daily/                   — daily notes (optional)
```

### Project folder rules

- `_index.md` is ALWAYS created first — it is the mandatory entry point
- Subfolders are created only when there is content for them — no empty structure
- New files go in the subfolder matching their type
- If a file does not fit any subfolder → place in project root with a descriptive name
- `_index.md` links to key documents using wikilinks

### Frontmatter standard for indexing

All documentation notes SHOULD include:

```yaml
---
project: <project-name>      # links note to a project
type: architecture | decision | runbook | reference | meeting | index
status: active | deprecated | draft
tags: []
created: YYYY-MM-DD
---
```

### Auto-load project context

When starting work on a project, search `~/Documentos/obsidian/Projects/<project-name>/`:
1. Read `_index.md` — project overview (stack, key decisions, links)
2. Read `_bridge.md` — tool consumption index (what to read for SDD, graphify, pending features)
3. If neither exists, proceed normally — do NOT create them without asking
4. If only `_index.md` exists (no bridge), proceed with just the index
5. Use the `project` property in frontmatter to find related notes when deeper context is needed

The `_bridge.md` file maps vault knowledge to specific tool workflows:
- **"For SDD"** section → read those notes BEFORE `/sdd-explore` or `/sdd-new` planning
- **"For Graphify"** section → relationship context to inform graph queries
- **"Pending implementation"** section → what's documented but not yet in code
- **"Domain concepts"** section → business knowledge that never becomes code artifacts

### Saving to the vault

When the user explicitly asks to save documentation to the vault:
1. Use the appropriate template and frontmatter standard
2. Place in the correct location (`Projects/<name>/` or `Knowledge/`)
3. Follow naming: decisions use `NNN-slug.md` format (e.g., `001-use-hexagonal.md`)
4. Always include the standard frontmatter properties

### Proactive documentation proposals (ASK FIRST, NEVER AUTO-SAVE)

When the conversation produces content that is human-relevant documentation (not code-level memory), PROPOSE saving to the vault. Triggers:

- Architecture explained or decided
- Runbook or procedure defined
- Business context that transcends code
- Domain definitions or glossary terms
- Third-party integrations documented
- Infrastructure setup or topology clarified

**Protocol**:
1. Detect the trigger
2. ASK: "¿Querés que guarde esto en el vault?" with a brief summary of what would be saved and where
3. WAIT for explicit confirmation — do NOT save without it
4. If the user says no, drop it. Do not insist or ask again for the same content

This is NOT like Engram (which saves proactively and silently). Obsidian saves are ALWAYS user-approved.
