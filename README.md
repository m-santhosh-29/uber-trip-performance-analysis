# 🚗 Uber Trip Performance Analysis

> An end-to-end data analytics project using **Python**, **MySQL**, and **Power BI** to analyze Uber trip demand, booking value, vehicle performance, trip distance, trip duration, payment methods, and pickup and drop-off locations. This project transforms raw trip data into actionable business insights through interactive dashboards.

![Python](https://img.shields.io/badge/Python-EDA-3776AB?logo=python&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-Analysis-4479A1?logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

## 📌 Table of Contents

- [Project Overview](#-project-overview)
- [Business Problem](#-business-problem)
- [Objectives](#-objectives)
- [Dataset](#-dataset)
- [Tech Stack](#-tech-stack)
- [Repository Structure](#-repository-structure)
- [Methodology](#-methodology)
- [Key KPIs](#-key-kpis)
- [Dashboard Preview](#-dashboard-preview)
- [Key Insights](#-key-insights)
- [Business Recommendations](#-business-recommendations)
- [How to Run](#-how-to-run)
- [Future Improvements](#-future-improvements)
- [Author](#-author)

---

## 🔎 Project Overview

Uber trip data can reveal useful patterns in customer demand, booking value, vehicle performance, and operational efficiency.

This project explores Uber trip records using Python, MySQL, and Power BI. It includes data preparation, exploratory data analysis, SQL-based business analysis, and an interactive Power BI dashboard.

The dashboard contains three pages: **Overview Analysis**, **Time Analysis**, and **Details**. Together, they help users explore booking performance, demand patterns, vehicle categories, payment methods, and location-level activity.

## 🎯 Business Problem

Analyzing trip performance can help identify demand patterns and areas for operational improvement.

This project explores the following business questions:

- When is trip demand highest during the day and week?
- What is the total booking value and average booking value?
- Which vehicle categories contribute the most bookings and revenue?
- Which payment methods are most commonly used?
- Which pickup and drop-off locations have the highest activity?
- How do trip distance and duration vary?
- How can demand patterns support better operational planning?

## ✅ Objectives

- Clean and prepare trip data for analysis.
- Identify peak booking hours and weekday demand patterns.
- Analyze booking value and trip performance.
- Compare vehicle categories by booking volume and value.
- Explore trip distance, duration, and payment methods.
- Identify popular pickup and drop-off locations.
- Build an interactive Power BI dashboard.
- Generate business insights and practical recommendations.

## 📂 Dataset

This project uses two datasets:

| Dataset | Description |
|---|---|
| Uber Trip Details | Trip ID, pickup and drop-off timestamps, passenger count, trip distance, pickup and drop-off location IDs, fare amount, surge fee, vehicle category, and payment type |
| Location Table | Location IDs, location names, and city information |

**Dataset size:**
- Trip records: approximately **103.7K**
- Location records: **265**

The location table helps translate pickup and drop-off location IDs into readable location names for analysis and visualization.

## 🛠 Tech Stack

| Tool | Purpose |
|---|---|
| **Python** | Data cleaning, exploratory data analysis, and visualization |
| **Pandas & NumPy** | Data manipulation and numerical analysis |
| **Matplotlib** | Charts and visualizations |
| **Jupyter Notebook** | Analytical workflow and documentation |
| **MySQL** | SQL queries and business analysis |
| **Power BI** | Interactive dashboards and reporting |
| **GitHub** | Version control and project showcase |

## 🗂 Repository Structure

```text
uber-trip-performance-analysis/
│
├── Dashboards/
│   ├── overview_analysis.png
│   ├── time_analysis.png
│   └── details.png
│
├── Data Set/
│   ├── Uber Trip Details.csv
│   └── Location Table.csv
│
├── Python Analysis/
│   ├── 01_Data_Understanding_and_Cleaning.ipynb
│   ├── 02_Exploratory_Data_Analysis.ipynb
│   ├── 03_Time_Based_Analysis.ipynb
│   ├── 04_Location_and_Vehicle_Analysis.ipynb
│   ├── 05_Advanced_Business_Analysis.ipynb
│   └── 06_Business_Insights_and_Conclusions.ipynb
│
├── SQL/
│   └── SQL analysis scripts
│
├── Dashboards/
│   └── Power BI report (.pbix), if included
│
└── README.md
```

*Update the structure above to match your actual repository files. The screenshot filenames should match the names used in the Dashboard Preview section.*

## ⚙️ Methodology

1. **Data Understanding:** Examined the trip and location datasets, columns, data types, and relationships.
2. **Data Cleaning:** Prepared data types, converted timestamps, and handled invalid values where necessary.
3. **Exploratory Data Analysis:** Used Python and Pandas to investigate trip patterns, fares, and vehicle performance.
4. **SQL Analysis:** Used MySQL for business-oriented queries and aggregations.
5. **Time Analysis:** Analyzed bookings by pickup hour and weekday.
6. **Location Analysis:** Connected location IDs with location names to identify frequently used pickup and drop-off points.
7. **Dashboard Development:** Built a three-page Power BI report with KPI cards, charts, tables, and filters.
8. **Business Insights:** Interpreted the observed patterns and developed recommendations.

## 📊 Key KPIs

The Power BI dashboard displays the following headline metrics:

| KPI | Dashboard Value |
|---|---:|
| Total Bookings | 103.7K |
| Total Booking Value | $1.6M |
| Average Booking Value | $15.0 |
| Total Trip Distance | 349K miles |
| Average Trip Distance | 3 miles |
| Average Trip Time | 16 minutes |

*Values are rounded as displayed in the dashboard and may vary with filters.*

## 🖥 Dashboard Preview

The Power BI dashboard contains three pages. **All screenshots are embedded below**, so visitors can view them by scrolling through this README.

### 1️⃣ Overview Analysis

Provides a summary of overall booking performance, booking value, average booking value, trip distance, and average trip time.

The page also explores payment methods, day and night trips, vehicle performance, and frequently used pickup and drop-off locations.

![Uber Trip Analysis - Overview Dashboard](Dashboards/overview_analysis.png)

### 2️⃣ Time Analysis

Explores booking patterns by pickup hour and day of the week. The page includes hourly booking trends, daily booking totals, and a heatmap showing demand across hours and weekdays.

These visualizations help identify busy periods and understand how booking activity changes throughout the week.

![Uber Trip Analysis - Time Analysis Dashboard](Dashboards/time_analysis.png)

### 3️⃣ Details

Displays individual trip records, including trip ID, pickup date and time, vehicle category, payment type, passenger count, trip distance, booking value, pickup location, and drop-off location.

This page allows visitors to understand the detailed records supporting the dashboard analysis.

![Uber Trip Analysis - Details Dashboard](Dashboards/details.png)

## 💡 Key Insights

The dashboard highlights the following findings:

- **Booking Volume:** Approximately 103.7K trips are represented in the dashboard.
- **Booking Value:** Total booking value is approximately $1.6M, with an average booking value of $15.
- **Trip Distance:** Total trip distance is approximately 349K miles, with an average trip distance of 3 miles.
- **Trip Duration:** The displayed average trip time is 16 minutes.
- **Time-Based Demand:** Booking activity varies across hours and weekdays.
- **Vehicle Performance:** Vehicle categories can be compared by booking volume and booking value.
- **Location Patterns:** Pickup and drop-off activity is concentrated around frequently used locations.

These findings summarize the displayed dashboard metrics. Additional analysis is needed to quantify other patterns and determine their underlying causes.

## 🚀 Business Recommendations

- Align driver availability with observed peak booking periods.
- Use weekday demand patterns to support operational planning.
- Compare vehicle categories by booking volume and booking value.
- Identify high-activity pickup locations for better resource allocation.
- Analyze trip distance and duration to understand trip characteristics.
- Monitor payment method distribution to understand customer preferences.
- Track key KPIs over time to identify changes in demand and booking value.

## ▶️ How to Run

### 1. Clone the Repository

```bash
git clone https://github.com/m-santhosh-29/uber-trip-performance-analysis.git
cd uber-trip-performance-analysis
```

### 2. Set Up Python

Install the required packages:

```bash
pip install pandas numpy matplotlib jupyter
```

Launch Jupyter Notebook:

```bash
jupyter notebook
```

Open the notebooks in the `Python Analysis/` folder and run them in sequence. Update the dataset paths in the notebooks to match your local environment.

### 3. Run the MySQL Analysis

- Open MySQL Workbench or your preferred MySQL client.
- Import the datasets into database tables if required by your SQL scripts.
- Execute the analysis queries included in the repository.

### 4. Open the Power BI Dashboard

- Open the `.pbix` file in Power BI Desktop if you have included it in the repository.
- Update the data source paths if necessary.
- Refresh the data and explore the three report pages.

## 🔮 Future Improvements

- Automate data refresh and reporting.
- Add deeper analysis of peak-hour and location-level demand.
- Develop additional KPIs for comparing vehicle categories.
- Investigate factors associated with fare differences and trip duration.
- Publish the dashboard through Power BI Service for interactive online access.
- Explore demand forecasting using historical trip data.

## 👤 Author

**Santhosh M**

- GitHub: [@m-santhosh-29](https://github.com/m-santhosh-29)
- LinkedIn: [Santhosh M](https://www.linkedin.com/in/santhosh-m-32a61b419)

---

⭐ If you find this project useful, please consider giving the repository a star!
