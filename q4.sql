USE lab2;
DELIMITER $$

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE subscriptionId INT;

    DECLARE cur CURSOR FOR
        SELECT DISTINCT SubscriberID
        FROM WatchHistory;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO subscriptionId;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Call Q2 for each subscriber
        CALL GetWatchHistoryBySubscriber(subscriptionId);

    END LOOP;
    CLOSE cur;
END$$

DELIMITER ;
