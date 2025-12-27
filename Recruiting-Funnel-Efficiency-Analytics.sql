{\rtf1\ansi\ansicpg1252\cocoartf2867
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 DROP TABLE IF EXISTS recruiting_funnel;\
\
CREATE TABLE recruiting_funnel (\
    candidate_id INTEGER,\
    recruiter TEXT,\
    hiring_manager TEXT,\
    applied TEXT,\
    screened TEXT,\
    interviewed TEXT,\
    offered TEXT,\
    hired TEXT,\
    rejected TEXT,\
    days_to_screen INTEGER,\
    days_to_interview INTEGER,\
    days_to_offer INTEGER,\
    days_to_hire INTEGER\
);\
\
INSERT INTO recruiting_funnel VALUES\
(1,'Ava','Chen','Yes','Yes','Yes','Yes','Yes','No',2,5,2,3),\
(2,'Ava','Chen','Yes','Yes','No','No','No','Yes',3,NULL,NULL,NULL),\
\
(3,'Liam','Patel','Yes','Yes','Yes','No','No','Yes',1,4,NULL,NULL),\
(4,'Liam','Patel','Yes','No','No','No','No','Yes',5,NULL,NULL,NULL),\
\
(5,'Mia','Rodriguez','Yes','Yes','Yes','Yes','No','Yes',2,3,4,NULL),\
(6,'Mia','Rodriguez','Yes','Yes','Yes','Yes','Yes','No',1,2,3,2),\
\
(7,'Noah','Patel','Yes','No','No','No','No','Yes',4,NULL,NULL,NULL),\
(8,'Noah','Patel','Yes','Yes','Yes','No','No','Yes',3,5,NULL,NULL),\
\
(9,'Ava','Singh','Yes','Yes','Yes','Yes','No','Yes',2,3,6,NULL),\
(10,'Ava','Singh','Yes','Yes','Yes','Yes','Yes','No',1,3,4,3);\
\
\
SELECT \
    AVG(CASE WHEN applied='Yes' THEN 1 ELSE 0 END) AS apply_rate,\
    AVG(CASE WHEN screened='Yes' THEN 1 ELSE 0 END) AS screen_rate,\
    AVG(CASE WHEN interviewed='Yes' THEN 1 ELSE 0 END) AS interview_rate,\
    AVG(CASE WHEN offered='Yes' THEN 1 ELSE 0 END) AS offer_rate,\
    AVG(CASE WHEN hired='Yes' THEN 1 ELSE 0 END) AS hire_rate\
FROM recruiting_funnel;\
\
SELECT\
    SUM(CASE WHEN screened='No' AND rejected='Yes' THEN 1 ELSE 0 END) AS drop_at_screen,\
    SUM(CASE WHEN interviewed='No' AND rejected='Yes' THEN 1 ELSE 0 END) AS drop_at_interview,\
    SUM(CASE WHEN offered='No' AND rejected='Yes' THEN 1 ELSE 0 END) AS drop_at_offer\
FROM recruiting_funnel;\
\
SELECT\
    recruiter,\
    COUNT(*) AS total_candidates,\
    AVG(CASE WHEN interviewed='Yes' THEN 1 ELSE 0 END) AS interview_rate,\
    AVG(CASE WHEN offered='Yes' THEN 1 ELSE 0 END) AS offer_rate,\
    AVG(CASE WHEN hired='Yes' THEN 1 ELSE 0 END) AS hire_rate\
FROM recruiting_funnel\
GROUP BY recruiter\
ORDER BY hire_rate DESC;\
\
SELECT\
    hiring_manager,\
    AVG(days_to_screen) AS avg_screen_time,\
    AVG(days_to_interview) AS avg_interview_time,\
    AVG(days_to_offer) AS avg_offer_time,\
    AVG(days_to_hire) AS avg_hire_time\
FROM recruiting_funnel\
GROUP BY hiring_manager\
ORDER BY avg_hire_time DESC;\
\
SELECT\
    candidate_id,\
    recruiter,\
    hiring_manager,\
    (COALESCE(days_to_screen,0) +\
     COALESCE(days_to_interview,0) +\
     COALESCE(days_to_offer,0) +\
     COALESCE(days_to_hire,0)) AS total_cycle_time\
FROM recruiting_funnel\
ORDER BY total_cycle_time DESC;\
\
\
SELECT\
    recruiter,\
    hiring_manager,\
    COUNT(*) AS total_candidates,\
    AVG(CASE WHEN interviewed='Yes' THEN 1 ELSE 0 END) AS interview_rate,\
    AVG(CASE WHEN offered='Yes' THEN 1 ELSE 0 END) AS offer_rate,\
    AVG(CASE WHEN hired='Yes' THEN 1 ELSE 0 END) AS hire_rate,\
    AVG(days_to_screen) AS avg_screen_time,\
    AVG(days_to_interview) AS avg_interview_time,\
    AVG(days_to_offer) AS avg_offer_time,\
    AVG(days_to_hire) AS avg_hire_time\
FROM recruiting_funnel\
GROUP BY recruiter, hiring_manager\
ORDER BY hire_rate DESC, avg_hire_time ASC;\
}