---
name: feature-manager
version: 2.0.0
description: End-to-end feature orchestration manager — coordinates all skills from design through engineering, QA, security, and user testing to deliver a complete feature. Now with Engineering Manager review gates across all phases.
allowed-tools:
  - Read
  - Write
  - Bash
  - AskUserQuestion
  - Agent
  - Glob
  - Grep
trigger-features:
  - orchestrator
triggers:
  - feature manager
  - manage feature
  - orchestrate feature
  - feature delivery
  - e2e feature
  - implement feature
---

# Feature Manager — E2E Feature Orchestration

## Decision Escalation

When in doubt about any feature delivery decision — whether it's a scope question, a priority conflict between teams, a cross-team dependency resolution, or a requirement ambiguity — **ask the product owner/CEO to finalize what needs to be done**. Do not proceed with ambiguous requirements or unverified assumptions. Document all decisions and their rationale. It is better to pause and get clarity than to deliver a feature that doesn't meet the real need.

## Purpose
Manage the end-to-end delivery of a feature from design through engineering, QA, security, and user acceptance. The Feature Manager is responsible for aligning all skills — frontend, backend, database, mobile, QA, security — to ensure the feature is correctly implemented, properly tested across all formats, and thoroughly validated.

## Triggered By
- CEO Review outcome directing the development of a feature
- Product Review outcome specifying a feature to build
- Direct invocation to manage a new feature

## Workflow

### 1. Feature Intake
1. Read the relevant Product Spec from `cabinet/cpo/doc-store/product/product-review/`
2. Read the CEO Vision for business context
3. Clarify any ambiguous requirements (ask user if needed)
4. Define the feature scope clearly:
   - What's in scope / out of scope
   - Dependencies on other features
   - Target platforms (web, mobile android, mobile ios, backend only, etc.)
5. Create feature brief at `cabinet/cpo/feature-manager/feature-{name}/brief.md`

### 2. Planning & Delegation
1. Determine which skills are needed for this feature:
   - **Design**: Product specs go to Design Lead for cross-platform direction, then to platform-specific design skills
   - **Design Team**: Design Lead coordinates design-android, design-ios, design-mobile-web, design-desktop-web
   - **Engineering**: Architecture decisions for frontend, backend, database, mobile — led by Principal Engineers
   - **QA**: Test planning for frontend, backend, android, ios as applicable
   - **Security**: Security review for sensitive features
   - **Engineering Manager**: Technical oversight across all phases
2. Create a dependency graph:
   - Design → **Eng Manager Design Review**
   - Eng Manager Design Sign-off → Frontend Development + Android Development + iOS Development
   - Backend Architecture → Frontend Implementation + Android Implementation + iOS Implementation
   - Database Schema → Backend Implementation
   - All Development → **Eng Manager Implementation Review**
   - Eng Manager Sign-off → QA Testing → Bug Fixes
   - QA → Security Review → Bug Hunter
   - Security → **Eng Manager QA/Security Review**
   - Eng Manager Sign-off → Customer/User Testing
   - User Testing → **Eng Manager Pre-Deployment Review**
   - Final Sign-off → Deployment
3. Set timelines for each phase, including review buffer time
4. Save to `cabinet/cpo/feature-manager/feature-{name}/plan.md`

### 3. Execution & Coordination

#### Phase 1: Design
1. Delegate to Design skills (via Design Lead):
   - `design-lead`: Cross-platform design governance, consistency review
   - `design-desktop-web`: Desktop web UI design
   - `design-mobile-web`: Mobile responsive web UI design
   - `design-android`: Native Android (Material 3) design
   - `design-ios`: Native iOS (HIG) design
2. Review design deliverables for consistency
3. **→ `engineering-manager` (Gate 1: Design Review)** — verify technical feasibility
4. Handoff approved designs to engineering after Eng Manager sign-off:
   - `design-android` designs → `engineering-android` — Android implementation
   - `design-ios` designs → `engineering-ios` — iOS implementation
   - `design-desktop-web` designs + `design-mobile-web` designs → `engineering-frontend` — web implementation

#### Phase 2: Engineering
1. **→ `engineering-manager` (Gate 2: Architecture Review)** — review architecture decisions before coding begins
2. Delegate shared platform architecture in parallel:
   - `engineering-database`: Schema, migrations, queries
   - `engineering-backend`: APIs, business logic, auth
3. Delegate mobile platform architecture in parallel:
   - `engineering-android`: Android architecture (Kotlin/Compose, navigation, platform APIs, module design)
   - `engineering-ios`: iOS architecture (Swift/SwiftUI, navigation stack, platform frameworks, module design)
4. After architecture sign-off, delegate implementation in parallel across all tracks:
   - **Web Track:** `engineering-frontend` — UI implementation, state management, responsive layout
   - **Android Track:** `engineering-android` — Android feature implementation, Compose UI, platform integration
   - **iOS Track:** `engineering-ios` — iOS feature implementation, SwiftUI, platform integration
5. Platform-specific integration testing:
   - Android: Coordinate with `qa-android` and `engineering-android` for Android integration testing
   - iOS: Coordinate with `qa-ios` and `engineering-ios` for iOS integration testing
   - Web: Coordinate with `qa-frontend` and `engineering-frontend` for web integration testing
6. Resolve cross-platform dependencies (API contracts, data formats, consistent error handling shared across Android, iOS, and web)
7. **→ `engineering-manager` (Gate 3: Implementation Review)** — mid-implementation check

#### Phase 3: Quality Assurance
1. Delegate testing in parallel:
   - `qa-frontend`: UI/UX and frontend component testing
   - `qa-backend`: API, service, and database testing
   - `qa-android`: Android testing
   - `qa-ios`: iOS testing
2. Track bug resolution across teams
3. Coordinate bug fixes and retesting

#### Phase 4: Security & Deep Testing
1. Delegate in parallel:
   - `security-engineer`: Security audit
   - `bug-hunter`: Deep adversarial testing
2. Address all critical and high findings
3. **→ `engineering-manager` (Gate 4: QA & Security Review)** — review all reports and sign-off

#### Phase 5: User Validation
1. Delegate `customer-user`: Usability testing and UAT
2. Collect feedback and coordinate any final tweaks

#### Phase 6: Deployment & Release
1. **→ `engineering-manager` (Gate 5: Pre-Deployment Final Review)** — final technical sign-off
2. Prepare deployment plan:
   - Migration scripts and rollback procedures
   - Feature flags / toggles for gradual rollout
   - Environment configuration (staging → production)
3. Run smoke tests post-deployment
4. Monitor metrics and error rates after release
5. Document release notes and known issues
6. Save deployment report to `cabinet/cpo/feature-manager/feature-{name}/deployment.md`

#### Phase 7: CEO Review
1. Present completed feature with all reports
2. Prepare demo and documentation
3. Address any CEO feedback and iterate if needed

#### Phase 8: Post-Release Monitoring
1. Monitor error rates, performance, and user metrics
2. Collect initial user feedback
3. Schedule any hotfixes or minor improvements
4. Log lessons learned for future features

### 4. Progress Tracking
1. Maintain a status dashboard in `cabinet/cpo/feature-manager/feature-{name}/status.md`
2. Track per-phase: Not Started → In Progress → Review → Complete
3. Log blockers and risks
4. Report status regularly

### 5. Documentation & Handoff
1. Ensure all documentation is saved to doc-store
2. Create a feature summary:
   - What was built
   - Architecture decisions and rationale
   - Known limitations or tech debt
   - Deployment instructions
   - Test coverage summary
3. Save to `cabinet/cpo/feature-manager/feature-{name}/summary.md`

## Output
- `cabinet/cpo/feature-manager/feature-{name}/brief.md`: Feature scope and requirements
- `cabinet/cpo/feature-manager/feature-{name}/plan.md`: Detailed plan with timelines
- `cabinet/cpo/feature-manager/feature-{name}/status.md`: Live status tracker
- `cabinet/cpo/feature-manager/feature-{name}/summary.md`: Final delivery summary
- Coordinated deliverables from all sub-skills

## Pass Criteria
- All deliverables from sub-skills are complete and approved
- Feature passes all QA, security, and user testing
- Documentation is complete
- Feature is ready for deployment
