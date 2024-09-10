USE petboarding;

ALTER TABLE client
DROP FOREIGN KEY fk_client_zipCode;

ALTER TABLE client
ADD CONSTRAINT fk_client_zipCode
FOREIGN KEY (zipCode)
REFERENCES citystatezip(zipCode)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE clientpet
DROP FOREIGN KEY clientpet_ibfk_1;

ALTER TABLE clientpet
DROP FOREIGN KEY clientpet_ibfk_2;

ALTER TABLE clientpet
ADD CONSTRAINT clientpet_ibfk_1
FOREIGN KEY (clientId)
REFERENCES client(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE clientpet
ADD CONSTRAINT clientpet_ibfk_2
FOREIGN KEY (clientId)
REFERENCES client(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE employee
DROP FOREIGN KEY fk_employee_zipCode;

ALTER TABLE employee
ADD CONSTRAINT fk_employee_zipCode
FOREIGN KEY (zipCode)
REFERENCES citystatezip(zipCode)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE employeeposition
DROP FOREIGN KEY employeeposition_ibfk_1;

ALTER TABLE employeeposition
DROP FOREIGN KEY fk_employeeposition_ibfk_2;

ALTER TABLE employeeposition
ADD CONSTRAINT employeeposition_ibfk_1
FOREIGN KEY (employeeId)
REFERENCES employee(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE employeeposition
ADD CONSTRAINT fk_employeeposition_ibfk_2
FOREIGN KEY (positionId)
REFERENCES `position`(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE pet
DROP FOREIGN KEY pet_ibfk_1;

ALTER TABLE pet
DROP FOREIGN KEY pet_ibfk_2;

ALTER TABLE pet
DROP FOREIGN KEY fk_pet_color;

ALTER TABLE pet
ADD CONSTRAINT pet_ibfk_1
FOREIGN KEY (breedId)
REFERENCES breed(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE pet
ADD CONSTRAINT pet_ibfk_2
FOREIGN KEY (petTypeId)
REFERENCES petType(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE pet
ADD CONSTRAINT fk_pet_color
FOREIGN KEY (colorId)
REFERENCES color(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

DELETE FROM pet
WHERE name IN ('Bailey', 'Max', 'Milo');

CREATE TABLE timecard (
ID INT NOT NULL AUTO_INCREMENT,
employeeId INT NOT NULL,
sun INT NOT NULL DEFAULT 0,
mon INT NOT NULL DEFAULT 0,
tues INT NOT NULL DEFAULT 0,
wed INT NOT NULL DEFAULT 0,
thurs INT NOT NULL DEFAULT 0,
fri INT NOT NULL DEFAULT 0,
sat INT NOT NULL DEFAULT 0,
PRIMARY KEY (ID),
FOREIGN KEY (employeeId) 
REFERENCES employee(id) 
ON UPDATE CASCADE 
ON DELETE CASCADE
);

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

SELECT
    pet.name AS `Pet Name`,
    petType.description AS `Pet Type`,
    breed.description AS `Breed`,
    CONCAT(client.firstName, ' ', client.lastName) AS `Owner`,
    client.phone AS `Phone Number`,
    client.email AS `Email`
FROM
    clientPet
JOIN
    pet ON clientPet.petId = pet.id
JOIN
    client ON clientPet.clientId = client.id
JOIN
    petType ON pet.petTypeId = petType.id
JOIN
    breed ON pet.breedId = breed.id
ORDER BY
    client.lastName, client.firstName, pet.name;

SELECT
    CONCAT(employee.firstName, ' ', employee.lastName) AS Employee,
    position.description AS Position,
    CONCAT_WS(', ', timecard.sun, timecard.mon, timecard.tues, timecard.wed, timecard.thurs, timecard.fri, timecard.sat) AS Hours
FROM
    employeePosition
JOIN
    employee ON employeePosition.employeeId = employee.id
JOIN
    position ON employeePosition.positionId = position.id
JOIN
    timecard ON employee.id = timecard.employeeId
ORDER BY
    employee.lastName;

