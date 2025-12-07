# SQL Questions - House Price Regression

## Database Setup

1. Create a database called `house_price_regression`.

2. Create a table `house_price_data` with the same columns as given in the csv file. Please make sure you use the correct data types for the columns.

3. Import the data from the csv file into the table. Before you import the data into the empty table, make sure that you have deleted the headers from the csv file. To not modify the original data, if you want you can create a copy of the csv file as well. Note you might have to use the following queries to give permission to SQL to import data from csv files in bulk:

```sql
SHOW VARIABLES LIKE 'local_infile'; -- This query would show you the status of the variable 'local_infile'. If it is off, use the next command, otherwise you should be good to go

SET GLOBAL local_infile = 1;
```

## Data Verification and Cleaning

4. Select all the data from table `house_price_data` to check if the data was imported correctly

5. Use the alter table command to drop the column `date` from the database, as we would not use it in the analysis with SQL. Select all the data from the table to verify if the command worked. Limit your returned results to 10.

6. Use sql query to find how many rows of data you have.
    21597

## Data Exploration

7. Now we will try to find the unique values in some of the categorical columns:
   - What are the unique values in the column `bedrooms`?
    1	196
    2	2760
    3	9824
    4	6882
    5	1601
    6	272
    7	38
    8	13
    9	6
    10	3
    11	1
    33	1

   - What are the unique values in the column `bathrooms`?
    0.50	4
    0.75	71
    1.00	3851
    1.25	9
    1.50	1445
    1.75	3048
    2.00	1930
    2.25	2047
    2.50	5377
    2.75	1185
    3.00	753
    3.25	589
    3.50	731
    3.75	155
    4.00	136
    4.25	79
    4.50	100
    4.75	23
    5.00	21
    5.25	13
    5.50	10
    5.75	4
    6.00	6
    6.25	2
    6.50	2
    6.75	2
    7.50	1
    7.75	1
    8.00	2

   - What are the unique values in the column `floors`?
    1.00	10673
    1.50	1910
    2.00	8235
    2.50	161
    3.00	611
    3.50	7

   - What are the unique values in the column `condition`?
    1	29
    2	170
    3	14020
    4	5677
    5	1701

   - What are the unique values in the column `grade`?
    3	1
    4	27
    5	242
    6	2038
    7	8974
    8	6065
    9	2615
    10	1134
    11	399
    12	89
    13	13

8. Arrange the data in a decreasing order by the price of the house. Return only the IDs of the top 10 most expensive houses in your data.
    6762700020
    9808700762
    9208900037
    2470100110
    8907500070
    7558700030
    1247600105
    1924059029
    7738500731
    3835500195

9. What is the average price of all the properties in your data?
    540,296.57
## Group By Analysis

10. In this exercise we will use simple group by to check the properties of some of the categorical variables in our data
    - What is the average price of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the prices. Use an alias to change the name of the second column.
    1	318,239.45
    2	401,387.75
    3	466,276.59
    4	635,564.68
    5	786,874.13
    6	825,853.50
    7	951,447.82
    8	1,105,076.92
    9	893,999.83
    10	820,000.00
    11	520,000.00
    33	640,000.00

    - What is the average `sqft_living` of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the `sqft_living`. Use an alias to change the name of the second column.
    1	  888.15
    2	1,239.75
    3	1,805.84
    4	2,554.65
    5	3,047.55
    6	3,284.34
    7	3,974.21
    8	3,800.00
    9	3,775.00
    10	3,706.67
    11	3,000.00
    33	1,620.00

    - What is the average price of the houses with a waterfront and without a waterfront? The returned result should have only two columns, waterfront and `Average` of the prices. Use an alias to change the name of the second column.
    0	531,762.32
    1	1,662,524.18

    - Is there any correlation between the columns `condition` and `grade`? You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
    1	5.9655
    2	6.5412
    3	7.8273
    4	7.3826
    5	7.3210

## Filtering and Conditions

11. One of the customers is only interested in the following houses:
    - Number of bedrooms either 3 or 4
    - Bathrooms more than 3
    - One Floor
    - No waterfront
    - Condition should be 3 at least
    - Grade should be 5 at least
    - Price less than 300000

    For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them?

    - No option available at this time.

## Advanced Queries

12. Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database. Write a query to show them the list of such properties. You might need to use a sub query for this problem.
- 1246 properties found.

13. Since this is something that the senior management is regularly interested in, create a view of the same query.

14. Most customers are interested in properties with three or four bedrooms. What is the difference in average prices of the properties with three and four bedrooms?
    169,288.08

15. What are the different locations where properties are available in your database? (distinct zip codes)
    98001
    98002
    98003
    98004
    98005
    98006
    98007
    98008
    98010
    98011
    98014
    98019
    98022
    98023
    98024
    98027
    98028
    98029
    98030
    98031
    98032
    98033
    98034
    98038
    98039
    98040
    98042
    98045
    98052
    98053
    98055
    98056
    98058
    98059
    98065
    98070
    98072
    98074
    98075
    98077
    98092
    98102
    98103
    98105
    98106
    98107
    98108
    98109
    98112
    98115
    98116
    98117
    98118
    98119
    98122
    98125
    98126
    98133
    98136
    98144
    98146
    98148
    98155
    98166
    98168
    98177
    98178
    98188
    98198
    98199

16. Show the list of all the properties that were renovated.
    914 properties found.

17. Provide the details of the property that is the 11th most expensive property in your database.
'6065300370', '2015-05-06', '5', '6.00', '7440', '21540', '2.00', '0', '0', '3', '12', '5550', '1890', '2003', '0', '98006', '47.569200', '-122.189000', '4740', '19329', '4210000'
