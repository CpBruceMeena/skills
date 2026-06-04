---
name: customer-user
version: 2.0.0
description: End-user testing, usability evaluation, and feedback collection for products built under the CEO vision.
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
  - user testing
  - customer feedback
  - usability test
  - user review
  - acceptance testing
  - UAT
---

# Customer / User — Product Testing & Feedback

## Decision Escalation

When in doubt about any user testing decision — whether it's a test scenario choice, a feedback interpretation, a usability severity classification, or a requirement ambiguity — **ask the feature/product owner to finalize what needs to be done**. Do not proceed with ambiguous testing requirements or unverified assumptions. Document all feedback with clear context and let the owner determine the priority of issues.

## Purpose
Simulate end-user behavior from the outside-in, evaluate usability, collect actionable feedback, and validate that the product meets real user needs and expectations. This skill bridges the gap between the company's internal vision (CEO, Engineering, Design) and the external reality of actual users.

## Triggered By
- **Full gate:** Invoked by `feature-manager` after QA and Security clearances (comprehensive UAT) — this is the primary trigger. See `cabinet/cpo/feature-manager/` for the full orchestration workflow.
- **Parallel track:** Runs concurrently with active development sprints (lightweight weekly check-ins with audience personas)
- CEO Review requesting user validation
- Post-deployment for ongoing feedback

## Workflow

### 0. Audience Definition — Create Competing User Personas

> Before any testing begins, define 2–3 distinct **user personalities** who exist *outside the company*. These are not internal stakeholders — they are real people with their own jobs, frustrations, and competing options. They don't care about your architecture or design system. They care about getting their problem solved.

For each product, create **2–3 vivid personas** with internal consistency and conflicting priorities so the product is tested from genuinely different angles.

#### Audience Profile Template

```
## [Name, Age]

**Tagline:** One-sentence summary of who they are

**Demographics:**
- Occupation / Industry
- Location / Environment
- Tech literacy: Low / Medium / High
- Devices used: [e.g., iPhone 13, Windows laptop, Android tablet]

**Psychographics:**
- Primary goal when using the product:
- What they value most: [speed / trust / simplicity / power / cost / aesthetics]
- What they hate: [clunky UIs, jargon, slow load times, hidden fees, being patronized]
- Decision style: [Impulsive / Methodical / Skeptical / Loyalty-driven / Price-sensitive]

**Daily Context:**
- When and where will they use this product?
- Are they in a hurry or relaxed?
- Distractions? Multi-tasking?
- Internet quality: [Fast / Unreliable / Mostly cellular]

**Competing Alternatives:**
- What do they use today instead of our product?
- Why might they *not* switch to us?

**Frustrations with current solutions:**
1.
2.
3.
```

> 💡 **Audience Definition Principle:** These are **external users** — people outside the company with no stake in the product's success. They have competing alternatives and no loyalty. Test as if they might walk away at any moment.

#### Three Audience Archetypes (adapt per product)

---
**👤 Audience Archetype 1: The Pragmatic Professional**
- *Tag:* `audience:pragmatic-professional`
- *Background:* Working professional, mid-to-high tech literacy. Busy. Values efficiency and reliability above all. Will read documentation if necessary but prefers things to just work.
- *Relationship to other audience members:* May receive reports or dashboards shared by the Power Scaler. Values clarity in those shared artifacts.
- *Will tolerate:* Steep learning curve IF the payoff is clear. Minimalist UIs. Keyboard shortcuts.
- *Will abandon:* Slow onboarding, broken flows, inconsistent behavior across devices.
- *Testing lens:* Task completion time, discoverability of advanced features, cross-device consistency.

---
**👤 Audience Archetype 2: The Skeptical First-Timer**
- *Tag:* `audience:skeptical-first-timer`
- *Background:* Low-to-mid tech literacy. Has been burned by complex products before. Anxious about making mistakes. Wants to feel guided and safe.
- *Relationship to other audience members:* Might be introduced to the product by the Pragmatic Professional. Their willingness to adopt depends heavily on how easy the first experience is.
- *Will tolerate:* Generous onboarding, clear labels, confirmation dialogs, gentle error messages.
- *Will abandon:* Jargon, assumed knowledge, irreversible actions, unclear pricing, any moment of confusion.
- *Testing lens:* First-run experience, error recovery, clarity of messaging, fear reduction.

---
**👤 Audience Archetype 3: The Power Scaler**
- *Tag:* `audience:power-scaler`
- *Background:* Tech-savvy early adopter. Manages multiple things at scale. Looks for automation, bulk operations, integrations, and API access. Compares products like a purchasing manager.
- *Relationship to other audience members:* Evaluates the product on behalf of a team. Their buying decision affects the Pragmatic Professional and Skeptical First-Timer who will actually use the product day-to-day.
- *Will tolerate:* Sparse UI, learning investment, configuration complexity.
- *Will abandon:* Lack of export/import, rate limits, missing API, manual-only workflows, closed ecosystems.
- *Testing lens:* Feature depth, edge cases at scale, API/automation quality, data portability.

---
> **Important:** These are audience templates. For each specific product, flesh them out with real demographics, product-specific goals, actual competing alternatives, and audience-specific usage contexts. Save the product-specific audience profiles to `audience/doc-store/{product}/personas.md`.

### 1. Role-Play Each Audience Archetype Through All Scenarios

For each audience archetype, simulate the full journey through the product, answering as that user would:

1. **Inhabit the persona**: Read their bio. Understand their mood, context, and goal.
2. **Navigate the product first-hand**: Go through every screen and flow as if you are that person.
3. **React honestly**: What would *this* person actually say? Not what the company wants to hear.
4. **Compare and contrast**: After each archetype finishes, note where their experiences diverged.

### 2. Scenario-Based Testing

Create and run realistic scenarios for each audience archetype:
- **First-time user**: Sign up, onboarding, first action
- **Power user**: Advanced features, shortcuts, bulk operations
- **Occasional user**: Return visit, recall previous state
- **Edge-case user**: Accessibility needs, slow connection, older device

For each scenario × audience archetype combination, evaluate:
- **Discoverability**: Can the user find the feature?
- **Learnability**: How quickly do they understand it?
- **Efficiency**: How many steps/clicks to complete the task?
- **Error recovery**: Can they fix mistakes easily?
- **Satisfaction**: Is the experience enjoyable?

Pay special attention to **divergent outcomes** — where Persona 2 (Skeptical First-Timer) had a very different experience than Persona 3 (Power Scaler). Those gaps are where the product's blind spots live.

### 3. Usability Heuristics Evaluation

Evaluate against Nielsen's 10 Usability Heuristics from each audience archetype's perspective:

| # | Heuristic | What This Audience Archetype Cares About |
|---|-----------|-------------------------------|
| 1 | **Visibility of system status** | Does the UI tell me what's happening? |
| 2 | **Match between system and real world** | Does it speak my language or engineering jargon? |
| 3 | **User control and freedom** | Can I undo mistakes? Is there a back button? |
| 4 | **Consistency and standards** | Does it behave like other apps I know? |
| 5 | **Error prevention** | Does it stop me before I do something dumb? |
| 6 | **Recognition rather than recall** | Do I see my options, or do I have to remember them? |
| 7 | **Flexibility and efficiency of use** | Can I do this faster as I get experienced? |
| 8 | **Aesthetic and minimalist design** | Is it clean or cluttered? |
| 9 | **Help users recognize, diagnose, and recover from errors** | When something breaks, does it help or scold me? |
| 10 | **Help and documentation** | Can I find help without searching? |

### 4. Feedback Collection (Per Audience Archetype)

Ask each audience archetype aloud:
- What do you like about this?
- What frustrates you?
- What's missing?
- Would you pay for this? If so, how much?
- How does this compare to what you use today?
- Would you recommend this to a friend or colleague? Why/why not?

Document all feedback with:
- Feature/area
- Audience archetype who said it
- User sentiment (Positive / Neutral / Negative)
- Severity of issue
- Suggested improvement

### 5. Cross-Audience Conflict Resolution

Where audience archetypes disagree on a feature, flag it explicitly:

```
## Audience Conflict: [Feature/Area]

- **Pragmatic Professional**: Found it efficient and fast. Rating: 9/10
- **Skeptical First-Timer**: Found it confusing and intimidating. Rating: 3/10
- **Power Scaler**: Found it too basic, wanted more control. Rating: 5/10

**Recommendation to Product Owner:** This feature has a polarizing split. 
The Skeptical First-Timer needs a simpler entry point, while the Power Scaler 
wants advanced controls. Consider tiered experience (basic vs. advanced mode).
```

### 6. Acceptance Testing

Validate against acceptance criteria from Product Specs from each audience archetype's perspective:
- Does the feature work as specified? (all audience archetypes)
- Does it meet the definition of done? (Pragmatic Professional)
- Is it intuitive without documentation? (Skeptical First-Timer)
- Does it handle errors gracefully? (all audience archetypes)
- Does it scale to real-world usage? (Power Scaler)

### 7. Report Generation & Sign-Off

> **The uat-report serves as the sign-off artifact that `feature-manager` checks before marking the feature Done.**

1. Compile findings into a structured report:
   - **Executive Summary**: Key findings at a glance
   - **Audience Results**: How each audience archetype fared, scored individually
   - **Audience Conflict Map**: Notable disagreements between audience archetypes
   - **Usability Score**: Rating out of 10 per heuristic, averaged across audience archetypes
   - **Top Issues**: Top 5-10 issues by severity, tagged by affected audience archetype(s)
   - **Positive Highlights**: What's working well (per audience archetype)
   - **Blind Spots**: Issues that only one audience archetype caught
   - **Recommendations**: Prioritized improvement list
2. **Include a clear sign-off statement** at the top of the report: `**User Validation Sign-Off: [APPROVED / CONDITIONALLY APPROVED / NOT APPROVED]**`
   - `APPROVED`: All pass criteria met. Feature is ready to be marked Done by `feature-manager`.
   - `CONDITIONALLY APPROVED`: Minor issues found, but non-blocking. Feature can proceed with tracked follow-ups.
   - `NOT APPROVED`: Critical issues found. Feature must be sent back for fixes before re-validation.

## Output
- `audience/doc-store/{product}/personas.md`: User personas (based on templates)
- `audience/doc-store/{product}/scenarios-{feature}.md`: Test scenarios per audience archetype
- `audience/doc-store/{product}/feedback-{feature}.md`: Audience-tagged user feedback
- `audience/doc-store/{product}/conflicts-{feature}.md`: Cross-audience conflict map
- `audience/doc-store/{product}/uat-report-{version}.md`: UAT sign-off report

## Pass Criteria
- All 3 audience archetypes cycled through all scenarios
- Acceptance criteria met for at least 2 of 3 audience archetypes
- No critical usability issues for any audience archetype
- Usability score ≥ 7/10 across all audience archetypes
- Audience conflicts documented and escalated to product owner
- User sentiment is predominantly positive
- Clear, actionable recommendations provided
