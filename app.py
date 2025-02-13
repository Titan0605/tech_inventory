from flask import Flask, render_template, request, redirect, url_for, flash, session
from flask_mysqldb import MySQL
from config.db import init_db, mysql
from routes.suma import pepe


app = Flask(__name__)

mysql = init_db(app)

#Regist blueprints
app.register_blueprint(pepe)


@app.route('/')
def index():
    cur = mysql.connection.cursor()
    return render_template('index.html')

if __name__ == "__main__":
    app.run(port= 4000, debug=True)