# Turn the water nutrients spreadsheet into edd, append to 

# "C:\Users\cwainright\OneDrive - DOI\Documents - NPS-NCRN-Water\General\Annual-Data-Packages\2022\NCRN_Water_New_Nutrient_Data.xlsx"
# https://doimspp.sharepoint.com/:x:/r/sites/NCRNWater/Shared%20Documents/General/Annual-Data-Packages/2022/NCRN_Water_New_Nutrient_Data.xlsx?d=w506cbbe8dfc84a639c0da2135a0e9b8f&csf=1&web=1&e=y0NW77
# https://doimspp.sharepoint.com/:f:/r/sites/NCRNWater/Shared%20Documents/General/Annual-Data-Packages/2022?csf=1&web=1&e=37uxYh


import pandas as pd
import numpy as np
import openpyxl

eg_results = pd.read_excel('data/edd_example.xlsx', sheet_name = 'Results')
eg_locations = pd.read_excel('data/edd_example.xlsx', sheet_name = 'Locations')
eg_activities = pd.read_excel('data/edd_example.xlsx', sheet_name = 'Activities')
