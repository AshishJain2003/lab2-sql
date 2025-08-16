USE lab2;
DELIMITER $$

CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
    SELECT s.Title AS ShowTitle,
           s.Genre AS Genre,
           s.ReleaseYear AS ReleaseYear,
           w.WatchTime AS WatchTimeMinutes
    FROM WatchHistory w
    INNER JOIN Shows s ON w.ShowID = s.ShowID
    WHERE w.SubscriberID = sub_id;
END$$

DELIMITER ;
