USE lab2;
DELIMITER $$

CREATE PROCEDURE ListAllSubscribers()
BEGIN
	DECLARE done INT DEFAULT 0;
	DECLARE subscriberName VARCHAR(100);
    
    DECLARE cur CURSOR FOR SELECT SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    read_loop: LOOP
		FETCH cur INTO subscriberName;
        IF done THEN
		LEAVE read_loop;
		END IF;
        SELECT subscriberName AS Subscriber;
        
	END LOOP;
    
    CLOSE cur;
END$$

DELIMITER ;