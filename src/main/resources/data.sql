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

INSERT INTO tb_user (username, email, password, enabled)
VALUES ('ygornacif', 'ygor@gmail.com', 'ygornacif', TRUE)