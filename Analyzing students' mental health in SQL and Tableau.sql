-- MENTAL HEALTH DATA 
SELECT *
FROM student_survey;
-- DATA CLEANING
-- Staging Table
CREATE TABLE survey_data
LIKE student_survey;

INSERT INTO survey_data
SELECT *
FROM student_survey;
SELECT *
FROM survey_data;
-- Input data into places where we can assume the answer e.g. Internet = ''
SELECT *
FROM survey_data 
where Internet = '';

UPDATE survey_data
SET internet = '0'
WHERE internet = '';
SELECT *
FROM survey_data ;
-- ANALYSING DATA 
-- QUESTION 1. Do higher levels of social connectedness correlate with lower depression scores?

SELECT ToSC, ToDep
FROM survey_data
ORDER BY ToSC ASC
LIMIT 10;

SELECT ToSC, ToDep
FROM survey_data
ORDER BY ToDep DESC
LIMIT 10;

SELECT *
FROM survey_data;
-- QUESTION 2. Does increased acculturative stress correlate with higher depression scores? 
SELECT ToAS, ToDep
FROM survey_data
ORDER BY ToAS DESC
LIMIT 10;
SELECT ToAS, ToDep
FROM survey_data
ORDER BY ToAS ASC
LIMIT 10;
-- QUESTION 3  Are there significant differences in depression scores based on gender or length of stay?
SELECT ToDep, Stay, Gender
FROM survey_data
ORDER BY Stay ASC;
-- Question 4 Can we build a simple regression model to predict depression score?
SELECT 
  ToDep,          -- Target variable: Depression Score
  Stay,           -- Predictor: Length of stay
  Japanese,       -- Predictor: Japanese proficiency
  English,        -- Predictor: English proficiency
  ToSC,           -- Predictor: Social connectedness
  Gender
FROM student_survey
WHERE ToDep IS NOT NULL 
  AND Stay IS NOT NULL 
  AND ToSC IS NOT NULL;
