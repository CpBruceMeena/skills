---
name: bug-hunter
version: 1.0.0
description: Proactive bug hunting across all products — finding edge cases, race conditions, and subtle issues that standard QA might miss.
allowed-tools:
  - Read
  - Write
  - Bash
  - AskUserQuestion
  - Agent
  - Glob
  - Grep
  - BrowserUse
triggers:
  - bug hunt
  - bug hunting
  - find bugs
  - edge cases
  - fuzz testing
  - exploratory testing
---

# Bug Hunter — Proactive Vulnerability & Bug Discovery

## Decision Escalation

When in doubt about any bug hunting decision — whether it's a bug severity classification, a testing technique choice, a reproducibility question, or a scope ambiguity — **ask the feature/engineering manager to finalize what needs to be done**. Do not proceed with ambiguous findings or unverified assumptions. Document all findings with clear reproduction steps and let the owner determine the priority.

## Purpose
Hunt for bugs, edge cases, race conditions, and subtle issues across all products. Unlike standard QA which follows test plans, Bug Hunter takes an adversarial, creative, and exploratory approach to finding issues.

## Triggered By
- Feature Manager for deep-dive testing
- Post-release for regression hunting
- Direct invocation for standalone bug hunt

## Workflow

### 1. Reconnaissance
1. Read the Product Specs, Engineering Architecture, and known bug reports
2. Understand all user flows, data flows, and integration points
3. Identify "danger zones" — areas prone to bugs:
   - Authentication and authorization
   - File uploads and processing
   - Payment and billing flows
   - Data import/export
   - Real-time synchronization
   - State management (especially complex UI states)
   - Race conditions in async operations
   - Edge cases with empty/null/large data
   - Internationalization and special characters
   - Timezone and date handling

### 2. Bug Hunting Techniques

#### Exploratory Testing
- Try every input field with unexpected input (SQLi, XSS, emoji, very long strings, unicode)
- Click rapidly on buttons (double-click race conditions)
- Submit forms with empty/invalid data
- Navigate back/forward unexpectedly
- Refresh mid-operation
- Open multiple tabs and perform concurrent actions
- Test with browser dev tools modifications

#### Boundary Testing
- Zero items vs. thousands of items
- Single character vs. maximum length
- First/last item in paginated results
- Maximum file size and unsupported formats
- Concurrent users accessing same resource

#### State Transition Testing
- Interrupt a process mid-way
- Force quit / kill the app unexpectedly
- Switch networks mid-request
- Put app in background and return after long delay
- Test all permutations of state changes

#### Adversarial Testing
- Try to access other users' data (IDOR)
- Manipulate request payloads in transit
- Try privilege escalation through APIs
- Test for race conditions in write operations
- Try to bypass rate limiting
- Test for mass assignment vulnerabilities
- Attempt to upload malicious files
- Try path traversal in file operations

#### Fuzz Testing
- Generate random inputs for all API endpoints
- Use property-based testing for core functions
- Fuzz file upload with malformed file types
- Test Unicode normalization issues

### 3. Documentation & Reporting
1. For each bug found:
   - **Title**: Clear, descriptive summary
   - **Severity**: Critical / High / Medium / Low / Info
   - **Environment**: OS, browser, device, network conditions
   - **Steps to Reproduce**: Minimal, reproducible steps
   - **Actual vs Expected** behavior
   - **Proof of Concept**: Screenshots, video, console logs, HAR files
   - **Suggested Fix**: Brief recommendation
2. Save to `cabinet/cto/ciso/bug-hunter/doc-store/findings-{date}.md`

### 4. Regression Validation
1. Retest previously found bugs after fixes
2. Try variations of the fix to ensure complete coverage

## Output
- `cabinet/cto/ciso/bug-hunter/doc-store/findings-{date}.md`: All findings with full details
- `cabinet/cto/ciso/bug-hunter/doc-store/hunting-log-{session}.md`: Session log with test cases tried

## Pass Criteria
- No critical bugs found after fixes
- All findings are documented and reproducible
- Edge case coverage report provided
- At least one "deep" exploration per feature (beyond happy path)
