# Skills — AI-Powered Product Development Framework

A structured library of specialized AI agent skills that work together to take a product from vision to deployment. Each skill is a `SKILL.md` file that defines a role with deep expertise, workflows, outputs, and cross-references to other skills.

**New in v3**: Strict sequential ordering (Design → Frontend → Backend → QA → User → Done), documentation-first movement tracking, Go-first for application backends / Python-first for adhoc work, Playwright CLI for all browser automation, and Open Design + UI-UX-Pro-Max + Motion for world-class design and animation.

---

## Quick Reference: The 7 Core Rules

Every feature implementation follows these rules in order:

| # | Rule | Detail |
|---|------|--------|
| 1 | **Design First** | Always invoke the designer skill before any engineering begins |
| 2 | **Frontend Before Backend** | Frontend is engineered first; it defines API contracts that backend implements |
| 3 | **Backend QA First** | QA validates backend APIs before testing the frontend UI |
| 4 | **User Validates Before Done** | No feature is marked complete until `customer-user` approves it |
| 5 | **Doc Every Step** | Every phase starts by creating/updating the movement log (`movement.md`) |
| 6 | **Go for Apps, Python for Adhoc** | Application-level work uses Go; scraping/media/doc/CSV uses Python |
| 7 | **Playwright for Browser Automation** | All browser testing uses `npx playwright` as first priority |

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

## End-to-End Feature Flow (How Features Get Built)

This is the **core workflow** — every feature follows this exact sequence. Read this to understand how all skills connect.

### The 6-Step Sequential Order (Mandatory for Frontend Features)

```
Step 1: DESIGN  ──→  Design Lead → platform designers (web, android, ios)
          │
          ├── Gate 1: Engineering Manager (Design Review)
          │
Step 2: FRONTEND ──→  Frontend engineering (web) + Mobile engineering (android, ios)
          │         Frontend defines API contracts
          ├── Gate 2: Engineering Manager (Architecture Review — Pass 1: frontend)
          │
Step 3: BACKEND  ──→  Database schema + Backend APIs (implements frontend's contracts)
          │
          ├── Gate 3: Engineering Manager (Implementation Review + Pass 2: backend arch)
          │
Step 4: QA       ──→  Backend QA first → Frontend QA second
          │         Security audit + Bug hunting
          ├── Gate 4: Engineering Manager (QA & Security Review)
          │
Step 5: USER     ──→  Customer-user validates the feature (UAT)
          │
Step 6: DONE     ──→  Feature Completion Gate → Deployment → CEO Review
          │
          ├── Gate 5: Engineering Manager (Pre-Deployment Review)
```

### Full Gate Trace (feature-manager ↔ engineering-manager)

| Phase | Feature Manager Invokes | Engineering Manager Gate | What Gets Reviewed |
|-------|------------------------|-------------------------|-------------------|
| Design | `design-lead` → platform designers | **Gate 1**: Design Review | UX flow, platform specs, technical feasibility |
| Frontend | `engineering-frontend`, `engineering-android`, `engineering-ios` | **Gate 2**: Architecture Review (Pass 1) | Frontend architecture, API contracts, mobile architecture |
| Backend | `engineering-database`, `engineering-backend` | **Gate 3**: Implementation Review (+ Pass 2) | Backend architecture, DB schema, implementation progress |
| QA | `qa-backend` → `qa-frontend`, `security-engineer`, `bug-hunter` | **Gate 4**: QA & Security Review | Test reports, security audit, performance benchmarks |
| User | `customer-user` (UAT) | — (external sign-off) | Usability, acceptance criteria, sign-off (APPROVED/CONDITIONALLY APPROVED/NOT APPROVED) |
| Done | Feature Completion Gate | **Gate 5**: Pre-Deployment Review | All gates passed, deployment plan, rollback strategy |

### Movement Log Resume Safety

Every step logs an entry in `feature-{name}/movement.md`. If the system stops mid-way (session timeout, context loss), the movement log provides the exact resume point:

```markdown
## Current Phase: Frontend
## Last Action: 2026-06-01 14:30 — Frontend architecture defined. API contracts documented.
### Next Step: Hand to Backend engineering
```

---

## Project Lifecycle

A product moves through 10 phases, each gated by the Engineering Manager. Steps 4-6 follow the sequential ordering above:

```
Phase 0:  Understand Users           → audience/
Phase 1:  Define the Vision          → ceo-review
Phase 2:  Define Products & Features → product-review
Phase 3:  Design the Experience      → design-lead → platform designs
          Gate 1: Design Review       → engineering-manager
Phase 4:  Plan & Orchestrate         → feature-manager (creates movement.md)
Phase 5:  Engineering (sequential)    → Frontend → Backend + Database
          Gate 2: Architecture        → engineering-manager (frontend pass)
          Gate 3: Implementation      → engineering-manager (backend pass + arch)
Phase 6:  Quality Assurance           → Backend QA → Frontend QA
Phase 7:  Security & Deep Testing     → security-engineer + bug-hunter
          Gate 4: QA & Security       → engineering-manager
Phase 8:  User Validation (Gate)      → customer-user (APPROVED required to mark Done)
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

### Walkthrough (With New Sequential Ordering)

**1. Define your users** → `/skill:audience`
Establish 3 user archetypes (Pragmatic Professional, Skeptical First-Timer, Power Scaler) that guide every decision downstream.

**2. Set the vision** → `/skill:ceo-review`
Answer: what problem, who it's for, revenue model, phased roadmap, success metrics. Produces a CEO Vision Document.

**3. Define products & features** → `/skill:product-review`
Break the vision into concrete products, features, user stories, and release planning.

**4. Design (Step 1)** → `/skill:design-lead` → platform designers
The Design Lead creates a cross-platform UX flow and delegates to:
- `design-desktop-web`, `design-mobile-web`, `design-android`, `design-ios`
- Each designer is equipped with **Open Design** skill set (72+ design systems, 5 visual directions)

**— Gate 1: Design Review → `/skill:engineering-manager`**

**5. Orchestrate** → `/skill:feature-manager`
Creates `brief.md` + `movement.md`. The movement log tracks every phase for resume safety.

**6. Frontend Engineering (Step 2 — Before Backend)** → sequential
- `/skill:engineering-frontend` — Web UI (uses **UI-UX-Pro-Max** design intelligence + **Motion** animations)
- `/skill:engineering-android` — Android native
- `/skill:engineering-ios` — iOS native
- Frontend defines **API contracts** that backend will implement

**— Gate 2: Engineering Manager (Architecture Review — Pass 1: frontend)**

**7. Backend Engineering (Step 3 — After Frontend)** → sequential
- `/skill:engineering-database` — Schema design, migrations
- `/skill:engineering-backend` — APIs, business logic (implements frontend's contracts)
  - **Go** for application-level work (APIs, services)
  - **Python** for adhoc work (scraping, audio/video/doc processing, CSV/Excel)

**— Gate 3: Engineering Manager (Implementation Review + Pass 2: backend architecture)**

**8. Quality Assurance (Step 4 — Backend First, Then Frontend)**
- **Backend QA first**: `/skill:qa-backend` — API, service, database testing
- **Frontend QA second**: `/skill:qa-frontend` — UI/UX against tested backend
- Mobile QA: `/skill:qa-android`, `/skill:qa-ios` (if applicable)
- All browser automation uses **Playwright CLI** (`npx playwright`) as 1st priority

**9. Security** → `/skill:security-engineer` + `/skill:bug-hunter`

**— Gate 4: QA & Security Review**

**10. User Validation (Step 5 — Gate Before Done)**
- `/skill:customer-user` — Usability testing and UAT
- Feature is **NOT** marked complete until user sign-off (APPROVED / CONDITIONALLY APPROVED)

**11. Feature Completion Gate (Step 6)**
- Verify all phases passed: Design ✅ Frontend ✅ Backend ✅ QA ✅ User ✅
- Mark **DONE** in movement tracker

**12. Deploy & iterate** → Gate 5 → Feature Manager orchestrates release → CEO review

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
DESIGN PIPELINE (equipped with Open Design skill set):
  design-android → engineering-android → qa-android
  design-ios     → engineering-ios     → qa-ios
  design-mobile-web  → engineering-frontend → qa-frontend
  design-desktop-web → engineering-frontend → qa-frontend

FRONTEND ENGINEERING (before backend — equipped with UI-UX-Pro-Max + Motion):
  engineering-frontend → (defines API contracts) → engineering-backend
  engineering-android  → (defines API contracts) → engineering-backend
  engineering-ios      → (defines API contracts) → engineering-backend

BACKEND ENGINEERING (after frontend — Go for apps / Python for adhoc):
  engineering-database → engineering-backend → qa-backend

QUALITY PIPELINE (Backend QA first, then Frontend QA):
  qa-backend → qa-frontend → engineering-manager (Gate 4) → security-engineer → bug-hunter

ALL BROWSER AUTOMATION (Playwright CLI as 1st priority):
  npx playwright test   → E2E, visual regression, API-through-browser
  npx playwright codegen → Test recording
  npx playwright test --ui → Interactive debugging

SECURITY PIPELINE:
  security-engineer → bug-hunter → engineering-manager (sign-off)

DELIVERY PIPELINE (sequential ordering enforced):
  Design → Gate 1 → Frontend → Gate 2 → Backend → Gate 3
    → QA (backend → frontend) → Gate 4 → User Validation → Done
      → Gate 5 → Deploy
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

---

## DevOps Engineer Guide: Build, Run & Deploy for All Tech

As a **Senior DevOps Engineer**, this section covers running and building the project across all tech stacks this framework targets.

### Technology Stack per Skill

| Skill | Language/Runtime | Build Tool | Package Manager | Key Dependencies |
|-------|-----------------|-----------|----------------|-----------------|
| `engineering-frontend` | TypeScript, JavaScript | Vite, Next.js, Astro | `npm` / `pnpm` / `bun` | React, Vue, Motion, Playwright, UI-UX-Pro-Max |
| `engineering-backend` | **Go** (apps) / **Python** (adhoc) / Node.js (real-time) | `go build`, `pip`, `npm` | Go modules / pip / npm | chi, gRPC, scrapy, pandas, pydub, moviepy, Pillow |
| `engineering-database` | SQL (PostgreSQL) | — | — | PostgreSQL 16+, pg_stat_statements |
| `engineering-android` | Kotlin | Gradle (Kotlin DSL) | Gradle / Maven Central | Jetpack Compose, Material 3, Room, Hilt |
| `engineering-ios` | Swift | Xcode, SwiftPM | Swift Package Manager | SwiftUI, SwiftData, WidgetKit |
| `qa-frontend` | TypeScript | Playwright CLI | `npm` | Playwright (`npx playwright`) |
| `qa-backend` | Go / Python / JavaScript | `go test`, `pytest`, `k6` | Go modules / pip / npm | Playwright CLI, k6, Pact |
| `qa-android` | Kotlin | Gradle | Gradle | Compose UI Test, Maestro, Paparazzi |
| `qa-ios` | Swift | Xcode | SwiftPM | XCUITest, Maestro, iOS Snapshot Testing |

### Quick Start Commands by Tech

#### Frontend (Web)
```bash
# Framework setup (pick one)
npm create vite@latest my-app -- --template react-ts
npx create-next-app@latest my-app --typescript

# Install Motion for animations
npm install motion

# Install Playwright for browser testing
npm init playwright@latest
npx playwright install

# Run tests
npx playwright test
npx playwright test --ui          # Interactive debugging
npx playwright codegen            # Record test from browser interactions
```

#### Backend (Go — Application Work)
```bash
# Initialize Go module
go mod init github.com/org/my-service

# Common frameworks
 go get github.com/go-chi/chi/v5    # HTTP router
go get google.golang.org/grpc      # gRPC
go get github.com/urfave/cli/v2    # CLI tools

# Build & run
go build -o ./bin/server ./cmd/server
./bin/server

# Test
go test ./... -v -race -count=1
go vet ./...
```

#### Backend (Python — Adhoc / Data / Media Work)
```bash
# Setup
python3 -m venv .venv
source .venv/bin/activate

# Common libraries
pip install scrapy beautifulsoup4    # Scraping
pip install pandas openpyxl           # CSV/Excel
pip install pydub librosa             # Audio
pip install moviepy opencv-python     # Video
pip install PyMuPDF python-docx       # Documents
pip install Pillow                     # Images

# Run scrapers / scripts
python3 scripts/scrape_data.py
python3 scripts/process_csv.py
```

#### Backend (Node.js — Real-time / I/O-heavy)
```bash
# Setup
npm init -y
npm install express ws uWebSockets.js

# Run
node server.js
```

#### Android
```bash
# Build
./gradlew assembleDebug

# Run tests
./gradlew testDebugUnitTest
./gradlew connectedDebugAndroidTest

# Baseline profiles
./gradlew :app:generateReleaseBaselineProfile

# Install on device
./gradlew installDebug
```

#### iOS
```bash
# Build
xcodebuild -project App.xcodeproj -scheme App build

# Run tests
xcodebuild test -scheme App -destination 'platform=iOS Simulator,name=iPhone 15'

# Archive for TestFlight
xcodebuild -scheme App -configuration Release archive -archivePath ./build/App.xcarchive
```

### CI/CD Pipeline Template

```yaml
# .github/workflows/feature-pipeline.yml
name: Feature Pipeline
on: [push, pull_request]

jobs:
  backend-go:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-go@v5
        with: { go-version: '1.23' }
      - run: go build ./...
      - run: go test ./... -v -race -count=1
      - run: go vet ./...

  backend-python:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with: { python-version: '3.12' }
      - run: pip install -r requirements.txt
      - run: pytest

  frontend:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: '22' }
      - run: npm ci
      - run: npx playwright install --with-deps
      - run: npm run build
      - run: npx playwright test

  android:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-java@v4
        with: { distribution: 'temurin', java-version: '17' }
      - run: ./gradlew assembleDebug
      - run: ./gradlew testDebugUnitTest

  ios:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v4
      - run: xcodebuild test -scheme App -destination 'platform=iOS Simulator,name=iPhone 15'

  security-audit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm audit --audit-level=high        # JS dependencies
      - run: go install golang.org/x/vuln/cmd/govulncheck@latest
      - run: govulncheck ./...                   # Go vulnerabilities
      - run: pip install pip-audit && pip-audit  # Python vulnerabilities
```

### Running the Framework Locally

```bash
# 1. Clone and install skills
cd Skills
./scripts/setup-skills.sh

# 2. Open Codebuff in any project directory
cd /path/to/your/project

# 3. Start a feature
/skill:feature-manager
# Creates: cabinet/cpo/feature-manager/feature-{name}/brief.md
# Creates: cabinet/cpo/feature-manager/feature-{name}/movement.md

# 4. Follow the sequential order (see E2E Feature Flow above)
# The movement.md log tracks every step for resume safety
```

---

## Design Principles

1. **One skill per role** — each skill represents a single role with a clear scope of responsibility
2. **Principal-level depth** — every skill embeds 8-12+ years of domain expertise, not just task instructions
3. **Review gates at every phase** — the Engineering Manager provides 5 gates of oversight across the lifecycle
4. **Platform-specific split** — Android and iOS have separate design, engineering, and QA skills to respect platform differences
5. **Doc-store for traceability** — every decision is documented with a clear artifact in the doc-store
6. **Project-agnostic** — skills use templated placeholders (`{project-name}`, `{feature-name}`, `{date}`) so they work for any product
