CREATE TABLE IF NOT EXISTS tb_user (
                                       id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                       username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    enabled BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE IF NOT EXISTS tb_roles (
                                        id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                        name VARCHAR(50) UNIQUE NOT NULL
    );

CREATE TABLE IF NOT EXISTS tb_user_roles (
                                             user_id BIGINT NOT NULL,
                                             role_id BIGINT NOT NULL,
                                             PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES tb_user(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES tb_roles(id) ON DELETE CASCADE
    );

-- Insert user with a hashed password (example using bcrypt hash)
INSERT INTO tb_user (username, email, password, enabled)
VALUES ('ygornacif', 'ygor@gmail.com', '$2a$10$7eqJtq98hPqEX7fNZaFWoOZt1r8sJ5FJxXH1e6UzG/Kjz7p/JN9eW', TRUE);

-- Insert roles
INSERT INTO tb_roles (name)
VALUES ('ROLE_USER'), ('ROLE_ADMIN');

-- Assign roles to the user
INSERT INTO tb_user_roles (user_id, role_id)
VALUES
    ((SELECT id FROM tb_user WHERE username = 'ygornacif'),
     (SELECT id FROM tb_roles WHERE name = 'ROLE_USER')),
    ((SELECT id FROM tb_user WHERE username = 'ygornacif'),
     (SELECT id FROM tb_roles WHERE name = 'ROLE_ADMIN'));

