import pyodbc
import pandas as pd
import numpy as np
import openpyxl

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
results_npstoret = results_npstoret.astype({"Result_Unit": str}) # type cast to str for joining
actvities_npstoret = pd.read_sql_query("EXEC qry_edd_npstoret_activities", conn)
locations_npstoret = pd.read_sql_query("EXEC qry_edd_npstoret_locations", con = conn)
conn.close()

# execute npstoret units query
conn = pyodbc.connect(r'Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=C:\Users\cwainright\OneDrive - DOI\Documents\data_projects\2023\20230214_iss138_iss139_ncrn_npstoret_water\data\NPSTORET_defTab.accdb;')
npstoret_units = pd.read_sql_query("SELECT tblDef_TSRUOM.TSRUOM_IS_NUMBER, tblDef_TSRUOM.SHORT_FORM_NAME FROM tblDef_TSRUOM;", conn)
npstoret_units = npstoret_units.astype({"TSRUOM_IS_NUMBER": str})
conn.close()

# join npstoret_units to results_npstoret
results_npstoret2 = results_npstoret.merge(npstoret_units, on=['TSRUOM_IS_NUMBER', 'Result_Unit'], how='left')


# append results
results = pd.DataFrame().append(results_ncrn_anc).append(results_ncrn_stream).append(results_ncrn_water).append(results_npstoret)
activities = pd.DataFrame().append(actvities_ncrn).append(actvities_npstoret)
locations = pd.DataFrame().append(locations_ncrn).append(locations_npstoret)

# write excel file
with pd.ExcelWriter('data/test_edd.xlsx') as writer:
    results.to_excel(writer, sheet_name='Results', index=False)
    activities.to_excel(writer, sheet_name='Activities', index=False)
    locations.to_excel(writer, sheet_name='Locations', index=False)

