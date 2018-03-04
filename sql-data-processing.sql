SET @counter := 0;

DROP TABLE IF EXISTS `neighbor_events`;
CREATE TABLE `neighbor_events`(
	SELECT se.*, (@counter := @counter + 1) as neighbor
	FROM session_events se 
	ORDER BY se.user_id, se.session_id, se.`at`
);

SELECT n1.*, n2.neighbor, n2.*
FROM neighbor_events n1 
	 JOIN neighbor_events n2 ON n1.neighbor = n2.neighbor - 1 AND n1.user_id = n2.user_id ;

SET @path_counter := 0;
DROP TABLE IF EXISTS `neighbor_paths`;
CREATE TABLE `neighbor_paths`(
SELECT n1.*, n2.neighbor as neighbor2test_upday, (@path_counter := @path_counter + 1) as neighbor_path
FROM neighbor_events n1 
	 JOIN neighbor_events n2 ON n1.neighbor = n2.neighbor - 1 AND n1.user_id = n2.user_id AND n1.event_name = n2.event_name
ORDER BY n1.user_id, n1.session_id, n1.`at`
);