from config.db import mysql

class BrandModel:
    def __init__(self):
        self.mysql = mysql
        self.id = 0
        self.brandName = ''
        
    def getBrand(self):
        hola = 'sufhuafu'