# DataAnalytics-Assessment

QUESTION 1
Approach:
For this question 1, I used common table expressions to get what i need from the plan_plans and the savings_savingsaccount tables. in the final CTE i combined all the tables and selected all the needed columns.  I also made sure to only count “funded” plans by checking the appropriate flags.
The challenge here was understanding the tables and knowing where to find what was needed. There was also a challange in figuring out the best way to approach this to get the right results

QUESTION 2
I also used CTE's here to break down the results. first i joined the savings_savingsaccount and users_customuser  tables to  get the total number of months that the customers have been using the product for, then i used another CTE to get the average transactions. The next CTE was to categorize each transaction and in the final select , grouped my results by the frequency category.I had to be sure the query included both savings and investment accounts and correctly handled the timeframe for inactivity. Also, working with date calculations in SQL always requires attention so it doesn’t exclude anything by accident.

QUESTION 3
Approach:
I calculated the account tenure using the signup date from the users table, then summed transactions from savings accounts. I used the simplified CLV formula given: (total_transactions / tenure) * 12 * avg_profit_per_transaction.The main challenge was making sure the tenure calculation was correct — this meant joining users and savings tables properly since the signup date was in users but transactions were in savings. Also, handling months correctly to avoid division by zero or inaccurate results.

QUESTION 4
I grouped transactions by customer, calculated their total transactions, then divided by the number of active months to get average transactions per month. I created frequency categories based on those averages and counted how many customers fell into each.
This one got complex because the signup date was in the users table, but transactions were in savings. I had to join carefully to calculate tenure accurately. Also, I wanted to avoid overcomplicating the query but still get correct results, so I used CTEs (common table expressions) to keep things clean.

