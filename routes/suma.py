from flask import Blueprint, render_template

pepe = Blueprint('suma', __name__)

@pepe.route('/suma')
def suma():
    return render_template('pepe.html')