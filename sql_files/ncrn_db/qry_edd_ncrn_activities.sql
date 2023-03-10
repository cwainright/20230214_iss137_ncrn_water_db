SELECT 
  "NCRN" AS Org_Code, 
  "Perennial stream water monitoring" AS Project_ID, 
  tbl_Locations.Loc_Code AS Location_ID, 
  tbl_Events.Event_ID AS Activity_ID, 
  "Field Msr/Obs" AS Activity_Type, 
  "Water" AS Medium, 
  "" AS Medium_Subdivision, 
  "" AS Assemblage_Sampled_Name, 
  tbl_Events.Start_Date AS Activity_Start_Date, 
  tbl_Events.Start_Time AS Activity_Start_Time, 
  "Eastern Time - Washington, DC" AS Activity_Start_Time_Zone, 
  "" AS Activity_End_Date, 
  "" AS Activity_End_Time, 
  "" AS Activity_End_Time_Zone, 
  "" AS Activity_Relative_Depth, 
  "" AS Activity_Depth, 
  "" AS Activity_Depth_Unit, 
  "" AS Activity_Upper_Depth, 
  "" AS Activity_Lower_Depth, 
  "" AS Activity_Depth_Reference, 
  tbl_Locations.Loc_Name AS Additional_Location_Info, 
  "" AS Activity_Sampler, 
  "" AS Activity_Recorder, 
  tbl_Locations.Loc_Code AS Custody_ID, 
  "NCRN" AS Activity_Conducting_Organization, 
  "" AS Station_Visit_Comment, 
  tbl_Events.Lab_Notes AS Activity_Comment, 
  "" AS Collection_Method_ID, 
  "" AS Collection_Equipment_Name, 
  "" AS Collection_Equipment_Description, 
  "" AS Gear_Deployment, 
  tbl_Water_Samples.Container AS Container_Type, 
  "" AS Container_Color, 
  tbl_Water_Samples.Amount AS Container_Size, 
  "ml" AS Container_Size_Unit, 
  "" AS Preparation_Method_ID, 
  "" AS Chemical_Preservative, 
  tbl_Water_Samples.Pres_Method AS Thermal_Preservative, 
  "" AS Transport_Storage_Description, 
  tbl_Events.Event_Group_ID AS Activity_Group_ID, 
  tbl_Locations.Loc_Code AS Activity_Group_Name, 
  "" AS Activity_Group_Type, 
  "" AS Collection_Duration, 
  "" AS Collection_Duration_Unit, 
  "" AS Sampling_Component_Name, 
  "" AS Sampling_Component_Place_In_Series, 
  "" AS Reach_Length, 
  "" AS Reach_Length_Unit, 
  "" AS Reach_Width, 
  "" AS Reach_Width_Unit, 
  "" AS Pass_Count, 
  "" AS Net_Type, 
  "" AS Net_Surface_Area, 
  "" AS Net_Surface_Area_Unit, 
  "" AS Net_Mesh_Size, 
  "" AS Net_Mesh_Size_Unit, 
  "" AS Boat_Speed, 
  "" AS Boat_Speed_Unit, 
  "" AS Current_Speed, 
  "" AS Current_Speed_Unit, 
  "" AS Toxicity_Test_Type, 
  "" AS Effort, 
  "" AS Effort_Unit 
FROM 
  tbl_Locations 
  LEFT JOIN (
    tbl_Events 
    LEFT JOIN tbl_Water_Samples ON tbl_Events.Event_ID = tbl_Water_Samples.Event_ID
  ) ON tbl_Locations.Location_ID = tbl_Events.Location_ID;
