USE petboarding

CREATE TABLE ratetype (
    ID INT NOT NULL AUTO_INCREMENT,
    description VARCHAR(30) NOT NULL,
    rate DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY (ID)
);

INSERT INTO ratetype (description, rate) VALUES
('Standard', 25.00),
('Deluxe', 35.00),
('Condo', 45.00),
('Private', 55.00);

CREATE TABLE board (
    ID INT NOT NULL AUTO_INCREMENT,
    petId INT NOT NULL,
    ratetypeId INT NOT NULL,
    days INT NOT NULL DEFAULT 0,
    PRIMARY KEY (ID),
    FOREIGN KEY (petId) REFERENCES pet(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ratetypeId) REFERENCES ratetype(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO board (petId, ratetypeId, days) VALUES
(
    (SELECT id FROM pet WHERE name = 'Buddy'),
    (SELECT ID FROM ratetype WHERE description = 'Standard'),
    3
),
(
    (SELECT id FROM pet WHERE name = 'Molly'),
    (SELECT ID FROM ratetype WHERE description = 'Deluxe'),
    4
),
(
    (SELECT id FROM pet WHERE name = 'Cooper'),
    (SELECT ID FROM ratetype WHERE description = 'Condo'),
    2
),
(
    (SELECT id FROM pet WHERE name = 'Maggie'),
    (SELECT ID FROM ratetype WHERE description = 'Private'),
    5
),
(
    (SELECT id FROM pet WHERE name = 'Zoe'),
    (SELECT ID FROM ratetype WHERE description = 'Standard'),
    3
),
(
    (SELECT id FROM pet WHERE name = 'Shadow'),
    (SELECT ID FROM ratetype WHERE description = 'Deluxe'),
    4
),
(
    (SELECT id FROM pet WHERE name = 'Oreo'),
    (SELECT ID FROM ratetype WHERE description = 'Condo'),
    6
),
(
    (SELECT id FROM pet WHERE name = 'Jake'),
    (SELECT ID FROM ratetype WHERE description = 'Private'),
    9
),
(
    (SELECT id FROM pet WHERE name = 'Annie'),
    (SELECT ID FROM ratetype WHERE description = 'Standard'),
    2
),
(
    (SELECT id FROM pet WHERE name = 'Cody'),
    (SELECT ID FROM ratetype WHERE description = 'Deluxe'),
    1
);

DELIMITER $$

CREATE PROCEDURE boardBill(INOUT bill VARCHAR(4000))
BEGIN
    DECLARE v_finished INT DEFAULT 0;
    DECLARE v_lines VARCHAR(100) DEFAULT '-------------------------------------------';
    DECLARE v_count INT DEFAULT 0;
    DECLARE v_clientFirst VARCHAR(100);
    DECLARE v_clientLast VARCHAR(100);
    DECLARE v_clientAddress VARCHAR(100);
    DECLARE v_clientCity VARCHAR(100);
    DECLARE v_clientState VARCHAR(100);
    DECLARE v_clientZip VARCHAR(100);
    DECLARE v_pet VARCHAR(100);
    DECLARE v_rate DECIMAL(5,2);
    DECLARE v_days INT;
    DECLARE v_bill DECIMAL(8,2);

    DECLARE board_cursor CURSOR FOR
        SELECT
            c.firstName,
            c.lastName,
            c.address,
            cs.city,
            cs.state,
            cs.zipCode,
            p.name AS pet,
            rt.rate,
            b.days
        FROM
            client c
            INNER JOIN cityState cs ON c.cityStateId = cs.id
            INNER JOIN pet p ON c.id = p.ownerId
            INNER JOIN board b ON p.id = b.petId
            INNER JOIN ratetype rt ON b.ratetypeId = rt.ID;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;

    OPEN board_cursor;

    get_board: LOOP
        FETCH board_cursor INTO v_clientFirst, v_clientLast, v_clientAddress, v_clientCity, v_clientState, v_clientZip, v_pet, v_rate, v_days;

        IF v_finished = 1 THEN
            LEAVE get_board;
        END IF;

        SET v_count = v_count + 1;

        SET v_bill = v_rate * v_days;

        IF v_count >= 1 THEN
            SET bill = CONCAT(bill, '\nCGS 2545 Pet Boarding\n');
            SET bill = CONCAT(bill, 'UCF\n');
            SET bill = CONCAT(bill, 'NSC 101\n\n');
            SET bill = CONCAT(bill, v_clientFirst, ' ', v_clientLast, '\n');
            SET bill = CONCAT(bill, v_clientAddress, '\n');
            SET bill = CONCAT(bill, v_clientCity, ', ', v_clientState, ' ', v_clientZip, '\n\n');
            SET bill = CONCAT(bill, 'Pet name: ', v_pet, '\n');
            SET bill = CONCAT(bill, 'Rate: $', v_rate, ' per day\n');
            SET bill = CONCAT(bill, 'Days: ', v_days, '\n');
            SET bill = CONCAT(bill, 'Total: $', v_bill, '\n\n');
            SET bill = CONCAT(bill, v_lines, '\n');
        END IF;

    END LOOP get_board;

    CLOSE board_cursor;
    
END$$

SET @bill = '';

CALL boardBill(@bill);

SELECT @bill;





