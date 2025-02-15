class Config:
    # Configuración de MySQL
    DB_HOST = 'localhost'
    DB_USER = 'root'
    DB_PASSWORD = ''
    DB_NAME = 'tech_inventory'
    DB_PORT = 3306
    DB_CURSORCLASS = 'DictCursor'  # Para obtener resultados en formato diccionario

class DevelopmentConfig(Config):
    DEBUG = True

class ProductionConfig(Config):
    DEBUG = False