# SQL project: food delivery service

In this SQL project, I used synthetic data provided for the "SQL Simulator" course from [Karpov.courses](https://karpov.courses/).   

I conducted an exploratory analysis using both basic and advanced SQL queries. I used the Redash environment to execute queries and create visualizations.

The data includes users' actions, their orders, and couriers' actions from 24/08/22 to 08/09/22.

In this project, I calculated product metrics for a food delivery service, such as:
1. **Product and system metrics:**
   - DAU (Daily Active Users), WAU (Weekly Active Users)
   - Dynamics of the number of users and couriers
   - Growth dynamics in relative values
   - Dynamics of the share of paying users and active couriers
   - Orders metrics
   - Load assessment on couriers
   - Time for order delivery
   - Burden on the system

3. **Product Economics:**
   - Calculation of revenue indicators
   - ARPU (Average Revenue Per User), ARPPU (Average Revenue Per Paying User), and AOV (Average Order Value)
   - Cumulative ARPU, ARPPU, and AOV
   - ARPU, ARPPU, and AOV by day of the week
   - Daily revenue distribution between new and returning users
   - Analytics for products that generate the most income
   - Calculation of costs with taxes and gross profit

4. **Marketing Metrics:**
   - DAU (Daily Active Users), MAU (Monthly Active Users)
   - CAC (Customer Acquisition Cost)
   - ROI (Return on Investment)
   - Average bill for campaigns
   - Retention rate by days
   - Retention rate by cohorts
   - Cumulative ARPPU by cohorts and days

As a result of the calculated metrics, we can create several dashboards that reflect the current status of the service's operations.


1. **Product and system metrics:**  
1.1 [DAU (Daily Active Users), WAU (Weekly Active Users)](DAU_WAU.sql)
   Number of active users by day:
   ![newplot (3)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/87387bbc-c373-4c60-99f0-0d942fd893ee)
   Number of active users by week:
   ![newplot (7)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/b0c31c7c-ebec-4062-8170-d21ed2d1273f)


