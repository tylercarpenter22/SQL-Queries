USE petboarding;

CREATE TABLE cityStateZip (
city VARCHAR(90) NOT NULL,
state CHAR(2) NOT NULL,
zipCode CHAR(5) UNIQUE PRIMARY KEY NOT NULL
);

INSERT INTO cityStateZip (city, state, zipCode)
SELECT DISTINCT city, state, zipCode
FROM employee
WHERE zipCode NOT IN (SELECT zipCode FROM cityStateZIP);

INSERT INTO cityStateZip (city, state, zipCode)
SELECT DISTINCT city, state, zipCode
FROM client
WHERE zipCode NOT IN (SELECT zipCode FROM cityStateZIP);

ALTER TABLE employee
ADD CONSTRAINT fk_employee_zipCode
FOREIGN KEY (zipcode)
REFERENCES cityStateZip(zipCode);

ALTER TABLE employee
DROP COLUMN city,
DROP COLUMN state;

ALTER TABLE client
ADD CONSTRAINT fk_client_zipCode
FOREIGN KEY (zipCode)
REFERENCES cityStateZip(zipCode);

ALTER TABLE client
DROP COLUMN city,
DROP COLUMN state;

CREATE TABLE employeePosition(
employeeId INT NOT NULL,
positionId INT NOT NULL,
PRIMARY KEY (employeeId, positionId),
FOREIGN KEY (employeeId) REFERENCES employee(id),
FOREIGN KEY (positionId) REFERENCES `position`(id)
);

INSERT INTO employeePosition (employeeId, positionId)
VALUES
((SELECT id FROM employee WHERE firstName = 'JohnPaul' AND lastName = 'Clarke'), (SELECT id FROM position WHERE description = 'Veterinarian')),
((SELECT id FROM employee WHERE firstName = 'Maha' AND lastName = 'Guthrie'), (SELECT id FROM position WHERE description = 'Groomer')),
((SELECT id FROM employee WHERE firstName = 'Dane' AND lastName = 'Kaiser'), (SELECT id FROM position WHERE description = 'Bather')),
((SELECT id FROM employee WHERE firstName = 'Paris' AND lastName = 'Lindsey'), (SELECT id FROM position WHERE description = 'Receptionist')),
((SELECT id FROM employee WHERE firstName = 'Umaiza' AND lastName = 'Melia'), (SELECT id FROM position WHERE description = 'Manager')),
((SELECT id FROM employee WHERE firstName = 'Hammad' AND lastName = 'Newman'), (SELECT id FROM position WHERE description = 'Groom')),
((SELECT id FROM employee WHERE firstName = 'Nico' AND lastName = 'Prince'), (SELECT id FROM position WHERE description = 'Maintenance')),
((SELECT id FROM employee WHERE firstName = 'Javan' AND lastName = 'Rennie'), (SELECT id FROM position WHERE description = 'Animal Trainer')),
((SELECT id FROM employee WHERE firstName = 'Tulisa' AND lastName = 'Roberts'), (SELECT id FROM position WHERE description = 'Kennel Technician')),
((SELECT id FROM employee WHERE firstName = 'Ali' AND lastName = 'Waters'), (SELECT id FROM position WHERE description = 'Pet Exerciser'));

