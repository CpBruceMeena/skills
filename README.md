# Skills — AI-Powered Product Development Framework

A structured library of specialized AI agent skills that work together to take a product from vision to deployment. Each skill is a `SKILL.md` file that defines a role with deep expertise, workflows, outputs, and cross-references to other skills.

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

## Skills Org Chart

The skills form an organizational hierarchy where parent directors control their sub-skills. Each box represents a `/skill:<name>` you can invoke. Sub-skills can only be invoked through their parent director.

```
                              ┌──────────────────────────────────────┐
      ┌───────────────────────│        Cabinet Director              │
      │                       │        /skill:cabinet                │
      │                       └────────────────┬─────────────────────┘
      │                    ┌───────────────────┼───────────────────┐
      ▼                    ▼                   ▼                   ▼
┌─────────────┐  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│   Audience  │  │  CEO / ceo-     │  │   CPO           │  │   CTO           │
│ /skill:audi-│  │  review         │  │ /skill:cpo      │  │ /skill:cto      │
│ ence        │  │ /skill:ceo-     │  └────────┬────────┘  └────────┬────────┘
│(standalone) │  │ review           │           │                    │
└─────────────┘  └─────────────────┘           │                    │
                      ┌────────────────────────┼────────────────────┘
                      │                        │
                      ▼                        ▼                                  
          ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────────────┐                     
          │  Feature Manager  │  │ Product Review   │  │    Design Lead           │                     
          │ /skill:feature-   │  │ /skill:product-  │  │ /skill:design-lead       │                     
          │ manager           │  │ review           │  └───────────┬──────────────┘                     
          └──────────────────┘  ├──────────────────┤              │                                      
                                │ customer-user    │     ┌────────┼────────┐                             
                                │ /skill:customer- │     ▼        ▼        ▼                             
                                │ user             │  ┌────────┐ ┌────────┐ ┌───────┐                    
                                └──────────────────┘  │design- │ │design- │ │design-│                    
                                                       │android │ │  ios   │ │desktop│                    
                  ┌────────────────────────────────┐   └────────┘ └────────┘ └───────┘                    
                  │         Video Director          │                        │                             
                  │      /skill:video-director       │                  ┌────────┐                         
                  └──┬──────────┬──────────┬────────┘                  │design- │                         
                     │          │          │                            │mobile  │                         
                     ▼          ▼          ▼                            │  web   │                         
               ┌────────┐ ┌────────┐ ┌────────┐                       └────────┘                         
               │script- │ │voice-  │ │animator│                                                           
               │writer  │ │over    │ └────────┘                                                           
               └────────┘ └────────┘     │                                                                 
                                   ┌──────────┐  ┌────────┐  ┌──────────┐                                 
                                   │ remotion │  │ editor │  │packaging │                                 
                                   └──────────┘  └────────┘  └──────────┘                                 
                                                                                                          
               ┌──────────────────────────────────────────────────────────────────────────┐                
               │                         CTO (continued)                                  │                
               └──────────────────────────────────────────────────────────────────────────┘                
                                                    │                                                   
                          ┌─────────────────────────┼─────────────────────────────┐                     
                          ▼                         ▼                             ▼                     
               ┌────────────────────┐  ┌────────────────────┐  ┌────────────────────┐                    
               │Engineering Manager │  │  Tech Doc Manager  │  │       CISO         │                    
               │/skill:engineering- │  │ /skill:tech-doc-   │  │ /skill:ciso        │                    
               │manager              │  │ manager             │  └─────────┬──────────┘                    
               └──────────┬─────────┘  └────────────────────┘            │                              
                          │                                        ┌─────┴─────┐                        
             ┌────────────┼────────────┬───────────┬──────────┐    ▼           ▼                        
             ▼            ▼            ▼           ▼          ▼  ┌──────────┐ ┌──────────┐              
        ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐  │security- │ │bug-hunter│              
        │frontend│ │backend │ │database│ │android │ │  ios   │  │engineer  │ └──────────┘              
        └────────┘ └────────┘ └────────┘ └────────┘ └────────┘  └──────────┘
             ├────────────┼────────────┼───────────┤
             ▼            ▼            ▼           ▼
        ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐
        │  qa-   │ │  qa-   │ │  qa-   │ │  qa-   │
        │frontend│ │backend │ │android │ │  ios   │
        └────────┘ └────────┘ └────────┘ └────────┘                                           
```

## Directory Structure

```
Skills/
├── audience/                          # External user personality archetypes
├── cabinet/                           # Cabinet — Executive Board
│   ├── SKILL.md                       # Cabinet Director (top-level parent)
│   ├── ceo/                           # CEO — product vision & strategy
│   ├── cto/
│   │   ├── ciso/                      # CISO — security parent director
│   │   │   ├── SKILL.md               # CISO skill
│   │   │   ├── security-engineer/     # Principal Security Engineer
│   │   │   └── bug-hunter/            # Adversarial bug discovery
│   │   ├── engineering-manager/       # Engineering Manager — parent director
│   │   │   ├── SKILL.md               # Engineering Manager skill
│   │   │   ├── frontend/              # Principal Frontend Engineer (web)
│   │   │   ├── backend/               # Principal Backend Engineer
│   │   │   ├── database/              # Principal Database Engineer
│   │   │   ├── android/               # Principal Android Engineer
│   │   │   ├── ios/                   # Principal iOS Engineer
│   │   │   ├── qa-frontend/           # Principal QA — Frontend
│   │   │   ├── qa-backend/            # Principal QA — Backend
│   │   │   ├── qa-android/            # Principal QA — Android
│   │   │   └── qa-ios/                # Principal QA — iOS
│   │   └── tech-doc-manager/          # Doc-store schemas & standards
│   └── cpo/
│       ├── SKILL.md                   # CPO — Chief Product Officer
│       ├── feature-manager/           # Feature orchestration & delivery
│       ├── design-lead/               # Design Lead — parent director
│       │   ├── SKILL.md               # Design Lead skill
│       │   ├── design-android/        # Android (Material 3) design
│       │   ├── design-ios/            # iOS (HIG) design
│       │   ├── design-desktop-web/    # Desktop web design
│       │   └── design-mobile-web/     # Mobile responsive web design
│       ├── product-review/            # Product Manager — parent director
│       │   ├── SKILL.md               # Product Review skill
│       │   └── customer-user/         # User research & UAT
│       └── video-director/            # Video Director — parent director
│           ├── SKILL.md               # Video Director skill
│           ├── scriptwriter/          # Scripts, storyboards, narrative
│           ├── animator/              # Motion graphics, 2D/3D animation
│           ├── editor/                # Post-production editing & export
│           ├── voiceover/             # AI voiceover, music, sound design
│           ├── remotion/              # Programmatic video with Remotion
│           └── packaging/             # Thumbnails, metadata, distribution
└── README.md                          # This file
```

## How It Works

Each skill is an expert agent with deep domain expertise, a defined workflow, decision escalation rules, output paths to `doc-store/`, and Next Steps cross-referencing other skills. Parent directors control their sub-skills — sub-skills can only be invoked through their parent.

## End-to-End Feature Flow (How Features Get Built)

```
Step 1: DESIGN  ──→  Design Lead → platform designers
          ├── Gate 1: Engineering Manager (Design Review)
Step 2: FRONTEND ──→  Frontend (web + mobile) — defines API contracts
          ├── Gate 2: Engineering Manager (Architecture Review)
Step 3: BACKEND  ──→  Database schema + Backend APIs (implements frontend contracts)
          ├── Gate 3: Engineering Manager (Implementation Review)
Step 4: QA       ──→  Backend QA first → Frontend QA second + Security audit
          ├── Gate 4: Engineering Manager (QA & Security Review)
Step 5: USER     ──→  Customer-user validates the feature (UAT)
Step 6: DONE     ──→  Feature Completion Gate → Deployment
          ├── Gate 5: Engineering Manager (Pre-Deployment Review)
```



## Getting Started

```bash
git clone https://github.com/CpBruceMeena/skills.git
cd skills
./scripts/setup-skills.sh
```

Then restart Codebuff. All 34 skills appear under `/skill:`.

## Project Lifecycle

```
Phase 0  Audience        → /skill:audience
Phase 1  Vision          → /skill:ceo-review
Phase 2  Product         → /skill:product-review
Phase 3  Design          → /skill:design-lead       Gate 1: Design Review
Phase 4  Orchestration   → /skill:feature-manager
Phase 5  Engineering     → /skill:engineering-*     Gates 2 & 3: Arch & Impl Review
Phase 6  QA              → /skill:qa-*              Per-platform testing
Phase 7  Security        → /skill:security-engineer  Gate 4: QA & Security Review
Phase 8  User Testing    → /skill:customer-user      UAT (must approve)
Phase 9  Deploy          → Gate 5 + feature-manager
Phase 10 Post-Launch     → /skill:ceo-review
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

Each folder in the cabinet is a skill with a `SKILL.md` file. Parent skills control their sub-skills and are responsible for invoking them.

| Skill | Location | Role |
|---|---|---|
| `cabinet` | `cabinet/` | Cabinet Director — top-level parent over CEO, CPO, CTO |
| `ceo-review` | `cabinet/ceo/` | Product vision, business strategy, phased roadmap |
| `cpo` | `cabinet/cpo/` | CPO — parent director for product, design, video |
| `cto` | `cabinet/cto/` | CTO — parent director for engineering, security |
| `feature-manager` | `cabinet/cpo/feature-manager/` | End-to-end feature orchestration & delivery |
| `product-review` | `cabinet/cpo/product-review/` | Feature breakdown, user stories, release planning |
| `customer-user` | `cabinet/cpo/product-review/customer-user/` | User personas, usability testing, UAT |
| `design-lead` | `cabinet/cpo/design-lead/` | Cross-platform design governance, design system |
| `design-android` | `cabinet/cpo/design-lead/design-android/` | Native Android (Material Design 3) |
| `design-ios` | `cabinet/cpo/design-lead/design-ios/` | Native iOS (Human Interface Guidelines) |
| `design-desktop-web` | `cabinet/cpo/design-lead/design-desktop-web/` | Desktop web |
| `design-mobile-web` | `cabinet/cpo/design-lead/design-mobile-web/` | Responsive mobile web |
| `video-director` | `cabinet/cpo/video-director/` | End-to-end video production governance & quality |
| `video-scriptwriter` | `cabinet/cpo/video-director/scriptwriter/` | Scriptwriting, storyboarding, narrative design |
| `video-animator` | `cabinet/cpo/video-director/animator/` | Motion graphics, 2D/3D animation, VFX |
| `video-editor` | `cabinet/cpo/video-director/editor/` | Post-production editing, color grading, export |
| `video-voiceover` | `cabinet/cpo/video-director/voiceover/` | AI voiceover, music composition, sound design |
| `video-remotion` | `cabinet/cpo/video-director/remotion/` | Programmatic video with Remotion (React-based) |
| `video-packaging` | `cabinet/cpo/video-director/packaging/` | Thumbnails, metadata, SEO, distribution |
| `engineering-manager` | `cabinet/cto/engineering-manager/` | Technical oversight, review gates (5 gates) |
| `engineering-frontend` | `cabinet/cto/engineering-manager/frontend/` | Web frontend (state management, performance) |
| `engineering-backend` | `cabinet/cto/engineering-manager/backend/` | Backend services (API design, auth, deployment) |
| `engineering-database` | `cabinet/cto/engineering-manager/database/` | Schema design, migrations, query optimization |
| `engineering-android` | `cabinet/cto/engineering-manager/android/` | Android (Kotlin, Compose, Material 3, Play Store) |
| `engineering-ios` | `cabinet/cto/engineering-manager/ios/` | iOS (Swift, SwiftUI, HIG, App Store) |
| `qa-frontend` | `cabinet/cto/engineering-manager/qa-frontend/` | Web UI/component testing |
| `qa-backend` | `cabinet/cto/engineering-manager/qa-backend/` | API, integration, load, chaos testing |
| `qa-android` | `cabinet/cto/engineering-manager/qa-android/` | Android device matrix, ANR detection |
| `qa-ios` | `cabinet/cto/engineering-manager/qa-ios/` | iOS device matrix, XCUITest, App Store readiness |
| `ciso` | `cabinet/cto/ciso/` | CISO — security parent director |
| `security-engineer` | `cabinet/cto/ciso/security-engineer/` | Threat modeling, pen testing, compliance |
| `bug-hunter` | `cabinet/cto/ciso/bug-hunter/` | Adversarial testing, edge cases, fuzzing |
| `tech-doc-manager` | `cabinet/cto/tech-doc-manager/` | Doc-store schemas, documentation standards |
| `audience` | `audience/` | 3 user archetypes: Pragmatic Professional, Skeptical First-Timer, Power Scaler |

## Pipeline Flow

```
DESIGN PIPELINE (under design-lead):
  design-lead → design-android → engineering-android → qa-android
  design-lead → design-ios     → engineering-ios     → qa-ios
  design-lead → design-mobile-web  → engineering-frontend → qa-frontend
  design-lead → design-desktop-web → engineering-frontend → qa-frontend

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

VIDEO PRODUCTION PIPELINE (invoked by feature-manager):
  video-director → (delegates to sub-skills):
    ├── video-scriptwriter  → script & storyboard
    ├── video-voiceover     → voiceover, music, sound design
    ├── video-animator      → motion graphics & animation
    ├── video-remotion      → programmatic video rendering
    ├── video-editor        → post-production assembly & export
    └── video-packaging     → thumbnails, metadata, distribution

DELIVERY PIPELINE (sequential ordering enforced):
  Design → Gate 1 → Frontend → Gate 2 → Backend → Gate 3
    → QA (backend → frontend) → Gate 4 → User Validation → Done
      → Gate 5 → Deploy
```

## Doc-Store Architecture

Each skill writes documentation to a `doc-store/` directory within its folder. Created dynamically when documents are saved.

```
cabinet/doc-store/                           (Cabinet Director)
cabinet/ceo/doc-store/                       (CEO / ceo-review)
cabinet/cpo/{team}/doc-store/                (CPO teams)
cabinet/cto/{department}/{team}/doc-store/   (CTO teams)
audience/doc-store/                          (Audience)
```

## Invocation

Skills are loaded via `/skill:<name>` in Codebuff. Type `/skill:` to see all available commands. Skills cross-reference each other in "Next Steps" sections using `→ skill-name` format.

## Codebuff Integration

All skills can be installed as global slash commands in Codebuff so they're available in any project.

### One-Time Setup

```bash
cd Skills/
./scripts/setup-skills.sh
```

This script:
1. Scans every `SKILL.md` in the project hierarchy
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

## Design Principles

1. **One skill per role** — each skill represents a single role with a clear scope of responsibility
2. **Principal-level depth** — every skill embeds 8-12+ years of domain expertise
3. **Review gates at every phase** — Engineering Manager provides 5 gates of oversight
4. **Platform-specific split** — Android and iOS have separate design, engineering, and QA skills
5. **Doc-store for traceability** — every decision is documented with a clear artifact
6. **Project-agnostic** — skills use templated placeholders (`{project-name}`, `{feature-name}`) so they work for any product
