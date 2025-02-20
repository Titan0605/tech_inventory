from utils.db_utils import get_cursor
from models import brandsModel, categoriesModel, locationsModel, statesModel

class ProductsModel:
    def __init__ (self):
        self.cur = None
        self.brandModel = brandsModel.BrandModel()
        self.categoryModel = categoriesModel.CategoryModel()
        self.locationModel = locationsModel.LocationModel()
        self.stateModel = statesModel.StateModel()
        self.infoProducts = []

    def openCursor(self):
        if not self.cur:
            self.cur = get_cursor()
    
    def closeCursor(self):
        if self.cur:
            self.cur.close()
            self.cur = None
        
    def getProducts(self):
        try:
            self.openCursor()
            query = """SELECT * FROM tproducts WHERE active = 1"""
            self.cur.execute(query)
            products = self.cur.fetchall()
            brand = None
            category = None
            state = None
            location = None
            
            for product in products:
                brand = self.brandModel.getBrandWithId(product[1])
                category = self.categoryModel.getCategoryWithId(product[4])
                state = self.stateModel.getStateWithId(product[8])
                location = self.locationModel.getLocationWithId(product[9])

                infoProduct = {}
                
                infoProduct['id'] = product[0]
                infoProduct['brand'] = brand[0]
                infoProduct['SKU'] = product[2]
                infoProduct['name'] = product[3]
                infoProduct['category'] = category[0]
                infoProduct['original_price'] = product[5]
                infoProduct['discount_price'] = product[6]
                infoProduct['stock'] = product[7]
                infoProduct['state'] = state[0]
                infoProduct['location'] = location[0]
                infoProduct['warranty'] = product[10]

                self.infoProducts.append(infoProduct)

            return self.infoProducts
        finally:
            self.closeCursor()
