INSERT INTO Users (username, email, password_hash, role)
VALUES
('alice123', 'alice@example.com', 'hashed123', 'owner'),
('bobwalker', 'bob@example.com', 'hashed456', 'walker'),
('carol123', 'carol@example.com', 'hashed789', 'owner'),
('willwalker', 'will@example.com', 'hashed321', 'walker'),
('brad234', 'brad@example.com', 'hashed654', 'owner');

INSERT INTO Dogs (owner_id, name, size)
VALUES
((SELECT user_id FROM Users WHERE username = 'alice123'), 'Max', 'medium'),
((SELECT user_id FROM Users WHERE username = 'carol123'), 'Bella', 'small'),
((SELECT user_id FROM Users WHERE username = 'brad234'), 'Barney', 'large'),
((SELECT user_id FROM Users WHERE username = 'alice123'), 'Buster', 'medium'),
((SELECT user_id FROM Users WHERE username = 'brad234'), 'Louis', 'small');

INSERT INTO WalkRequests (dog_id, requested_time, duration_minutes, location, status)
VALUES
((SELECT dog_id FROM Dogs WHERE name = 'Max'), '2025-06-10 08:00:00', 30, 'Parklands', 'open'),
((SELECT dog_id FROM Dogs WHERE name = 'Bella'), '2025-06-10 09:30:00', 45, 'Beachside Ave', 'accepted'),
((SELECT dog_id FROM Dogs WHERE name = 'Barney'), '2025-06-10 12:00:00', 60, 'Beach', 'open'),
((SELECT dog_id FROM Dogs WHERE name = 'Buster'), '2025-06-10 10:45:00', 20, 'Dog Park', 'open'),
((SELECT dog_id FROM Dogs WHERE name = 'Louis'), '2025-06-10 11:30:00', 40, 'Plaza', 'accepted');

-- Query /api/dogs route
