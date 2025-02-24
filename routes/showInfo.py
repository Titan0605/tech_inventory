from flask import Blueprint, render_template
from models import productsModel

bp = Blueprint('info', __name__)

@bp.route('/get_products')
def info():
    # brands = BrandModel()
    # data = brands.getBrands()
    # print(data)
    # print(type(brands))
    # print(type(data))
    # print(data[1])
    # print(data[0][1])
    # print(type(data[0][1]))
    products = productsModel.ProductsModel()
    # return render_template('index.html', products_list = products) #was change to return the products
    return products.getProducts()