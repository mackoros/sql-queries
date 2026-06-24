-- Все установленные пакеты отсортированные по дате
SELECT 
    u.username,
    p.name AS package_name,
    d.name AS distribution,
    ip.installed_version,
    ip.install_date,
    ip.status
FROM Installed_Packages ip
JOIN Users u ON ip.user_id = u.id
JOIN Packages p ON ip.package_id = p.id
JOIN Distributions d ON ip.distribution_id = d.id
WHERE ip.status = 'installed'
ORDER BY ip.install_date DESC;
