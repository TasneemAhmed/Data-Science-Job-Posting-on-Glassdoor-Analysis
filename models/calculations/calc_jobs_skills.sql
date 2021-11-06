SELECT 
  countif(job_post_has_statistics = 1) as statstics_skill_count,
  countif(job_post_has_excel = 1) as excel_skill_count,
  countif(job_post_has_hadoop = 1) as hadoop_skill_count,
  countif(job_post_has_spark = 1) as spark_skill_count,
  countif(job_post_has_aws = 1) as aws_skill_count,
  countif(job_post_has_tableau = 1) as tableau_skill_count,
  countif(job_post_has_powerBI = 1) as powerBI_skill_count,
  countif(job_post_has_SQL = 1) as SQL_skill_count,
  countif(job_post_has_NoSql = 1) as NoSql_skill_count,
  countif(job_post_has_ETL = 1) as ETL_skill_count,
  countif(job_post_has_GoogleCloud = 1) as GoogleCloud_skill_count,
  countif(job_post_has_MachineLearning = 1) as MachineLearning_skill_count,

FROM 

    {{ ref('stg_uncleaned_ds_jobs_glassdor') }}