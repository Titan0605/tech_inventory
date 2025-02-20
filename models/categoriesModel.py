from utils.db_utils import get_cursor

class CategoryModel:
    def __init__(self):
        self.cur = None

    def openCursor(self):
        if not self.cur:
            self.cur = get_cursor()
    
    def closeCursor(self):
        if self.cur:
            self.cur.close()
            self.cur = None
        
    def getCategories(self):
        try:
            self.openCursor()
            query = """SELECT * FROM tcategories ORDER BY id_category"""
            self.cur.execute(query)
            return self.cur.fetchall()
        finally:
            self.closeCursor()

    def getCategoryWithId(self, id_category):
        try:
            self.openCursor()
            query = """SELECT category_name FROM tcategories WHERE id_category = %s"""
            self.cur.execute(query, (id_category,))
            return self.cur.fetchone()
        finally:
            self.closeCursor()