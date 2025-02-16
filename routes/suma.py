from flask import Blueprint, render_template

bp = Blueprint('suma', __name__)

@bp.route('/suma')
def suma():
    return render_template('pepe.html')