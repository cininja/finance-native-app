# Roadmap – Finance App (Swift / SwiftUI)

Goal: Build a native iOS app to manually track personal finances (bank + cash), visualize daily spending using a traffic-light calendar, and estimate how long it takes to reach savings goals.

## Guiding Principles

- Build a working MVP first, then iterate.
- Data is stored locally on the device (no bank integration in MVP).
- Monetary values are stored internally as **cents (Int)**, not floating-point numbers.

---

## MVP (Version 1) – “Usable & Simple”

### 1) Project Foundation

- SwiftUI app with 3 main tabs:
  - Overview
  - Calendar
  - Goals
- Basic navigation and a clean, minimal UI

### 2) Local Data Storage

- Set up local persistence (e.g. SwiftData)
- Core data models:
  - Balance (bank + cash)
  - Transaction (date, amount, payment method, optional note)
  - Settings (monthly income + traffic-light limits)
  - Goal (name, target amount, optional already saved amount)

### 3) Overview (Balance & Quick Inputs)

- Display:
  - Bank balance
  - Cash balance
  - Total balance
  - Today’s spending
- Add expense:
  - Quick buttons (e.g. €2, €5, €10, €20)
  - Custom amount input
  - Payment method selection (bank or cash)
- On save:
  - Create a new transaction
  - Update balances accordingly

### 4) Calendar (Traffic-Light Days)

- Monthly calendar view with color-coded days:
  - Green / Yellow / Red based on daily spending
- Tap on a day:
  - List of transactions for that day
  - Daily total

### 5) Goals (Savings Estimator)

- Create a goal: name + target amount
- Input monthly income (via Settings)
- Calculation: estimated “X days / months remaining”
- Rules:
  - If estimated savings rate ≤ 0 → show a warning that the goal is not reachable

---

## Version 2 – Quality of Life & Insights

- Expense categories (food, transport, etc.)
- Transaction filtering and sorting
- Monthly summaries
- Charts (weekly / monthly spending)
- Data export (CSV / JSON)

---

## Version 3 – Nice to Have

- Budgets (daily / weekly / monthly)
- Recurring transactions
- iCloud sync / multi-device support
- Face ID / Touch ID app lock

---

## Out of Scope (for now)

- Automatic bank integration (PSD2 / Open Banking)
- Multi-user support
