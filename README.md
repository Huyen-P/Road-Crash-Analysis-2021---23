![carbon](https://github.com/Huyen-P/UK-Road-Crash-Analysis-2019-2022/assets/72473316/b608a203-2d7f-4565-84a3-e600ed878174)![UK_Road_Crash_Analysis (1)](https://github.com/Huyen-P/UK-Road-Crash-Analysis-2019-2022/assets/72473316/1c6f2c17-4bdd-4d79-9bbb-7491abd708eb)
**Period of time: from 2019 to 2022**

### 01 - INTRODUCTION
This repository contains the datasource, an EDA SQL script, a data cleaning SQL script and an interactive Tableau workbook for visulization.
The datasource has **307.973 rows** and **19 columns**.
Link to the [Tableau dashboard](https://www.example.com](https://public.tableau.com/app/profile/huyen.phan5825/viz/RoadAccidentDashboard_16962422435460/Dashboard1)

### 02- REQUIREMENTS
**Initial requirements**: 

Clients want to create a UK Road Crash dashboard for the years from 2019 to 2022 so that they can have the following insights with the hope that they can minimize the loss of lives.

📌 Total Casualties took place after the accident.

📌 Total Casualties & percentage of total with respect to accident severity and maximum casualties by type of vehicle.

📌 Total Casualties with respect to vehicle type.

📌 Monthly trend showing a comparison of casualties for the current year and the previous year.

📌 Maximum Casualties by Road type.

📌 Distribution of total casualties by road surface.

📌 Relation between Casualties by Area/ Location & by Day/ Night.

### 03 - TOOL USED
📌 **SQL Microsoft Server** for EDA and Data Cleaning Process.

📌 **Tableau Desktop** for Data Visualization in parallel with Data Analysis.

### 04 - STEPS
**EDA**

I started with exploratory data analysis to deeper understand about the data patterns, inconsistences and potential insights. This step drives effective decision-making, aids in data cleaning, and informs appropriate analysis methods for enhanced project outcomes.

**Data Cleaning**

This step involves getting rid of data inconsistencies, errors, and duplicates, ensuring the accuracy and reliability of the data I'm using for subsequent analysis.

**Data Processing**

This step contains generating additional columns by organizing, sorting, and filtering the data to derive valuable insights.

**Data Analysing and Data Visualizing**

I conducted analysis and visualization simultaneously to grasp insights quickly, validate results, communicate effectively, and refine hypotheses iteratively. It aids in comprehensive understanding and facilitates efficient data exploration and interpretation.

**Dashboard Building** 

Finally, I translate all the insights into an interactive Tableau Public dashboard, enabling users to engage with the data.

### 05 - Insights from SQL query (following to the KPIs)
✅ The **Total Casualties** occurring post the accident amount to **417883**.
https://carbon.now.sh/?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=dracula-pro&wt=none&l=sql&width=680&ds=true&dsyoff=20px&dsblur=68px&wc=true&wa=true&pv=56px&ph=56px&ln=false&fl=1&fm=Hack&fs=18px&lh=133%25&si=false&es=2x&wm=false&code=SELECT%2520SUM%28number_of_casualties%29%2520AS%2520CY_Casualties%250AFROM%2520%255BUK-Road-Crash-DB%255D%2520..%2520uk_road_crash

✅ The **Maximum Casualties** occurred due to car accidents (**333,485**), accounting for **79.8%** of the Total Casualties, while the Minium occurred in **Other**, amounting to **3,424**.

✅ Total Casualties with respect to vehicle type.

✅ Monthly trend showing a comparison of casualties for the current year and the previous year.

✅ Maximum Casualties by Road type.

✅ Distribution of total casualties by road surface

✅ Relation between Casualties by Area/ Location & by Day/ Night.

