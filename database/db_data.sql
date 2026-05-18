TRUNCATE TABLE trains;

INSERT INTO trains (
    company,
    departure_station,
    arrival_station,
    departure_date,
    departure_time,
    arrival_time,
    train_code,
    carriages_number,
    is_on_time,
    is_cancelled,
    created_at,
    updated_at
) VALUES
('Trenitalia', 'Roma Termini', 'Milano Centrale', DATE_SUB(CURDATE(), INTERVAL 10 DAY), '08:30:00', '12:15:00', 'FR9500', 12, 1, 0, NOW(), NOW()),
('Italo', 'Napoli Centrale', 'Torino Porta Nuova', DATE_SUB(CURDATE(), INTERVAL 7 DAY), '09:10:00', '15:20:00', 'IT8901', 10, 1, 0, NOW(), NOW()),
('Regionale', 'Bologna Centrale', 'Rimini', DATE_SUB(CURDATE(), INTERVAL 3 DAY), '12:05:00', '13:40:00', 'REG4521', 7, 1, 0, NOW(), NOW()),

('Trenitalia', 'Roma Termini', 'Milano Centrale', CURDATE(), '08:30:00', '12:15:00', 'FR9601', 12, 1, 0, NOW(), NOW()),
('Italo', 'Milano Centrale', 'Roma Termini', CURDATE(), '10:20:00', '13:40:00', 'IT7788', 9, 1, 0, NOW(), NOW()),
('Trenitalia', 'Firenze Santa Maria Novella', 'Venezia Santa Lucia', CURDATE(), '11:00:00', '13:45:00', 'FR9321', 11, 0, 0, NOW(), NOW()),
('Regionale', 'Bari Centrale', 'Lecce', CURDATE(), '18:20:00', '20:05:00', 'REG320', 5, 1, 0, NOW(), NOW()),

('Trenitalia', 'Torino Porta Susa', 'Genova Piazza Principe', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '07:15:00', '09:00:00', 'IC602', 8, 0, 0, NOW(), NOW()),
('Italo', 'Roma Termini', 'Salerno', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '14:30:00', '16:10:00', 'IT5520', 10, 1, 0, NOW(), NOW()),
('Regionale', 'Palermo Centrale', 'Messina Centrale', DATE_ADD(CURDATE(), INTERVAL 3 DAY), '15:45:00', '19:20:00', 'REG991', 6, 1, 0, NOW(), NOW()),
('Trenitalia', 'Milano Centrale', 'Verona Porta Nuova', DATE_ADD(CURDATE(), INTERVAL 5 DAY), '16:00:00', '17:25:00', 'FR8810', 12, 1, 0, NOW(), NOW()),
('Italo', 'Venezia Santa Lucia', 'Roma Termini', DATE_ADD(CURDATE(), INTERVAL 7 DAY), '17:10:00', '21:00:00', 'IT9900', 11, 0, 0, NOW(), NOW()),
('Trenitalia', 'Roma Tiburtina', 'Pescara Centrale', DATE_ADD(CURDATE(), INTERVAL 9 DAY), '19:00:00', '22:10:00', 'IC745', 8, 1, 1, NOW(), NOW()),

('Frecciarossa', 'Milano Centrale', 'Napoli Centrale', DATE_ADD(CURDATE(), INTERVAL 12 DAY), '06:45:00', '11:25:00', 'FR9515', 13, 1, 0, NOW(), NOW()),
('Intercity', 'Genova Piazza Principe', 'Roma Termini', DATE_ADD(CURDATE(), INTERVAL 15 DAY), '09:35:00', '14:50:00', 'IC510', 9, 1, 0, NOW(), NOW()),
('Regionale', 'Torino Porta Nuova', 'Aosta', DATE_ADD(CURDATE(), INTERVAL 18 DAY), '10:10:00', '12:35:00', 'REG1842', 5, 0, 0, NOW(), NOW()),
('Italo', 'Torino Porta Nuova', 'Venezia Santa Lucia', DATE_ADD(CURDATE(), INTERVAL 21 DAY), '13:25:00', '17:30:00', 'IT7741', 10, 1, 0, NOW(), NOW()),
('Trenitalia', 'Bologna Centrale', 'Firenze Santa Maria Novella', DATE_ADD(CURDATE(), INTERVAL 25 DAY), '08:55:00', '09:35:00', 'FR9402', 11, 1, 0, NOW(), NOW()),

('Regionale', 'Catania Centrale', 'Siracusa', DATE_ADD(CURDATE(), INTERVAL 30 DAY), '07:40:00', '09:05:00', 'REG2150', 4, 1, 0, NOW(), NOW()),
('Trenitalia', 'Ancona', 'Bologna Centrale', DATE_ADD(CURDATE(), INTERVAL 35 DAY), '12:30:00', '15:05:00', 'IC612', 8, 1, 0, NOW(), NOW()),
('Italo', 'Roma Termini', 'Venezia Santa Lucia', DATE_ADD(CURDATE(), INTERVAL 40 DAY), '16:15:00', '20:20:00', 'IT9930', 10, 0, 0, NOW(), NOW()),
('Frecciarossa', 'Napoli Centrale', 'Milano Centrale', DATE_ADD(CURDATE(), INTERVAL 45 DAY), '05:50:00', '10:35:00', 'FR9608', 12, 1, 0, NOW(), NOW()),
('Regionale', 'Pisa Centrale', 'La Spezia Centrale', DATE_ADD(CURDATE(), INTERVAL 50 DAY), '11:25:00', '12:45:00', 'REG7044', 5, 1, 0, NOW(), NOW()),
('Trenitalia', 'Lecce', 'Bari Centrale', DATE_ADD(CURDATE(), INTERVAL 55 DAY), '18:00:00', '19:40:00', 'IC880', 7, 1, 0, NOW(), NOW()),
('Italo', 'Salerno', 'Torino Porta Nuova', DATE_ADD(CURDATE(), INTERVAL 60 DAY), '06:30:00', '13:55:00', 'IT8950', 11, 1, 0, NOW(), NOW());