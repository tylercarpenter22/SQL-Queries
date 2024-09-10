USE petboarding;

RENAME TABLE petType TO pettype;

RENAME TABLE employeePosition TO employeeposition;

RENAME TABLE clientPet TO clientpet;

RENAME TABLE cityStateZip TO citystatezip;


CREATE TABLE color (
    ID INT NOT NULL AUTO_INCREMENT,
    color VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY (ID)
);

ALTER TABLE color AUTO_INCREMENT = 100;

INSERT INTO color (color)
SELECT DISTINCT color FROM pet;

UPDATE pet
JOIN color ON pet.color = color.color
SET pet.color = color.ID;

ALTER TABLE pet
CHANGE COLUMN color colorId INT;

ALTER TABLE pet
MODIFY COLUMN colorId INT NOT NULL;

ALTER TABLE pet
ADD CONSTRAINT fk_pet_color
FOREIGN KEY (colorId) REFERENCES color(id);

INSERT INTO color (color)
VALUES 
('Tan'),
('Brindle'),
('Grey'),
('Red'),
('Blue'),
('Sable'),
('Tabby'),
('Calico'),
('Tortoiseshell'),
('Pointed');

SELECT 
    pet.name AS Name,
    pettype.description AS `Pet Type`,
    breed.description AS Breed,
    color.color AS Color
FROM 
    pet
JOIN 
    breed ON pet.breedId = breed.ID
JOIN 
    pettype ON pet.petTypeId = pettype.ID
JOIN 
    color ON pet.colorId = color.ID
WHERE 
    pettype.description = 'Dog'
ORDER BY 
    pet.name;

SELECT 
    pet.name AS Name,
    pettype.description AS `Pet Type`,
    breed.description AS Breed,
    color.color AS Color
FROM 
    pet
JOIN 
    breed ON pet.breedId = breed.ID
JOIN 
    pettype ON pet.petTypeId = pettype.ID
JOIN 
    color ON pet.colorId = color.ID
WHERE 
    pettype.description = 'Cat'
ORDER BY 
    pet.name;