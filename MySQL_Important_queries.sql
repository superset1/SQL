--- MySQL Important ---

-- Создание нового пользователя vitaly
CREATE USER vitaly IDENTIFIED BY 'password';
-- Установка пароля root пользователя для локального доступа
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
-- Разрешение удаленного доступа для root
UPDATE user SET host ='%' WHERE host ='loc # Cброс привилегийalhost' AND user ='root';
-- Установка пароля пользователя root для удаленного доступа
ALTER USER 'root'@'%' IDENTIFIED BY 'password';
-- Выдача полных прав root пользователю
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
-- Cброс привилегий
FLUSH PRIVILEGES;
-- Показать пользователей и доступы
SELECT user,host FROM mysql.user;
-- Показать привилегии для пользователя root
SHOW GRANTS FOR 'root'@'%';
-- Показать привилегии для текущего пользователя
SHOW GRANTS;
-- Подробный вывод привилегий для всех пользователей
SELECT * FROM information_schema.user_privileges;

-- Формат даты с автозаполнением
mydate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

-- Установка нумерации строк
set @rn = 0;
SELECT (@rn:=@rn + 1) AS num, column_name FROM table_name