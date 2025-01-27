# SQL project: online grocery delivery service

## **Project Introduction**

### **Overview**

In this project, I conducted a detailed exploratory data analysis for an online grocery delivery service, focusing on the period from August 24, 2022, to September 8, 2022. The primary objective was to evaluate various product metrics to understand user behavior, system performance, and financial health, thereby providing actionable insights for optimizing service operations.

### **Data source and structure**
In this SQL project, I used synthetic data wich describes online grocery delivery service. These datasets were provided for the "SQL Simulator" course from [Karpov.courses](https://karpov.courses/).   
 
We have several **tables** which describe actions of users and couriers:
<img width="709" alt="Снимок экрана 2024-06-26 в 14 21 50" src="https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/442fbeea-cec3-41e6-8c4c-1eb3ed0b46e6">

### **Methodology**

To achieve these objectives, I employed both basic and advanced PostgreSql queries to extract and analyze data. The analysis was performed in the Redash environment, which enabled the execution of complex queries and the creation of comprehensive visualizations. The data sets used in this analysis included users’ actions, order details, and couriers’ activities.

### **Analysis focus**

The analysis was structured into three main categories:

1. [**Product and System Metrics**](https://github.com/annamarkova13/SQL_project_food_delivery_service/edit/main/README.md#1-product-and-system-metrics)
   - DAU (Daily Active Users), WAU (Weekly Active Users)
   - Dynamics of the number of users and couriers
   - Dynamics of the share of paying users and active couriers
   - Orders metrics
   - Assessment of the average workload of couriers
   - Time for order delivery
   - Burden on the system

2. [**Product Economics**](https://github.com/annamarkova13/SQL_project_food_delivery_service/edit/main/README.md#2-product-economics)
   - Calculation of revenue indicators
   - ARPU (Average Revenue Per User), ARPPU (Average Revenue Per Paying User), and AOV (Average Order Value)
   - ARPU, ARPPU, and AOV by day of the week
   - Daily revenue distribution between new and returning users
   - Analytics for products that generate the most income
   - Calculation of costs with taxes and gross profit

3. [**Marketing Metrics**](https://github.com/annamarkova13/SQL_project_food_delivery_service/edit/main/README.md#3-marketing-metrics)
   - CAC (Customer Acquisition Cost)
   - ROI (Return on Investment)
   - Average bill for campaigns
   - Retention rate by days
   - Retention rate by cohorts
   - Cumulative ARPPU by cohorts and days

### **Impact of analysis**

The analysis provided a deep dive into the operational and financial aspects of the online grocery delivery service. Here’s how the findings and recommendations from the analysis impact the service:

| **Analysis area**                | **Impact**                                                                                         |
|----------------------------------|----------------------------------------------------------------------------------------------------|
| **User Engagement and Growth**   | Identified growth trends and peak periods, allowing for targeted marketing and engagement strategies. |
| **System Performance**          | Highlighted peak usage hours and system burden, leading to recommendations for improved infrastructure and load management. |
| **Order Metrics**               | Provided insights into order frequency, delivery efficiency, and user behavior, which can help in optimizing courier operations and improving service quality. |
| **Product Economics**          | Detailed financial analysis revealed initial losses and subsequent profitability, guiding cost management strategies and future investment decisions. |
| **Marketing Effectiveness**    | Revealed the effectiveness of acquisition and retention efforts, helping to balance marketing strategies and improve customer retention programs. |
| **Top Revenue Products**       | Identified high-revenue products, guiding inventory management and marketing strategies to focus on best-performing items. |

### **Conclusion and recommendations**

**Key findings:**
- **Growth Trends:** DAU and WAU showed positive growth, with notable increases during the weekends.
- **User-Courier Balance:** The number of users is growing faster than couriers, suggesting a need for improved courier management.
- **Order Metrics:** A consistent AOV but fluctuating new user orders indicated a need for strategies to increase repeat purchases.
- **Financial Health:** The service transitioned from initial losses to profitability, highlighting successful cost management and revenue strategies.

**Strategic recommendations:**
1. **Marketing Campaigns:** Enhance weekday marketing efforts to balance the higher weekend spending.
2. **Retention Strategies:** Focus on converting non-paying users and increasing repeat orders.
3. **Operational Efficiency:** Optimize courier allocation based on user demand and peak times.
4. **Financial Planning:** Analyze cost structures and prepare for scalable growth.

The insights from this analysis not only reflect the current state of the service but also provide a strategic foundation for future improvements. By implementing the recommendations, the service can enhance user satisfaction, optimize operational efficiency, and drive sustained financial growth.

### **Project summary**

This project provided a comprehensive evaluation of the online grocery delivery service’s metrics through advanced data analysis techniques. The findings offer actionable insights for optimizing marketing strategies, improving operational efficiency, and managing finances effectively.


## Dashboards
As a result of the calculated metrics, we can create several dashboards that reflect the current status of the service's operations.  
The following dashboards were created using Tableau and are supported by links to Tableau Public pages.

- [Users And Orders Metrics](https://public.tableau.com/shared/43JCRYPWB?:display_count=n&:origin=viz_share_link)  
![USERS AND ORDERS METRICS (1)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/bef1e598-1f7d-4153-8d7a-a91f80192351)


- [Couriers and Delivery Metrics](https://public.tableau.com/views/Couriersanddeliverymetrics/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
![Dashboard 1 (1)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/f66d8e70-2f39-43c0-9fa9-7817f10e9d91)
  
- [Product Economics Metrics](https://public.tableau.com/views/Producteconomicsmetrics/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
![Dashboard 1 (3)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/cf1a411d-11bc-4590-8e45-76caf0008ae4)



## 1. Product and system metrics:
   
### 1.1 [DAU (Daily Active Users), WAU (Weekly Active Users)](Product_and_system_metrics/DAU_WAU.sql)
   **Conclusion:**
- The increase in DAU and WAU, with a noticeable acceleration in registrations from September 2nd, indicates successful user acquisition efforts.
- The growth trend is positive, showing that the service is gaining traction among new users.

**Recommendations:**
- **Enhance user acquisition:** Continue to invest in marketing campaigns, promotions, or referral programs to sustain and amplify the growth rate of new users.
- **Analyze growth drivers:** Investigate the factors contributing to the increase in registrations around September 2nd. It is related to specific marketing efforts, promotions. Leverage these insights to replicate successful strategies.
- **Focus on retention strategies:** Since acquiring new users is successful, concentrate efforts on improving user retention by offering loyalty programs, personalized offers, and better customer support.

  
   *Number of active users by day:*
   ![newplot (3)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/87387bbc-c373-4c60-99f0-0d942fd893ee)
       
   *Number of active users by week:*
   ![newplot (7)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/b0c31c7c-ebec-4062-8170-d21ed2d1273f)

### 1.2 [Dynamics of the number of users and couriers](Product_and_system_metrics/number_of_users_and_couriers.sql)     
  
   Let's analyze how quickly our service's audience is growing.
     
   **Conclusion:**
- From the dynamics chart of the total number of users, it is evident that over the course of the service's existence, more than 20,000 unique users have been attracted, each having placed at least one order.
-  The number of new users is increasing faster than the number of new couriers, which is typical for these services. We will assess the average number of orders per courier in the next steps.
-  The indicators of new user numbers are quite volatile; on any given day, we acquire between 1,000 to 2,000 new users. There are days when these figures deviate from the overall trend.
-  Meanwhile, the indicator for the number of new couriers is more stable compared to the metric for new users.
  
**Recommendations:**
- **Optimize courier recruitment:** To keep up with the increasing number of users, maintain the number of couriers and track average workload of couriers.
- **Optimize courier allocation:** Analyze the geographical distribution of users and couriers to ensure efficient coverage and minimize delivery times. Consider implementing a dynamic allocation system to match couriers with users based on demand patterns.

   *Daily dynamics of new users and new couriers:*
   ![newplot (4)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/150121ed-583a-446d-a613-51071983f9b9)

   *Dynamics of the total number of users and couriers:*
   ![newplot (5)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/3a992a7f-b7ab-4dfb-90f7-82207362e732)

### 1.3 [Dynamics of the share of paying users and active couriers](Product_and_system_metrics/share_of_paying_users_and_active_couriers.sql)  

   We will consider as paying users those who placed at least one order on a given day, which was subsequently not canceled.   
   Couriers will be considered active if on a given day they accepted at least one order that was delivered (possibly on the next day), or they delivered any order.  
     
**Conclusion:**
- Alongside the overall growth in the number of users and couriers, the number of paying users and active couriers is also increasing. However, we observe that the share of paying users is decreasing and stabilizing around 20%.   
- Simultaneously, the proportion of active couriers remains stable at approximately 90%, which is normal and expected.  
   
**Recommendations:**
- **Improve conversion rates:** Develop strategies to increase the percentage of users who make purchases, such as targeted promotions for first-time buyers, user experience improvements, and incentives for repeat purchases.
- **Focus on user engagement:** Create campaigns to re-engage users who have not placed orders recently and improve the user journey from sign-up to checkout.
  
   *Number of paying users and active couriers:*
   ![newplot (6)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/f323e3a3-0555-4720-a373-8787233fbeb6)
  
  *Dynamics of the share of paying users and active couriers:* 
   ![newplot (8)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/7d115b23-22f3-425c-9b9d-e33b4d0b9453)

### 1.4 [Orders metrics](Product_and_system_metrics/orders_metrics.sql)

**Conclusion:**
- Based on the first graph, it is evident that each day we receive between 1000 to 2000 orders from new users, with a portion of these users placing more than one order per day. This ratio remains stable throughout the observed period.
- The trend in the share of first orders shows a decline, stabilizing around 30-40%. This means that on any given day, 30-40% of our orders come from new users. The remaining portion consists of repeat orders from existing users. In the long term, we can expect a decrease in this relative indicator as the overall number of users continues to grow.
  
**Recommendations:**
- **Encourage repeat orders:** Introduce loyalty programs, discounts for repeat purchases, or exclusive deals for frequent users to increase the number of orders per user.
- **Promote new user orders:** Create special offers for new users to encourage initial orders, which could help increase the percentage of first orders.

   *Dynamic of the total number of orders, number of first orders, and number of orders by new users:*
   ![newplot (9)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/34e67e29-81bf-4640-99b2-d33f4cec9705)
     
   *Dynamic of the share of first orders and the share of orders by new users in the total number of orders:*
   ![newplot (10)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/441a3254-e94c-4e4a-b41c-fd58913e0aa0)

### 1.5. [Assessment of the average workload of couriers](Product_and_system_metrics/orders_per_courier.sql)
   Let's evaluate the average number of orders per courier. On average, each courier delivers only two orders per day. 

   **Conclusion:**
- Some users place more than one order per day, which explains why the total number of orders exceeds the number of unique users.
- Additionally, there is a decreasing trend, with the number of orders per user declining. Currently, the service has more couriers than needed for the number of orders.

**Recommendations:**
- **Optimize courier workload:** reassess the number of couriers needed and consider adjusting the number of couriers to better match demand. Implement scheduling adjustments to better align with peak order times.
- **Increase order volume:** work on increasing the order volume per courier by implementing strategies to boost overall orders, such as promotions or partnerships.

   *Number of orders per courier:*
   ![newplot (11)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/4fd7c1c7-adab-4426-ba63-13d91733d4e4)

### 1.6. [Time for order delivery](Product_and_system_metrics/time_to_delivery.sql)  

**Conclusion:**
- On average, it takes 20 minutes for order delivery.

**Recommendations:**
- **Improve efficiency:** Explore ways to reduce delivery times without compromising service quality. This might involve route optimization algorithms, better courier training, or improved logistics support.
- **Communicate delivery times:** Ensure that delivery times are clearly communicated to users, and consider setting expectations for longer delivery times during peak hours.
    
*Time for order delivery:*
![newplot (13)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/d40cd666-e63f-44e5-99e4-6171065e6828)

### 1.7. [Burden on the system by hours](Product_and_system_metrics/burden_on_system.sql)
To determine the hours when users are most active, let's analyze the number of delivered orders, canceled orders, and the share of canceled orders in the total number of orders for each hour. 

**Conclusion:**
- The highest load on the service is observed in the evening hours between 17:00 and 21:00, while the lowest load occurs at night between 02:00 and 06:00.
- The cancellation rate is around 5% during the day and remains quite stable.  

**Recommendations:**
- **Manage Peak Hours:** Prepare for peak hours by increasing the number of couriers and support staff during the busiest times (17:00 - 21:00). Use data to forecast peak times and adjust resources accordingly.
- **Address Cancellations:** Although the cancellation rate is stable, it’s beneficial to investigate the causes of order cancellations and work on reducing them.

*The load on the service by hours:*
![newplot (37)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/3174958f-ae26-4711-a813-33a34612c754)


### Conclusions and recommendations

| Metric                     | Conclusion                                                                 | Recommendations                                                                                                        |
|----------------------------|----------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| DAU & WAU                  | Increase in DAU and WAU, with growth acceleration from September 2nd       | Enhance user acquisition, analyze successful growth drivers, focus on user retention strategies.                     |
| Users vs. Couriers         | New user growth outpaces courier growth; user acquisition is volatile       | Stop courier recruitment for now, optimize courier allocation, and match supply with demand.                                |
| Paying Users & Active Couriers | Paying user share is declining, courier activity is stable                   | Improve conversion rates, focus on user engagement, increase repeat orders.                                          |
| Orders Metrics             | Stable order volume; share of first orders is declining                     | Encourage repeat orders, promote new user orders, offer incentives for first-time users.                             |
| Average Workload of Couriers | Couriers have low average order volume; excess couriers                      | Optimize courier workload, adjust the number of couriers based on demand, and increase order volume.                |
| Time for Order Delivery    | Average delivery time is 20 minutes                                       | Improve delivery efficiency, communicate delivery times, and explore ways to reduce average delivery times.         |
| System Burden by Hours     | Highest load during 17:00 - 21:00, lowest during 02:00 - 06:00             | Manage peak hours with more resources, analyze and reduce cancellation causes.                                        |


## 2. **Product Economics:**  
  
### 2.1. [Calculation of revenue indicators](Product_economics/revenue_indicators.sql)
We can observe a noticeable decline in daily revenue on September 5th and 6th, while on other days, the increase compared to the previous day remained positive. Based on previous calculations, we can attribute this to a drop in the growth of orders from new users and a decrease in the share of paying users in the service.

Overall, in the 16 days of the service's existence, the total revenue amounted to 21,679,095.
  
*Daily revenue:*
![newplot (20)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/b7b6b8c9-dcea-407a-ba48-da42100fd273)
  
*Increase in revenue generated on that day compared to the revenue of the previous day:*
![newplot (21)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/c767e9e7-5999-4d3d-998b-14b939f62e96)

*Cumulative revenue up to the current day:*
![newplot (22)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/39770248-65b3-4e27-8a8b-0fe23c871873)

### 2.2 [ARPU (Average Revenue Per User), ARPPU (Average Revenue Per Paying User), and AOV (Average Order Value)](Product_economics/ARPU_ARPPU_AOV.sql)

Based on the graph showing ARPU (Average Revenue Per User), ARPPU (Average Revenue Per Paying User), and AOV (Average Order Value) per day, we can draw several conclusions:

- **User behavior**: Users tend to spend more on weekends, which aligns with common shopping behaviors where people buy groceries for the upcoming week.  
  The peaks and troughs suggest that user spending behavior varies significantly across different days.  
  The spikes in ARPU and ARPPU, particularly around weekends (August 27-28 and September 3-4), suggest increased spending during these periods. This could be due to users making larger purchases or more frequent orders on weekends.  
  Despite the stability in AOV, the higher number of transactions or higher spending per user on weekends drives up the overall revenue metrics.
- **Order value consistency**: The consistent AOV suggests a stable pricing strategy and consistent purchasing patterns per order.  
  AOV remains relatively stable throughout the period, fluctuating within a narrow range. This indicates that while the number of orders might vary, the value per order remains consistent.  
  This stability suggests that individual order sizes do not change drastically, even though overall user spending and the number of paying users do.  
- **Revenue strategies**: Efforts to increase the number of paying users and encouraging larger or more frequent orders on weekdays could help smooth out revenue volatility.  
  The consistent gap between ARPU and ARPPU highlights the dependency on paying users for revenue. Strategies to convert more users into paying customers could potentially increase overall revenue.

**Recommendations:**

1. **Marketing campaigns**: Implement targeted marketing campaigns during weekdays to boost spending and order frequency outside of weekends.
2. **Incentives for repeat purchases**: Offer incentives for users to place orders more frequently, particularly aiming to convert non-paying users to paying users.
3. **Weekend promotions**: Continue or enhance promotions and discounts on weekends to capitalize on the higher spending trend.
4. **Analyze spending patterns**: Further analyze the spending patterns of paying users to identify opportunities for upselling and cross-selling.

*Daily ARPU, ARPPU, AOV:*
![newplot (24)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/a1280afb-0c9f-4e4a-900e-1dfb99d07d46)

### 2.3 [ARPU, ARPPU, and AOV by day of the week](Product_economics/DOW_APRU_APPRU_AOV.sql)
Let's calculate the same metrics, but broken down by days of the week rather than by individual days.   
In our calculations, we will only consider data from August 26, 2022, to September 8, 2022, inclusive—ensuring the analysis includes an equal number of all weekdays (exactly two days each).  
  
The ARPU and ARPPU metrics reach their highest values on Saturday and Sunday (with a maximum ARPPU of 595 rub). We might assume this is because people make purchases with higher average order values to stock up on groceries for the upcoming week, but the AOV remains almost unchanged on these days. Therefore, we can hypothesize that the increase in revenue per user is driven by repeat orders throughout the day. On other days of the week, the ARPPU ranges from 548 rub to 553 rub.

*ARPU, ARPPU, and AOV by day of the week:*
![newplot (25)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/e53c4521-77d2-48c1-86da-bdcab556cd61)

### 2.4 [Daily revenue distribution between new and returning users](Product_economics/new_and_returning_users_revenue.sql)
Based on the graph depicting the distribution of orders between new and old customers per day, we can draw several conclusions:
- **Customer acquisition**: The service was initially successful in acquiring new customers, which is crucial for growth in the early stages.
- **Customer retention**: The increasing share of revenue from returning customers indicates that the service is effectively retaining its user base.
- **Revenue stability**: As the proportion of revenue from old customers stabilizes, the service can expect more stable and predictable income. By the end of the second week, the share of revenue from new user orders stabilizes around 40%.

**Recommendations:**

1. **Enhance retention programs**: Continue to focus on retention programs to maintain and grow the proportion of revenue from returning customers.
2. **Balance acquisition and retention efforts**: Ensure a balanced approach to acquiring new customers while keeping existing ones engaged.
3. **Analyze customer behavior**: Further analyze the behavior and preferences of returning customers to tailor services and products that meet their needs.
  
*Daily revenue distribution between new and returning users:*
![newplot (26)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/92feedd8-827b-40a1-a162-e939c8ae4cb3)

### 2.5 [Analytics for products that generate the most income](Product_economics/products_that_generate_the_most_income.sql)
It would also be interesting to analyze which products are the most popular and contribute the most to our revenue. Let’s review the top 20 products that generate the highest revenue. We can see that the meat category makes the largest contribution: if we sum up the revenue shares of pork, chicken, beef, and lamb among the top 5 products, they account for 20% of the total revenue. Olive oil also represents a significant portion of the revenue.  
Based on this analysis, we can draw **several conclusions and recomendations**:
- The meat category is a major revenue driver. Pork, chicken, beef, and lamb collectively contribute significantly to overall sales, indicating strong consumer demand for these products.
- Olive oil is another key revenue source. Its significant share of revenue suggests that it is a popular and essential item for customers.
- Focus on high-revenue products. Since meat and olive oil are top contributors, prioritize their availability and quality to maintain or increase revenue.
- Strategize marketing efforts. Highlight these popular products in marketing campaigns to attract more customers and boost sales.
- Explore opportunities for growth. Investigate ways to expand the product range within these successful categories or introduce new products that complement meat and olive oil.
  
*Top-20 products that generate the most income:*
![newplot (28)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/ceaa1ec5-47fc-4935-a773-ee12bc339bfa)


### 2.6 [Calculation of costs with taxes and gross profit](Product_economics/costs_with_taxes_and_gross_profit.sql)

Now let’s incorporate costs and taxes into our calculations to determine the gross profit, which represents the actual amount we earned from selling products over the analyzed period. We will calculate the following metrics:

1. *Revenue Generated on That Day*  
   The total amount earned from sales on a specific day.
2. *Costs Incurred on That Day*  
   The total expenses associated with producing or procuring the products sold on that day.
3. *VAT Collected from Sales on That Day*  
   The value-added tax collected on sales for that specific day.
4. *Gross Profit for the Day*  
   Calculated as: Revenue - Costs - VAT. This represents the profit made from sales after accounting for costs and taxes.
5. *Total Revenue Up to That Day*  
    The cumulative revenue generated from the start of the period up to and including that day.
6. *Total Costs Up to That Day*  
    The cumulative costs incurred from the start of the period up to and including that day.
7. *Total VAT Up to That Day*  
    The cumulative VAT collected from sales from the start of the period up to and including that day.
8. *Total Gross Profit Up to That Day*  
    Calculated as: Total Revenue - Total Costs - Total VAT. This shows the cumulative gross profit earned from sales over the period.
9. *Share of Gross Profit in Revenue for That Day*  
    The ratio of the gross profit for that day to the revenue for that day, expressed as a percentage. This shows the proportion of revenue that remains as profit after accounting for costs and VAT.
10. *Share of Total Gross Profit in Total Revenue Up to That Day*  
    The ratio of total gross profit to total revenue up to that day, expressed as a percentage. This indicates the overall profitability of the sales over the period.

**To calculate costs, we will introduce additional conditions**  
In simplified terms, the **costs** for our service will be considered as the sum of fixed and variable expenses. We will categorize **fixed costs** as warehouse rent and **variable costs** as the cost of order picking and delivery. Therefore, variable costs will be directly related to the number of orders.

Based on the data provided by the finance department, we know the following:
- In **August 2022**, the fixed costs amounted to **120,000 rubles per day**. However, starting from **September 2022**, the need for additional warehouse space increased the fixed costs to **150,000 rubles per day**.
- Additionally, in **August 2022**, the cost of picking one order was **140 rubles**, the payment to couriers for one delivered order was **150 rubles**, and there was a daily bonus of **400 rubles** for couriers delivering **at least 5 orders per day**.
- In **September 2022**, the cost of picking an order was reduced to **115 rubles**, but the bonus for delivering **5 or more orders per day** was increased to **500 rubles** to offer more competitive working conditions, while the payment for each delivered order remained at **150 rubles**.

#### Cost Calculation:

1. **Fixed Costs**:
   - **August 2022**: 120,000 rubles per day.
   - **September 2022**: 150,000 rubles per day.

2. **Variable Costs**:
   - **August 2022**:
     - Cost of picking one order: 140 rubles.
     - Payment to couriers for one delivered order: 150 rubles.
     - Daily bonus for couriers: 400 rubles if they deliver at least 5 orders.
   - **September 2022**:
     - Cost of picking one order: 115 rubles.
     - Payment to couriers for one delivered order: 150 rubles.
     - Daily bonus for couriers: 500 rubles if they deliver at least 5 orders.

#### Formulas for Cost Calculation:
- **Total variable cost** = (Cost of Picking Orders + Payment to Couriers) * Number of Orders + (Bonus for Couriers if Applicable)
  - **August 2022**:
    - **Total variable cost** = (140 + 150) * Number of Orders + (400 rubles if 5 or more orders are delivered)
  - **September 2022**:
    - **Total variable cost** = (115 + 150) * Number of Orders + (500 rubles if 5 or more orders are delivered)

#### Key Terms:

- **Fixed costs:** Regular expenses that do not change with the volume of orders.
- **Variable costs:** Expenses that vary directly with the number of orders.
- **Order picking cost:** The expense associated with preparing an order for delivery.
- **Courier payment:** The fee paid to couriers for delivering an order.
- **Courier bonus:** An additional payment to couriers based on the number of orders delivered.

By incorporating these calculations, we can better understand the cost structure of the service and evaluate financial performance over time.

#### Summary Table:

| **Month**    | **Fixed Costs** | **Order Picking Cost** | **Courier Payment** | **Courier Bonus** |
|--------------|-----------------|------------------------|---------------------|-------------------|
| **August 2022** | 120,000 rubles/day | 140 rubles/order       | 150 rubles/order    | 400 rubles/day     |
| **September 2022** | 150,000 rubles/day | 115 rubles/order       | 150 rubles/order    | 500 rubles/day     |

#### Calculating VAT:
To incorporate VAT into our calculations, we need to distinguish between products taxed at different rates. For each day, calculate:
- Revenue from products taxed at 10% and 20%.
- VAT from products taxed at 10% = Revenue * 10 / 110.
- VAT from products taxed at 20% = Revenue * 20 / 120.

Based on the graph of *Gross Profit for the Day and Cumulative Gross Profit*, we can make several conclusions:
![newplot (29)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/82645305-c687-430d-b0bc-5742727dfd74)

- **Early operational losses**: The service faced significant operational losses initially, likely due to high fixed and variable costs not being met by the revenues.
- **Successful cost management or revenue increase**: The turnaround suggests successful cost management, increased efficiency, or a significant increase in order volumes or average order value.
- **Profitability achieved**: The service has achieved and maintained profitability after an initial period of losses, indicating a successful business model adjustment or market penetration strategy.

#### Recommendations:

1. **Analyze causes of initial losses**: Conduct a detailed analysis to understand the high losses in the initial period and identify if they were due to fixed costs, low order volumes, or other factors.
2. **Sustain positive trends**: Focus on sustaining the positive trends in daily gross profit through continued cost management, customer acquisition, and retention strategies.
3. **Plan for scalability**: Prepare for future scalability by ensuring that fixed and variable costs remain manageable as order volumes grow.

This analysis provides a clear picture of the financial health and trajectory of the online grocery service, indicating a positive outlook after an initial challenging phase.

**Conclusions and recommendations:**

| **Aspect**                                    | **Conclusion**                                                                                              | **Recommendations**                                                                                                   |
|-----------------------------------------------|-------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| **ARPU (Average Revenue Per User)**          | Users spend more on weekends, and overall spending trends are positive.                                    | - Implement weekday marketing campaigns to boost engagement. <br> - Offer incentives for repeat purchases. <br> - Analyze spending patterns for upselling opportunities. |
| **ARPPU (Average Revenue Per Paying User)**  | Higher ARPPU on weekends suggests users make larger or more frequent purchases during these days.         | - Enhance weekend promotions to drive sales. <br> - Focus on converting non-paying users into paying customers. <br> - Explore user behavior for targeted upselling. |
| **AOV (Average Order Value)**                | AOV remains consistent, indicating stable pricing and order sizes over time.                               | - Maintain current pricing strategies. <br> - Consider promotions that encourage larger orders.                 |
| **Customer acquisition vs. retention**       | Effective retention strategies have led to a stable proportion of revenue from returning customers (~40%). | - Strengthen retention programs to keep existing customers engaged. <br> - Balance efforts between acquiring new customers and retaining existing ones. <br> - Analyze returning customer behavior for service improvements. |
| **Top revenue products**                     | Meat products and olive oil are significant revenue drivers.                                                | - Prioritize the availability and quality of top revenue products. <br> - Highlight these products in marketing campaigns. <br> - Explore growth opportunities for these product categories. |
| **Costs and VAT**                             | Initial period showed significant losses due to high costs, but profitability was achieved through adjustments. | - Analyze the causes of initial losses and refine cost management strategies. <br> - Focus on sustaining positive financial trends. <br> - Plan for scalability as order volumes grow. |
| **Gross profit**                              | The service transitioned from losses to profitability through effective strategies and increased order volumes. | - Continue to manage costs effectively and leverage successful strategies. <br> - Prepare for scalable growth with efficient cost structures. |


## 3. **Marketing metrics:**  
  
In a hypothetical case, we conducted two advertising campaigns.  
- In **Advertising Campaign No.1**, a famous blogger on a YouTube culinary channel talked about our app. We spent a total of 250,000 rubles on this integration. As a result of this campaign, on September 1st, 171 people registered for the app.
- In **Advertising Campaign No.2**, users were shown targeted ads on social media. We also spent a total of 250,000 rubles on this campaign, and as a result, on September 1st, we gained 236 new users.
  
Let's evaluate which campaign performed better and calculate several metrics.  

### 3.1. [CAC (Customer Acquisition Cost)](Marketing_metrics/CAC.sql)

We've got following numbers:
| **Advertising Campaign**    | **CAC** | 
|--------------|-----------------|
| **Campaign No.1** | 1,461.99 rubles/client |
| **Campaign No.2** | 1,068.38 rubles/client |

Based on the calculations of CAC, we can draw the **following conclusions**:

1. **Campaign No. 2** proved to be more effective in terms of cost per user acquisition. The cost per acquired user was 1,059 rubles compared to 1,462 rubles for Campaign No. 1.
2. For a complete comparison, it is also necessary to consider the revenue generated from these users (ARPU) to assess the overall return on investment for each campaign.  
  
**Further steps**. To perform a more detailed analysis, it is necessary to:  
1. **Collect data on revenue from new users**:
   - Extract revenue data for a specific period (e.g., for the first month) from users who registered on September 1st.
   - Segment the data by campaign to distinguish which users came from which campaign.
2. **Calculate following metrics for each Campaign**:
   - ROI (Return on Investment)
   - Average bill for campaigns
   - Retention rate by days
   - Retention rate by cohorts
   - Cumulative ARPPU by cohorts and days

After obtaining this data, we can definitively evaluate the effectiveness of the campaigns and make decisions regarding the feasibility of further investments in each of them.  

### 3.2. [ROI (Return on Investment)](Marketing_metrics/ROI.sql)
Despite the higher CAC, the first campaign has a positive ROI, meaning it covers the advertising costs. Meanwhile, the second campaign has a negative ROI — it is currently operating at a loss. These metrics may change over time, but at the moment, the first advertising campaign is a more profitable direction for investing the advertising budget.  

*Return on Investment*:
![newplot (31)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/f4f50c40-f608-41ea-b367-6e5df471fdb1)

### 3.3. [Average bill for campaigns](Marketing_metrics/Average_bill_for_campaigns.sql)
Let's check the values of the average bill for each campaign to find potentially more insights.   
For the first campaign, the average bill is 372, and for the second campaign, it's 381.  
Of course, it is impossible to definitively say whether the groups differ in terms of average bill without statistical tests, but we can still assume that the differences are insignificant. And what is particularly interesting is that the average bill is even slightly higher in the second group with the negative ROI.
*Average bill for campaigns*:
![newplot (33)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/5e620b6f-ab03-4b93-a16a-8cb4b6ab0c34)

### 3.4. [Retention rate by cohorts](Marketing_metrics/Retention_rate_by_cohorts.sql)
Users from both advertising channels show almost no difference in the average bill, but the retention rate is almost twice as high for the first group. This leads to users from the first group bringing in more revenue for us.
*Retention rate by cohorts:*
<img width="270" alt="Снимок экрана 2024-07-03 в 09 22 52" src="https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/496351a7-b297-4c6f-907d-453244419c61">

### 3.5 [Cumulative ARPPU by cohorts and days](Marketing_metrics/Cumulative_ARPPU_by_cohorts_and_days.sql)
For the first advertising campaign, the cumulative Average Revenue Per Paying User (ARPPU) exceeded the CAC by the 5th day. In contrast, for the second campaign, even by the 7th day, the CAC still did not exceed the ARPPU. This indicates that the first campaign quickly becomes profitable, while the second campaign struggles to cover its acquisition costs within the same timeframe.  

*Cumulative ARPPU and CAC for Campaign No.1:*
![newplot (36)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/23db1187-7012-462e-b7ec-6a443892d2ca)
*Cumulative ARPPU and CAC for Campaign No.2:*
![newplot (35)](https://github.com/annamarkova13/SQL_project_food_delivery_service/assets/169673359/960a4ad6-aedf-44d3-a4d5-a496a5ee61d8)

### Conclusions and recommendations
**Conclusions:**
1. **Cost analysis of advertising campaigns:**
   - The first advertising campaign, despite having a higher Customer Acquisition Cost (CAC), shows a positive Return on Investment (ROI), indicating that it recovers its advertising costs.
   - The second advertising campaign has a negative ROI, meaning it currently operates at a loss. This suggests it is less effective in converting ad spend into revenue.
2. **Average bill comparison:**
   - The average bill for users acquired through the first campaign is 372, while for the second campaign it is 381.
   - Although statistical tests are needed to confirm if the difference in average bill is significant, the slight difference suggests that the average bill does not vary much between the two campaigns. Interestingly, the second group, despite having a negative ROI, has a slightly higher average bill.
3. **Retention rate analysis:**
   - Retention rate is a critical metric that indicates the percentage of users returning to the app after their first visit. A high retention rate means users frequently return to make repeat orders, while a low rate suggests user attrition.
   - Users from the first advertising campaign have nearly twice the retention rate compared to those from the second campaign. This higher retention rate results in users from the first group generating more revenue over time.
4. **ARPPU vs CAC:**
   - For the first advertising campaign, the cumulative Average Revenue Per Paying User (ARPPU) exceeded the CAC by the 5th day. In contrast, for the second campaign, even by the 7th day, the CAC still exceeded the ARPPU. This indicates that the first campaign quickly becomes profitable, while the second campaign struggles to cover its acquisition costs within the same timeframe.

**Recommendations:**
1. **Focus on effective campaigns (famous blogger on a YouTube culinary channel):**
   - Allocate a larger portion of the advertising budget to campaigns similar to the first one (similar YouTube bloggers), as they demonstrate a positive ROI and higher user retention, leading to greater overall revenue.
2. **Improve the second campaign (social media target):**
   - Conduct further analysis to identify why the second campaign has a lower retention rate. Potential areas to explore include user experience, pricing, product assortment, and delivery service.
   - Consider making adjustments to the second campaign's strategy, such as optimizing ad targeting, improving the onboarding process, or enhancing post-purchase engagement to increase retention and ROI.
3. **Retention rate enhancement:**
   - Regularly monitor and analyze retention metrics to identify trends and areas for improvement, ensuring that the service continues to meet user needs effectively.
  
By focusing on the most effective campaigns and improving areas where performance lags, the company can optimize its advertising spend, enhance user retention, and ultimately drive higher revenue growth.








