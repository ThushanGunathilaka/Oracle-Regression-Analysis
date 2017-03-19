drop table miner_model_settings;
/
CREATE TABLE miner_model_settings(setting_name VARCHAR2(30),setting_value VARCHAR2(4000));
/
drop table row_diagnostic_statistics;
/
BEGIN
INSERT INTO miner_model_settings VALUES(
DBMS_DATA_MINING.algo_name,DBMS_DATA_MINING.algo_generalized_linear_model
);
INSERT INTO miner_model_settings VALUES(
DBMS_DATA_MINING.GLMS_RIDGE_REGRESSION,DBMS_DATA_MINING.GLMS_RIDGE_REG_DISABLE
);
INSERT INTO miner_model_settings VALUES(
DBMS_DATA_MINING.GLMS_FTR_SELECTION,DBMS_DATA_MINING.GLMS_FTR_SELECTION_ENABLE
);
INSERT INTO miner_model_settings VALUES(
DBMS_DATA_MINING.prep_auto,DBMS_DATA_MINING.prep_auto_on
);
INSERT INTO miner_model_settings VALUES(dbms_data_mining.glms_diagnostics_table_name,'row_diagnostic_statistics');
COMMIT;
END;
/
BEGIN
DBMS_DATA_MINING.DROP_MODEL('FINAL_GLM_MODEL');
COMMIT;
END;
/
BEGIN
DBMS_DATA_MINING.CREATE_MODEL
(
model_name => 'FINAL_GLM_MODEL',
mining_function => dbms_data_mining.regression,
data_table_name     => 'ONLINENEWSPOPULARITY',
case_id_column_name => 'URL',
target_column_name  => 'SHARES',
settings_table_name => 'miner_model_settings'
);
COMMIT;
END;
/

-- DISPLAY MODEL SETTINGS
column setting_name format a30
column setting_value format a30
SELECT setting_name, setting_value
  FROM user_mining_model_settings
 WHERE model_name = 'FINAL_GLM_MODEL'
ORDER BY setting_name;


-- DISPLAY MODEL SIGNATURE
column attribute_name format a40
column attribute_type format a20
SELECT attribute_name, attribute_type
  FROM user_mining_model_attributes
 WHERE model_name = 'FINAL_GLM_MODEL'
ORDER BY attribute_name;

-- DISPLAY MODEL DETAILS
-- Global statistics
SELECT *
  FROM TABLE(dbms_data_mining.get_model_details_global('FINAL_GLM_MODEL'))
ORDER BY global_detail_name;
-- GLM statistics
SELECT * FROM TABLE (DBMS_DATA_MINING.GET_MODEL_DETAILS_GLM('FINAL_GLM_MODEL'));
select * from table(dbms_data_mining.get_model_details_glm(model_name => 'FINAL_GLM_MODEL'));

SELECT setting_name, setting_value
  FROM TABLE(DBMS_DATA_MINING.GET_MODEL_SETTINGS('FINAL_GLM_MODEL'))
ORDER BY setting_name;

-- Coefficient statistics
SET line 120
column feature_expression format a53   
SELECT feature_expression, coefficient, std_error, test_statistic,
  p_value, std_coefficient, lower_coeff_limit, upper_coeff_limit
  FROM TABLE(dbms_data_mining.get_model_details_glm('FINAL_GLM_MODEL'));

-- Show the features and their p_values
SET lin 80
SET pages 20
SELECT feature_expression, coefficient, p_value 
  FROM TABLE(dbms_data_mining.get_model_details_glm('FINAL_GLM_MODEL'))
  ORDER BY p_value;

 
 -- 1. Root Mean Square Error - Sqrt(Mean((x - x')^2))
-- 2. Mean Absolute Error - Mean(|(x - x')|)
 column rmse format 9999.99
column mae format 9999.99  
SELECT SQRT(AVG((A.pred - B.shares) * (A.pred - B.shares))) rmse,
       AVG(ABS(a.pred - B.shares)) mae
  FROM (SELECT url,shares, prediction(FINAL_GLM_MODEL using *) pred
          FROM ONLINENEWSPOPULARITY) A,
       ONLINENEWSPOPULARITY B
  WHERE A.URL = B.URL;

--Prediction Query
SELECT url,shares, prediction(FINAL_GLM_MODEL using *) pred FROM ONLINENEWSPOPULARITY;