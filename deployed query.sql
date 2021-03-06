/* SQL Deployed by Oracle SQL Developer 4.1.3.20.78 from Node "Apply", Workflow "Regression", Project "Online News Popularity", Connection "dmuser" on Aug 22, 2016 */
ALTER SESSION set "_optimizer_reuse_cost_annotations" = false;
ALTER SESSION set NLS_NUMERIC_CHARACTERS = ".," ;
--ALTER SESSION FOR OPTIMIZER
WITH 
/* Start of sql for node: ONLINENEWSPOPULARITY-TEST */
"N$10152" as (select "ONLINENEWSPOPULARITY"."ABS_TITLE_SENTIMENT_POLARITY", 
"ONLINENEWSPOPULARITY"."ABS_TITLE_SUBJECTIVITY", 
"ONLINENEWSPOPULARITY"."AVERAGE_TOKEN_LENGTH", 
"ONLINENEWSPOPULARITY"."AVG_NEGATIVE_POLARITY", 
"ONLINENEWSPOPULARITY"."AVG_POSITIVE_POLARITY", 
"ONLINENEWSPOPULARITY"."DATA_CHANNEL_IS_BUS", 
"ONLINENEWSPOPULARITY"."DATA_CHANNEL_IS_ENTERTAINMENT", 
"ONLINENEWSPOPULARITY"."DATA_CHANNEL_IS_LIFESTYLE", 
"ONLINENEWSPOPULARITY"."DATA_CHANNEL_IS_SOCMED", 
"ONLINENEWSPOPULARITY"."DATA_CHANNEL_IS_TECH", 
"ONLINENEWSPOPULARITY"."DATA_CHANNEL_IS_WORLD", 
"ONLINENEWSPOPULARITY"."GLOBAL_RATE_NEGATIVE_WORDS", 
"ONLINENEWSPOPULARITY"."GLOBAL_RATE_POSITIVE_WORDS", 
"ONLINENEWSPOPULARITY"."GLOBAL_SENTIMENT_POLARITY", 
"ONLINENEWSPOPULARITY"."GLOBAL_SUBJECTIVITY", 
"ONLINENEWSPOPULARITY"."IS_WEEKEND", 
"ONLINENEWSPOPULARITY"."KW_AVG_AVG", 
"ONLINENEWSPOPULARITY"."KW_AVG_MAX", 
"ONLINENEWSPOPULARITY"."KW_AVG_MIN", 
"ONLINENEWSPOPULARITY"."KW_MAX_AVG", 
"ONLINENEWSPOPULARITY"."KW_MAX_MAX", 
"ONLINENEWSPOPULARITY"."KW_MAX_MIN", 
"ONLINENEWSPOPULARITY"."KW_MIN_AVG", 
"ONLINENEWSPOPULARITY"."KW_MIN_MAX", 
"ONLINENEWSPOPULARITY"."KW_MIN_MIN", 
"ONLINENEWSPOPULARITY"."LDA_00", 
"ONLINENEWSPOPULARITY"."LDA_01", 
"ONLINENEWSPOPULARITY"."LDA_02", 
"ONLINENEWSPOPULARITY"."LDA_03", 
"ONLINENEWSPOPULARITY"."LDA_04", 
"ONLINENEWSPOPULARITY"."MAX_NEGATIVE_POLARITY", 
"ONLINENEWSPOPULARITY"."MAX_POSITIVE_POLARITY", 
"ONLINENEWSPOPULARITY"."MIN_NEGATIVE_POLARITY", 
"ONLINENEWSPOPULARITY"."MIN_POSITIVE_POLARITY", 
"ONLINENEWSPOPULARITY"."NUM_HREFS", 
"ONLINENEWSPOPULARITY"."NUM_IMGS", 
"ONLINENEWSPOPULARITY"."NUM_KEYWORDS", 
"ONLINENEWSPOPULARITY"."NUM_SELF_HREFS", 
"ONLINENEWSPOPULARITY"."NUM_VIDEOS", 
"ONLINENEWSPOPULARITY"."N_NON_STOP_UNIQUE_TOKENS", 
"ONLINENEWSPOPULARITY"."N_NON_STOP_WORDS", 
"ONLINENEWSPOPULARITY"."N_TOKENS_CONTENT", 
"ONLINENEWSPOPULARITY"."N_TOKENS_TITLE", 
"ONLINENEWSPOPULARITY"."N_UNIQUE_TOKENS", 
"ONLINENEWSPOPULARITY"."RATE_NEGATIVE_WORDS", 
"ONLINENEWSPOPULARITY"."RATE_POSITIVE_WORDS", 
"ONLINENEWSPOPULARITY"."SELF_REFERENCE_AVG_SHARESS", 
"ONLINENEWSPOPULARITY"."SELF_REFERENCE_MAX_SHARES", 
"ONLINENEWSPOPULARITY"."SELF_REFERENCE_MIN_SHARES", 
"ONLINENEWSPOPULARITY"."TIMEDELTA", 
"ONLINENEWSPOPULARITY"."TITLE_SENTIMENT_POLARITY", 
"ONLINENEWSPOPULARITY"."TITLE_SUBJECTIVITY", 
"ONLINENEWSPOPULARITY"."URL", 
"ONLINENEWSPOPULARITY"."WEEKDAY_IS_FRIDAY", 
"ONLINENEWSPOPULARITY"."WEEKDAY_IS_MONDAY", 
"ONLINENEWSPOPULARITY"."WEEKDAY_IS_SATURDAY", 
"ONLINENEWSPOPULARITY"."WEEKDAY_IS_SUNDAY", 
"ONLINENEWSPOPULARITY"."WEEKDAY_IS_THURSDAY", 
"ONLINENEWSPOPULARITY"."WEEKDAY_IS_TUESDAY", 
"ONLINENEWSPOPULARITY"."WEEKDAY_IS_WEDNESDAY", 
"ONLINENEWSPOPULARITY"."SHARES" 
from "DMUSER"."ONLINENEWSPOPULARITY"  )
/* End of sql for node: ONLINENEWSPOPULARITY-TEST */
,
/* Start of sql for node: Apply */
"N$10216" as (SELECT 
PREDICTION("GLM_SELECTION" USING *) "GLM_SELECTION_PRED", 
"SHARES", 
"URL"
FROM "N$10152" )
/* End of sql for node: Apply */
select * from "N$10216";