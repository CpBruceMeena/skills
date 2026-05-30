---
name: doc-store
version: 2.0.0
description: CPO documentation store — manages CEO vision, product specs, design specs, and audience artifacts for the CPO organization.
allowed-tools:
  - Read
  - Write
  - Bash
  - AskUserQuestion
  - Agent
  - Glob
  - Grep
triggers:
  - doc store
  - cpo docs
  - documentation
  - save doc
  - read doc
  - find doc
  - document management
  - knowledge base
---

# Doc Store — CPO Documentation Management

## Decision Escalation

When in doubt about any documentation decision — whether it's a document structure choice, a naming convention, a version numbering approach, a cross-referencing strategy, or a classification question — **ask the CPO or feature/product manager to finalize what needs to be done**. Do not proceed with ambiguous documentation requirements. Document all decisions and their rationale so the knowledge base remains consistent.

## Purpose

Manage all documents generated across the CPO organization — from CEO Vision through Product Specs, Design Specs, Audience/User Research, and Design System artifacts. Each CTO team maintains its own doc-store within its skill directory for technical documentation.

## Triggered By

- CPO skills (ceo-review, product-review, customer-user, design skills) saving or reading documentation
- Direct invocation for document management

## Directory Structure

```
cabinet/cpo/doc-store/
├── ceo/
│   ├── vision-v1.md              # Original CEO vision
│   ├── vision-v2.md              # Updated vision after review
│   └── roadmap.md                # Business roadmap
├── product/
│   └── product-review/
│       ├── product-{name}.md         # Product specification
│       ├── product-{name}-v2.md      # Updated product spec
│       └── product-roadmap.md        # Product-level roadmap
├── audience/
│   └── {product}/
│       ├── personas.md               # Audience profiles
│       ├── scenarios-{feature}.md    # Test scenarios
│       ├── feedback-{feature}.md     # Audience-tagged feedback
│       ├── conflicts-{feature}.md    # Cross-audience conflict map
│       └── uat-report-{version}.md   # UAT sign-off
└── design/
    ├── design-lead/
    │   ├── {project}/cross-platform-flow.md
    │   ├── {project}/design-review-{platform}-{date}.md
    │   └── design-system/
    │       ├── tokens-v{version}.md
    │       ├── component-library.md
    │       └── changelog.md
    ├── design-android/
    │   └── {project}/feature-{name}/
    │       ├── ui-spec.md
    │       └── platform-notes.md
    ├── design-ios/
    │   └── {project}/feature-{name}/
    │       ├── ui-spec.md
    │       └── platform-notes.md
    ├── design-mobile-web/
    │   └── {project}/feature-{name}/
    │       ├── ui-spec.md
    │       └── responsive-guide.md
    └── design-desktop-web/
        └── {project}/feature-{name}/
            ├── ui-spec.md
            └── interaction-guide.md
```

## Workflow

### 1. Document Creation
1. Determine the correct directory for the document
2. Create the document with proper YAML frontmatter:
   ```yaml
   ---
   title: Document Title
   author: {skill-name}
   version: 1.0.0
   created: {date}
   status: draft | review | approved | archived
   related-to:
     - cabinet/cpo/doc-store/path/to/related-doc.md
   ---
   ```
3. Save with clear, consistent naming conventions

### 2. Document Retrieval
1. Search by:
   - **Feature name**: Find all docs related to a feature
   - **Skill type**: Find all docs from a specific skill
   - **Document type**: Find all test plans, specs, etc.
   - **Status**: Find all docs in review state
2. Return relevant document paths with summaries

### 3. Document Updates
1. Use version numbering (v1, v2, etc.) for updates
2. Keep a change log:
   ```yaml
   changelog:
     - version: 1.1.0
       date: {date}
       author: {skill-name}
       changes: Summary of what changed
   ```
3. Mark superseded documents as `status: archived`
4. Link old → new versions in the `related-to` field

### 4. Cross-Referencing
1. When reading a document, find and list all related docs
2. Maintain a master index at `cabinet/cpo/doc-store/index.md`
3. Update the index when new docs are created

### 5. Search & Discovery
1. Search all documents by keyword, feature, or date
2. Group results by skill or feature
3. Return a structured list with file paths and summaries

## Master Index

The master index (`cabinet/cpo/doc-store/index.md`) is auto-maintained and lists:
- All documents grouped by skill
- Latest version of each document
- Document status
- Quick summary of each document

## Output
- Organized CPO document store with consistent structure
- Master index for navigation
- Document retrieval by search criteria
- Version history and change tracking

## Next Steps

1. → `tech-doc-manager` for CTO team doc-store schemas and standards
2. → `feature-manager` for cross-feature orchestration and delivery tracking
