set sql_safe_updates = 0;


# Task 1: Counting Countries with World Bank Loans
select count(distinct(country)) from cleaned_dataset;

#  Task 2: Calculating Total Loan Amount for Each Project
SELECT 
    `Project ID`,
    `Project Name`,
    SUM(`Original Principal Amount`) AS TotalLoanAmount
FROM 
    cleaned_dataset
GROUP BY 
    `Project ID`, `Project Name`;
    
    
# Task 4: Calculating Total Original Principal Amount for All Projects
select sum(`Original Principal Amount`) as `Total Original Principal Amount` from cleaned_dataset;


# Task 5: Calculating Average Repaid to IDA for Each Region
select Region,avg(`Repaid to IDA`) from cleaned_dataset group by `Region`;

#Task 6: Identifying Country with Highest Repaid to IDA Ratio

select country,max(`repaid to ida`/`original principal amount`) as ratio
from cleaned_dataset where `credit status` = "fully repaid"
group by country;

# Task 7: Counting Projects by Credit Status for Each Country¶

SELECT 
    Country,
    `Credit Status`,
    COUNT(*) AS Project_Count
FROM 
   cleaned_dataset
GROUP BY 
    Country, `Credit Status`;

# Task 8: Counting Countries with World Bank Loans by Region
SELECT 
    Region,
    COUNT(DISTINCT Country) AS Country_Count
FROM 
    cleaned_dataset
GROUP BY 
    Region;
    
    
# Task 9: Counting Fully Repaid Projects by Region

UPDATE cleaned_dataset
SET Region = 'Eastern and Southern Africa'
WHERE Region = 'EASTERN AND SOUTHERN AFRICA';

SELECT 
    Region,
    COUNT(*) AS `Fully Repaid Count`
FROM 
    cleaned_dataset
WHERE 
    `Credit Status` = 'Fully Repaid'
GROUP BY 
    Region
ORDER BY 
    FIELD(Region, 
        'Africa', 
        'MIDDLE EAST AND NORTH AFRICA', 
        'EAST ASIA AND PACIFIC', 
        'LATIN AMERICA AND CARIBBEAN', 
        'AFRICA WEST', 
        'Eastern and Southern Africa', 
        'WESTERN AND CENTRAL AFRICA', 
        'South Asia', 
        'EUROPE AND CENTRAL ASIA', 
        'Africa east'
    );

# Task 10: Identifying Projects with the Highest "Due to IDA"


select country,`Project Name`,`Effective Date`,`Due to IDA` from cleaned_dataset
order by `due to ida` desc limit 10;

# Task 11: Identifying Top 5 Countries with Highest Repaid to Principal Ratio













