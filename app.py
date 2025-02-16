from flask import Flask
from config.db import init_db
from routes.index import index_bp
from routes.inventory import inventory_bp


app = Flask(__name__)
mysql = init_db(app)

#Register of blueprints
app.register_blueprint(index_bp)
app.register_blueprint(inventory_bp)

if __name__ == "__main__":
    app.run(port=4000, debug=True)