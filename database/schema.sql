-- Minimal MySQL schema inferred from the queries used by the current PHP classes.
-- Back up/export any existing local data before importing this into production.

CREATE TABLE IF NOT EXISTS journals (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    entry TEXT NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_journals_date (date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS points (
    id TINYINT UNSIGNED NOT NULL,
    points INT NOT NULL DEFAULT 0,
    streak INT NOT NULL DEFAULT 1,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO points (id, points, streak)
VALUES (1, 0, 1)
ON DUPLICATE KEY UPDATE id = VALUES(id);

CREATE TABLE IF NOT EXISTS searches (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    city VARCHAR(150) NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_searches_date (date),
    INDEX idx_searches_city (city)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
