DELIMITER $$

CREATE PROCEDURE GetAllWatchHistoriesWithCursor()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE current_sub_id INT;
    DECLARE current_sub_name VARCHAR(100);

    DECLARE all_subs_cursor CURSOR FOR 
        SELECT SubscriberID, SubscriberName FROM Subscribers;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN all_subs_cursor;

    history_loop: LOOP
        FETCH all_subs_cursor INTO current_sub_id, current_sub_name;
        IF done THEN
            LEAVE history_loop;
        END IF;

        CALL GetWatchHistoryBySubscriber(current_sub_id);
    END LOOP;

    CLOSE all_subs_cursor;
END$$

DELIMITER ;
