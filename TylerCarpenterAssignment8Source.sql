USE petboarding;

CREATE TABLE workschedule (
    ID INT AUTO_INCREMENT NOT NULL,
    employeeId INT NOT NULL,
    startDateTime TIMESTAMP NOT NULL,
    endDateTime TIMESTAMP NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (employeeId) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE CASCADE
);


INSERT INTO workschedule (employeeId, startDateTime, endDateTime)
VALUES
    ((SELECT id FROM employee WHERE firstName = 'Paris' AND lastName = 'Lindsey'), '2024-04-01 08:00:00', '2024-04-01 16:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Nico' AND lastName = 'Prince'), '2024-04-01 09:00:00', '2024-04-01 17:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Javan' AND lastName = 'Rennie'), '2024-04-01 12:00:00', '2024-04-01 21:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Umaiza' AND lastName = 'Melia'), '2024-04-01 16:00:00', '2024-04-01 23:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Harvey' AND lastName = 'West'), '2024-04-02 07:00:00', '2024-04-02 14:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Louis' AND lastName = 'Giles'), '2024-04-02 07:00:00', '2024-04-02 16:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Leo' AND lastName = 'Bird'), '2024-04-02 07:00:00', '2024-04-02 15:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Aamina' AND lastName = 'Dillon'), '2024-04-02 09:00:00', '2024-04-02 17:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Raheem' AND lastName = 'Montgomery'), '2024-04-03 06:00:00', '2024-04-03 14:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Nicholas' AND lastName = 'Pena'), '2024-04-03 07:00:00', '2024-04-03 15:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Alexa' AND lastName = 'Preston'), '2024-04-03 08:00:00', '2024-04-03 16:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Krystal' AND lastName = 'Walters'), '2024-04-03 09:00:00', '2024-04-03 17:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Tulisa' AND lastName = 'Roberts'), '2024-04-04 06:00:00', '2024-04-04 14:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Ethan' AND lastName = 'Ali'), '2024-04-04 07:00:00', '2024-04-04 16:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Rebekah' AND lastName = 'Morgan'), '2024-04-04 08:00:00', '2024-04-04 17:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Alissa' AND lastName = 'Ortiz'), '2024-04-04 09:00:00', '2024-04-04 18:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Sara' AND lastName = 'Barron'), '2024-04-05 07:00:00', '2024-04-05 16:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Maha' AND lastName = 'Guthrie'), '2024-04-05 08:00:00', '2024-04-05 17:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Malik' AND lastName = 'Vincent'), '2024-04-05 09:00:00', '2024-04-05 17:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Lyra' AND lastName = 'Murphy'), '2024-04-05 10:00:00', '2024-04-06 18:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Awais' AND lastName = 'Carrillo'), '2024-04-06 07:00:00', '2024-04-06 16:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Dawson' AND lastName = 'Marquez'), '2024-04-06 08:00:00', '2024-04-06 17:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Raja' AND lastName = 'Glass'), '2024-04-06 09:00:00', '2024-04-06 18:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Honey' AND lastName = 'Warren'), '2024-04-07 07:00:00', '2024-04-07 14:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Jemima' AND lastName = 'Miller'), '2024-04-07 07:00:00', '2024-04-07 15:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Laila' AND lastName = 'Christensen'), '2024-04-07 08:00:00', '2024-04-07 17:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Kaya' AND lastName = 'Hodge'), '2024-04-07 09:00:00', '2024-04-07 17:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Oliwier' AND lastName = 'Barnett'), '2024-04-09 07:00:00', '2024-04-09 15:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Lauren' AND lastName = 'Morton'), '2024-04-09 08:00:00', '2024-04-09 16:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Brodie' AND lastName = 'Gordon'), '2024-04-09 09:00:00', '2024-04-09 17:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Fern' AND lastName = 'Garner'), '2024-04-09 10:00:00', '2024-04-09 19:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Hammad' AND lastName = 'Newman'), '2024-04-09 12:00:00', '2024-04-09 20:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Floyd' AND lastName = 'Johns'), '2024-04-10 07:00:00', '2024-04-10 15:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Mathew' AND lastName = 'Horton'), '2024-04-10 08:00:00', '2024-04-10 16:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Ernest' AND lastName = 'Higgins'), '2024-04-10 09:00:00', '2024-04-10 17:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Kamil' AND lastName = 'Lozano'), '2024-04-10 10:00:00', '2024-04-10 18:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Ty' AND lastName = 'Bell'), '2024-04-10 13:00:00', '2024-04-10 22:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Ali' AND lastName = 'Waters'), '2024-04-11 07:00:00', '2024-04-11 16:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'JohnPaul' AND lastName = 'Clarke'), '2024-04-11 08:00:00', '2024-04-11 17:00:00'),
    ((SELECT id FROM employee WHERE firstName = 'Dane' AND lastName = 'Kaiser'), '2024-04-11 09:00:00', '2024-04-11 18:00:00');

CREATE VIEW workscheduleview AS
SELECT CONCAT(employee.firstName, ' ', employee.lastName) AS Employee,
       position.description AS Position,
       workschedule.startDateTime AS Start,
       workschedule.endDateTime AS End
FROM workschedule
JOIN employee ON workschedule.employeeId = employee.id
JOIN employeeposition ON employee.id = employeeposition.employeeId
JOIN position ON employeeposition.positionId = position.id
ORDER BY workschedule.startDateTime;

ALTER TABLE pet
MODIFY COLUMN weight DECIMAL(5,1);

UPDATE pet
SET weight = CASE
    WHEN name = 'Buddy' THEN weight + 50
    WHEN name = 'Charlie' THEN weight + 20
    WHEN name = 'Luna' THEN weight + 15
    WHEN name = 'Cooper' THEN weight + 30
    WHEN name = 'Jack' THEN weight + 50
    WHEN name = 'Chloe' THEN weight + 120
    WHEN name = 'Buster' THEN weight + 30
    WHEN name = 'Sophie' THEN weight + 30
    WHEN name = 'Lily' THEN weight + 10
    WHEN name = 'Oreo' THEN weight + 70
    WHEN name = 'Ginger' THEN weight + 100
    WHEN name = 'Rusty' THEN weight + 10
    WHEN name = 'Zeus' THEN weight - 6
    WHEN name = 'Sasha' THEN weight + 80
    WHEN name = 'Sammy' THEN weight + 85
    WHEN name = 'Annie' THEN weight - 10
    WHEN name = 'Tucker' THEN weight + 40
    ELSE weight
END;