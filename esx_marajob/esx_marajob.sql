INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_marabunta','marabunta',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_marabunta','marabunta',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_marabunta', 'marabunta', 1)
;

INSERT INTO `jobs` (`name`, `label`, `SecondaryJob`) VALUES
('marabunta', 'marabunta', 1);

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('marabunta', 0, 'soldato', 'Petit', 0, 'null', 'null'),
('marabunta', 1, 'capo', 'Grand', 0, 'null', 'null'),
('marabunta', 2, 'consigliere', 'Bras Droit', 0, 'null', 'null'),
('marabunta', 3, 'boss', 'Jefe', 0, 'null', 'null');

CREATE TABLE `fine_types_marabunta` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  
  PRIMARY KEY (`id`)
);

INSERT INTO `fine_types_marabunta` (label, amount, category) VALUES 
	('Raket',3000,0),
	('Raket',5000,0),
	('Raket',10000,1),
	('Raket',20000,1),
	('Raket',50000,2),
	('Raket',150000,3),
	('Raket',350000,3)
;