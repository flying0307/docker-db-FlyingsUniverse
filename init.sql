DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles 
      WHERE  rolname = 'flying') THEN
      CREATE USER flying WITH ENCRYPTED PASSWORD '12345678';
   END IF;
END
$do$;

CREATE DATABASE test;
GRANT ALL PRIVILEGES ON DATABASE test TO flying;
\c test;

CREATE TABLE users (
    name VARCHAR(100),
    email VARCHAR(100) PRIMARY KEY,
    password VARCHAR(100)
);

CREATE TABLE users_daily (
    user_id VARCHAR(100),
    date VARCHAR(100),
    timestamp TIMESTAMP with time zone,
    PRIMARY KEY (user_id, date)
);
