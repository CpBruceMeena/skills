# Skills — AI-Powered Product Development Framework

A structured library of specialized AI agent skills that work together to take a product from vision to deployment. Each skill is a `SKILL.md` file that defines a role with deep expertise, workflows, outputs, and cross-references to other skills.

## Directory Structure

```
Skills/
├── audience/                          # External user personality archetypes
├── cabinet/
│   ├── ceo/                           # CEO — product vision & strategy
│   ├── cto/
│   │   ├── ciso/
│   │   │   ├── security-engineer/     # Principal Security Engineer
│   │   │   └── bug-hunter/            # Adversarial bug discovery
│   │   ├── engineering/
│   │   │   ├── engineering-manager/   # Engineering Manager — review gates
│   │   │   ├── engineering-frontend/  # Principal Frontend Engineer (web)
│   │   │   ├── engineering-backend/   # Principal Backend Engineer
│   │   │   ├── engineering-database/  # Principal Database Engineer
│   │   │   ├── engineering-android/   # Principal Android Engineer
│   │   │   ├── engineering-ios/       # Principal iOS Engineer
│   │   │   └── qa/
│   │   │       ├── qa-frontend/       # Principal QA — Frontend
│   │   │       ├── qa-backend/        # Principal QA — Backend
│   │   │       ├── qa-android/        # Principal QA — Android
│   │   │       └── qa-ios/            # Principal QA — iOS
│   │   └── tech-doc-manager/          # Doc-store schemas & standards
│   └── cpo/
│       ├── doc-store/                 # Central document registry (CPO)
│       ├── feature-manager/           # Feature orchestration & delivery
│       ├── design/
│       │   ├── design-lead/           # Design Lead — cross-platform governance
│       │   ├── design-android/        # Android (Material 3) design
│       │   ├── design-ios/            # iOS (HIG) design
│       │   ├── design-mobile-web/     # Mobile responsive web design
│       │   └── design-desktop-web/    # Desktop web design
│       └── product/
│           ├── product-review/        # Product Manager — feature breakdown
│           └── customer-user/         # User research & UAT
└── README.md                          # This file
```

## How It Works

Each skill is an expert agent with:
- **Deep domain expertise** — 8-12+ years of principal-level knowledge
- **Decision escalation rules** — clear guidance on when to ask for clarification
- **A defined workflow** — step-by-step processes for the task
- **Output paths** — documents are saved to `doc-store/` for traceability
- **Next Steps** — cross-references to the next skill(s) in the pipeline

Skills communicate through the **doc-store** (a structured documentation layer) and through explicit cross-references (e.g., "→ `engineering-android` — for Android implementation").

## Project Lifecycle

A product moves through 10 phases, each gated by the Engineering Manager:

```
Phase 0:  Understand Users           → audience/
Phase 1:  Define the Vision          → ceo-review
Phase 2:  Define Products & Features → product-review
Phase 3:  Design the Experience      → design-lead → platform designs
          Gate 1: Design Review       → engineering-manager
Phase 4:  Plan & Orchestrate         → feature-manager
Phase 5:  Engineering                 → database + backend + platform engineers
          Gate 2: Architecture Review → engineering-manager
          Gate 3: Implementation      → engineering-manager
Phase 6:  Quality Assurance           → qa-* (per platform)
Phase 7:  Security & Deep Testing     → security-engineer + bug-hunter
          Gate 4: QA & Security       → engineering-manager
Phase 8:  User Validation             → customer-user
Phase 9:  Deployment & Release        → feature-manager
          Gate 5: Pre-Deployment      → engineering-manager
Phase 10: Post-Release Strategy       → ceo-review (re-run)
```

## Getting Started

### Prerequisites

- [Codebuff](https://codebuff.com) CLI installed
- Git

### Step 1: Clone the Repository

```bash
git clone https://github.com/CpBruceMeena/skills.git
cd skills
```

### Step 2: Install Skills as Slash Commands (One-Time)

```bash
./scripts/setup-skills.sh
```

This symlinks all 24 skills into `~/.agents/skills/<name>/SKILL.md`, making them available as `/skill:<name>` commands in any Codebuff session.

### Step 3: Restart Codebuff

Restart the Codebuff CLI. Type `/skill:` to see all available skills.

That's it. You now have the full framework ready to use in any project.

## Integration into a New Project

Use this flow when starting a product from scratch — from idea to shipped code.

### The 10-Phase Lifecycle

```
Phase 0  Audience        → /skill:audience          3 user archetypes
Phase 1  Vision          → /skill:ceo-review        Product vision, roadmap, revenue
Phase 2  Product         → /skill:product-review     Feature breakdown, user stories
Phase 3  Design          → /skill:design-lead        Cross-platform UX + platform specs
                           Gate 1: Design Review
Phase 4  Orchestration   → /skill:feature-manager    Plan dependencies, timeline, teams
Phase 5  Engineering     → /skill:engineering-*      Database, backend, frontend, mobile
                           Gates 2 & 3: Architecture & Implementation Review
Phase 6  QA              → /skill:qa-*               Per-platform testing
Phase 7  Security        → /skill:security-engineer   Threat modeling, pen testing
                           Gate 4: QA & Security Review
Phase 8  User Testing    → /skill:customer-user       Usability testing, UAT
Phase 9  Deploy          → Gates 5 + feature-manager  Pre-deployment → release
Phase 10 Post-Launch     → /skill:ceo-review          Re-evaluate, iterate
```

### Walkthrough

**1. Define your users** → `/skill:audience`
Establish 3 user archetypes (Pragmatic Professional, Skeptical First-Timer, Power Scaler) that guide every decision downstream.

**2. Set the vision** → `/skill:ceo-review`
Answer: what problem, who it's for, revenue model, phased roadmap, success metrics. Produces a CEO Vision Document.

**3. Define products & features** → `/skill:product-review`
Break the vision into concrete products, features, user stories, and release planning.

**4. Design** → `/skill:design-lead` → platform designers
The Design Lead creates a cross-platform UX flow and delegates to:
- `design-desktop-web`, `design-mobile-web`, `design-android`, `design-ios`

**— Gate 1: Design Review → `/skill:engineering-manager`**

The Engineering Manager reviews all designs for technical feasibility before engineering begins.

**5. Orchestrate** → `/skill:feature-manager`
The Feature Manager plans the entire delivery: dependencies, timelines, team assignments, and tracks progress through every phase.

**6. Engineering** → Delegate to principal engineers
- `/skill:engineering-database` — Schema design, migrations
- `/skill:engineering-backend` — APIs, business logic
- `/skill:engineering-frontend` — Web UI
- `/skill:engineering-android` — Android native
- `/skill:engineering-ios` — iOS native

**— Gates 2 & 3: Engineering Manager reviews architecture and implementation**

**7. Quality Assurance** → Per-platform QA skills
- `/skill:qa-frontend`, `/skill:qa-backend`, `/skill:qa-android`, `/skill:qa-ios`

**8. Security** → `/skill:security-engineer` + `/skill:bug-hunter`

**— Gate 4: QA & Security Review**

**9. User validation** → `/skill:customer-user`

**— Gate 5: Pre-Deployment Review**

**10. Deploy & iterate** → Feature Manager orchestrates release. Re-run CEO review post-launch.

## Integration into an Existing / Running Project

Already have a codebase? You don't need to start from scratch. The skills work independently — pick the ones relevant to your current situation.

### Option A: Add a New Feature to an Existing App

```
1. /skill:product-review      → Define the feature (skip vision, go straight to feature breakdown)
2. /skill:design-lead          → UX flow for the new feature
3. /skill:feature-manager      → Plan and delegate engineering
4. Pick the engineering skill(s) you need:
   /skill:engineering-frontend   → Web frontend changes
   /skill:engineering-backend    → Backend API changes
   /skill:engineering-database   → Schema changes
   /skill:engineering-android    → Android changes
   /skill:engineering-ios        → iOS changes
5. /skill:qa-frontend            → Test the feature
6. /skill:engineering-manager    → Review gate before deploy
```

The Feature Manager handles orchestration regardless of whether it's a greenfield feature or adding to an existing app.

### Option B: Security Audit on an Existing Codebase

```bash
/skill:security-engineer     → Threat model, penetration testing, dependency audit
/skill:bug-hunter            → Adversarial edge-case testing, fuzzing
/skill:engineering-manager    → Review findings, prioritize fixes
```

### Option C: Performance Optimization

```bash
/skill:engineering-frontend   → Bundle analysis, render optimization, LCP/CLS audit
/skill:engineering-backend    → Query profiling, caching strategy, connection pooling
/skill:engineering-database   → Index analysis, query plan review, migration planning
```

### Option D: Pre-Launch Readiness

```bash
/skill:qa-ios                 → App Store readiness checklist, XCUITest review
/skill:qa-android             → Play Store readiness, baseline profiles, device matrix
/skill:security-engineer      → Final security sweep
/skill:engineering-manager    → Pre-deployment gate
```

### Option E: Post-Launch / Incident Review

```bash
/skill:bug-hunter             → Root cause analysis of production issue
/skill:engineering-frontend   → Fix frontend bugs, improve error handling
/skill:engineering-backend    → Fix backend issues, add monitoring
/skill:customer-user          → Gather user feedback on the fix
```

### Picking the Right Skill for Your Situation

| If you need to... | Start with this skill | Followed by... |
|---|---|---|
| Start a new product | `ceo-review` | `product-review` → `design-lead` → `feature-manager` |
| Add a feature to an existing app | `product-review` | `feature-manager` → relevant engineering skills |
| Fix a production bug | `engineering-*` (whichever platform) | `bug-hunter` for root cause |
| Improve performance | `engineering-frontend` / `engineering-backend` / `engineering-database` | — |
| Run a security audit | `security-engineer` | `bug-hunter` → `engineering-manager` |
| Prepare for App Store launch | `qa-ios` | `engineering-manager` |
| Prepare for Play Store launch | `qa-android` | `engineering-manager` |
| Run QA on a new feature | `qa-frontend` / `qa-backend` / `qa-android` / `qa-ios` | `engineering-manager` (Gate 4) |
| Test with real users | `customer-user` | `engineering-manager` |
| Review architecture | `engineering-manager` | Relevant principal engineer |
| Define documentation standards | `tech-doc-manager` | All teams |
| Understand your users | `audience` | All downstream decisions |

## Skill Index

### Strategic (Cabinet Level)

| Skill | Location | Role |
|---|---|---|
| `ceo-review` | `cabinet/ceo/` | Product vision, business strategy, phased roadmap |
| `product-review` | `cabinet/cpo/product/product-review/` | Feature breakdown, user stories, release planning |
| `design-lead` | `cabinet/cpo/design/design-lead/` | Cross-platform design governance, design system |
| `feature-manager` | `cabinet/cpo/feature-manager/` | End-to-end feature orchestration & delivery |
| `customer-user` | `cabinet/cpo/product/customer-user/` | User personas, usability testing, UAT |
| `tech-doc-manager` | `cabinet/cto/tech-doc-manager/` | Doc-store schemas, documentation standards |

### Design (Platform-Specific)

| Skill | Location | Platform |
|---|---|---|
| `design-android` | `cabinet/cpo/design/design-android/` | Native Android (Material Design 3) |
| `design-ios` | `cabinet/cpo/design/design-ios/` | Native iOS (Human Interface Guidelines) |
| `design-mobile-web` | `cabinet/cpo/design/design-mobile-web/` | Responsive mobile web |
| `design-desktop-web` | `cabinet/cpo/design/design-desktop-web/` | Desktop web |

### Engineering (Principal Level)

| Skill | Location | Expertise |
|---|---|---|
| `engineering-manager` | `cabinet/cto/engineering/engineering-manager/` | Technical oversight, review gates (5 gates) |
| `engineering-frontend` | `cabinet/cto/engineering/engineering-frontend/` | Web frontend (state management, performance, testing) |
| `engineering-backend` | `cabinet/cto/engineering/engineering-backend/` | Backend services (API design, auth, deployment) |
| `engineering-database` | `cabinet/cto/engineering/engineering-database/` | Schema design, migrations, query optimization |
| `engineering-android` | `cabinet/cto/engineering/engineering-android/` | Android (Kotlin, Compose, Material 3, Play Store) |
| `engineering-ios` | `cabinet/cto/engineering/engineering-ios/` | iOS (Swift, SwiftUI, HIG, App Store) |

### QA (Principal Level)

| Skill | Location | Focus |
|---|---|---|
| `qa-frontend` | `cabinet/cto/engineering/qa/qa-frontend/` | Web UI/component testing |
| `qa-backend` | `cabinet/cto/engineering/qa/qa-backend/` | API, integration, load, chaos testing |
| `qa-android` | `cabinet/cto/engineering/qa/qa-android/` | Android device matrix, ANR detection, baseline profiles |
| `qa-ios` | `cabinet/cto/engineering/qa/qa-ios/` | iOS device matrix, XCUITest, App Store readiness |

### Security

| Skill | Location | Focus |
|---|---|---|
| `security-engineer` | `cabinet/cto/ciso/security-engineer/` | Threat modeling, pen testing, compliance, incident response |
| `bug-hunter` | `cabinet/cto/ciso/bug-hunter/` | Adversarial testing, edge cases, fuzzing |

### Audience

| Skill | Location | Purpose |
|---|---|---|
| `audience` | `audience/` | 3 user archetypes: Pragmatic Professional, Skeptical First-Timer, Power Scaler |

### Doc-Store

| Skill | Location | Purpose |
|---|---|---|
| `doc-store` | `cabinet/cpo/doc-store/` | Central document registry (CPO-controlled — CEO vision, product specs, design specs, audience research) |

## Pipeline Flow

```
DESIGN PIPELINE:
  design-android → engineering-android → qa-android
  design-ios     → engineering-ios     → qa-ios
  design-mobile-web  → engineering-frontend → qa-frontend
  design-desktop-web → engineering-frontend → qa-frontend

ENGINEERING PIPELINE:
  engineering-database → engineering-backend
  engineering-frontend → qa-frontend
  engineering-android  → qa-android
  engineering-ios      → qa-ios

QUALITY PIPELINE:
  qa-* → engineering-manager (Gate 4) → security-engineer → bug-hunter

SECURITY PIPELINE:
  security-engineer → bug-hunter → engineering-manager (sign-off)

DELIVERY PIPELINE:
  All skills → engineering-manager (gates) → feature-manager → deployment
```

## Doc-Store Architecture

Each team writes documentation to a local `doc-store/` directory at the root of its skill folder. The CPO `doc-store/` acts as the central registry for cross-cutting artifacts.

**CPO doc-store structure:**
```
cabinet/cpo/doc-store/
├── ceo/{project-name}/vision-{date}.md
├── product/product-review/{project-name}/product-definition-{date}.md
├── design/design-lead/{project}/cross-platform-flow.md
├── design/design-lead/design-system/tokens-v{version}.md
├── design/design-android/{project}/feature-{name}/ui-spec.md
├── design/design-ios/{project}/feature-{name}/ui-spec.md
├── design/design-mobile-web/{project}/feature-{name}/ui-spec.md
├── design/design-desktop-web/{project}/feature-{name}/ui-spec.md
└── audience/{product}/personas.md
```

**CTO team doc-store structure (per team):**
```
cabinet/cto/{department}/{team}/doc-store/feature-{name}/
├── architecture.md
├── api-contracts.md
└── (varies by team — see tech-doc-manager for schemas)
```

## Invocation

Skills can be loaded from the Codebuff CLI in two ways:

### Slash Commands (Codebuff)

When installed via the setup script (see [Codebuff Integration](#codebuff-integration) below), every skill becomes a `/skill:<name>` slash command:

```
/skill:ceo-review           → Product vision & strategy
/skill:feature-manager       → End-to-end feature orchestration
/skill:engineering-android   → Principal Android Engineer
/skill:design-lead           → Cross-platform design governance
```

Type `/skill:` in Codebuff to see all available skills.

### Cross-References

Skills reference each other in "Next Steps" sections using `→ skill-name` format, telling you which skill to invoke next in the pipeline:

```
After iOS design:
1. → `design-lead` — for cross-platform consistency review
2. → `engineering-manager` — for design feasibility review
3. → `engineering-ios` — for iOS implementation
```

## Codebuff Integration

All 24 skills can be installed as global slash commands in Codebuff so they're available in any project.

### One-Time Setup

```bash
cd Skills/
./scripts/setup-skills.sh
```

This script:
1. Scans every `SKILL.md` in the `cabinet/` hierarchy
2. Reads the `name:` field from each skill's frontmatter
3. Creates a symlink at `~/.agents/skills/<name>/SKILL.md` pointing back to the source
4. Cleans up any stale symlinks for skills that no longer exist

After running, restart Codebuff. All skills appear under `/skill:`.

### Refreshing After Updates

If you add, rename, or edit a skill, re-run the setup script to refresh the symlinks. Changes to existing skills are reflected automatically (symlinks point to the live file).

### Per-Project Install (Alternative)

To install skills into a specific project's `.agents/skills/` directory instead of globally:

```bash
./scripts/setup-skills.sh --target /path/to/your/project
```

The script appends `.agents/skills/` automatically, so skills land in `/path/to/your/project/.agents/skills/`. Codebuff picks them up the next time you open that project.

You can also use a relative path:

```bash
./scripts/setup-skills.sh --target ../my-awesome-app
```

Or install into the current directory:

```bash
./scripts/setup-skills.sh --target .
```

**Note:** Some projects may already have `.claude/skills/` (Claude Code compatible). The setup script targets `.agents/skills/` which takes priority. You can create a symlink from `.claude/skills/` to `.agents/skills/` if you need both.

## Design Principles

1. **One skill per role** — each skill represents a single role with a clear scope of responsibility
2. **Principal-level depth** — every skill embeds 8-12+ years of domain expertise, not just task instructions
3. **Review gates at every phase** — the Engineering Manager provides 5 gates of oversight across the lifecycle
4. **Platform-specific split** — Android and iOS have separate design, engineering, and QA skills to respect platform differences
5. **Doc-store for traceability** — every decision is documented with a clear artifact in the doc-store
6. **Project-agnostic** — skills use templated placeholders (`{project-name}`, `{feature-name}`, `{date}`) so they work for any product
