import sqlite3 as sql


# TODO Add a comment here
def listSpecies():
    con = sql.connect(".database/data_source.db") # Connect to database
    con.row_factory = sql.Row # Set row factory to sqlite3.Row for named column access
    cur = con.cursor()
    data = cur.execute('SELECT * FROM birdSpecies').fetchall()
    con.close()
    return data


# TODO Add a comment here
def searchByCommonName(name):
    con = sql.connect(".database/data_source.db")
    con.row_factory = sql.Row # Set row factory to sqlite3.Row for named column access
    cur = con.cursor()
    data = cur.execute(
        'SELECT * FROM birdSpecies WHERE common_name LIKE ?', 
        ('%' + name + '%',)
    ).fetchall()
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


