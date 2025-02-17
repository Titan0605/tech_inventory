import os, csv

def readCSV ():
    inventory_array = ''
    # path = os.path.dirname(__file__)
    # file_path = os.path.join(path,'tech_inventory.csv')
    
    file_path = './data/tech_inventory.csv'
    # print(file_path)
    
    if os.path.exists(file_path):
        print('File exists')
        
    with open(file_path) as file:
        csv_reader = csv.reader(file, delimiter=',')
        inventory_array = list(csv_reader)
        return inventory_array
    
# def get_inventory_section(inventory = readCSV()): //Function to get a specific section of the inventory
#     brands = []
#     for item in inventory:
#         if item[9] not in brands:
#             brands.append(item[9])

#     brands.sort()
#     print(brands)

# get_inventory_section()