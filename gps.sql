ALTER TABLE owned_vehicles ADD COLUMN gps CHAR(10) NOT NULL DEFAULT 'false',
;

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('gps', 'GPS', 1),
;