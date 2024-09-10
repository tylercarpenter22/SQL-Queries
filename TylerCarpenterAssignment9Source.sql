USE petboarding;

SELECT CURRENT_USER();

CREATE USER 'TylerCarpenter'@'localhost' IDENTIFIED BY 'cgs2545$%';

SELECT host, user, select_priv, insert_priv, update_priv, delete_priv, create_priv, drop_priv 
FROM mysql.user 
WHERE user = 'TylerCarpenter' AND host = 'localhost';

GRANT SELECT, INSERT, UPDATE ON petboarding.* TO 'TylerCarpenter'@'localhost';

SHOW GRANTS FOR 'TylerCarpenter'@'localhost';

QUIT;

SELECT version();

mysql -u TylerCarpenter -p

USE petboarding;

DELETE FROM clients WHERE condition;

exit;

mysql -u root -p

USE petboarding;

CREATE USER 'employee'@'localhost' IDENTIFIED BY 'cgs2545$%';

SELECT host, user, select_priv, insert_priv, update_priv, delete_priv, create_priv, drop_priv
FROM mysql.user
WHERE user = 'employee' AND host = 'localhost';

GRANT SELECT, SHOW VIEW ON petboarding.workscheduleview TO 'employee'@'localhost';

SHOW GRANTS FOR 'employee'@'localhost';

exit;

mysql -u employee -p

USE petboarding;

SHOW TABLES;

SELECT * FROM clients;

exit;

mysql -u root -p

REVOKE INSERT, UPDATE ON petboarding.* FROM 'TylerCarpenter'@'localhost';

SHOW GRANTS FOR 'TylerCarpenter'@'localhost';





