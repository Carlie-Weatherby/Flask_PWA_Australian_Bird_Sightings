import sqlite3 as sql

def listSpecies():
    con = sql.connect(".database/data_source_2.db") # Connect to database
    con.row_factory = sql.Row # Set row factory to sqlite3.Row for named column access
    cur = con.cursor()
    data = cur.execute('SELECT * FROM birdSpecies').fetchall()
    con.close()
    return data