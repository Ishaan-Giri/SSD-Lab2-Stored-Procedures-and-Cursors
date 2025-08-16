DELIMITER $$

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE current_sub_id INT;

    DECLARE report_cursor CURSOR FOR 
        SELECT DISTINCT SubscriberID FROM WatchHistory;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN report_cursor;

    report_loop: LOOP
        FETCH report_cursor INTO current_sub_id;
        IF done THEN
            LEAVE report_loop;
        END IF;
        
        CALL GetWatchHistoryBySubscriber(current_sub_id);
    END LOOP;

    CLOSE report_cursor;
    
END$$

DELIMITER ;
