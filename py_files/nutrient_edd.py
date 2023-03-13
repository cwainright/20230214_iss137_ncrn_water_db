# Turn the water nutrients spreadsheet into edd, append to 

# "C:\Users\cwainright\OneDrive - DOI\Documents - NPS-NCRN-Water\General\Annual-Data-Packages\2022\NCRN_Water_New_Nutrient_Data.xlsx"
# https://doimspp.sharepoint.com/:x:/r/sites/NCRNWater/Shared%20Documents/General/Annual-Data-Packages/2022/NCRN_Water_New_Nutrient_Data.xlsx?d=w506cbbe8dfc84a639c0da2135a0e9b8f&csf=1&web=1&e=y0NW77
# https://doimspp.sharepoint.com/:f:/r/sites/NCRNWater/Shared%20Documents/General/Annual-Data-Packages/2022?csf=1&web=1&e=37uxYh


import pandas as pd
import numpy as np
import openpyxl
import sys
import os

class bcolors:
    '''A class to hold colors used in messages.'''
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

class Edd():
    '''Electronic data deliverable (EDD) object'''
    
    def __init__(self, template_filepath:str, source_filepath:str):
        '''Class constructor. Models an empty EDD object given a template EDD to copy.'''
        
        # @param template_filepath
            # required
            # a filepath to a template xlsx containing the column names and column order of an edd
            # example edd spreadsheet must contain three sheets with these names:
                # 1) Results
                # 2) Locations
                # 3) Activities
        # @param source_filepath
            # required
            # a filepath to the spreadsheet you want to parse to edd
        
        # @examples
            # mynutrients = nutrient_edd.Edd(example_filepath = 'data/example_edd.xlsx', source_filepath = 'data/my_nutrient_data.xlsx')
            
        # validate user input
        assert template_filepath != "", bcolors.FAIL + "`template_filepath` cannot be blank"
        assert template_filepath.lower().endswith(".xlsx"), bcolors.FAIL + "`template_filepath` must end with '.xlsx'"
        assert source_filepath != "", bcolors.FAIL + "`source_filepath` cannot be blank"
        assert source_filepath.lower().endswith(".xlsx"), bcolors.FAIL + "`source_filepath` must end with '.xlsx'"
        
        # static assets
        
        
        # procedure
        try:
            self.template_results = pd.read_excel(template_filepath, sheet_name = 'Results')
            self.template_locations = pd.read_excel(template_filepath, sheet_name = 'Locations')
            self.template_activities = pd.read_excel(template_filepath, sheet_name = 'Activities')
            self.nutrients = pd.read_excel(source_filepath)
            self.loc_lookup = pd.read_excel('data/locations_lookup.xlsx')
            self.edd_results = self._get_results()
            self.edd_locations = self._get_locations()
            self.edd_activities = self._get_activities()
            print(bcolors.OKGREEN + 'EDD object created!')
        except NameError as e:
            print(e)
            print(bcolors.FAIL + 'Please check your parameters for accuracy and try again.')
        except TypeError as t:
            print(t)
            print(bcolors.FAIL + 'Please check your parameters for accuracy and try again.')
            
    def _get_results(self):
        '''Parse `source` nutrients xlsx into EDD results.'''
        
        # protected method, not intended to be called directly
        
        # process data into flat form where one row is one 'result'
        df = self.nutrients.copy()
        df["dummy"] = df["Source File"] + ';' + df["Sample ID"] + ';' + df["Sample Date"].astype(str) + ';' + df["Parameter"]
        df = df.drop_duplicates('dummy') # duplicate `dummy` values are true duplicate records; same exact values for all fields
        df["Comments"] = df["Comments"].astype(str) + df["Comment Description"].astype(str)
        df["Location_ID"] = df["Sample ID"].replace('_DUP', '', regex = True)
        df = pd.merge(df, self.loc_lookup, how = 'left', on = 'Location_ID') # left-join
        
        # fill processed data into template
        edd = pd.DataFrame(columns = self.template_results.columns, index = range(df.shape[0])) # empty df to receive data
        edd["#Org_Code"] = 'NCRN'
        edd["Activity_ID"] = df["dummy"]
        edd["Characteristic_Name"] = 'Perennial stream water monitoring'
        edd["Method_Speciation"] = df["Parameter"]
        edd["Result_Text"] = df["Result"]
        edd["Result_Unit"] = df["Unit"]
        edd["Result_Status"] = 'Final'
        edd["Result_Type"] = 'Actual'
        edd["Result_Comment"] = df["Comments"]
        edd["Result_Sampling_Point_Name"] = df["Location_Name"]
        edd["Analysis_Start_Date"] = df["Analysis Date"].dt.strftime('%Y-%m-%d')
        edd["Analysis_Start_Time_Zone"] = 'Eastern Time - Washington, DC'

        edd = edd.fillna('')
        
        return edd
        
    def _get_locations(self):
        '''Parse `source` nutrients xlsx into EDD locations.'''
        
        # protected method, not intended to be called directly
        
        # process data into flat form where one row is one 'location'
        df = self.nutrients.copy()
        df["Location_ID"] = df["Sample ID"].replace('_DUP', '', regex = True) # get rid of the _DUP suffix so we can match on location ID
        df["park_code"] = df["Location_ID"].str[5:9]
        df = df.drop_duplicates('Location_ID')
        df = pd.merge(df, self.loc_lookup, how = 'left', on = 'Location_ID') # left-join
        
        # fill processed data into template
        edd = pd.DataFrame(columns = self.template_locations.columns)
        edd["#Org_Code"] = df["Location_ID"].str[:4]
        edd["Park_Code"] = df["park_code"]
        edd["Location_ID"] = df["Location_ID"]
        edd["Location_Name"] = df["Location_Name"]
        edd["Location_Type"] = df["Location_Type"]
        edd["Latitude"] = df["Latitude"]
        edd["Longitude"] = df["Longitude"]
        edd["Lat_Lon_Method"] = 'GPS-Unspecified'
        edd["Lat_Lon_Datum"] = df["Lat_Lon_Datum"]
        edd["Location_Description"] = df["Location_Description"]
        edd["Travel_Directions"] = df["Travel_Directions"]
        edd["HUC8_Code"] = df["HUC8_Code"]
        edd["HUC12_Code"] = df["HUC12_Code"]
        edd["Alternate_Location_ID"] = df["Alternate_Location_ID"]
        edd["Alternate_Location_ID_Context"] = df["Alternate_Location_ID_Context"]
        edd["Elevation"] = df["Elevation"]
        edd["Elevation_Unit"] = df["Elevation_Unit"]
        edd["Elevation_Method"] = df["Elevation_Method"]
        edd["Elevation_Datum"] = df["Elevation_Datum"]
        edd["Elevation_Accuracy"] = df["Elevation_Accuracy"]
        edd["Elevation_Accuracy_Unit"] = df["Elevation_Accuracy_Unit"]
        edd["Country_Code"] = df["Country_Code"]
        edd["State_Code"] = df["State_Code"]
        edd["County_Name"] = df["County_Name"]
        edd["Drainage_Area"] = df["Drainage_Area"]
        edd["Drainage_Area_Unit"] = df["Drainage_Area_Unit"]
        edd["Contributing_Area"] = df["Contributing_Area"]
        edd["Contributing_Area_Unit"] = df["Contributing_Area_Unit"]
        edd["Tribal_Land_Indicator"] = df["Tribal_Land_Indicator"]
        edd["Tribal_Land_Name"] = df["Tribal_Land_Name"]
        edd["Well_ID"] = df["Well_ID"]
        edd["Well_Type"] = df["Well_Type"]
        edd["Aquifer_Name"] = df["Aquifer_Name"]
        edd["Formation_Type"] = df["Formation_Type"]
        edd["Well_Hole_Depth"] = df["Well_Hole_Depth"]
        edd["Well_Hole_Depth_Unit"] = df["Well_Hole_Depth_Unit"]
        edd["Well_Status"] = df["Well_Status"]
        
        return edd

    def _get_activities(self):
        '''Parse `source` nutrients xlsx into EDD activite.'''
        
        # protected method, not intended to be called directly
        
        # process data into flat form where one row is one 'activity'
        df = self.nutrients.copy()
        df["Location_ID"] = df["Sample ID"].replace('_DUP', '', regex = True) # get rid of the _DUP suffix so we can match on location ID
        df["dummy"] = df["Source File"] + ';' + df["Sample ID"] + ';' + df["Sample Date"].astype(str)
        df = df.drop_duplicates('dummy')
        df = pd.merge(df, self.loc_lookup, how = 'left', on = 'Location_ID') # left-join
        
        # fill processed data into template
        edd = pd.DataFrame(columns = self.template_activities.columns)
        edd["#Org_Code"] = df["Location_ID"][:4]
        edd["Project_ID"] = 'Perennial stream water monitoring'
        edd["Location_ID"] = df["Location_ID"]
        edd["Activity_ID"] = df["dummy"]
        edd["Activity_Type"] = 'Field Msr/Obs'
        edd["Medium"] = 'Water'
        edd["Activity_Start_Date"] = df["Sample Date"]
        edd["Activity_Start_Time_Zone"] = 'Eastern Time - Washington, DC'
        edd["Additional_Location_Info"] = df["Location_Name"]
        edd["Custody_ID"] = 'Analyst id: ' + df["Analyst"]
        edd["Preparation_Method_ID"] = df["Method"]
        edd["Activity_Group_Name"] = df["Location_ID"]
        
        edd = edd.fillna('')
        
        return edd
    
    
