SELECT 
  'NCRN' AS Org_Code, 
  foo.ANC_Data_ID AS Activity_ID, 
  'Perennial stream water monitoring' AS Characteristic_Name, 
  foo.Variable AS Method_Speciation, 
  '' AS Filtered_Fraction, 
  '' AS Result_Detection_Condition, 
  foo.Val AS Result_Text, 
  foo.unit AS Result_Unit, 
  '' AS Result_Qualifier, 
  'Final' AS Result_Status, 
  'Actual' AS Result_Type, 
  '' AS Result_Comment, 
  '' AS Method_Detection_Limit, 
  '' AS Lower_Quantification_Limit, 
  '' AS Upper_Quantification_Limit, 
  '' AS Limit_Comment, 
  '' AS Temperature_Basis, 
  '' AS Statistical_Basis, 
  '' AS Time_Basis, 
  '' AS Weight_Basis, 
  '' AS Particle_Size_Basis, 
  '' AS [Precision], 
  '' AS Bias, 
  '' AS Confidence_Interval, 
  '' AS Upper_Confidence_Limit, 
  '' AS Result_Sampling_Point_Name, 
  '' AS Result_Depth_Height_Measure, 
  '' AS Result_Depth_Height_Measure_Unit, 
  '' AS Result_Depth_Altitude_Reference_Point, 
  '' AS Analytical_Method_ID, 
  '' AS Analytical_Remark, 
  '' AS Lab_ID, 
  '' AS Lab_Remark_Code, 
  '' AS Analysis_Start_Time_Zone, 
  '' AS Lab_Accreditation_Indicator, 
  '' AS Lab_Accreditation_Authority_Name, 
  '' AS Lab_Batch_ID, 
  '' AS Lab_Sample_Preparation_ID, 
  '' AS Lab_Sample_Preparation_Start_Date, 
  '' AS Lab_Sample_Preparation_Start_Time, 
  '' AS Lab_Sample_Preparation_Start_Time_Zone, 
  '' AS Dilution_Factor, 
  '' AS Num_of_Replicates, 
  '' AS Data_Logger_Line_Name, 
  '' AS Biological_Intent, 
  '' AS Biological_Individual_ID, 
  '' AS Subject_Taxon, 
  '' AS Unidentified_Species_ID, 
  '' AS Tissue_Anatomy, 
  '' AS Group_Summary_Count_or_Weight, 
  '' AS Group_Summary_Count_or_Weight_Unit, 
  '' AS Cell_Form, 
  '' AS Cell_Shape, 
  '' AS Habit_Name_1, 
  '' AS Habit_Name_2, 
  '' AS Habit_Name_3, 
  '' AS Voltinism, 
  '' AS Pollution_Tolerance, 
  '' AS Pollution_Tolerance_Scale, 
  '' AS Trophic_Level, 
  '' AS Functional_Feeding_Group_1, 
  '' AS Functional_Feeding_Group_2, 
  '' AS Functional_Feeding_Group_3, 
  '' AS Resource_ID, 
  '' AS Resource_Date, 
  '' AS Resource_Title_Name, 
  '' AS Resource_Creator_Name, 
  '' AS Resource_Publisher_Name, 
  '' AS Resource_Publication_Year, 
  '' AS Resource_Volume_Pages, 
  '' AS Resource_Subject_Text, 
  '' AS Frequency_Class_Descriptor_1, 
  '' AS Frequency_Class_Bounds_Unit_1, 
  '' AS Frequency_Class_Lower_Bound_1, 
  '' AS Frequency_Class_Upper_Bound_1, 
  '' AS Frequency_Class_Descriptor_2, 
  '' AS Frequency_Class_Bounds_Unit_2, 
  '' AS Frequency_Class_Lower_Bound_2, 
  '' AS Frequency_Class_Upper_Bound_2, 
  '' AS Frequency_Class_Descriptor_3, 
  '' AS Frequency_Class_Bounds_Unit_3, 
  '' AS Frequency_Class_Lower_Bound_3, 
  '' AS Frequency_Class_Upper_Bound_3, 
  '' AS Taxonomist_Accreditation_Indicator, 
  '' AS Taxonomist_Accreditation_Authority_Name, 
  '' AS Result_File_Name 
FROM 
  tbl_ANC 
  LEFT JOIN (
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Digits_Phenol_01' AS Variable, 
      tbl_ANC.Digits_Phenol_01 AS val, 
      'n' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Digits_Phenol_04' AS Variable, 
      tbl_ANC.Digits_Phenol_04 AS val, 
      'n' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Digits_Phenol_10' AS Variable, 
      tbl_ANC.Digits_Phenol_10 AS val, 
      'n' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Digits_Bromcresol_01' AS Variable, 
      tbl_ANC.Digits_Bromcresol_01 AS val, 
      'n' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Digits_Bromcresol_04' AS Variable, 
      tbl_ANC.Digits_Bromcresol_04 AS val, 
      'n' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Digits_Bromcresol_10' AS Variable, 
      tbl_ANC.Digits_Bromcresol_10 AS val, 
      'n' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Phenol_Alkalinity' AS Variable, 
      tbl_ANC.Phenol_Alkalinity AS val, 
      'mg/L' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Total_Alkalinity_01' AS Variable, 
      tbl_ANC.Total_Alkalinity_01 AS val, 
      'mg/L' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Hydroxide_Alkalinity_01' AS Variable, 
      tbl_ANC.Hydroxide_Alkalinity_01 AS val, 
      'mg/L' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Carbonate_Alkalinity_01' AS Variable, 
      tbl_ANC.Carbonate_Alkalinity_01 AS val, 
      'mg/L' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Bicarbonate_Alkalinity_01' AS Variable, 
      tbl_ANC.Bicarbonate_Alkalinity_01 AS val, 
      'mg/L' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Microequivalents_Alkalinity_01' AS Variable, 
      tbl_ANC.Microequivalents_Alkalinity_01 AS val, 
      'ueq/kg' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Phenol_Alkalinity_04' AS Variable, 
      tbl_ANC.Phenol_Alkalinity_04 AS val, 
      'mg/L' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Total_Alkalinity_04' AS Variable, 
      tbl_ANC.Total_Alkalinity_04 AS val, 
      'mg/L' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Hydroxide_Alkalinity_04' AS Variable, 
      tbl_ANC.Hydroxide_Alkalinity_04 AS val, 
      'mg/L' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Carbonate_Alkalinity_04' AS Variable, 
      tbl_ANC.Carbonate_Alkalinity_04 AS val, 
      'mg/L' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Bicarbonate_Alkalinity_04' AS Variable, 
      tbl_ANC.Bicarbonate_Alkalinity_04 AS val, 
      'mg/L' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Microequivalents_Alkalinity_04' AS Variable, 
      tbl_ANC.Microequivalents_Alkalinity_04 AS val, 
      'ueq/kg' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Phenol_Alkalinity_10' AS Variable, 
      tbl_ANC.Phenol_Alkalinity_10 AS val, 
      'mg/L' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Total_Alkalinity_10' AS Variable, 
      tbl_ANC.Total_Alkalinity_10 AS val, 
      'mg/L' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Hydroxide_Alkalinity_10' AS Variable, 
      tbl_ANC.Hydroxide_Alkalinity_10 AS val, 
      'mg/L' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Carbonate_Alkalinity_10' AS Variable, 
      tbl_ANC.Carbonate_Alkalinity_10 AS val, 
      'mg/L' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Bicarbonate_Alkalinity_10' AS Variable, 
      tbl_ANC.Bicarbonate_Alkalinity_10 AS val, 
      'mg/L' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Microequivalents_Alkalinity_10' AS Variable, 
      tbl_ANC.Microequivalents_Alkalinity_10 AS val, 
      'ueq/kg' AS unit 
    FROM 
      tbl_ANC 
    UNION ALL 
    SELECT 
      tbl_ANC.ANC_Data_ID, 
      tbl_ANC.Event_ID, 
      'Export_ANC' AS Variable, 
      tbl_ANC.Export_ANC AS val, 
      'n' AS unit 
    FROM 
      tbl_ANC
  ) AS foo ON tbl_ANC.ANC_Data_ID = foo.ANC_Data_ID;
