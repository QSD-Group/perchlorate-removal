DV_UP_Conversions
Characterization_Factors
BC_O_Energy

%Determines the volume and number of regenration steps required for NS_IX
%over the life of the resin (7 years).

load('bed_volumes_15ppb.mat')

bed_volumes_15ppb_lhsempir=lhs_empir(bed_volumes_15ppb,10000);

NS_IX_EBCT=15; %empty bed contact time of 15 minutes.
NS_IX_EBCT_hr=15/60; %empty bed contact time in hours
NS_IX_EBCT_day=15/60/24; %empty bed contact time in day
NS_IX_Volume=Flow_Rate_Facility_Min*NS_IX_EBCT; %Volume treatment requirement
%for 15 minutes of flow.
Resin_Volume=NS_IX_Volume; %Volume of resin required to keep an EBCT of 15 minutes.
Resin_Redundancy_Factor=2;
Total_Resin_Volume=NS_IX_Volume*Resin_Redundancy_Factor;
kg_Total_Resin_7year=Total_Resin_Volume; %assumes resin has a density of 1g/mL

load('kg_Total_Resin_m3_water.mat');
%kg_Total_Resin_m3_water=lhsu((0.9*(kg_Total_Resin_7year/(3785*365.25*7))),(1.1*(kg_Total_Resin_7year/(3785*365.25*7))),10000);

volume_bed_volume=Treatment_Capacity_Facility*NS_IX_EBCT_day; %volume of bed volumes treated per day
bed_volume_water_day=24/NS_IX_EBCT_hr; %number of bed volumes in a day
bed_volume_water_7year=bed_volume_water_day*365.25*7; %Total water treated over a 7 years period

regeneration_cycles=bed_volume_water_7year./bed_volumes_15ppb_lhsempir; %number of regeneration cycles for ion exchange.

regeneration_volume_factor=2.5; %bed volumes required to regenerate resin
bed_volume_NaCl=regeneration_cycles*regeneration_volume_factor;
volume_regeneration=bed_volume_NaCl*volume_bed_volume; %volume of brine solution
brine_conc=0.06; %assume 6% NaCl - 6g/L or 0.06kg/L
kg_NaCl_7year=volume_regeneration*brine_conc; %total kg of NaCl for 7 years of treatment
kg_NaCl_m3_water=kg_NaCl_7year/(3785*365.25*7);




% IP_NS_IX_sodium_chloride=kg_NaCl_m3_water'*CF_sodium_chloride';
% IP_NS_IX_resin=kg_Total_Resin_m3_water'*CF_anion_resin';
% 
% kWhr_B_Operation_m3_DW=(EBOT_NoAeration)/L_m3; %conversion is for L to m3 of DW
% IP_NS_IX_O_electricity=kWhr_B_Operation_m3_DW*CF_electricity_average_US';

kWhr_B_Operation_m3_DW=(EBOT)/L_m3; %conversion is for L to m3 of DW

BC_C_Tank_Number_Sizing

%Amount of sodium hypochlorite for cleaning tanks
%Tanks are assumed to be cleaned twice a year

V_BC_O_Cleaning=SA_BC_C_Tank.*t_NaClO_BOT*conc_NaClO; %volume(m3) of NaClO cleaning solution per tank
V_BC_O_Cleaning_Total=cleaning_year.*V_BC_O_Cleaning*(Number_Tanks_BC+extra_tank); %total volume (m3) of NaClO cleaning solution for all tanks