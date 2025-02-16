from config.db import get_cursor
from MySQLdb import Error


def inset_inventory_data(inventory):
    cur = get_cursor()    
    print(inventory[2])
    
    try:
        for item in inventory:
            #cursor.execute("INSERT INTO tproduct(id_product, id_brand, SKU, product_name, id_category_ original_price, discount_price, stock, id_state, id_location, warranty, last_updated, activate) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (item[0], item[1], item[2], item[3], item[4], item[5], item[6], item[7], item[8], item[9], item[10], item[11]))
            
            print(item[3])         
            try:                   
                cur.execute("INSERT INTO tstates(state_name) VALUES (%s)", (item[8],))        
                cur.connection.commit()
            except Exception as e:
                print(e)
    except Exception as e:
        print("", e)
    finally:
        cur.close()