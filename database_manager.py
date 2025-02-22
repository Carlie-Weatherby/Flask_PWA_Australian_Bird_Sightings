import sqlite3 as sql


# TODO Add a comment here
def listSpecies():
    con = sql.connect(".database/data_source.db") # Connect to database
    con.row_factory = sql.Row # Set row factory to sqlite3. Row for named column access. # Allows dictionary-like access to columns.
    cur = con.cursor()
    data = cur.execute('SELECT * FROM birdSpecies').fetchall() # fetchall() fetches all rows
    con.close()
    return data


# TODO Add a comment here
def searchByCommonName(name):
    con = sql.connect(".database/data_source.db")
    con.row_factory = sql.Row # Set row factory to sqlite3.Row for named column access
    # Create a cursor object from the database connection (con)
    #   The cursor acts as a control structure that allows you to:
    #   Execute SQL commands (like SELECT, INSERT, UPDATE, etc.).
    #   Fetch data from query results using methods like .fetchall(), .fetchone(), etc.
    #   Manage transactions if needed (e.g., using .commit()).
    cur = con.cursor() 
    data = cur.execute(
        'SELECT * FROM birdSpecies WHERE common_name LIKE ?', 
        ('%' + name + '%',)
    ).fetchall()
    
    # Debug: Check if data is fetched
    if data:
        print(f"✅ Fetched {len(data)} rows from the database.")
        for idx, row in enumerate(data):
            print(f"Row {idx+1}: {dict(row)}")  # Explicit dict conversion
    else:
        print("⚠️ No data returned from query.")
    
    con.close()
    return data


# TODO Add a comment here
def searchByScientificName(name):
    con = sql.connect(".database/data_source.db")
    con.row_factory = sql.Row # Set row factory to sqlite3.Row for named column access
    cur = con.cursor()
    data = cur.execute(
        'SELECT * FROM birdSpecies WHERE scientific_name LIKE ?', 
        ('%' + name + '%',)
    ).fetchall()
    con.close()
    return data



