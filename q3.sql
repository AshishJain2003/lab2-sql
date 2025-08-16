USE lab2;
DELIMITER $$

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE count INT;

    SELECT COUNT(*) INTO count
    FROM Subscribers
    WHERE SubscriberName = subName;

    IF count = 0 THEN
        INSERT INTO Subscribers (SubscriberName, SubscriptionDate)
        VALUES (subName, CURDATE());
    END IF;
END$$

DELIMITER ;
