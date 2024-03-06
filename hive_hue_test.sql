-- Instructions: Open Hue from Hive VW and execute the whole script

-- create test DB objects
CREATE DATABASE IF NOT EXISTS hive_vw_test;

CREATE TABLE IF NOT EXISTS hive_vw_test.tbl_a (col_1 STRING, col_2 STRING);

INSERT INTO hive_vw_test.tbl_a VALUES ('a', 'b'), ('c', 'd'), ('e', 'f');
-- SELECT col_1, col_2 from hive_vw_test.tbl_a;

-- test DB objects and store results
CREATE TABLE IF NOT EXISTS hive_vw_test.test_result (test_name STRING, test_result STRING, test_time TIMESTAMP);

INSERT INTO hive_vw_test.test_result
SELECT
  'HIVE_HUE_TEST_1' as test_name, IF (cnt > 0, 'SUCCESS', 'FAILURE') AS test_result, current_timestamp as test_time
FROM (
  SELECT COUNT(1) AS cnt FROM hive_vw_test.tbl_a
) as tmp;

SELECT * FROM hive_vw_test.test_result;

-- DROP TABLE IF EXISTS hive_vw_test.tbl_a;
-- DROP TABLE IF EXISTS hive_vw_test.test_result;
-- DROP DATABASE IF EXISTS hive_vw_test;
