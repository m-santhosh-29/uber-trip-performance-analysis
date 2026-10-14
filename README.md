# 🚗 Uber Trip Performance Analysis

> An end-to-end data analytics project using **Python**, **MySQL**, and **Power BI** to analyze Uber trip demand, booking value, vehicle performance, trip distance, travel time, payment methods, and pickup and drop-off locations, transforming trip data into actionable business insights through interactive dashboards.

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

Uber generates a large volume of trip data that can help businesses understand customer demand, revenue patterns, vehicle performance, and operational efficiency.

This project analyzes Uber trip data using Python, MySQL, and Power BI. It follows an end-to-end analytics workflow, from data preparation and exploratory analysis to business-focused SQL queries and interactive dashboard development.

The Power BI report contains three pages: **Overview Analysis, Time Analysis, and Details**. These pages provide an overview of booking performance, trip trends, vehicle categories, payment methods, and location-level activity.

## 🎯 Business Problem

Understanding trip performance is essential for identifying demand patterns and improving operational decisions.

This project explores questions such as:

- When is trip demand highest throughout the day and week?
- How much booking value is generated, and how does it change over time?
- Which vehicle categories contribute the most bookings and booking value?
- Which payment methods are most frequently used?
- Which pickup and drop-off locations are most popular?
- How do trip distance and duration vary across trips?
- How can demand and performance trends support better operational planning?

## ✅ Objectives

- Analyze trip data and prepare it for reliable analysis.
- Identify peak booking hours and weekday demand patterns.
- Evaluate booking value and trip performance.
- Compare vehicle categories by bookings and booking value.
- Analyze trip distance, duration, and payment methods.
- Identify frequently used pickup and drop-off locations.
- Build an interactive Power BI dashboard for business reporting.
- Convert analytical findings into practical recommendations.

## 📂 Dataset

The project uses two datasets:

| Dataset | Description |
|---|---|
| Uber Trip Details | Trip ID, pickup and drop-off timestamps, passenger count, trip distance, pickup and drop-off location IDs, fare amount, surge fee, vehicle category, and payment type |
| Location Table | Location IDs, location names, and city information |

The trip dataset contains approximately **103.7K trip records**, while the location table contains **265 location records**.

The location table helps map pickup and drop-off location IDs to readable location names for analysis and visualization.

## 🛠 Tech Stack

| Tool | Purpose |
|---|---|
| **Python** | Data cleaning, preprocessing, exploratory data analysis, and visualization |
| **Pandas & NumPy** | Data manipulation and numerical analysis |
| **Matplotlib** | Data visualization |
| **Jupyter Notebook** | Executing and documenting analytical questions |
| **MySQL** | SQL-based data analysis and business queries |
| **Power BI** | Interactive dashboards and business reporting |
| **GitHub** | Version control and project documentation |

## 🗂 Repository Structure

```text
uber-trip-performance-analysis/
│
├── Dashboards/
│   ├── uber_trip_analysis.pbix
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
└── README.md
```

*Adjust the folder and file names to match the files you actually upload to GitHub.*

## ⚙️ Methodology

1. **Data Understanding:** Examined the trip and location datasets, including their columns, data types, and relationships.
2. **Data Cleaning:** Prepared columns for analysis, handled data types, and parsed pickup and drop-off timestamps.
3. **Exploratory Data Analysis:** Used Python and Pandas to investigate trip patterns, booking values, and vehicle performance.
4. **SQL Analysis:** Used MySQL to perform business-oriented queries and aggregations.
5. **Time Analysis:** Examined bookings by pickup hour, weekday, and other available time dimensions.
6. **Location Analysis:** Connected location IDs with location names to identify popular pickup and drop-off points.
7. **Dashboard Development:** Built a three-page Power BI report with KPI cards, charts, tables, and filters.
8. **Business Insights:** Interpreted the results and developed recommendations based on observed patterns.

## 📊 Key KPIs

The Power BI dashboard highlights the following metrics:

| KPI | Dashboard Value |
|---|---:|
| Total Bookings | 103.7K |
| Total Booking Value | $1.6M |
| Average Booking Value | $15.0 |
| Total Trip Distance | 349K miles |
| Average Trip Distance | 3 miles |
| Average Trip Time | 16 minutes |

*These values reflect the dashboard screenshots and may be rounded for display.*

## 🖥 Dashboard Preview

The Power BI dashboard contains three pages designed to explore overall performance, trip timing, and detailed trip records.

**Interactive Dashboard:** [View the Power BI Dashboard](PASTE_YOUR_POWER_BI_LINK_HERE)

*Replace the placeholder above with your published Power BI report link when available.*

### 1️⃣ Overview Analysis

Provides a high-level view of trip performance, including total bookings, booking value, average booking value, trip distance, and average trip time.

It also includes payment method analysis, day/night trip comparisons, vehicle performance, popular pickup and drop-off points, and location-based booking patterns.

![Uber Trip Analysis - Overview](Dashboards/overview_analysis.png)

### 2️⃣ Time Analysis

Explores booking patterns across hours and days of the week. The page includes booking trends by pickup time, weekday booking totals, and a heatmap of booking demand by hour and day.

These visualizations help identify peak periods and understand how demand changes throughout the week.

![Uber Trip Analysis - Time Analysis](Dashboards/time_analysis.png)

### 3️⃣ Details

Displays detailed trip records, including trip ID, pickup date and time, vehicle category, payment type, passenger count, trip distance, booking value, pickup location, and drop-off location.

This page supports detailed examination of individual trips and the underlying data used in the dashboard.

![Uber Trip Analysis - Details](Dashboards/details.png)

## 💡 Key Insights

The dashboard highlights several areas for business investigation:

- **Booking Volume:** The dataset contains approximately 103.7K bookings.
- **Booking Value:** Total booking value is approximately $1.6M, with an average booking value of $15.
- **Trip Distance:** Total trip distance is approximately 349K miles, while average trip distance is around 3 miles.
- **Trip Duration:** The average trip time displayed in the dashboard is 16 minutes.
- **Time-Based Demand:** Booking activity varies across hours and weekdays, making peak-period analysis useful for planning.
- **Vehicle Performance:** Comparing bookings and booking value across vehicle categories helps identify differences in contribution.
- **Location Patterns:** Frequently used pickup and drop-off points reveal where trip activity is concentrated.

*These observations summarize the displayed dashboard metrics and chart categories. Further analysis is needed to quantify additional patterns and explain their causes.*

## 🚀 Business Recommendations

- Align driver availability with observed peak booking periods.
- Monitor booking trends by weekday to support operational planning.
- Compare vehicle categories by booking volume and booking value when allocating resources.
- Use pickup and drop-off patterns to identify locations with concentrated trip demand.
- Evaluate trip distance and duration to better understand trip characteristics.
- Monitor payment method distribution to understand customer payment preferences.
- Continue tracking key performance indicators to identify changes in demand and booking value over time.

## ▶️ How to Run

### 1. Clone the Repository

```bash
git clone https://github.com/m-santhosh-29/uber-trip-performance-analysis.git
cd uber-trip-performance-analysis
```

### 2. Python Analysis

Install the required packages:

```bash
pip install pandas numpy matplotlib jupyter
```

Open Jupyter Notebook:

```bash
jupyter notebook
```

Navigate to the `Python Analysis/` folder and open the notebooks in sequence.

Update the CSV file paths in the notebooks to match your local environment before running the cells.

### 3. MySQL Analysis

- Open MySQL Workbench or your preferred MySQL client.
- Import or load the dataset if your SQL workflow requires database tables.
- Execute the SQL scripts included in the repository.

### 4. Power BI Dashboard

- Open the `.pbix` file using Power BI Desktop.
- Update data source paths if necessary.
- Refresh the data model and review the report pages.

## 🔮 Future Improvements

- Automate data refresh and reporting.
- Add deeper analysis of peak-hour demand and location-level performance.
- Develop additional KPIs and comparisons across vehicle categories.
- Investigate factors associated with fare differences and trip duration.
- Publish the dashboard through Power BI Service for interactive online access.
- Improve the analysis with additional datasets and forecasting techniques.

## 👤 Author

**Santhosh M**

- GitHub: [@m-santhosh-29](https://github.com/m-santhosh-29)
- LinkedIn: [Santhosh M](https://www.linkedin.com/in/santhosh-m-32a61b419)

---

⭐ If you find this project useful, please consider giving the repository a star!
