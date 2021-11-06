
select 

    job_title,
    cast({{var("salary_range") }}[ORDINAL(1)] as int64) * 1000  AS min_salary_estimate,
    cast({{var("salary_range") }}[ORDINAL(2)] as int64) * 1000  AS max_salary_estimate,
    IF( job_post_rating<0, 0.0, job_post_rating) as job_post_rating,
    job_description,
    REGEXP_REPLACE(company_name, '[^a-zA-z ]', '') as company_name,
    company_location,
    IF( CONTAINS_SUBSTR(headquarters_location, '-1'), company_location, headquarters_location) as headquarters_location,
    IF(CONTAINS_SUBSTR(company_size, '-1' ),'Unknown', company_size) as company_size,
    company_founded,
    IF(CONTAINS_SUBSTR(company_type_ownership, '-1' ),'Unknown', company_type_ownership) as company_type_ownership,
    IF(CONTAINS_SUBSTR(company_industry, '-1' ),'Unknown', company_industry) as company_industry,
    company_sector,
    IF(CONTAINS_SUBSTR(company_total_revenue, '-1' ),'Unknown', company_total_revenue) as company_total_revenue,
    IF(CONTAINS_SUBSTR(company_Competitors, '-1' ),'Unknown', company_Competitors) as company_competitors,
    
    IF(CONTAINS_SUBSTR(job_description, 'statistics' ),1, 0) as job_post_has_statistics,
    IF(CONTAINS_SUBSTR(job_description, 'python' ),1, 0) as job_post_has_python,
    IF(CONTAINS_SUBSTR(job_description, 'excel' ),1, 0) as job_post_has_excel,
    IF(CONTAINS_SUBSTR(job_description, 'hadoop' ),1, 0) as job_post_has_hadoop,
    IF(CONTAINS_SUBSTR(job_description, 'spark' ),1, 0) as job_post_has_spark,
    IF(CONTAINS_SUBSTR(job_description, 'aws' ),1, 0) as job_post_has_aws,
    IF(CONTAINS_SUBSTR(job_description, 'tableau' ),1, 0) as job_post_has_tableau,

    IF(CONTAINS_SUBSTR(job_description, 'power BI' ),1, 0) as job_post_has_powerBI,
    IF(CONTAINS_SUBSTR(job_description, 'SQL' ),1, 0) as job_post_has_SQL,
    IF(CONTAINS_SUBSTR(job_description, 'NoSql' ),1, 0) as job_post_has_NoSql,
    IF(CONTAINS_SUBSTR(job_description, 'ETL' ),1, 0) as job_post_has_ETL,
    IF(CONTAINS_SUBSTR(job_description, 'Google Cloud' ),1, 0) as job_post_has_GoogleCloud,
    IF(CONTAINS_SUBSTR(job_description, 'Machine Learning' ),1, 0) as job_post_has_MachineLearning,
from 
    {{ref('stg_distinct_uncleaned_ds_ jobs')}}