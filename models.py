import sqlite3
from pathlib import Path

DB_PATH = Path(__file__).parent / "rescue.db"


def query(sql, values=()):
    connection = sqlite3.connect(DB_PATH)
    connection.row_factory = sqlite3.Row
    rows = connection.execute(sql, values).fetchall()
    connection.close()
    return rows


def get_dogs():
    return query("SELECT id, name, age, breed, description FROM dogs ORDER BY name COLLATE NOCASE")


def get_cats():
    return query("SELECT id, name, age, breed, description FROM cats ORDER BY name COLLATE NOCASE")
