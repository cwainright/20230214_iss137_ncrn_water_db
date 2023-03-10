SELECT 
  "NCRN" AS Org_Code, 
  tbl_Locations.Unit_Code AS Park_Code, 
  tbl_Locations.Loc_Code AS Location_ID, 
  tbl_Locations.Loc_Name AS Location_Name, 
  tbl_Locations.Loc_Type AS Location_Type, 
  tbl_Locations.Lat_DD AS Latitude, 
  tbl_Locations.Long_DD AS Longitude, 
  "GPS-Unspecified" AS Lat_Lon_Method, 
  tbl_Locations.Datum AS Lat_Lon_Datum, 
  "" AS Source_Map_Scale_Numeric, 
  "" AS Lat_Lon_Accuracy, 
  "" AS Lat_Lon_Accuracy_Unit, 
  tbl_Locations.Loc_Description AS Location_Description, 
  tbl_Locations.Travel_Directions, 
  "" AS Location_Purpose, 
  "" AS Establishment_Date, 
  tbl_Locations.HUC AS HUC8_Code, 
  "" AS HUC12_Code, 
  tbl_Locations.Location_ID AS Alternate_Location_ID, 
  "" AS Alternate_Location_ID_Context, 
  "" AS Elevation, 
  "" AS Elevation_Unit, 
  "" AS Elevation_Method, 
  "" AS Elevation_Datum, 
  "" AS Elevation_Accuracy, 
  "" AS Elevation_Accuracy_Unit, 
  "US" AS Country_Code, 
  tbl_Locations.State AS State_Code, 
  tbl_Locations.County AS County_Name, 
  "" AS Drainage_Area, 
  "" AS Drainage_Area_Unit, 
  "" AS Contributing_Area, 
  "" AS Contributing_Area_Unit, 
  "" AS Tribal_Land_Indicator, 
  "" AS Tribal_Land_Name, 
  "" AS Well_ID, 
  "" AS Well_Type, 
  "" AS Aquifer_Name, 
  "" AS Formation_Type, 
  "" AS Well_Hole_Depth, 
  "" AS [Well Hole_Depth_Unit], 
  "" AS Well_Status 
FROM 
  tbl_Locations;
