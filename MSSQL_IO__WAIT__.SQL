SELECT
    *
   ,wait_time_ms/waiting_tasks_count AS 'Avg Wait in ms'
FROM
   sys.dm_os_wait_stats 
WHERE
   waiting_tasks_count > 0
ORDER BY
   wait_time_ms DESC
