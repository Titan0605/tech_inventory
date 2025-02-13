from flask import Flask, render_template, request, redirect, url_for, flash, session
from flask_mysqldb import MySQL
from db import init_db, mysql


app = Flask(__name__)

mysql = init_db(app)

@app.route('/')
def index():
    cur = mysql.connection.cursor()
    cur.execute("Select * from table")
    return render_template('index.html')

if __name__ == "__main__":
    app.run(port= 4000, debug=True)