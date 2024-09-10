USE petboarding;

CREATE TABLE employeedeposit (
    ID INT NOT NULL AUTO_INCREMENT,
    employeeId INT NOT NULL,
    payDeposit DECIMAL(6, 2) NOT NULL DEFAULT 0.0,
    PRIMARY KEY (ID),
    FOREIGN KEY (employeeId) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DELIMITER $$

DROP TRIGGER IF EXISTS after_timecard_insert $$

CREATE TRIGGER after_timecard_insert
AFTER INSERT ON timecard
FOR EACH ROW
BEGIN
    DECLARE v_empId INT DEFAULT 0;
    DECLARE v_rate DECIMAL(5,2) DEFAULT 0.0;
    DECLARE v_hours INT DEFAULT 0;
    DECLARE v_deposit DECIMAL(6,2) DEFAULT 0.0;

    -- Selecting employee details and hours worked
    SELECT employee.id, position.hourly, 
           SUM(CASE WHEN timecard.day = 'Sunday' THEN timecard.hours ELSE 0 END +
               CASE WHEN timecard.day = 'Monday' THEN timecard.hours ELSE 0 END +
               CASE WHEN timecard.day = 'Tuesday' THEN timecard.hours ELSE 0 END +
               CASE WHEN timecard.day = 'Wednesday' THEN timecard.hours ELSE 0 END +
               CASE WHEN timecard.day = 'Thursday' THEN timecard.hours ELSE 0 END +
               CASE WHEN timecard.day = 'Friday' THEN timecard.hours ELSE 0 END +
               CASE WHEN timecard.day = 'Saturday' THEN timecard.hours ELSE 0 END)
    INTO v_empId, v_rate, v_hours
    FROM employee
    JOIN position ON employee.positionId = position.id
    JOIN timecard ON employee.id = timecard.employeeId
    WHERE timecard.employeeId = NEW.employeeId
    GROUP BY employee.id;

    -- Calculate deposit amount using the depositAmount function
    SET v_deposit = depositAmount(v_hours, v_rate);

    -- Insert the calculated deposit into the employeedeposit table
    INSERT INTO employeedeposit (employeeId, payDeposit) 
    VALUES (v_empId, v_deposit);
END $$

DELIMITER ;

DELETE FROM timecard;

INSERT INTO timecard(employeeId, sun, mon, tues, wed, thurs, fri, sat)
SELECT id, 12, 0, 12, 0, 4, 12, 0 FROM employee WHERE firstName = 'Ethan' AND lastName = 'Ali'
UNION ALL
SELECT id, 12, 0, 12, 0, 4, 12, 0 FROM employee WHERE firstName = 'Oliwier' AND lastName = 'Barnett'
UNION ALL
SELECT id, 6, 6, 6, 6, 6, 5, 0 FROM employee WHERE firstName = 'Sara' AND lastName = 'Barron'
UNION ALL
SELECT id, 0, 8, 8, 8, 8, 8, 0 FROM employee WHERE firstName = 'Ty' AND lastName = 'Bell'
UNION ALL
SELECT id, 6, 6, 6, 6, 6, 5, 0 FROM employee WHERE firstName = 'Leo' AND lastName = 'Bird'
UNION ALL
SELECT id, 0, 12, 6, 10, 6, 8, 0 FROM employee WHERE firstName = 'Awais' AND lastName = 'Carrillo'
UNION ALL
SELECT id, 7, 4, 9, 0, 0, 10, 3 FROM employee WHERE firstName = 'Laila' AND lastName = 'Christensen'
UNION ALL
SELECT id, 6, 6, 6, 6, 6, 5, 0 FROM employee WHERE firstName = 'JohnPaul' AND lastName = 'Clarke'
UNION ALL
SELECT id, 0, 12, 6, 10, 6, 8, 0 FROM employee WHERE firstName = 'Aamina' AND lastName = 'Dillon'
UNION ALL
SELECT id, 12, 0, 12, 0, 4, 12, 0 FROM employee WHERE firstName = 'Fern' AND lastName = 'Garner'
UNION ALL
SELECT id, 8, 8, 0, 0, 8, 10, 6 FROM employee WHERE firstName = 'Louis' AND lastName = 'Giles'
UNION ALL
SELECT id, 10, 8, 0, 0, 8, 10, 10 FROM employee WHERE firstName = 'Raja' AND lastName = 'Glass'
UNION ALL
SELECT id, 0, 8, 8, 8, 8, 8, 0 FROM employee WHERE firstName = 'Brodie' AND lastName = 'Gordon'
UNION ALL
SELECT id, 10, 8, 0, 0, 8, 10, 10 FROM employee WHERE firstName = 'Maha' AND lastName = 'Guthrie'
UNION ALL
SELECT id, 10, 8, 0, 0, 8, 10, 10 FROM employee WHERE firstName = 'Ernest' AND lastName = 'Higgins'
UNION ALL
SELECT id, 8, 8, 0, 0, 8, 10, 6 FROM employee WHERE firstName = 'Kaya' AND lastName = 'Hodge'
UNION ALL
SELECT id, 12, 0, 12, 0, 4, 12, 0 FROM employee WHERE firstName = 'Mathew' AND lastName = 'Horton'
UNION ALL
SELECT id, 0, 12, 6, 10, 6, 8, 0 FROM employee WHERE firstName = 'Floyd' AND lastName = 'Johns'
UNION ALL
SELECT id, 0, 12, 6, 10, 6, 8, 0 FROM employee WHERE firstName = 'Dane' AND lastName = 'Kaiser'
UNION ALL
SELECT id, 7, 4, 9, 0, 0, 10, 3 FROM employee WHERE firstName = 'Paris' AND lastName = 'Lindsey'
UNION ALL
SELECT id, 0, 12, 6, 10, 6, 8, 0 FROM employee WHERE firstName = 'Kamil' AND lastName = 'Lozano'
UNION ALL
SELECT id, 8, 8, 0, 0, 8, 10, 6 FROM employee WHERE firstName = 'Dawson' AND lastName = 'Marquez'
UNION ALL
SELECT id, 8, 8, 0, 0, 8, 10, 6 FROM employee WHERE firstName = 'Umaiza' AND lastName = 'Melia'
UNION ALL
SELECT id, 6, 6, 6, 6, 6, 5, 0 FROM employee WHERE firstName = 'Jemima' AND lastName = 'Miller'
UNION ALL
SELECT id, 12, 0, 12, 0, 4, 12, 0 FROM employee WHERE firstName = 'Raheem' AND lastName = 'Montgomery'
UNION ALL
SELECT id, 12, 0, 12, 0, 4, 12, 0 FROM employee WHERE firstName = 'Rebekah' AND lastName = 'Morgan'
UNION ALL
SELECT id, 10, 8, 0, 0, 8, 10, 10 FROM employee WHERE firstName = 'Lauren' AND lastName = 'Morton'
UNION ALL
SELECT id, 0, 8, 8, 8, 8, 8, 0 FROM employee WHERE firstName = 'Lyra' AND lastName = 'Murphy'
UNION ALL
SELECT id, 7, 4, 9, 0, 0, 10, 3 FROM employee WHERE firstName = 'Hammad' AND lastName = 'Newman'
UNION ALL
SELECT id, 6, 6, 6, 6, 6, 5, 0 FROM employee WHERE firstName = 'Alissa' AND lastName = 'Ortiz'
UNION ALL
SELECT id, 10, 8, 0, 0, 8, 10, 10 FROM employee WHERE firstName = 'Nicholas' AND lastName = 'Pena'
UNION ALL
SELECT id, 0, 8, 8, 8, 8, 8, 0 FROM employee WHERE firstName = 'Alexa' AND lastName = 'Preston'
UNION ALL
SELECT id, 7, 4, 9, 0, 0, 10, 3 FROM employee WHERE firstName = 'Nico' AND lastName = 'Prince'
UNION ALL
SELECT id, 6, 6, 6, 6, 6, 5, 0 FROM employee WHERE firstName = 'Javan' AND lastName = 'Rennie'
UNION ALL
SELECT id, 0, 12, 6, 10, 6, 8, 0 FROM employee WHERE firstName = 'Tulisa' AND lastName = 'Roberts'
UNION ALL
SELECT id, 0, 8, 8, 8, 8, 8, 0 FROM employee WHERE firstName = 'Malik' AND lastName = 'Vincent'
UNION ALL
SELECT id, 0, 8, 8, 8, 8, 8, 0 FROM employee WHERE firstName = 'Krystal' AND lastName = 'Walters'
UNION ALL
SELECT id, 10, 8, 0, 0, 8, 10, 10 FROM employee WHERE firstName = 'Honey' AND lastName = 'Warren'
UNION ALL
SELECT id, 8, 8, 0, 0, 8, 10, 6 FROM employee WHERE firstName = 'Ali' AND lastName = 'Waters'
UNION ALL
SELECT id, 0, 8, 8, 8, 8, 8, 0 FROM employee WHERE firstName = 'Harvey' AND lastName = 'West';