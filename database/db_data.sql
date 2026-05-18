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

('Trenitalia', 'Roma Termini', 'Milano Centrale', '2026-05-18', '08:30:00', '12:15:00', 'FR9500', 12, 1, 0, NOW(), NOW()),

('Italo', 'Napoli Centrale', 'Torino Porta Nuova', '2026-05-18', '09:10:00', '15:20:00', 'IT8901', 10, 1, 0, NOW(), NOW()),

('Trenitalia', 'Firenze Santa Maria Novella', 'Venezia Santa Lucia', '2026-05-18', '10:00:00', '13:45:00', 'FR9321', 11, 0, 0, NOW(), NOW()),

('Italo', 'Milano Centrale', 'Roma Termini', '2026-05-18', '11:20:00', '14:35:00', 'IT7788', 9, 1, 0, NOW(), NOW()),

('Regionale', 'Bologna Centrale', 'Rimini', '2026-05-18', '12:05:00', '13:40:00', 'REG4521', 7, 1, 0, NOW(), NOW()),

('Trenitalia', 'Torino Porta Susa', 'Genova Piazza Principe', '2026-05-18', '13:15:00', '15:00:00', 'IC602', 8, 0, 0, NOW(), NOW()),

('Italo', 'Roma Termini', 'Salerno', '2026-05-18', '14:30:00', '16:10:00', 'IT5520', 10, 1, 0, NOW(), NOW()),

('Regionale', 'Palermo Centrale', 'Messina Centrale', '2026-05-18', '15:45:00', '19:20:00', 'REG991', 6, 1, 0, NOW(), NOW()),

('Trenitalia', 'Milano Centrale', 'Verona Porta Nuova', '2026-05-18', '16:00:00', '17:25:00', 'FR8810', 12, 1, 0, NOW(), NOW()),

('Italo', 'Venezia Santa Lucia', 'Roma Termini', '2026-05-18', '17:10:00', '21:00:00', 'IT9900', 11, 0, 0, NOW(), NOW()),

('Regionale', 'Bari Centrale', 'Lecce', '2026-05-18', '18:20:00', '20:05:00', 'REG320', 5, 1, 0, NOW(), NOW()),

('Trenitalia', 'Roma Tiburtina', 'Pescara Centrale', '2026-05-18', '19:00:00', '22:10:00', 'IC745', 8, 1, 1, NOW(), NOW());