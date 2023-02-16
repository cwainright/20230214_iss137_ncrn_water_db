import pyodbc
import pandas as pd

conn = pyodbc.connect(r'Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=C:\Users\cwainright\OneDrive - DOI\Documents\data_projects\2023\20230214_iss137_ncrn_water_db\data\NCRN_Water_Field_Data_BE_Ver_20230203_1514.accdb;')

results = pd.read_sql_query("EXEC qry_edd_activities", conn)

conn.close()
