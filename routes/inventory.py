from flask import Blueprint, jsonify
from services.get_inventory_csv import readCSV
from services.insert_inventory_db import inset_inventory_data

inventory_bp = Blueprint('inventory', __name__)

@inventory_bp.route("/get_inventory", methods=['GET'])
def get_inventory():
    inventory = readCSV()    
    inset_inventory_data(inventory)
    return jsonify({"message": "Completed", "data": inventory})