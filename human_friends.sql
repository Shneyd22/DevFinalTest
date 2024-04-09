DROP DATABASE IF EXISTS human_friends; 
CREATE DATABASE human_friends;
USE human_friends;

DROP TABLE IF EXISTS dogs;
CREATE TABLE dogs(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	animal_name VARCHAR(20) NOT NULL, 
	animal_type VARCHAR(10) DEFAULT 'dog',
	birth_date DATE NOT NULL,
	commands VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS cats;
CREATE TABLE cats(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	animal_name VARCHAR(20) NOT NULL, 
	animal_type VARCHAR(10) DEFAULT 'cat',
	birth_date DATE NOT NULL,
	commands VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS hamsters;
CREATE TABLE hamsters(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	animal_name VARCHAR(20) NOT NULL, 
	animal_type VARCHAR(10) DEFAULT 'hamster',
	birth_date DATE NOT NULL,
	commands VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS horses;
CREATE TABLE horses(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	animal_name VARCHAR(20) NOT NULL, 
	animal_type VARCHAR(10) DEFAULT 'horse',
	birth_date DATE NOT NULL,
	commands VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS camels;
CREATE TABLE camels(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	animal_name VARCHAR(20) NOT NULL, 
	animal_type VARCHAR(10) DEFAULT 'camel',
	birth_date DATE NOT NULL,
	commands VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS donkeys;
CREATE TABLE donkeys(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	animal_name VARCHAR(20) NOT NULL, 
	animal_type VARCHAR(10) DEFAULT 'donkey',
	birth_date DATE NOT NULL,
	commands VARCHAR(100) NOT NULL
);

INSERT INTO dogs (animal_name, birth_date, commands)
VALUES 
('Fido', '2022-01-01', 'Sit, Stay, Fetch'),
('Buddy', '2018-12-10', 'Sit, Paw, Bark'),
('Bella', '2019-11-11', 'Sit, Stay, Roll');

INSERT INTO cats (animal_name, birth_date, commands)
VALUES 
('Whiskers', '2019-05-15', 'Sit, Pounce'),
('Smudge', '2023-02-20', 'Sit, Pounce, Scratch'),
('Oliver', '2020-06-30', 'Meow, Scratch, Jump');

INSERT INTO hamsters (animal_name, birth_date, commands)
VALUES 
('Hammy', '2022-03-10', 'Roll, Hide'),
('Peanut', '2021-08-01', 'Roll, Spin');

INSERT INTO horses (animal_name, birth_date, commands)
VALUES 
('Thunder', '2015-07-21', 'Trot, Canter, Gallop'),
('Storm', '2021-05-05', 'Trot, Canter'),
('Blaze', '2016-02-29', 'Trot, Jump, Gallop');

INSERT INTO camels (animal_name, birth_date, commands)
VALUES 
('Sandy', '2016-11-03', 'Walk, Carry Load'),
('Dune', '2018-12-12', 'Walk, Sit'),
('Sahara', '2015-08-14', 'Walk, Run');

INSERT INTO donkeys (animal_name, birth_date, commands)
VALUES 
('Eeyore', '2021-09-18', 'Walk, Carry Load, Bray'),
('Burro', '2019-01-23', 'Walk, Bray, Kick');

TRUNCATE TABLE camels;

DROP TABLE IF EXISTS pack_animals;
CREATE TABLE pack_animals AS
SELECT animal_name, animal_type, birth_date, commands
FROM horses
UNION ALL SELECT animal_name, animal_type, birth_date, commands
FROM donkeys;

DROP TABLE IF EXISTS animals;
CREATE TABLE animals AS
SELECT * FROM pack_animals
UNION ALL SELECT animal_name, animal_type, birth_date, commands
FROM dogs
UNION ALL SELECT animal_name, animal_type, birth_date, commands
FROM cats
UNION ALL SELECT animal_name, animal_type, birth_date, commands
FROM hamsters;

SELECT
	animal_name,
    animal_type,
    birth_date,
    CONCAT(
		(TIMESTAMPDIFF(MONTH, birth_date, CURRENT_DATE)) DIV 12, ' years ',
        (TIMESTAMPDIFF(MONTH, birth_date, CURRENT_DATE)) % 12, ' months') as age
FROM animals
WHERE birth_date BETWEEN '2021-04-10' AND '2023-04-09';
    
    
	



    



