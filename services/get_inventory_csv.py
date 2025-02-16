import os, csv

def readCSV ():
    inventory_array = ''
    path = os.path.dirname(__file__)
    file_path = os.path.join(path,'tech_inventory.csv')
    print(file_path)
    
    if os.path.exists(file_path):
        print('File exists')
        
    with open(file_path) as file:
        csv_reader = csv.reader(file, delimiter=',')
        inventory_array = list(csv_reader)
        return inventory_array