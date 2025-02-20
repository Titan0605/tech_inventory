from utils.db_utils import get_cursor

class StateModel:
    def __init__(self):
        self.cur = None

    def openCursor(self):
        if not self.cur:
            self.cur = get_cursor()
    
    def closeCursor(self):
        if self.cur:
            self.cur.close()
            self.cur = None
        
    def getStates(self):
        try:
            self.openCursor()
            query = """SELECT * FROM tstates ORDER BY id_state"""
            self.cur.execute(query)
            return self.cur.fetchall()
        finally:
            self.closeCursor()

    def getStateWithId(self, id_state):
        try:
            self.openCursor()
            query = """SELECT state_name FROM tstates WHERE id_state = %s"""
            self.cur.execute(query, (id_state,))
            return self.cur.fetchone()
        finally:
            self.closeCursor()