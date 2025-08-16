DELIMITER $$

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN

    DECLARE new_subscriber_id INT;

    IF NOT EXISTS (SELECT 1 FROM Subscribers WHERE SubscriberName = subName) THEN
    
        SELECT COALESCE(MAX(SubscriberID), 0) + 1 INTO new_subscriber_id FROM Subscribers;

        INSERT INTO Subscribers(SubscriberID, SubscriberName, SubscriptionDate)
        VALUES (new_subscriber_id, subName, CURDATE());
        
        SELECT CONCAT('Subscriber ''', subName, ''' was added successfully.') AS Message;

    ELSE
        SELECT CONCAT('Subscriber ''', subName, ''' already exists.') AS Message;
    END IF;

END$$

DELIMITER ;
