-- Пользователи и их установки
SELECT 
    u.username,
    p.name AS package_name,
    d.name AS distribution,
    ip.install_date
FROM Users u
LEFT JOIN Installed_Packages ip ON u.id = ip.user_id
LEFT JOIN Packages p ON ip.package_id = p.id
LEFT JOIN Distributions d ON ip.distribution_id = d.id
ORDER BY u.username;

-- Установки и пакеты
SELECT 
    u.username,
    p.name AS package_name,
    ip.install_date
FROM Installed_Packages ip
RIGHT JOIN Users u ON ip.user_id = u.id
RIGHT JOIN Packages p ON ip.package_id = p.id
ORDER BY p.name;

-- Пользователи, которые установили пакеты с лицензией GPL
SELECT DISTINCT u.username
FROM Users u
INNER JOIN Installed_Packages ip ON u.id = ip.user_id
INNER JOIN Packages p ON ip.package_id = p.id
WHERE p.license LIKE '%GPL%';
