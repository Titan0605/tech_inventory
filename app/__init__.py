from flask import Flask, render_template, request, redirect, url_for, flash, session
from flask_mysqldb import MySQL
from config import Config
from app.routes import suma, home

mysql = MySQL()

def create_app(config_class = Config):
    app = Flask(__name__)
    
    app.config.from_object(config_class)
    
    app.config['MYSQL_HOST'] = app.config.get('DB_HOST')
    app.config['MYSQL_USER'] = app.config.get('DB_USER')
    app.config['MYSQL_PASSWORD'] = app.config.get('DB_PASSWORD')
    app.config['MYSQL_DB'] = app.config.get('DB_NAME')
    app.config['MYSQL_PORT'] = app.config.get('DB_PORT')
    app.config['MYSQL_CURSORCLASS'] = app.config.get('DB_CURSORCLASS')

    mysql.init_app(app)
    
    app.register_blueprint(suma.bp)
    app.register_blueprint(home.bp)
    
    return app