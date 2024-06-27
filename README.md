# SQL project: online grocery delivery service

## Intro and data sourse
In this SQL project, I used synthetic data wich describes online grocery delivery service. These datasets were provided for the "SQL Simulator" course from [Karpov.courses](https://karpov.courses/).   
  
We have several **tables** which describe actions of users and couriers:
<img width="709" alt="Снимок экрана 2024-06-26 в 14 21 50" src="https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/442fbeea-cec3-41e6-8c4c-1eb3ed0b46e6">

I conducted an exploratory analysis using both basic and advanced SQL queries. Also I used the Redash environment to execute queries and create visualizations.

The data includes users' actions, their orders, and couriers' actions from 24/08/22 to 08/09/22.

In this project, I calculated product metrics for a food delivery service, such as:
1. **Product and system metrics:**
   - DAU (Daily Active Users), WAU (Weekly Active Users)
   - Dynamics of the number of users and couriers
   - Dynamics of the share of paying users and active couriers
   - Orders metrics
   - Assessment of the average workload of couriers
   - Time for order delivery
   - Burden on the system

2. **Product Economics:**
   - Calculation of revenue indicators
   - ARPU (Average Revenue Per User), ARPPU (Average Revenue Per Paying User), and AOV (Average Order Value)
   - ARPU, ARPPU, and AOV by day of the week
   - Daily revenue distribution between new and returning users
   - Analytics for products that generate the most income
   - Calculation of costs with taxes and gross profit

3. **Marketing Metrics:**
   - DAU (Daily Active Users), MAU (Monthly Active Users)
   - CAC (Customer Acquisition Cost)
   - ROI (Return on Investment)
   - Average bill for campaigns
   - Retention rate by days
   - Retention rate by cohorts
   - Cumulative ARPPU by cohorts and days

## Dashboards
As a result of the calculated metrics, we can create several dashboards that reflect the current status of the service's operations.


## Exploratory analysis
### 1. Product and system metrics:
   
#### 1.1 [DAU (Daily Active Users), WAU (Weekly Active Users)](Product_and_system_metrics/DAU_WAU.sql)
  
   We observed an increase in the daily number of active users, with a noticeable acceleration in registrations starting from the 2nd of September 
   
   *Number of active users by day:*
   ![newplot (3)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/87387bbc-c373-4c60-99f0-0d942fd893ee)
     
   *Number of active users by week:*
   ![newplot (7)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/b0c31c7c-ebec-4062-8170-d21ed2d1273f)

#### 1.2 [Dynamics of the number of users and couriers](Product_and_system_metrics/number_of_users_and_couriers.sql)     
  
   Let's analyze how quickly our service's audience is growing.
     
   From the dynamics chart of the total number of users, it is evident that over the course of the service's existence, more than 20,000 unique users have been attracted, each having placed at least one order.  
   The number of new users is increasing faster than the number of new couriers, which is typical for these services. We will assess the average number of orders per courier in the next steps.    
   The indicators of new user numbers are quite volatile; on any given day, we acquire between 1,000 to 2,000 new users. There are days when these figures deviate from the overall trend.   
   Meanwhile, the indicator for the number of new couriers is more stable compared to the metric for new users.
     
   *Daily dynamics of new users and new couriers:*
   ![newplot (4)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/150121ed-583a-446d-a613-51071983f9b9)

   *Dynamics of the total number of users and couriers:*
   ![newplot (5)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/3a992a7f-b7ab-4dfb-90f7-82207362e732)

#### 1.3 [Dynamics of the share of paying users and active couriers](Product_and_system_metrics/share_of_paying_users_and_active_couriers.sql)  
  
   We will consider as paying users those who placed at least one order on a given day, which was subsequently not canceled.   
   Couriers will be considered active if on a given day they accepted at least one order that was delivered (possibly on the next day), or they delivered any order.  

   Alongside the overall growth in the number of users and couriers, the number of paying users and active couriers is also increasing. However, we observe that the share of paying users is decreasing and stabilizing around 20%.   
   Simultaneously, the proportion of active couriers remains stable at approximately 90%, which is normal and expected.  
  
   *Number of paying users and active couriers:*
   ![newplot (6)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/f323e3a3-0555-4720-a373-8787233fbeb6)
  
  *Dynamics of the share of paying users and active couriers:* 
   ![newplot (8)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/7d115b23-22f3-425c-9b9d-e33b4d0b9453)

#### 1.4 [Orders metrics](Product_and_system_metrics/orders_metrics.sql)
   Based on the first graph, it is evident that each day we receive between 1000 to 2000 orders from new users, with a portion of these users placing more than one order per day. This ratio remains stable throughout the observed period.

   The trend in the share of first orders shows a decline, stabilizing around 30-40%. This means that on any given day, 30-40% of our orders come from new users. The remaining portion consists of repeat orders from existing users. In the long term, we can expect a decrease in this relative indicator as the overall number of users continues to grow.

   *Dynamic of the total number of orders, number of first orders, and number of orders by new users:*
   ![newplot (9)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/34e67e29-81bf-4640-99b2-d33f4cec9705)
     
   *Dynamic of the share of first orders and the share of orders by new users in the total number of orders:*
   ![newplot (10)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/441a3254-e94c-4e4a-b41c-fd58913e0aa0)

#### 1.5. [Assessment of the average workload of couriers](Product_and_system_metrics/orders_per_courier.sql)
   Let's evaluate the average number of orders per courier. On average, each courier delivers only two orders per day. Some users place more than one order per day, which explains why the total number of orders exceeds the number of unique users. Additionally, there is a decreasing trend, with the number of orders per user declining. Currently, the service has more couriers than needed for the number of orders.
     
   *Number of orders per user:*
   ![newplot (11)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/4fd7c1c7-adab-4426-ba63-13d91733d4e4)

#### 1.6. [Time for order delivery](Product_and_system_metrics/time_to_delivery.sql)  
Delivery of one order in average takes 20 minutes.
    
*Time for order delivery:*
![newplot (13)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/d40cd666-e63f-44e5-99e4-6171065e6828)

#### 1.7. [Burden on the system by hours](Product_and_system_metrics/burden_on_system.sql)
To determine the hours when users are most active, let's analyze the number of delivered orders, canceled orders, and the share of canceled orders in the total number of orders for each hour. The highest load on the service is observed in the evening hours between 17:00 and 21:00, while the lowest load occurs at night between 02:00 and 06:00. The cancellation rate is around 5% during the day and remains quite stable.  

*The load on the service by hours:*
![newplot (15)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/c2ec94a3-8135-412e-9ff5-6cab430ad6ff)

### 2. **Product Economics:**  
  
#### 2.1. [Calculation of revenue indicators](Product_economics/revenue_indicators.sql)
We can observe a noticeable decline in daily revenue on September 5th and 6th, while on other days, the increase compared to the previous day remained positive. Based on previous calculations, we can attribute this to a drop in the growth of orders from new users and a decrease in the share of paying users in the service.

Overall, in the 16 days of the service's existence, the total revenue amounted to 21,679,095.
  
*Daily revenue:*
![newplot (20)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/b7b6b8c9-dcea-407a-ba48-da42100fd273)
  
*Increase in revenue generated on that day compared to the revenue of the previous day:*
![newplot (21)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/c767e9e7-5999-4d3d-998b-14b939f62e96)

*Cumulative revenue up to the current day:*
![newplot (22)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/39770248-65b3-4e27-8a8b-0fe23c871873)

#### 2.2 [ARPU (Average Revenue Per User), ARPPU (Average Revenue Per Paying User), and AOV (Average Order Value)](Product_economics/ARPU_ARPPU_AOV.sql)

The metrics ARPU and ARPPU show volatility in values throughout the observed period, with ARPPU ranging from $470 to $582. Meanwhile, the daily average order value (AOV) has stabilized and fluctuates between $370 and $383.

Regarding the ratio of paying users to all users of the service, we can observe a stable gap in the average revenue per user, favoring the revenue from paying users. This is because order cancellations lead to a decrease in the average revenue per user.

*Daily ARPU, ARPPU, AOV:*
![newplot (24)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/a1280afb-0c9f-4e4a-900e-1dfb99d07d46)

#### 2.3 [ARPU, ARPPU, and AOV by day of the week](Product_economics/DOW_APRU_APPRU_AOV.sql)
Let's calculate the same metrics, but broken down by days of the week rather than by individual days.   
In our calculations, we will only consider data from August 26, 2022, to September 8, 2022, inclusive—ensuring the analysis includes an equal number of all weekdays (exactly two days each).  
The ARPU and ARPPU metrics reach their highest values on Saturday and Sunday (with a maximum ARPPU of $595). We might assume this is because people make purchases with higher average order values to stock up on groceries for the upcoming week, but the AOV remains almost unchanged on these days. Therefore, we can hypothesize that the increase in revenue per user is driven by repeat orders throughout the day. On other days of the week, the ARPPU ranges from $548 to $553.

*ARPU, ARPPU, and AOV by day of the week:*
![newplot (25)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/e53c4521-77d2-48c1-86da-bdcab556cd61)

#### 2.4 [Daily revenue distribution between new and returning users](Product_economics/new_and_returning_users_revenue.sql)


#### 2.5 [Analytics for products that generate the most income]()
#### 2.6 [Calculation of costs with taxes and gross profit]()




  



   



