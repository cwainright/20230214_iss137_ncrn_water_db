import pyodbc
import pandas as pd
import numpy as np
import openpyxl
import nutrient_edd # project module in 'py_files\nutrient_edd.py'
from importlib import reload
reload(nutrient_edd)

# add 'py_files' to sys.path if not already present
if 'py_files' not in sys.path: # lets python search for 'nutrient_edd.py' in child directory 'py_files'
    sys.path.append('py_files') # https://stackoverflow.com/questions/24868733/how-to-access-a-module-from-outside-your-file-folder-in-python
    print('`py_files` appended to sys.path')
else:
    print('`py_files` already in sys.path')

# execute ncrn queries
conn = pyodbc.connect(r'Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=C:\Users\cwainright\OneDrive - DOI\Documents\data_projects\2023\20230214_iss138_iss139_ncrn_npstoret_water\data\NCRN_Water_Field_Data_BE_Ver_20230203_1514.accdb;')
results_ncrn_anc = pd.read_sql_query("EXEC qry_edd_results_tbl_ANC", conn)
results_ncrn_stream = pd.read_sql_query("EXEC qry_edd_results_tbl_Stream_Condition", conn)
results_ncrn_water = pd.read_sql_query("EXEC qry_edd_results_tbl_Core_Water_Data", conn)
actvities_ncrn = pd.read_sql_query("EXEC qry_edd_activities", conn)
locations_ncrn = pd.read_sql_query("EXEC qry_edd_locations", conn)
conn.close()

# execute npstoret queries
conn = pyodbc.connect(r'Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=C:\Users\cwainright\OneDrive - DOI\Documents\data_projects\2023\20230214_iss138_iss139_ncrn_npstoret_water\data\NCRN_NPSTORET_BE_20230213.mdb;')
results_npstoret = pd.read_sql_query("EXEC qry_edd_npstoret_results", conn)
actvities_npstoret = pd.read_sql_query("EXEC qry_edd_npstoret_activities", conn)
locations_npstoret = pd.read_sql_query("EXEC qry_edd_npstoret_locations", con = conn)
conn.close()

# execute npstoret units query
conn = pyodbc.connect(r'Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=C:\Users\cwainright\OneDrive - DOI\Documents\data_projects\2023\20230214_iss138_iss139_ncrn_npstoret_water\data\NPSTORET_defTab.accdb;')
npstoret_units = pd.read_sql_query("SELECT tblDef_TSRUOM.TSRUOM_IS_NUMBER, tblDef_TSRUOM.SHORT_FORM_NAME FROM tblDef_TSRUOM;", conn)
conn.close()

# join npstoret_units to results_npstoret
results_npstoret = pd.merge(results_npstoret, npstoret_units, left_on='Result_Unit', right_on='TSRUOM_IS_NUMBER', how="left")
results_npstoret.Result_Unit = results_npstoret.TSRUOM_IS_NUMBER
results_npstoret = results_npstoret.drop(labels="TSRUOM_IS_NUMBER", axis=1)

# execute nutrients
template = 'data/edd_template.xlsx'
nutrients = 'data/NCRN_Water_New_Nutrient_Data.xlsx' # https://doimspp.sharepoint.com/:f:/r/sites/NCRNWater/Shared%20Documents/General/Annual-Data-Packages/2022?csf=1&web=1&e=37uxYh
mynutrients = nutrient_edd.Edd(template_filepath = template, source_filepath = nutrients)

# append results
results = pd.DataFrame().append(results_ncrn_anc).append(results_ncrn_stream).append(results_ncrn_water).append(results_npstoret)
activities = pd.DataFrame().append(actvities_ncrn).append(actvities_npstoret)
locations = pd.DataFrame().append(locations_ncrn).append(locations_npstoret)

# write excel file
with pd.ExcelWriter('C:/Users/cwainright/OneDrive - DOI/Desktop/water_edd.xlsx') as writer:
    results.to_excel(writer, sheet_name='Results', index=False)
    activities.to_excel(writer, sheet_name='Activities', index=False)
    locations.to_excel(writer, sheet_name='Locations', index=False)

