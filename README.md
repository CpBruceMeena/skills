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

## Quick Start

To start a **new project**:

1. **Define your users** → Load `audience/` to establish 3 user archetypes
2. **Set the vision** → Load `cabinet/ceo/` — answers: what, who, why, and how
3. **Define products** → Load `cabinet/cpo/product/product-review/` — breaks vision into features
4. **Design** → Load `cabinet/cpo/design/design-lead/` — creates cross-platform UX + delegates to platform designers
5. **Orchestrate** → Load `cabinet/cpo/feature-manager/` — plans and delegates all engineering, QA, and security work
6. **Build, test, ship** — The Feature Manager coordinates the full delivery pipeline

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

To install skills for a specific project instead of globally:

```bash
cd /path/to/your/project
mkdir -p .agents/skills
# Symlink only the skills you need for this project
ln -s /path/to/Skills/cabinet/ceo .agents/skills/ceo-review
```

## Design Principles

1. **One skill per role** — each skill represents a single role with a clear scope of responsibility
2. **Principal-level depth** — every skill embeds 8-12+ years of domain expertise, not just task instructions
3. **Review gates at every phase** — the Engineering Manager provides 5 gates of oversight across the lifecycle
4. **Platform-specific split** — Android and iOS have separate design, engineering, and QA skills to respect platform differences
5. **Doc-store for traceability** — every decision is documented with a clear artifact in the doc-store
6. **Project-agnostic** — skills use templated placeholders (`{project-name}`, `{feature-name}`, `{date}`) so they work for any product
