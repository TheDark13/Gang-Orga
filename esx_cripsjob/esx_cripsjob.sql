INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_crips','crips',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_crips','crips',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_crips', 'crips', 1)
;

INSERT INTO `jobs` (`name`, `label`, `SecondaryJob`) VALUES
('crips', 'crips', 1);

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('crips', 0, 'soldato', 'Recrue', 0, 'null', 'null'),
('crips', 1, 'capo', 'Dealer', 0, 'null', 'null'),
('crips', 2, 'consigliere', 'Thug', 0, 'null', 'null'),
('crips', 3, 'boss', 'Jefe', 0, 'null', 'null');

CREATE TABLE `fine_types_crips` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  
  PRIMARY KEY (`id`)
);

INSERT INTO `fine_types_crips` (label, amount, category) VALUES 
	('Raket',3000,0),
	('Raket',5000,0),
	('Raket',10000,1),
	('Raket',20000,1),
	('Raket',50000,2),
	('Raket',150000,3),
	('Raket',350000,3)
;