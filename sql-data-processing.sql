SET @counter := 0;

DROP TABLE IF EXISTS `neighbor_events`;
CREATE TABLE `neighbor_events`(
	SELECT se.*, (@counter := @counter + 1) as neighbor
	FROM session_events se 
	ORDER BY se.user_id, se.session_id, se.`at`
);

SET @path_counter := 0;
SET @uid := 0;
SET @lastEventEq1 := "";
SET @lastEventEq2 := "";


	SELECT tmp_Paths.user_id, tmp_Paths.session_id, tmp_Paths.path_counter, tmp_paths.event_time, tmp_paths.ev_1 as event_name, 
	MAX(tmp_Paths.neighbor2) - MIN(tmp_Paths.neighbor1) + 1 as event_count,
	MIN(tmp_Paths.neighbor1) as minN, 
	MAX(tmp_Paths.neighbor2) AS maxN
	FROM (
		SELECT n1.event_name as ev_1, n2.event_name AS ev_2, n1.neighbor as neighbor1, n1.user_id, n1.session_id, n1.`at` as event_time,
		CASE 
			WHEN (@lastEventEq1 <> @lastEventEq2) THEN (@path_counter := @path_counter + 1)
			WHEN (n1.event_name <> n2.event_name) THEN (@path_counter := @path_counter + 1)
			WHEN (@uid = (@uid := n1.user_id)) THEN @path_counter 
			WHEN (@lastEventEq1 = @lastEventEq2) AND (n1.event_name = n2.event_name) THEN @path_counter 
			ELSE (@path_counter := @path_counter + 1)
		END AS path_counter,
		(@lastEventEq1 := n1.event_name) AS R_LE_1,
		(@lastEventEq2 := n2.event_name) AS R_LE_2,
		n2.neighbor as neighbor2 #, n2.id, n2.user_id
		FROM neighbor_events n1 
		 	JOIN neighbor_events n2 ON n1.neighbor = n2.neighbor - 1 AND n1.user_id = n2.user_id 
	) AS tmp_Paths
	WHERE tmp_Paths.ev_1 = tmp_Paths.ev_2
	GROUP BY tmp_Paths.user_id, tmp_Paths.session_id, tmp_Paths.path_counter	 





