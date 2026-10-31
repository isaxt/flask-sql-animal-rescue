# Second Chance Animal Rescue — Flask database starter

A student template with three pages:

| Page | URL | Template |
| --- | --- | --- |
| Home | `/` | `templates/home.html` |
| Available dogs | `/dogs` | `templates/dogs.html` |
| Available cats | `/cats` | `templates/cats.html` |

The routes, navigation, inherited base template, and CSS are already provided.
This is a fictional rescue for a classroom project.

## Run the starter

Unzip the download and open a terminal in `animal-rescue-starter`:

```bash
python -m pip install -r requirements.txt
python init_db.py
python -m flask --app app run --debug
```

Use `python3` if that is the Python command on your computer.
Open http://127.0.0.1:5000. Stop Flask with Ctrl+C.

Before the student tasks are complete, initialization creates a blank
`rescue.db` and the animal pages display empty listing messages. There are
no completed table definitions or sample records hidden in the starter.
The query functions deliberately return empty lists until you implement them.

## Your task

Build a database-backed animal listing site. The site must read the available
dogs and cats from SQLite rather than storing animal records in Python lists
or typing each animal directly into HTML.

### 1. Define two tables

Complete `schema.sql` with tables named **dogs** and **cats**. Both should have:

| Column | Suggested type | Meaning |
| --- | --- | --- |
| id | INTEGER PRIMARY KEY | Unique record ID |
| name | TEXT | Animal's name |
| age | INTEGER | Age in whole years; use 0 for under one year |
| breed | TEXT | Breed or a description such as mixed breed |
| description | TEXT | A short personality or care description |

All records in this exercise represent animals available for adoption.
Use `CREATE TABLE IF NOT EXISTS` to preserve existing tables on initialization.
Remember that creating a table does not add any animals to it.

### 2. Add animal records

Complete `seed.sql` with at least **three fictional dogs and three fictional
cats**. Use INSERT statements with an explicit column list. You can omit `id`
so SQLite assigns it. Give each animal a name, age, breed, and description.

After completing the SQL files, run:

```bash
python init_db.py
```

This runs both SQL files and commits the changes. Running it repeatedly also
repeats your INSERT statements unless you design them to avoid duplicates.
For a clean classroom reset, stop Flask, delete only this project's
`rescue.db`, and run initialization again. This removes the project's records.

### 3. Query the tables through models.py

Replace the empty lists in `get_dogs()` and `get_cats()` with database queries.
The supplied `query(sql, values=())` helper opens the database, executes a
SELECT, fetches its rows, and closes the connection.

- `get_dogs()` should return records from dogs, sorted by name.
- `get_cats()` should return records from cats, sorted by name.
- Keep SQL in models.py. The existing app.py already calls these functions
  and passes their results to the correct templates.

The helper uses `sqlite3.Row`, so a row's values can be accessed by column name,
for example `animal['name']`. If you later add filters, pass variable values
using ? placeholders and the helper's second argument.

### 4. Display the rows in the templates

Find the STUDENT TASK comment in each animal template. Inside its
`animal-grid`, write a Jinja loop and show one card for each row.

Each card should display the animal's **name, age, breed, and description**.
Use the supplied `.animal-card` class for the card and optionally
`.animal-tag` for a short label. A heading and a few paragraphs are enough.

Keep the existing empty-state branch for a table that has no records.
Once a query returns rows, the page enters the populated branch; it will
remain blank there until you add your loop and cards.

The shared `base.html` already loads `static/style.css` and provides navigation.
You do not need to copy the page structure or build new routes.

## Check your work

1. All three pages load and their navigation works.
2. The dog page shows only the dog records; the cat page shows only the cats.
3. Both lists are alphabetised by name.
4. A new database record appears after refreshing the appropriate page.
5. Changing a description in the database changes the displayed description.
6. Stopping and restarting Flask retains the records.
7. With no records in one table, that page shows its empty state.
8. The pages remain readable in a narrow browser window.

## File map

| File | Provided or student work? |
| --- | --- |
| app.py | Provided: three routes and template variables |
| models.py | Provided connection/query helper; students complete two functions |
| schema.sql | Students define dogs and cats |
| seed.sql | Students insert fictional records |
| init_db.py | Provided: runs schema and seed files, commits, and closes |
| templates/base.html | Provided: navigation, shared layout, stylesheet |
| templates/home.html | Provided: rescue home page |
| templates/dogs.html | Provided page shell; students add dog cards |
| templates/cats.html | Provided page shell; students add cat cards |
| static/style.css | Provided: page styling and animal-card styles |
| rescue.db | Created locally by initialization; not included in the ZIP |

## Optional extensions

- Add an available/adopted status column and filter listings with WHERE.
- Add local animal photos and a filename column to each table.
- Add a filter for maximum age using a parameterised query.

## Explain your app

In a few sentences, trace a visit to `/dogs`: which route runs, which model
function is called, which table is queried, and how the rows become HTML?

References:
- Flask templates: https://flask.palletsprojects.com/en/stable/templating/
- Python sqlite3: https://docs.python.org/3/library/sqlite3.html
