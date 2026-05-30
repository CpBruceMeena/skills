---
name: tech-doc-manager
version: 1.0.0
description: Technical documentation manager — defines doc-store schemas, documentation standards, and quality gates for all CTO engineering, QA, and security teams.
allowed-tools:
  - Read
  - Write
  - Bash
  - AskUserQuestion
  - Agent
  - Glob
  - Grep
triggers:
  - tech docs
  - documentation standards
  - doc store schema
  - technical documentation
  - doc quality
  - documentation review
---

# Tech Doc Manager — CTO Documentation Governance

## Decision Escalation

When in doubt about any documentation standard decision — whether it's a schema structure choice, a naming convention, a required document type, or a quality threshold — **ask the engineering manager or CTO to finalize what needs to be done**. Do not proceed with ambiguous documentation requirements. Document all decisions and their rationale so the technical documentation remains consistent and valuable.

## Purpose

Define and enforce documentation standards across all CTO teams. Each team (engineering, QA, security, bug-hunting) maintains its own doc-store within its skill directory. This skill ensures those doc-stores are consistent, complete, and discoverable.

## Triggered By

- New CTO skill being created (doc-store schema needed)
- Documentation quality review
- Cross-team document discovery
- Onboarding new team members

## CTO Team Doc-Store Schemas

Each CTO team maintains a `doc-store/` directory at the root of its skill folder. Below are the required schemas for each team.

### Engineering Teams

#### Engineering Frontend
```
cabinet/cto/engineering/engineering-frontend/doc-store/
└── feature-{name}/
    ├── architecture.md           # Frontend architecture & tech stack decisions
    ├── component-tree.md         # Component hierarchy & dependencies
    └── api-contracts.md          # API contracts consumed by frontend
```

#### Engineering Backend
```
cabinet/cto/engineering/engineering-backend/doc-store/
└── feature-{name}/
    ├── architecture.md           # Backend architecture & service design
    ├── api-design.md             # REST/GraphQL API design documents
    └── deployment.md             # Deployment guide & infrastructure
```

#### Engineering Database
```
cabinet/cto/engineering/engineering-database/doc-store/
└── feature-{name}/
    ├── schema.md                 # Database schema design
    ├── migrations.md             # Migration plans & rollback strategies
    └── queries.md                # Performance-critical queries & indexes
```

#### Engineering Android
```
cabinet/cto/engineering/engineering-android/doc-store/
└── feature-{name}/
    ├── architecture.md           # Android architecture & Compose design
    ├── navigation.md             # Navigation graph & screen flow
    └── api-contracts.md          # API contracts consumed by Android app
```

#### Engineering iOS
```
cabinet/cto/engineering/engineering-ios/doc-store/
└── feature-{name}/
    ├── architecture.md           # iOS architecture & SwiftUI design
    ├── navigation.md             # Navigation stack & screen flow
    └── api-contracts.md          # API contracts consumed by iOS app
```

#### Engineering Manager
```
cabinet/cto/engineering/engineering-manager/doc-store/
└── feature-{name}/
    ├── design-review.md          # Design feasibility sign-off
    ├── architecture-review.md    # Architecture decision sign-off
    ├── implementation-review.md  # Mid-implementation status review
    ├── qa-security-review.md     # QA & security gate sign-off
    └── final-sign-off.md         # Pre-deployment final sign-off
```

### QA Teams

#### QA Frontend
```
cabinet/cto/engineering/qa/qa-frontend/doc-store/
└── feature-{name}/
    ├── test-plan.md              # Frontend test strategy & plan
    ├── test-report.md            # Test execution results
    └── bug-log.md                # Bug tracking log
```

#### QA Backend
```
cabinet/cto/engineering/qa/qa-backend/doc-store/
└── feature-{name}/
    ├── test-plan.md              # Backend test strategy & plan
    ├── test-report.md            # Test execution results
    ├── load-test-report.md       # Load & performance test results
    └── bug-log.md                # Bug tracking log
```

#### QA Android
```
cabinet/cto/engineering/qa/qa-android/doc-store/
└── feature-{name}/
    ├── test-plan.md              # Android test strategy & plan
    ├── test-report.md            # Test execution results
    └── bug-log.md                # Bug tracking log
```

#### QA iOS
```
cabinet/cto/engineering/qa/qa-ios/doc-store/
└── feature-{name}/
    ├── test-plan.md              # iOS test strategy & plan
    ├── test-report.md            # Test execution results
    └── bug-log.md                # Bug tracking log
```

### Security Teams

#### Security Engineer
```
cabinet/cto/ciso/security-engineer/doc-store/
└── feature-{name}/
    ├── threat-model.md           # Threat modeling analysis
    ├── audit-report.md           # Security audit findings
    ├── dependency-report.md      # Dependency vulnerability scan
    └── clearance.md              # Security clearance sign-off
```

#### Bug Hunter
```
cabinet/cto/ciso/bug-hunter/doc-store/
├── findings-{date}.md            # All bug findings with reproduction steps
└── hunting-log-{session}.md     # Session log with test cases tried
```

## Documentation Standards

### Required Metadata
Every document must include YAML frontmatter:
```yaml
---
title: Document Title
author: {skill-name}
version: 1.0.0
created: {date}
status: draft | review | approved | archived
related-to:
  - path/to/related-doc.md
---
```

### Naming Conventions
- Use lowercase with hyphens for files and directories
- Feature-based grouping: `feature-{name}/`
- Date suffix for time-based docs: `report-{YYYY-MM-DD}.md`
- Version suffix for iterative docs: `schema-v2.md`

### Quality Gates
- Every feature must have at least the required documents listed in the schema
- All documents must have valid YAML frontmatter with required fields
- Cross-references between related docs must be maintained
- Archived documents must link to their superseding version
- All doc-store directories must have an `index.md` listing their contents

## Workflow

### 1. Schema Definition
1. When a new CTO skill is created, define its doc-store schema
2. Add the schema to this document
3. Notify the team of required document types

### 2. Quality Review
1. Audit doc-stores for completeness against schema
2. Check metadata quality (frontmatter, naming, versioning)
3. Verify cross-references are up to date
4. Report gaps and violations to team leads

### 3. Cross-Team Discovery
1. When a team needs to find docs from another team, use the shared naming conventions
2. Document search across all CTO doc-stores follows the pattern:
   - `cabinet/cto/{department}/{team}/doc-store/feature-{name}/`
3. The engineering-manager skill coordinates doc access across teams

### 4. Onboarding
1. New team members should read this document first
2. Review the relevant doc-store schemas for their team
3. Review example documents from completed features

## Next Steps

1. → `engineering-manager` — for coordinating doc-store access across teams during feature delivery
2. → `feature-manager` — for cross-feature orchestration and delivery tracking
3. → Individual CTO team skills — for executing work and saving docs to their local doc-store
