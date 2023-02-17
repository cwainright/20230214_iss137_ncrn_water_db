SELECT 
  TOP 50 "NCRN" AS Org_Code, 
  foo.Core_Data_ID AS Activity_ID, 
  "Perennial stream water monitoring" AS Characteristic_Name, 
  foo.Variable AS Method_Speciation, 
  "" AS Filtered_Fraction, 
  "" AS Result_Detection_Condition, 
  foo.Val AS Result_Text, 
  foo.unit AS Result_Unit, 
  "" AS Result_Qualifier, 
  "Final" AS Result_Status, 
  "Actual" AS Result_Type, 
  "" AS Result_Comment, 
  "" AS Method_Detection_Limit, 
  "" AS Lower_Quantification_Limit, 
  "" AS Upper_Quantification_Limit, 
  "" AS Limit_Comment, 
  "" AS Temperature_Basis, 
  "" AS Statistical_Basis, 
  "" AS Time_Basis, 
  "" AS Weight_Basis, 
  "" AS Particle_Size_Basis, 
  "" AS [Precision], 
  "" AS Bias, 
  "" AS Confidence_Interval, 
  "" AS Upper_Confidence_Limit, 
  "" AS Result_Sampling_Point_Name, 
  "" AS Result_Depth_Height_Measure, 
  "" AS Result_Depth_Height_Measure_Unit, 
  "" AS Result_Depth_Altitude_Reference_Point, 
  "" AS Analytical_Method_ID, 
  "" AS Analytical_Remark, 
  "" AS Lab_ID, 
  "" AS Lab_Remark_Code, 
  "Eastern Time - Washington, DC" AS Analysis_Start_Time_Zone, 
  "" AS Lab_Accreditation_Indicator, 
  "" AS Lab_Accreditation_Authority_Name, 
  "" AS Lab_Batch_ID, 
  "" AS Lab_Sample_Preparation_ID, 
  "" AS Lab_Sample_Preparation_Start_Date, 
  "" AS Lab_Sample_Preparation_Start_Time, 
  "" AS Lab_Sample_Preparation_Start_Time_Zone, 
  "" AS Dilution_Factor, 
  "" AS Num_of_Replicates, 
  "" AS Data_Logger_Line_Name, 
  "" AS Biological_Intent, 
  "" AS Biological_Individual_ID, 
  "" AS Subject_Taxon, 
  "" AS Unidentified_Species_ID, 
  "" AS Tissue_Anatomy, 
  "" AS Group_Summary_Count_or_Weight, 
  "" AS Group_Summary_Count_or_Weight_Unit, 
  "" AS Cell_Form, 
  "" AS Cell_Shape, 
  "" AS Habit_Name_1, 
  "" AS Habit_Name_2, 
  "" AS Habit_Name_3, 
  "" AS Voltinism, 
  "" AS Pollution_Tolerance, 
  "" AS Pollution_Tolerance_Scale, 
  "" AS Trophic_Level, 
  "" AS Functional_Feeding_Group_1, 
  "" AS Functional_Feeding_Group_2, 
  "" AS Functional_Feeding_Group_3, 
  "" AS Resource_ID, 
  "" AS Resource_Date, 
  "" AS Resource_Title_Name, 
  "" AS Resource_Creator_Name, 
  "" AS Resource_Publisher_Name, 
  "" AS Resource_Publication_Year, 
  "" AS Resource_Volume_Pages, 
  "" AS Resource_Subject_Text, 
  "" AS Frequency_Class_Descriptor_1, 
  "" AS Frequency_Class_Bounds_Unit_1, 
  "" AS Frequency_Class_Lower_Bound_1, 
  "" AS Frequency_Class_Upper_Bound_1, 
  "" AS Frequency_Class_Descriptor_2, 
  "" AS Frequency_Class_Bounds_Unit_2, 
  "" AS Frequency_Class_Lower_Bound_2, 
  "" AS Frequency_Class_Upper_Bound_2, 
  "" AS Frequency_Class_Descriptor_3, 
  "" AS Frequency_Class_Bounds_Unit_3, 
  "" AS Frequency_Class_Lower_Bound_3, 
  "" AS Frequency_Class_Upper_Bound_3, 
  "" AS Taxonomist_Accreditation_Indicator, 
  "" AS Taxonomist_Accreditation_Authority_Name, 
  "" AS Result_File_Name 
FROM 
  tbl_Core_Water_Data 
  LEFT JOIN (
    SELECT 
      tbl_Core_Water_Data.Core_Data_ID, 
      tbl_Core_Water_Data.Event_ID, 
      "pH" AS Variable, 
      tbl_Core_Water_Data.pH AS val, 
      "pH" AS unit 
    FROM 
      tbl_Core_Water_Data 
    UNION ALL 
    SELECT 
      tbl_Core_Water_Data.Core_Data_ID, 
      tbl_Core_Water_Data.Event_ID, 
      "Percent_DO" AS Variable, 
      tbl_Core_Water_Data.Percent_DO AS val, 
      "percent" AS unit 
    FROM 
      tbl_Core_Water_Data 
    UNION ALL 
    SELECT 
      tbl_Core_Water_Data.Core_Data_ID, 
      tbl_Core_Water_Data.Event_ID, 
      "DO" AS Variable, 
      tbl_Core_Water_Data.DO AS val, 
      "mg/L" AS unit 
    FROM 
      tbl_Core_Water_Data 
    UNION ALL 
    SELECT 
      tbl_Core_Water_Data.Core_Data_ID, 
      tbl_Core_Water_Data.Event_ID, 
      "Salinity" AS Variable, 
      tbl_Core_Water_Data.Salinity AS val, 
      "ppt" AS unit 
    FROM 
      tbl_Core_Water_Data 
    UNION ALL 
    SELECT 
      tbl_Core_Water_Data.Core_Data_ID, 
      tbl_Core_Water_Data.Event_ID, 
      "Water_Temp" AS Variable, 
      tbl_Core_Water_Data.Water_Temp AS val, 
      "celsius" AS unit 
    FROM 
      tbl_Core_Water_Data 
    UNION ALL 
    SELECT 
      tbl_Core_Water_Data.Core_Data_ID, 
      tbl_Core_Water_Data.Event_ID, 
      "Spec_Conductance" AS Variable, 
      tbl_Core_Water_Data.Spec_Conductance AS val, 
      "uS/cm: microsiemens per centimeter" AS unit 
    FROM 
      tbl_Core_Water_Data 
    UNION ALL 
    SELECT 
      tbl_Core_Water_Data.Core_Data_ID, 
      tbl_Core_Water_Data.Event_ID, 
      "Spec_Conductance" AS Variable, 
      tbl_Core_Water_Data.Spec_Conductance AS val, 
      "uS/cm: microsiemens per centimeter" AS unit 
    FROM 
      tbl_Core_Water_Data 
    UNION ALL 
    SELECT 
      tbl_Core_Water_Data.Core_Data_ID, 
      tbl_Core_Water_Data.Event_ID, 
      "Conductivity" AS Variable, 
      tbl_Core_Water_Data.Conductivity AS val, 
      "uohms/cm: microohms per centimeter" AS unit 
    FROM 
      tbl_Core_Water_Data 
    UNION ALL 
    SELECT 
      tbl_Core_Water_Data.Core_Data_ID, 
      tbl_Core_Water_Data.Event_ID, 
      "TDS" AS Variable, 
      tbl_Core_Water_Data.TDS AS val, 
      "mg/L" AS unit 
    FROM 
      tbl_Core_Water_Data 
    UNION ALL 
    SELECT 
      tbl_Core_Water_Data.Core_Data_ID, 
      tbl_Core_Water_Data.Event_ID, 
      "Barometric pressure" AS Variable, 
      tbl_Core_Water_Data.Air_Pressure AS val, 
      "mm Hg" AS unit 
    FROM 
      tbl_Core_Water_Data 
    UNION ALL 
    SELECT 
      tbl_Core_Water_Data.Core_Data_ID, 
      tbl_Core_Water_Data.Event_ID, 
      "Distance increment where measurements are taken from right bank" AS Variable, 
      tbl_Core_Water_Data.Samp_Comp_Order AS val, 
      "meter" AS unit 
    FROM 
      tbl_Core_Water_Data 
    UNION ALL 
    SELECT 
      tbl_Core_Water_Data.Core_Data_ID, 
      tbl_Core_Water_Data.Event_ID, 
      "Description of sequential increment from right bank" AS Variable, 
      tbl_Core_Water_Data.Samp_Increment AS val, 
      "Sample order" AS unit 
    FROM 
      tbl_Core_Water_Data
  ) AS foo ON tbl_Core_Water_Data.Core_Data_ID = foo.Core_Data_ID;
