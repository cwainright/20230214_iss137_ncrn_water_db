import pyodbc
import pandas as pd
import openpyxl

# connect to db
conn = pyodbc.connect(r'Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=C:\Users\cwainright\OneDrive - DOI\Documents\data_projects\2023\20230214_iss138_iss139_ncrn_npstoret_water\data\NCRN_Water_Field_Data_BE_Ver_20230203_1514.accdb;')
# execute queries
results_anc = pd.read_sql_query("EXEC qry_edd_results_tbl_ANC", conn)
results_stream = pd.read_sql_query("EXEC qry_edd_results_tbl_Stream_Condition", conn)
results_water = pd.read_sql_query("EXEC qry_edd_results_tbl_Core_Water_Data", conn)
results = pd.DataFrame().append(results_anc).append(results_stream).append(results_water)
actvities = pd.read_sql_query("EXEC qry_edd_activities", conn)
locations = pd.read_sql_query("EXEC qry_edd_locations", conn)

with pd.ExcelWriter('data/test_edd.xlsx') as writer:
    results.to_excel(writer, sheet_name='Results', index=False)
    actvities.to_excel(writer, sheet_name='Activities', index=False)
    locations.to_excel(writer, sheet_name='Locations', index=False)

conn.close()
