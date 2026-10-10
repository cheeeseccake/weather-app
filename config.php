<?php
/**
 * Database configuration for local development and Vercel.
 * Configure DB_HOST, DB_PORT, DB_USER, DB_PASSWORD, and DB_NAME
 * in Vercel Project Settings → Environment Variables.
 */
class Database {
    private $conn;

    public function __construct() {
        mysqli_report(MYSQLI_REPORT_OFF);

        $host = getenv('DB_HOST') ?: '127.0.0.1';
        $port = (int) (getenv('DB_PORT') ?: 3306);
        $username = getenv('DB_USER') ?: 'root';
        $password = getenv('DB_PASSWORD') ?: '';
        $dbname = getenv('DB_NAME') ?: 'weather_app';

        $this->conn = new mysqli($host, $username, $password, $dbname, $port);
        if ($this->conn->connect_error) {
            error_log('Weather App database connection failed: ' . $this->conn->connect_error);
            throw new RuntimeException('Database connection unavailable.');
        }
        $this->conn->set_charset('utf8mb4');
    }

    public function getConnection() {
        return $this->conn;
    }

    public function close() {
        if ($this->conn instanceof mysqli) {
            $this->conn->close();
        }
    }

    public function query($sql) {
        return $this->conn->query($sql);
    }

    public function real_escape_string($string) {
        return $this->conn->real_escape_string($string);
    }
}
