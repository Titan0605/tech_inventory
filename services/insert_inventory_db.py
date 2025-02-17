from utils.db_utils import get_cursor, get_section_data
from MySQLdb import Error
from datetime import datetime


def insert_inventory_data(inventory):
    cur = get_cursor()    
    # print(inventory[2])
    brands = get_section_data("tbrands")
    categories = get_section_data("tcategories")
    states = get_section_data("tstates")
    locations = get_section_data("tlocations")
    date = ''
    
    id_brand = None
    id_category = None
    id_state = None
    id_location = None
    
    try:
        for item in inventory:
            try:                   
                for brand in brands:
                    if item[3] == brand[1]:
                        id_brand = int(brand[0])
                        break
                for category in categories:
                    if item[4] == category[1]:
                        id_category = int(category[0])
                        break
                for state in states:
                    if item[8] == state[1]:
                        id_state = int(state[0])
                        break
                for location in locations:
                    if item[9] == location[1]:
                        id_location = int(location[0])
                        break
                    
                date = datetime.strptime(item[11], "%d/%m/%Y").date()
                
                cur.execute("INSERT INTO tproducts(id_brand, SKU, product_name, id_category, original_price, discount_price, stock, id_state, id_location, warranty, last_updated) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",(id_brand, item[1], item[2], id_category, item[5], item[6], item[7], id_state, id_location, item[10], date))
                cur.connection.commit()
            except Exception as e:
                print(e)
    except Exception as e:
        print("", e)
    finally:
        cur.close()