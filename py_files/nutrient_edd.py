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
        template_results = pd.read_excel(template_filepath, sheet_name = 'Results')
        template_locations = pd.read_excel(template_filepath, sheet_name = 'Locations')
        template_activities = pd.read_excel(template_filepath, sheet_name = 'Activities')
        nutrients = pd.read_excel(source_filepath)
        
        # procedure
        try:
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
        pass
        
        
    def _get_locations(self):
        '''Parse `source` nutrients xlsx into EDD locations.'''
        
        # protected method, not intended to be called directly
        pass
    
    def _get_activites(self):
        '''Parse `source` nutrients xlsx into EDD activite.'''
        
        # protected method, not intended to be called directly
        pass
    
    
