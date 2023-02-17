SELECT 
  'NCRN' AS Org_Code, 
  foo.Stream_Cond_ID AS Activity_ID, 
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
  tbl_Stream_Condition 
  LEFT JOIN (
    SELECT 
      tbl_Stream_Condition.Stream_Cond_ID, 
      tbl_Stream_Condition.Event_ID, 
      'Algae_Cover' AS Variable, 
      tbl_Stream_Condition.Algae_Cover AS val, 
      'Percent algae cover on stream substrate' AS unit 
    FROM 
      tbl_Stream_Condition 
    UNION ALL 
    SELECT 
      tbl_Stream_Condition.Stream_Cond_ID, 
      tbl_Stream_Condition.Event_ID, 
      'Algae_Appearance' AS Variable, 
      tbl_Stream_Condition.Algae_Appearance AS val, 
      'Appearance of the algae' AS unit 
    FROM 
      tbl_Stream_Condition 
    UNION ALL 
    SELECT 
      tbl_Stream_Condition.Stream_Cond_ID, 
      tbl_Stream_Condition.Event_ID, 
      'Stream_Condition' AS Variable, 
      tbl_Stream_Condition.Stream_Condition AS val, 
      'Condition of stream and water clarity' AS unit 
    FROM 
      tbl_Stream_Condition 
    UNION ALL 
    SELECT 
      tbl_Stream_Condition.Stream_Cond_ID, 
      tbl_Stream_Condition.Event_ID, 
      'Wetted_Width' AS Variable, 
      tbl_Stream_Condition.Wetted_Width AS val, 
      'feet' AS unit 
    FROM 
      tbl_Stream_Condition 
    UNION ALL 
    SELECT 
      tbl_Stream_Condition.Stream_Cond_ID, 
      tbl_Stream_Condition.Event_ID, 
      'Discharge' AS Variable, 
      tbl_Stream_Condition.Discharge AS val, 
      'cubic feet per second' AS unit 
    FROM 
      tbl_Stream_Condition 
    UNION ALL 
    SELECT 
      tbl_Stream_Condition.Stream_Cond_ID, 
      tbl_Stream_Condition.Event_ID, 
      'Flow_Condition' AS Variable, 
      tbl_Stream_Condition.Flow_Condition AS val, 
      'qualitative estimation of creek stage relative to normal' AS unit 
    FROM 
      tbl_Stream_Condition 
    UNION ALL 
    SELECT 
      tbl_Stream_Condition.Stream_Cond_ID, 
      tbl_Stream_Condition.Event_ID, 
      'Depth' AS Variable, 
      tbl_Stream_Condition.Depth AS val, 
      'feet' AS unit 
    FROM 
      tbl_Stream_Condition 
    UNION ALL 
    SELECT 
      tbl_Stream_Condition.Stream_Cond_ID, 
      tbl_Stream_Condition.Event_ID, 
      'Velocity' AS Variable, 
      tbl_Stream_Condition.Flow AS val, 
      'feet per second' AS unit 
    FROM 
      tbl_Stream_Condition
  ) AS foo ON tbl_Stream_Condition.Stream_Cond_ID = foo.Stream_Cond_ID;
