ALTER TABLE `owned_vehicles` 
	ADD garage VARCHAR(50) NULL DEFAULT 'sapcounsel',
    ADD fuel INT(11) NULL DEFAULT '100',
    ADD engine FLOAT NULL DEFAULT '1000',
    ADD price INT(11) NULL DEFAULT '0'
;
