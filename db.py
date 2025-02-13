from flask_mysqldb import MySQL

mysql = None

def init_db(app):
    global mysql
    app.config['MYSQL_HOST'] = 'localhost'
    app.config['MYSQL_USER'] = 'root'
    app.config['MYSQL_PASSWORD'] = ''
    app.config['MYSQL_DB'] = 'tech_inventory'
    app.config['MYSQL_PORT'] = 3306
    app.config['MYSQL_CURSORCLASS'] = 'DictCursor'  # Para obtener resultados en formato diccionario
    mysql = MySQL(app)
