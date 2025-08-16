USE lab2;
DELIMITER $$

CREATE PROCEDURE GetAllSubscribersWatchHistory()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE subscriptionId INT;

    DECLARE cur CURSOR FOR
        SELECT SubscriberID
        FROM Subscribers;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO subscriptionId;
        IF done THEN
            LEAVE read_loop;
        END IF;

        CALL GetWatchHistoryBySubscriber(subscriptionId);

    END LOOP;
    CLOSE cur;
END$$

DELIMITER ;
