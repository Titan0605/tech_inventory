from config.db import mysql

def get_cursor():
    return mysql.connection.cursor()

def get_section_data(table):
    cur = get_cursor()
    cur.execute(f"SELECT * FROM {table}")
    data = cur.fetchall()
    result = list(data)
    cur.close()
    return result