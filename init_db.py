import sqlite3
from pathlib import Path
from models import DB_PATH

folder = Path(__file__).parent
connection = sqlite3.connect(DB_PATH)
connection.executescript((folder / "schema.sql").read_text())
connection.executescript((folder / "seed.sql").read_text())
connection.commit()
connection.close()
print("Initialized:", DB_PATH)
