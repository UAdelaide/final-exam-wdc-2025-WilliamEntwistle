INSERT INTO users (username, email, password_hash, role)
Values
('alice123', 'alice@example.com', 'hashed123', 'owner'),
('bobwalker', 'bob@example.com', 'hashed456', 'walker'),
('carol123', 'carol@example.com', 'hashed789', 'owner'),
('willwalker', 'will@example.com', 'hashed321', 'walker'),
('brad234', 'brad@example.com', 'hashed654', 'owner');

INSERT INTO Dogs (owner_id, name, size)
VALUES
((SELECT user_id FROM Users WHERE username = 'alice123'), 'Max', 'medium'),