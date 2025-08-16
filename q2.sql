DELIMITER $$

CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
    SELECT 
        s.Title, 
        wh.WatchTime
    FROM 
        WatchHistory wh
    JOIN 
        Shows s ON wh.ShowID = s.ShowID
    WHERE 
        wh.SubscriberID = sub_id;
END$$

DELIMITER ;