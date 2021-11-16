DV_UP_Conversions
Characterization_Factors
BC_O_Energy

%Determines the volume and number of regenration steps required for NS_IX
%over the life of the resin (7 years).

%load('bed_volumes_1000.mat')

load('ClO4_Influent_6.mat')
n=10000;

for k=1:n
        
deltaClO4=ClO4_Influent_6-6; %6 is 6ug of perchlorate as treatment target
meq_delta_ClO4=deltaClO4/1000/99.45; %1000 ug to mg and 99.45 mg in meq of perchlorate
meq_delta_total_7years=meq_delta_ClO4*Flow_Rate_Facility*365.25*7; %365.25 days in a year and treatment of 7 years

TR=1000; %meq/L of the resin available for perchlorate uptake

total_volume_resin=meq_delta_total_7years/TR;
density_resin=1; %assume density of resin is 1g/mL
total_kg_resin=total_volume_resin*density_resin;

total_kg_resin_m3_DW=total_kg_resin/(7*365.5*(Flow_Rate_Facility/1000));

end

% NS_IX_EBCT=15; %empty bed contact time of 15 minutes.
% NS_IX_EBCT_hr=15/60; %empty bed contact time in hours
% NS_IX_EBCT_day=15/60/24; %empty bed contact time in day
% NS_IX_Volume=Flow_Rate_Facility_Min*NS_IX_EBCT; %Volume treatment requirement
% %for 15 minutes of flow.
% Resin_Volume=NS_IX_Volume; %Volume of resin in liters required to keep an EBCT of 15 minutes.
% Resin_Redundancy_Factor=1;
% Total_Resin_Volume=NS_IX_Volume*Resin_Redundancy_Factor;
% meq_Resin=Total_Resin_Volume*TR;





% kg_Total_Resin_7year=Total_Resin_Volume; %assumes resin has a density of 1g/mL
% kg_Total_Resin_m3_water=kg_Total_Resin_7year/(3785*365.25*7);
% 
% volume_bed_volume=Treatment_Capacity_Facility*NS_IX_EBCT_day; %volume of bed volumes treated per day
% bed_volume_water_day=24/NS_IX_EBCT_hr; %number of bed volumes in a day
% bed_volume_water_7year=bed_volume_water_day*365.25*7; %Total water treated over a 7 years period
% 
% regeneration_cycles=bed_volume_water_7year./bed_volumes_1000; %number of regeneration cycles for ion exchange.
% 
% regeneration_volume_factor=2.5; %bed volumes required to regenerate resin
% bed_volume_NaCl=regeneration_cycles*regeneration_volume_factor;
% volume_regeneration=bed_volume_NaCl*volume_bed_volume; %volume of brine solution
% brine_conc=.006; %assume 6% NaCl - 6g/L or 0.006kg/L
% kg_NaCl_7year=volume_regeneration*brine_conc; %total kg of NaCl for 7 years of treatment
% kg_NaCl_m3_water=kg_NaCl_7year/(3785*365.25*7);
% 
% IP_NS_IX_sodium_chloride=kg_NaCl_m3_water'*CF_sodium_chloride';
% IP_NS_IX_resin=kg_Total_Resin_m3_water'*CF_anion_resin';

%Energy Consumption and Cleaning based on biocatalysts

kWhr_B_Operation_m3_DW=(EBOT)/L_m3; %conversion is for L to m3 of DW

BC_C_Tank_Number_Sizing

%Amount of sodium hypochlorite for cleaning tanks
%Tanks are assumed to be cleaned twice a year

V_BC_O_Cleaning=SA_BC_C_Tank.*t_NaClO_BOT*conc_NaClO; %volume(m3) of NaClO cleaning solution per tank
V_BC_O_Cleaning_Total=cleaning_year.*V_BC_O_Cleaning*(Number_Tanks_BC+extra_tank); %total volume (m3) of NaClO cleaning solution for all tanks

