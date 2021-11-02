
select 
    job_title,
    cast( {{ var("salary_range") }}[ORDINAL(1)] as int64) * 1000  AS min_salary_estimate,
    cast( {{ var("salary_range") }}[ORDINAL(2)] as int64) * 1000  AS max_salary_estimate,
    IF( job_post_rating<0, 0.0, job_post_rating) as job_post_rating,
    REGEXP_REPLACE(company_name, '[^a-zA-z ]', '') as company_name,
    company_location,
from 
  `ds-jobs-analysis.DS_Jops_Glassdor.raw_uncleaned_ds_jobs_glassdor`