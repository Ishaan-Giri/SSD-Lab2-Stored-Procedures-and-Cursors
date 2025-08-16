DELIMITER $$

CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE subscriber_name VARCHAR(100);
    DECLARE done INT DEFAULT FALSE; 

    DECLARE cursor_subscribers CURSOR FOR
        SELECT SubscriberName FROM Subscribers;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cursor_subscribers;

    read_loop: LOOP
        FETCH cursor_subscribers INTO subscriber_name;

        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT subscriber_name;

    END LOOP;

    CLOSE cursor_subscribers;
    
END$$

DELIMITER ;
