# Decisions – Finance App (Swift / SwiftUI)

This document records important architectural and product decisions to keep the project consistent and understandable over time.

---

## Platform & UI

**Decision:** Native iOS app using SwiftUI  
**Reason:** Native performance, modern UI framework, beginner-friendly, strong Apple ecosystem integration.  
**Consequence:** Android is not targeted in the MVP.

---

## Data Persistence

**Decision (MVP):** Local on-device storage using SwiftData  
**Reason:** No backend, no accounts, no server costs, offline-first.  
**Consequence:** Data initially lives only on a single device (no sync).

---

## Monetary Values

**Decision:** Store all monetary values as `Int` in **cents** (e.g. 199 = €1.99)  
**Reason:** Avoid floating-point rounding errors.  
**Consequence:** Values must be formatted for display.

---

## Transactions as the Source of Truth

**Decision:** Every expense is stored as a `Transaction` with date and payment method.  
**Reason:** Daily, monthly, and calendar-based analytics can be derived from transactions.  
**Consequence:** Balances can be:

- (A) Stored and updated directly (fast)
- (B) Recalculated from transactions (always correct, but slower)

**MVP choice:** Store balances directly, with the option to add recalculation/debug tools later.

---

## Calendar Traffic-Light Logic

**Decision:** Day color is based on total spending for that day.  
**Default limits (configurable in Settings):**

- Green: daily spending ≤ €10
- Yellow: daily spending ≤ €30
- Red: daily spending > €30

**Reason:** Simple, intuitive feedback on daily spending behavior.  
**Consequence:** Limits should be user-adjustable later.

---

## Savings Goal Estimation

**Decision:** Estimate time to goal based on income and average spending.  
**Formula idea:**

- `dailySavings = (monthlyIncome - avgMonthlySpend) / 30`
- `daysToGoal = remainingAmount / dailySavings`

**Edge cases:**

- If `dailySavings ≤ 0` → goal is not reachable (show warning)
- If not enough historical data exists → show disclaimer about accuracy

---

## Scope & Priorities

**Decision:** Manual tracking only in MVP, no bank integrations.  
**Reason:** Bank APIs add significant legal, security, and complexity overhead.  
**Consequence:** Focus on UX, fast input, and clear visual feedback.
