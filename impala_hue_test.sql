-- Instructions: Open Hue from Impala VW and execute the whole script

-- create test DB objects
CREATE DATABASE IF NOT EXISTS impala_vw_test;

CREATE TABLE IF NOT EXISTS impala_vw_test.tbl_a (col_1 STRING, col_2 STRING);

INSERT INTO impala_vw_test.tbl_a VALUES ('a', 'b'), ('c', 'd'), ('e', 'f');
-- SELECT col_1, col_2 from impala_vw_test.tbl_a;

-- test DB objects and store results
CREATE TABLE IF NOT EXISTS impala_vw_test.test_result (test_name STRING, test_result STRING, test_time TIMESTAMP);

INSERT INTO impala_vw_test.test_result
SELECT
  'IMPALA_HUE_TEST_1' as test_name, IF (cnt > 0, 'SUCCESS', 'FAILURE') AS test_result, now() as test_time
FROM (
  SELECT COUNT(1) AS cnt FROM impala_vw_test.tbl_a
) as tmp;

SELECT * FROM impala_vw_test.test_result;

-- DROP TABLE IF EXISTS impala_vw_test.tbl_a;
-- DROP TABLE IF EXISTS impala_vw_test.test_result;
-- DROP DATABASE IF EXISTS impala_vw_test;
