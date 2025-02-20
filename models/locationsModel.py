from utils.db_utils import get_cursor

class LocationModel:
    def __init__(self):
        self.cur = None

    def openCursor(self):
        if not self.cur:
            self.cur = get_cursor()
    
    def closeCursor(self):
        if self.cur:
            self.cur.close()
            self.cur = None
        
    def getLocations(self):
        try:
            self.openCursor()
            query = """SELECT * FROM tlocations ORDER BY id_location"""
            self.cur.execute(query)
            return self.cur.fetchall()
        finally:
            self.closeCursor()

    def getLocationWithId(self, id_location):
        try:
            self.openCursor()
            query = """SELECT location_name FROM tlocations WHERE id_location = %s"""
            self.cur.execute(query, (id_location,))
            return self.cur.fetchone()
        finally:
            self.closeCursor()