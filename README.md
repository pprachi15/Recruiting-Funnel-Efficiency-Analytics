# Recruiting Funnel & Hiring Operations Analytics
This project analyzes a full recruiting pipeline to identify funnel conversion, bottlenecks, recruiter effectiveness, and hiring manager efficiency.

---

## 📊 Project Overview
Using a synthetic SQL dataset representing 10 candidates, I evaluated:

- Funnel conversion (Apply → Screen → Interview → Offer → Hire)
- Drop-offs at each stage
- Recruiter effectiveness metrics
- Hiring manager responsiveness
- End-to-end hiring cycle time

This mirrors the analytics used by People Ops, Talent Acquisition, and HR Business Partners inside recruiting organizations at high-growth companies.

---

## 🧩 Key SQL Outputs

### **1. Funnel Conversion Rates**
| step | rate |
|------|------|
| apply → screen | **80%**  
| screen → interview | **70%**  
| interview → offer | **50%**  
| offer → hire | **30%**  

---

### **2. Drop-Off Analysis**
| stage | count |
|--------|--------|
| Screen Failures | **2**  
| Interview Fails | **3**  
| Offer Declines / Rejections | **5**  

These highlight where the funnel is leaking and where process improvements are needed.

---

### **3. Recruiter Performance**
| recruiter | total candidates | interview rate | offer rate | hire rate |
|-----------|------------------|----------------|------------|-----------|
| **Mia** | 2 | **1.00** | **1.00** | **0.50**  
| **Ava** | 4 | **0.75** | **0.75** | **0.50**  
| **Noah** | 2 | 0.50 | 0.00 | 0.00  
| **Liam** | 2 | 0.50 | 0.00 | 0.00  

Mia demonstrates the strongest funnel efficiency; Noah & Liam require process review.

---

### **4. Hiring Manager Efficiency**
| hiring manager | avg screen | avg interview | avg offer | avg hire |
|----------------|-------------|---------------|------------|-----------|
| **Singh** | 1.5 days | 3 | 5 | 3  
| **Chen** | 2.5 days | **5** | 2 | 3  
| **Rodriguez** | 1.5 | 2.5 | **3.5** | **2**  
| **Patel** | 3.25 | 4.5 | null | null  

Chen slows the pipeline; Rodriguez moves fastest.

---

### **5. Candidate Cycle Time (End-to-End)**
| candidate | recruiter | hiring manager | total cycle time |
|-----------|-----------|----------------|-------------------|
| #1 | Ava | Chen | **12 days**  
| #9 | Ava | Singh | **11 days**  
| #10 | Ava | Singh | **11 days**  
| #5 | Mia | Rodriguez | 9  
| #6 | Mia | Rodriguez | 8  
| #8 | Noah | Patel | 8  
| #3 | Liam | Patel | 5  
| #4 | Liam | Patel | 5  
| #7 | Noah | Patel | 4  
| #2 | Ava | Chen | **3 days**  

---

## 🧠 What This Tells Us

- The funnel is strongest at the top, weakest at Offer → Hire.
- Recruiter performance varies widely; coaching opportunities exist.
- Hiring managers drive cycle time more than recruiters.
- Process standardization could reduce cycle time variability by 40–60%.

---

## 🛠️ Skills Demonstrated

- SQL CASE logic for funnel tracking  
- Aggregation + performance metrics  
- Operational analytics for HR workflows  
- Translating data into decision-ready insights  

---

## 📌 About This Challenge
This project is part of my **30-Day Applied Business Strategy Challenge**, where I solve one realistic problem each day using analytics + product thinking.

