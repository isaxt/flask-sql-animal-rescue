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
    # TODO: replace the empty list with a query of your dogs table.
    return []


def get_cats():
    # TODO: replace the empty list with a query of your cats table.
    return []
