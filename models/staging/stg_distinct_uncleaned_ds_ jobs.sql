select 
    distinct *
from
    {{ source('DS_Jops_Glassdor', 'raw_uncleaned_ds_jobs_glassdor') }}