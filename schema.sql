-- Two tables, one for dogs and one for cats, with identical columns.
-- IF NOT EXISTS preserves existing tables (and their records) when init_db.py is re-run.
-- UNIQUE on name lets seed.sql use INSERT OR IGNORE so re-running never creates duplicates.

CREATE TABLE IF NOT EXISTS dogs (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL UNIQUE,
    age         INTEGER NOT NULL,      -- whole years; 0 means under one year
    breed       TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS cats (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL UNIQUE,
    age         INTEGER NOT NULL,      -- whole years; 0 means under one year
    breed       TEXT NOT NULL,
    description TEXT NOT NULL
);
