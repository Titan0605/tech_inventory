from utils.db_utils import get_cursor
class BrandModel:
    def __init__(self):
        self.cur = None
        
    def openCursor(self):
        if not self.cur:
            self.cur = get_cursor()
    
    def closeCursor(self):
        if self.cur:
            self.cur.close()
            self.cur = None
        
    def getBrands(self):
        try:
            self.openCursor()
            query = """SELECT * FROM tbrands ORDER BY id_brand"""
            self.cur.execute(query)
            return self.cur.fetchall()
        finally:
            self.closeCursor()
    
    def getBrandWithId(self, id_brand):
        try:
            self.openCursor()
            query = """SELECT brand_name FROM tbrands WHERE id_brand = %s"""
            self.cur.execute(query, (id_brand,))
            return self.cur.fetchone()
        finally:
            self.closeCursor()