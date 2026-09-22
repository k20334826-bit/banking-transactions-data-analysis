# 🏦 Banking Transactions Analytics — Python | MySQL | Power BI

An end-to-end **Banking Transactions Analytics** project built to demonstrate practical Data Analyst skills across **Python, MySQL, and Microsoft Power BI**.

The project transforms multi-domain banking data into interactive dashboards covering **customer behavior, account activity, transaction trends, cards, loans, credit risk, and support operations**.

---

## 📌 Project Overview

Financial institutions generate large volumes of customer, transaction, account, card, loan, and service data.

The objective of this project was to build an end-to-end analytical solution that answers questions such as:

* Who are the bank's customers?
* Where are customers geographically concentrated?
* How are accounts distributed by status and type?
* What transaction types generate the most value?
* Which transaction channels are most frequently used?
* How does transaction activity change over time?
* What does the card portfolio look like?
* What are the key loan and repayment patterns?
* How frequently are payments late?
* How can credit and customer-support information be analyzed together?

---

## 📂 Project Files

| Component | Description |
|---|---|
| 🐍 [Python EDA](./python/Banking_Transactions.ipynb) | Data cleaning, exploratory data analysis and analytical exploration |
| 🗄️ [SQL Analysis](./sql/) | Database setup, data-quality checks and business analysis |
| 📊 [Power BI Dashboard](./powerbi/banking_transactions.pbix) | Interactive Power BI dashboard |
| 🖼️ [Dashboard Screenshots](./screenshots/) | Power BI dashboard page previews |
| 📄 [Power BI Professional Report](./documentation/Banking_Transactions_PowerBI_Professional_Report.pdf) | Detailed Power BI project report |
| 📑 [Professional Case Study](./documentation/Banking_Transactions_Professional_Case_Study.pdf) | End-to-end banking analytics case study |

---

# 🎯 Business Objectives

The project focuses on five major analytical areas:

1. **Customer Analytics**

   * Demographics
   * Geography
   * Income
   * Credit score
   * Customer segmentation

2. **Account Analytics**

   * Account types
   * Account status
   * Account balances
   * Branch-level exposure

3. **Transaction Analytics**

   * Transaction volume
   * Transaction value
   * Transaction type
   * Transaction channel
   * Merchant category
   * Monthly trends

4. **Loan & Credit Risk Analytics**

   * Loan portfolio
   * Loan types
   * Repayment activity
   * Principal and interest
   * Late payments
   * Estimated outstanding balances

5. **Credit & Support Analytics**

   * Credit profile
   * Support tickets
   * Issue categories
   * Ticket status
   * Customer satisfaction

---

# 🗂️ Dataset Overview

| Domain            |   Records | Purpose                                 |
| ----------------- | --------: | --------------------------------------- |
| Customers         |    60,000 | Customer profile and credit information |
| Accounts          |    95,000 | Account activity and balances           |
| Branches          |       150 | Branch-level analysis                   |
| Transactions      | 2,000,000 | Core banking transaction analysis       |
| Cards             |    65,000 | Card portfolio analysis                 |
| Card Transactions | 3,000,000 | Card transaction behavior               |
| Loans             |    22,000 | Loan portfolio analysis                 |
| Loan Payments     |   600,000 | Repayment and late-payment analysis     |
| Employees         |     1,800 | Branch staffing analysis                |
| Support           |    25,000 | Customer support analysis               |

---

# 🛠️ Technology Stack

### Python

* Pandas
* NumPy
* Matplotlib
* Exploratory Data Analysis
* Data quality checks
* Feature engineering

### MySQL

* SQL querying
* Joins
* Aggregations
* CTEs
* Window functions
* Subqueries
* Ranking
* Data validation
* Relational modeling

### Power BI

* Power Query
* Data modeling
* DAX
* KPI cards
* Trend analysis
* Interactive slicers
* Drill-through
* Tooltips
* Bookmarks
* Dashboard storytelling

---

# 🔄 End-to-End Workflow

```text
Raw Banking Data
       ↓
Data Understanding
       ↓
Data Cleaning & Validation
       ↓
Python Exploratory Data Analysis
       ↓
MySQL Relational Modeling
       ↓
SQL Business Analysis
       ↓
Power BI Data Model
       ↓
DAX Measures & KPIs
       ↓
Interactive Dashboards
       ↓
Business Insights
       ↓
Recommendations
```

---

# 🐍 Phase 1 — Python EDA

Python was used to understand the datasets before dashboard development.

### Major activities

* Dataset profiling
* Shape and structure analysis
* Data type validation
* Missing-value analysis
* Duplicate checks
* Descriptive statistics
* Distribution analysis
* Outlier exploration
* Date analysis
* Customer segmentation
* Transaction analysis
* Loan-payment analysis
* Card-status analysis

### Example analytical questions

```text
What is the customer distribution by state?

How are accounts distributed by status?

What are the most common transaction types?

Which channels have the highest transaction volume?

Which months have the highest transaction value?

What percentage of loan payments are late?

What is the distribution of credit scores?
```

---

# 🗄️ Phase 2 — MySQL Analysis

The banking data was organized into a relational analytical environment.

### Key entities

```text
Customers
Accounts
Branches
Transactions
Cards
Card Transactions
Loans
Loan Payments
Employees
Support
```

### SQL techniques used

* `SELECT`
* `WHERE`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `JOIN`
* `LEFT JOIN`
* Subqueries
* CTEs
* Window functions
* Ranking
* Aggregations
* Date functions
* Conditional logic
* Data-quality checks

### Example business analysis

```sql
-- Example: transaction value by transaction type

SELECT
    txn_type,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_value,
    AVG(amount) AS average_transaction
FROM transactions
GROUP BY txn_type
ORDER BY total_value DESC;
```

---

# 📊 Phase 3 — Power BI Dashboard

The Power BI report is organized into business-focused analytical pages.

## 1️⃣ Executive Overview

Provides a high-level view of the banking portfolio.

### Focus areas

* Customers
* Accounts
* Transactions
* Transaction value
* Cards
* Loans
* High-level trends

### Business question

> What is the overall state of the banking portfolio?

---

## 2️⃣ Customer Analysis

Focuses on customer demographics and geographic distribution.

### Focus areas

* Customer count
* Gender
* State
* Age
* Income
* Credit score
* Customer segmentation

### Business question

> Who are the customers and where are they concentrated?

---

## 3️⃣ Transaction Analysis

Analyzes banking transaction behavior.

### Focus areas

* Transaction volume
* Transaction value
* Transaction type
* Transaction channel
* Merchant category
* Monthly trends
* High-value transactions

### Business question

> What drives transaction activity and transaction value?

---

## 4️⃣ Loans & Credit Risk Analysis

Analyzes the loan portfolio and repayment behavior.

### Focus areas

* Loan count
* Loan amount
* Loan type
* Loan status
* Payments
* Principal
* Interest
* Late payments
* Estimated outstanding balance

### Business question

> What does the loan portfolio and repayment behavior look like?

---

## 5️⃣ Credit + Support Analysis

Combines credit-related information with customer-support activity.

### Focus areas

* Credit score
* Credit categories
* Support tickets
* Issue types
* Ticket status
* Satisfaction

### Business question

> How do customer credit characteristics and service activity interact?

---

# 📈 Key Project Insights

### 👥 Customer Distribution

Maharashtra has **11,981 customers**, representing approximately **19.97%** of the customer base.

Madhya Pradesh follows with **8,059 customers**, approximately **13.43%**.

---

### 🏦 Account Activity

The dataset contains **95,000 accounts**.

* Active: **80,707**
* Dormant: **9,526**
* Closed: **4,767**

Approximately **84.96%** of accounts are active.

---

### 💳 Card Portfolio

The project contains **65,000 cards**.

Based on the project's expiry-date calculation:

* Expired: **41,185**
* Active: **23,815**

This represents approximately **63.36% expired** and **36.64% active** according to that calculation.

---

### 💰 Transaction Analytics

The project contains **2 million core banking transactions**.

Total transaction value analyzed is approximately:

**₹12.10 billion**

Average transaction value:

**₹6,048.38**

The EDA identifies **Deposit** and **Withdrawal** as the largest transaction-value categories, each contributing approximately **₹3.02 billion**.

---

### 📱 Transaction Channels

The Python analysis identifies **Mobile App** as the most frequently used core transaction channel, with approximately **333,776 transactions**.

---

### 📅 Monthly Transaction Trends

The EDA identifies **May** as the highest transaction-value month among the twelve monthly aggregates at approximately:

**₹1.093 billion**

September is the lowest at approximately:

**₹0.931 billion**

---

### 💳 Loan Payment Analysis

The project contains:

* **22,000 loans**
* **600,000 loan payments**

The analyzed payment data contains a late-payment flag rate of approximately **12.01%**.

Average payment:

**₹10,397.46**

Average principal component:

**₹8,487.30**

Average interest component:

**₹1,910.16**

---

# 💡 Business Recommendations

### 1. Customer Segmentation

Use geographic, demographic, income and credit-score segmentation to understand differences between customer groups.

### 2. Dormant Account Monitoring

Create a dedicated dormant-account monitoring view and investigate patterns by branch, account type and customer characteristics.

### 3. Digital Channel Monitoring

Track transaction volume and transaction value across digital and physical channels to understand customer-channel behavior.

### 4. Card Lifecycle Management

Monitor card expiry and renewal requirements by card type and branch.

### 5. Loan Repayment Monitoring

Create monitoring views for late payments, repayment progress and estimated outstanding principal.

### 6. Customer Support Analysis

Combine support-ticket information with customer and credit characteristics to identify recurring service issues.

---

# ⚠️ Data Quality & Validation

Before using the dashboard as a production banking solution, the following should be validated:

* KPI definitions
* Relationships
* DAX calculations
* Date filtering
* Transaction totals
* Loan outstanding calculations
* Credit-status definitions
* SQL queries containing `LIMIT 1`
* Queries without explicit ordering
* Join conditions
* Partial-year 2026 comparisons

The project is primarily a **portfolio/learning analytics solution**, not a production banking reporting system.

---

# 🚀 Future Improvements

Potential future enhancements include:

* Automated data refresh
* Advanced DAX time intelligence
* Customer lifetime value
* Customer churn prediction
* Fraud detection analysis
* Loan default prediction
* Credit-risk segmentation
* Branch performance scorecards
* Customer profitability analysis
* Power BI Row-Level Security
* Automated data-quality monitoring
* Forecasting transaction volume
* Python machine-learning integration

---

# 👨‍💻 Skills Demonstrated

```text
Python
Pandas
NumPy
Matplotlib
Exploratory Data Analysis
Data Cleaning
Data Validation
MySQL
SQL
Joins
CTEs
Window Functions
Data Modeling
Power BI
Power Query
DAX
KPI Development
Dashboard Design
Data Visualization
Business Analysis
Data Storytelling
```

---

# 📌 Project Outcome

This project demonstrates an end-to-end Data Analyst workflow:

**Data → Cleaning → EDA → SQL → Data Modeling → Power BI → KPIs → Insights → Recommendations**

It showcases the ability to transform large, multi-domain banking datasets into an interactive business intelligence solution.
