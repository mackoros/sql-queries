-- Измение статуса записи об установке
UPDATE Installed_Packages 
SET status = 'removed' 
WHERE CAST(install_date AS DATE) = '2026-06-22';

-- Удалить запись об установке пакета postgresql пользователем eve
DELETE FROM Installed_Packages 
WHERE user_id = (SELECT id FROM Users WHERE username = 'eve') 
  AND package_id = (SELECT id FROM Packages WHERE name = 'postgresql');
