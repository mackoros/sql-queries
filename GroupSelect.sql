-- Количество установленных пакетов по пользователям
SELECT 
    u.username,
    COUNT(ip.id) AS total_installed
FROM Users u
LEFT JOIN Installed_Packages ip ON u.id = ip.user_id AND ip.status = 'installed'
GROUP BY u.username
ORDER BY total_installed DESC;
