from flask import Blueprint, jsonify
from services.get_inventory_csv import readCSV
from services.insert_inventory_db import insert_inventory_data

bp = Blueprint('inventory', __name__)

@bp.route("/get_inventory", methods=['GET'])
def get_inventory():
    inventory = readCSV()
    insert_inventory_data(inventory)
    return jsonify({"message": "Completed", "inserted data": inventory})