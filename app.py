from flask import Flask
from config.db import init_db
from routes import index, inventory


app = Flask(__name__)
mysql = init_db(app)

#Register of blueprints
app.register_blueprint(index.bp)
app.register_blueprint(inventory.bp)

if __name__ == "__main__":
    app.run(port=4000, debug=True)