# config/database.py
from flask_mysqldb import MySQL

mysql = MySQL()

def init_db(app):
    # Configuración básica de MySQL
    app.config['MYSQL_HOST'] = 'localhost'
    app.config['MYSQL_USER'] = 'root'
    app.config['MYSQL_PASSWORD'] = ''
    app.config['MYSQL_DB'] = 'tech_inventory'
    app.config['MYSQL_PORT'] = 3306    
    app.config['MYSQL_POOL_SIZE'] = 5  # Número de conexiones en el pool
    app.config['MYSQL_POOL_NAME'] = 'mypool'
    
    mysql.init_app(app)
    app.mysql = mysql  
    
    return mysql

# def get_cursor():
#     return mysql.connection.cursor()

# def get_section_data(table):
#     cur = get_cursor()
#     cur.execute(f"SELECT * FROM {table}")
#     data = cur.fetchall()
#     result = list(data)
#     cur.close()
#     return result