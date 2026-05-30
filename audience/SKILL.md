---
name: audience
version: 1.0.0
description: Defines the external user personality archetypes (audience) who use our products, provide feedback, request features, and drive product direction — operating in parallel to the internal cabinet.
allowed-tools:
  - Read
  - Write
  - AskUserQuestion
triggers:
  - audience
  - user personas
  - user personality
  - audience archetype
  - feedback
  - feature request
---

# Audience — External User Personality Archetypes

## Purpose

The **audience** represents the real people outside the company who use our products. They exist in parallel to the internal **cabinet** (CEO, CTO, CPO, and their teams) and have no stake in our company's success. They have competing alternatives, no loyalty, and will walk away the moment the product stops serving their needs.

This skill defines the **3 core audience archetypes** that all products should reference when making decisions. When the customer-user skill runs testing, it uses these archetypes. When the product-review skill defines features, it considers these archetypes. When the CEO sets vision, they imagine these people.

> **Principle:** The audience is not internal stakeholders. They don't care about your architecture, design system, or engineering effort. They care about getting their problem solved as simply as possible.

---

## The 3 Audience Archetypes

### 👤 Audience Archetype 1: The Pragmatic Professional

- **Tag:** `audience:pragmatic-professional`
- **Core need:** Efficiency and reliability — get the job done with minimal friction.

**Background:** Working professional, mid-to-high tech literacy. Busy. Values efficiency and reliability above all. Will read documentation if necessary but prefers things to just work. Makes decisions based on proven track record and time saved.

**Personality traits:**
- Wants speed over frills
- Will invest time learning IF the payoff is clear
- Cross-device consistency matters (uses multiple platforms)
- Loyal to tools that save them time
- Skeptical of flashy marketing — wants substance

**What they tolerate:** Steep learning curve IF the payoff is clear. Minimalist UIs. Keyboard shortcuts. Power features hidden behind menus.

**What makes them leave:** Slow onboarding, broken flows, inconsistent behavior across devices, features that look good but don't actually work reliably.

**How they give feedback:** Precise, actionable, often feature-specific. "The export takes 6 seconds when I have 500 rows — it should be under 2." They report bugs with steps to reproduce.

**Feature requests reflect:** Performance improvements, integration with existing tools, bulk operations, export/import capabilities.

---

### 👤 Audience Archetype 2: The Skeptical First-Timer

- **Tag:** `audience:skeptical-first-timer`
- **Core need:** Safety and guidance — I need to feel I won't break anything.

**Background:** Low-to-mid tech literacy. Has been burned by complex products before. Anxious about making mistakes. Wants to feel guided and safe. May have been forced to try the product by a colleague (the Pragmatic Professional) or by their organization (the Power Scaler's decision).

**Personality traits:**
- Reads every label before clicking
- Hesitates before committing to actions
- Checks for an "undo" option before doing anything
- Prefers simple, guided workflows over power features
- Will abandon the product rather than ask for help (fear of looking stupid)

**What they tolerate:** Generous onboarding, clear labels, confirmation dialogs, gentle error messages, visible help options, consistent patterns that match other apps they know.

**What makes them leave:** Jargon, assumed knowledge, irreversible actions without confirmation, unclear pricing, confusing navigation, any moment of confusion where they don't know what to do next.

**How they give feedback:** Emotional and experience-focused. "I felt lost on this screen." "I was afraid to click that button." "I don't know what this means." They often don't report bugs — they just stop using the feature.

**Feature requests reflect:** Simpler workflows, more guidance, clearer labels, confirmation dialogs, undo options, better error messages, bigger buttons, fewer options.

---

### 👤 Audience Archetype 3: The Power Scaler

- **Tag:** `audience:power-scaler`
- **Core need:** Control and scale — I need to manage many things at once and automate everything.

**Background:** Tech-savvy early adopter. Manages multiple things at scale. Looks for automation, bulk operations, integrations, and API access. Compares products like a purchasing manager evaluating enterprise tools. Often makes buying decisions that affect the other two archetypes.

**Personality traits:**
- Evaluates products against competitors meticulously
- Looks under the hood — tests limits, rate limits, edge cases
- Wants API access, webhooks, integrations with their stack
- Compares pricing against value at scale
- Influences purchasing decisions for teams and organizations

**What they tolerate:** Sparse UI, learning investment, configuration complexity, reading documentation.

**What makes them leave:** Lack of export/import, rate limits, missing API, manual-only workflows, closed ecosystems, inability to customize, vendor lock-in without migration path.

**How they give feedback:** Technical and comparative. "Your API returns 429 after 100 requests/min while Competitor X handles 1000." "Your competitor has a Zendesk integration — when will you?" They benchmark, test, and compare systematically.

**Feature requests reflect:** API endpoints, webhooks, bulk operations, SSO/SAML, role-based access control, audit logs, data portability, competitive parity.

---

## Audience-to-Cabinet Parallel Model

```
┌─────────────────────────────────┐     ┌─────────────────────────────────┐
│          CABINET                │     │           AUDIENCE              │
│   (Internal Company Org)        │     │    (External Users)             │
│                                 │     │                                 │
│  CEO → sets vision              │     │  Pragmatic Professional →       │
│  CTO → builds technology        │  ←──│  uses the product daily        │
│  CPO → defines products         │     │  Skeptical First-Timer →        │
│  Design → crafts experience     │     │  evaluates ease of use          │
│  Engineering → implements       │     │  Power Scaler →                 │
│  QA → tests quality             │     │  evaluates at scale             │
│  Security → protects            │     │                                 │
│                                 │     │  Feedback flows:                │
│  Output → Products & Features   │────→│  - Feature requests             │
│                                 │     │  - Bug reports                  │
│                                 │     │  - Usability feedback            │
│                                 │     │  - Competitive intelligence      │
└─────────────────────────────────┘     └─────────────────────────────────┘
```

## Workflow

### 1. Referencing Audience in Product Decisions

When any cabinet skill (CEO, CPO, design, engineering, QA) makes a decision, they should ask:

> "How would the **Pragmatic Professional** react to this?"
> "Would the **Skeptical First-Timer** feel safe using this?"
> "Is the **Power Scaler** going to find this scalable?"

If any archetype would have a strong negative reaction, the decision needs reconsideration.

### 2. Collecting Feedback

The customer-user skill is the executor that runs tests with these archetypes. However, feedback can also flow directly:

- **Feature requests** → routed to product-review for prioritization
- **Bug reports** → routed to engineering + qa for triage
- **Usability complaints** → routed to design-lead for review
- **Competitive comparisons** → routed to ceo-review + product-review for strategic response

### 3. Archetype Conflict Resolution

Where the archetypes disagree:

| Scenario | Pragmatic Professional | Skeptical First-Timer | Power Scaler | Resolution |
|----------|----------------------|----------------------|--------------|------------|
| Too many features? | "Only show me what I use" | "Overwhelming" | "I want everything" | Progressive disclosure: simple default, advanced settings |
| New feature workflow? | "Let me skip the tutorial" | "Walk me through it" | "Give me the API" | Role-based onboarding (skip/guided/docs) |
| Pricing change? | "Is it still worth the cost?" | "Am I being tricked?" | "How does this scale?" | Transparent pricing with comparison tool |

## Output
- `doc-store/audience/{product}/pragmatic-professional.md` — Archetype profile for this product
- `doc-store/audience/{product}/skeptical-first-timer.md` — Archetype profile for this product
- `doc-store/audience/{product}/power-scaler.md` — Archetype profile for this product
- `doc-store/audience/{product}/feedback-log.md` — Ongoing feedback & feature requests
