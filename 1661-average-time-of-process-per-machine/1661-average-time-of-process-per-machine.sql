-- # Write your MySQL query statement b

select machine_id,round(avg(end_time - start_time),3)processing_time

from (
select a1.machine_id,a1.timestamp as start_time, a2.timestamp as end_time
from Activity a1
join Activity a2
on a1.machine_id = a2.machine_id 
and a1.process_id = a2.process_id
and a1.activity_type = 'start'
and a2.activity_type ='end')t
group by machine_id;


-- SELECT machine_id,
--        ROUND(AVG(end_time - start_time), 3) AS processing_time 
-- FROM (
--     SELECT a1.machine_id,
--            a1.timestamp AS start_time,
--            a2.timestamp AS end_time
--     FROM Activity a1
--     JOIN Activity a2
--       ON a1.machine_id = a2.machine_id
--      AND a1.process_id = a2.process_id
--      AND a1.activity_type = 'start'
--      AND a2.activity_type = 'end'
-- ) t
-- GROUP BY machine_id;
