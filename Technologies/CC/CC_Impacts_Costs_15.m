%% MASTER FUNCTION FOR CATALYST CF AND COSTS

%% INITIATE THE START OF INPUTS FOR THE MASTER WORKSHEET
DV_UP_Conversions
Costs
Characterization_Factors
CC_O_Catalyst_15
CC_O_Cleaning
CC_O_ElectronDonor_15
CC_P_Energy_L_Total
CC_O_Energy
CC_C_Tank_Number_Sizing


%% TOTAL AMOUNTS TO DETERMINE CF AND COSTS

%% CATALYST PRODUCTION
%Catalyst Production Media Required
CC_Media_Required_L_DW_m3=CC_Media_Required_L_DW/L_m3/21915; 
%amount of catalyst production volume (L) to treat m3 of DW
%21915 is the life factor for the catalysts - 5 years.  2 hour cycles means
%12 hours of use a day. 

%Amounts of ingredients (kg) for Catalyst Production to treat 1m3 of DW
kg_C_palladium_AC_m3_DW=CC_P_palladium_AC*CC_Media_Required_L_DW_m3; 
kg_C_water_m3_DW=CC_P_water*CC_Media_Required_L_DW_m3;
kg_C_hydrochloric_acid_m3_DW=CC_P_hydrochloric_acid*CC_Media_Required_L_DW_m3;
kg_C_ammonium_perrhenate_m3_DW=CC_P_ammonium_perrhenate*CC_Media_Required_L_DW_m3;

%Total electricity (kWhr) for Catalyst Production for 1m3 of DW
kWhr_C_Production_m3_DW=CC_Media_Required_L_DW_m3.*E_CP_Total; %Electricity to produce catalyst to treat 1m3 of drinking water

%% TRANSPORTATION OF MATERIALS FOR PRODUCTION
%Total Transportation for Production of Catalyst for 1m3 of DW
%Uses the amounts determined above and calculates a total weight for the
%ingridents of the Catalysts media. used later to calculate cost and cf
%for transportation - excludes water. Assumes palladium carbon catalysts
%was produced and shipped to plant

kg_C_P_total=kg_C_palladium_AC_m3_DW+kg_C_hydrochloric_acid_m3_DW...
    +kg_C_ammonium_perrhenate_m3_DW;

%% CATALYST OPERATION
%Total Electron Donor (H2) to Reduce Perchlorate
kg_C_ElectronDonor_m3_DW=Total_ElectronDonor_CO*mmole_mole*gfm_H2*g_kg/L_m3; 
%total electron donor to treat oxygen, perchlorate and nitrate

%Total Hydrochloric acid (kg) for catalyst treatment operations for 1m3
kg_C_O_hydrochloric_acid_m3_DW=CC_O_hydrochloric_acid/L_m3; 
%total hydrochloric acid (kg) to reduce pH to achieve acceptable activity

%Total Electricity (kWhr) for Catalyst Treatment Operations for 1m3
kWhr_C_Operation_m3_DW=ECOT/L_m3; 
%total electricity to operate for treatment of 1m3

%Total Cleanign Solution (kg) for Catalyst Treatment Operation for 1m3 of DW
kg_C_Cleaning_m3_DW=V_CC_O_Cleaning_Total*rho_NaClO/Total_Volume_m3_1year; 
%Total NaClo per m3 (normalized over a year with 2 cleaning cycles)

%% TRANSPORTATION OF MATERIALS FOR OPERATION

kg_C_O_total=kg_C_ElectronDonor_m3_DW+kg_C_O_hydrochloric_acid_m3_DW...
    +kg_C_Cleaning_m3_DW;

%% CATALYST CONSTRUCTION

%Total Concrete (m3) for facility tretament of m3 (concrete impacts distributed over 30 years of treatment)
m3_C_Concrete_m3_DW=V_CC_Concrete_Total_AllTanks/Total_Volume_m3_Facility_Age;

%Total Reinforcing Steel (kg) for Facility Treatment of m3 (impacts distributed over 30 years of treatment)
kg_C_Reinf_Steel_m3_DW=(V_CC_Concrete_Total_AllTanks*Reinforce_Steel_m3_Concrete)/Total_Volume_m3_Facility_Age;

%% COSTS
%Calculates the cost of catalytic treatment of water based on 1m3 of water

%% COSTS TOTAL PRODUCTION FOR CATALYSTS PER M3 OF DW

cost_C_palladium_AC_m3_DW=kg_C_palladium_AC_m3_DW.*price_palladium_AC;
cost_C_water_m3_DW=kg_C_water_m3_DW.*price_water;
cost_C_hydrochloric_acid_m3_DW=kg_C_hydrochloric_acid_m3_DW.*price_hydrochloric_acid;
cost_C_ammonium_perrhenate_m3_DW=kg_C_ammonium_perrhenate_m3_DW.*price_ammonium_perrhenate;

% NOTE - CHECK FOR INCLUSION OF HYDROGEN FOR PRODUCTION IMPACTS AND COST
% FOR THE RHENIUM CATALYSTS

%Electricity cost for catalyst production
cost_CP_electricity_m3_DW=kWhr_C_Production_m3_DW.*price_electricity;
% NOTE I MAY BE COSTING THE ELECTRICITY DOUBLE FOR THE PALLADIUM AC!!

cost_CP_Transportation_m3_DW=((kg_C_P_total/1000).*Transportation_Distance_Production).*(price_transportation);%divide cost by 1000 as it is in tons km.


%% TOTAL PRODUCTION COST FOR CATALYST PER M3 OF DW

cost_CP_total_m3_DW=cost_C_palladium_AC_m3_DW+cost_C_water_m3_DW...
    +cost_C_hydrochloric_acid_m3_DW+cost_C_ammonium_perrhenate_m3_DW+cost_CP_Transportation_m3_DW;

%% COSTS TOTAL OPERATION COST FOR CATALYSTS PER M3 OF DW

cost_CO_hydrogen_m3_DW=kg_C_ElectronDonor_m3_DW.*price_hydrogen;
cost_CO_hydrochloric_acid_m3_DW=kg_C_O_hydrochloric_acid_m3_DW.*price_hydrochloric_acid;
cost_CO_electricity_m3_DW=kWhr_C_Operation_m3_DW.*price_electricity;
cost_CO_NaClO=kg_C_Cleaning_m3_DW.*price_NaClO;
cost_CO_Transportation_m3_DW=((kg_C_O_total/1000).*Transportation_Distance_Operation).*price_transportation;

%% TOTAL OPERATION COST

cost_CO_total_m3_DW=cost_CO_hydrogen_m3_DW+cost_CO_hydrochloric_acid_m3_DW...
    +cost_CO_electricity_m3_DW+cost_CO_NaClO+cost_CO_Transportation_m3_DW;

%% TOTAL COSTS
cost_C_Total=cost_CO_total_m3_DW+cost_CP_total_m3_DW;

%% CHARACTERIZATION FACTORS - CATALYSTS
% CHARACTERIZATION FACTORS TOTALS%
%Impacts of Treatment for 1m3 of DW for individual components

%% IMPACT CATEGORIES CATALYST PRODUCTION
L_palladium_AC=(kg_C_palladium_AC_m3_DW./(Yield_C_PdAC));
CF_CC_palladium_AC=L_palladium_AC*CF_palladium_carbon_L; 
%CF account for all ingredients going into producing Pd/AC

CF_CC_water=kg_C_water_m3_DW*CF_water';
CF_CC_hydrochloric_acid=kg_C_hydrochloric_acid_m3_DW*CF_hydrochloric_acid';
CF_CC_ammonium_perrhenate=kg_C_ammonium_perrhenate_m3_DW*CF_ammonium_perrhenate'; 
%CF accounts for ratio of rhenium in molybenum

CF_CC_P_electricity=kWhr_C_Production_m3_DW*CF_electricity_average_US';

CF_CC_P_transportation=((kg_C_P_total/1000).*Transportation_Distance_Production)*CF_truck_eff4_32t';
%impacts for transportation based on long ton (divide by 1000) and distance
%% IMPACT CATEGOREIS CATALYST OPERATION

CF_CC_O_electron_donor=kg_C_ElectronDonor_m3_DW*CF_hydrogen_gas';

CF_CC_O_electricity=kWhr_C_Operation_m3_DW*CF_electricity_average_US';

CF_CC_O_cleaning=kg_C_Cleaning_m3_DW*CF_NaClO';

CF_CC_O_hydrochloric_acid=kg_C_O_hydrochloric_acid_m3_DW*CF_hydrochloric_acid';

CF_CC_O_transportation=((kg_C_O_total/1000).*Transportation_Distance_Operation)*CF_truck_eff4_32t';
%impacts for transportation based on long ton (divide by 1000) and distance
%% IMPACT CATEGORIES CATALYST CONSTRUCTION

CF_CC_C_Concrete=m3_C_Concrete_m3_DW*CF_concrete_m3'; 
%note concrete impacts are determined from m3.

CF_CC_C_Reinforcing_Steel=kg_C_Reinf_Steel_m3_DW*CF_reinforcing_steel';

%% TOTAL IMPACT CATEGORIES

% %Production%
% CF_C_P_Ozone_Matrix=[CF_CC_palladium_AC(1,1) CF_CC_water(1,1) CF_CC_hydrochloric_acid(1,1) CF_CC_ammonium_perrhenate(1,1) CF_CC_P_electricity(1,1)];
% CF_C_P_GW_Matrix=[CF_CC_palladium_AC(2,1) CF_CC_water(2,1) CF_CC_hydrochloric_acid(2,1) CF_CC_ammonium_perrhenate(2,1) CF_CC_P_electricity(2,1)];
% CF_C_P_Smog_Matrix=[CF_CC_palladium_AC(3,1) CF_CC_water(3,1) CF_CC_hydrochloric_acid(3,1) CF_CC_ammonium_perrhenate(3,1) CF_CC_P_electricity(3,1)];
% CF_C_P_Acidification_Matrix=[CF_CC_palladium_AC(4,1) CF_CC_water(4,1) CF_CC_hydrochloric_acid(4,1) CF_CC_ammonium_perrhenate(4,1) CF_CC_P_electricity(4,1)];
% CF_C_P_Eutrophication_Matrix=[CF_CC_palladium_AC(5,1) CF_CC_water(5,1) CF_CC_hydrochloric_acid(5,1) CF_CC_ammonium_perrhenate(5,1) CF_CC_P_electricity(5,1)];
% CF_C_P_Carcinogens_Matrix=[CF_CC_palladium_AC(6,1) CF_CC_water(6,1) CF_CC_hydrochloric_acid(6,1) CF_CC_ammonium_perrhenate(6,1) CF_CC_P_electricity(6,1)];
% CF_C_P_Non_Carcinogens_Matrix=[CF_CC_palladium_AC(7,1) CF_CC_water(7,1) CF_CC_hydrochloric_acid(7,1) CF_CC_ammonium_perrhenate(7,1) CF_CC_P_electricity(7,1)];
% CF_C_P_Respiratory_Matrix=[CF_CC_palladium_AC(8,1) CF_CC_water(8,1) CF_CC_hydrochloric_acid(8,1) CF_CC_ammonium_perrhenate(8,1) CF_CC_P_electricity(8,1)];
% CF_C_P_Ecotoxicity_Matrix=[CF_CC_palladium_AC(9,1) CF_CC_water(9,1) CF_CC_hydrochloric_acid(9,1) CF_CC_ammonium_perrhenate(9,1) CF_CC_P_electricity(9,1)];
% CF_C_P_Fossil_Fuel_Matrix=[CF_CC_palladium_AC(10,1) CF_CC_water(10,1) CF_CC_hydrochloric_acid(10,1) CF_CC_ammonium_perrhenate(10,1) CF_CC_P_electricity(10,1)];
% 
CF_C_P_Total=CF_CC_palladium_AC+CF_CC_water+CF_CC_hydrochloric_acid...
    +CF_CC_ammonium_perrhenate+CF_CC_P_electricity+CF_CC_P_transportation;
% CF_C_P_Ozone=CF_CC_palladium_AC(1,1)+CF_CC_water(1,1)+CF_CC_hydrochloric_acid(1,1)+CF_CC_ammonium_perrhenate(1,1)+CF_CC_P_electricity(1,1);
% CF_C_P_GW=CF_CC_palladium_AC(2,1)+CF_CC_water(2,1)+CF_CC_hydrochloric_acid(2,1)+CF_CC_ammonium_perrhenate(2,1)+CF_CC_P_electricity(2,1);
% CF_C_P_Smog=CF_CC_palladium_AC(3,1)+CF_CC_water(3,1)+CF_CC_hydrochloric_acid(3,1)+CF_CC_ammonium_perrhenate(3,1)+CF_CC_P_electricity(3,1);
% CF_C_P_Acidification=CF_CC_palladium_AC(4,1)+CF_CC_water(4,1)+CF_CC_hydrochloric_acid(4,1)+CF_CC_ammonium_perrhenate(4,1)+CF_CC_P_electricity(4,1);
% CF_C_P_Eutrophication=CF_CC_palladium_AC(5,1)+CF_CC_water(5,1)+CF_CC_hydrochloric_acid(5,1)+CF_CC_ammonium_perrhenate(5,1)+CF_CC_P_electricity(5,1);
% CF_C_P_Carcinogens=CF_CC_palladium_AC(6,1)+CF_CC_water(6,1)+CF_CC_hydrochloric_acid(6,1)+CF_CC_ammonium_perrhenate(6,1)+CF_CC_P_electricity(6,1);
% CF_C_P_Non_Carcinogens=CF_CC_palladium_AC(7,1)+CF_CC_water(7,1)+CF_CC_hydrochloric_acid(7,1)+CF_CC_ammonium_perrhenate(7,1)+CF_CC_P_electricity(7,1);
% CF_C_P_Respiratory=CF_CC_palladium_AC(8,1)+CF_CC_water(8,1)+CF_CC_hydrochloric_acid(8,1)+CF_CC_ammonium_perrhenate(8,1)+CF_CC_P_electricity(8,1);
% CF_C_P_Ecotoxicity=CF_CC_palladium_AC(9,1)+CF_CC_water(9,1)+CF_CC_hydrochloric_acid(9,1)+CF_CC_ammonium_perrhenate(9,1)+CF_CC_P_electricity(9,1);
% CF_C_P_Fossil_Fuel=CF_CC_palladium_AC(10,1)+CF_CC_water(10,1)+CF_CC_hydrochloric_acid(10,1)+CF_CC_ammonium_perrhenate(10,1)+CF_CC_P_electricity(10,1);
% 
% %Operation%
% CF_C_O_Ozone_Matrix=[CF_CC_O_electron_donor(1,1) CF_CC_O_electricity(1,1) CF_CC_O_cleaning(1,1) CF_CC_O_hydrochloric_acid(1,1) 0];
% CF_C_O_GW_Matrix=[CF_CC_O_electron_donor(2,1) CF_CC_O_electricity(2,1) CF_CC_O_cleaning(2,1) CF_CC_O_hydrochloric_acid(2,1) 0];
% CF_C_O_Smog_Matrix=[CF_CC_O_electron_donor(3,1) CF_CC_O_electricity(3,1) CF_CC_O_cleaning(3,1) CF_CC_O_hydrochloric_acid(3,1) 0];
% CF_C_O_Acidification_Matrix=[CF_CC_O_electron_donor(4,1) CF_CC_O_electricity(4,1) CF_CC_O_cleaning(4,1) CF_CC_O_hydrochloric_acid(4,1) 0];
% CF_C_O_Eutrophication_Matrix=[CF_CC_O_electron_donor(5,1) CF_CC_O_electricity(5,1) CF_CC_O_cleaning(5,1) CF_CC_O_hydrochloric_acid(5,1) 0];
% CF_C_O_Carcinogens_Matrix=[CF_CC_O_electron_donor(6,1) CF_CC_O_electricity(6,1) CF_CC_O_cleaning(6,1) CF_CC_O_hydrochloric_acid(6,1) 0];
% CF_C_O_Non_Carcinogens_Matrix=[CF_CC_O_electron_donor(7,1) CF_CC_O_electricity(7,1) CF_CC_O_cleaning(7,1) CF_CC_O_hydrochloric_acid(7,1) 0];
% CF_C_O_Respiratory_Matrix=[CF_CC_O_electron_donor(8,1) CF_CC_O_electricity(8,1) CF_CC_O_cleaning(8,1) CF_CC_O_hydrochloric_acid(8,1) 0];
% CF_C_O_Ecotoxicity_Matrix=[CF_CC_O_electron_donor(9,1) CF_CC_O_electricity(9,1) CF_CC_O_cleaning(9,1) CF_CC_O_hydrochloric_acid(9,1) 0];
% CF_C_O_Fossil_Fuel_Matrix=[CF_CC_O_electron_donor(10,1) CF_CC_O_electricity(10,1) CF_CC_O_cleaning(10,1) CF_CC_O_hydrochloric_acid(10,1) 0];
% 
CF_C_O_Total=CF_CC_O_electron_donor+CF_CC_O_electricity+CF_CC_O_cleaning...
    +CF_CC_O_hydrochloric_acid+CF_CC_O_transportation;
% CF_C_O_Ozone=CF_CC_O_electron_donor(1,1)+CF_CC_O_electricity(1,1)+CF_CC_O_cleaning(1,1)+CF_CC_O_hydrochloric_acid(1,1);
% CF_C_O_GW=CF_CC_O_electron_donor(2,1)+CF_CC_O_electricity(2,1)+CF_CC_O_cleaning(2,1)+CF_CC_O_hydrochloric_acid(2,1);
% CF_C_O_Smog=CF_CC_O_electron_donor(3,1)+CF_CC_O_electricity(3,1)+CF_CC_O_cleaning(3,1)+CF_CC_O_hydrochloric_acid(3,1);
% CF_C_O_Acidification=CF_CC_O_electron_donor(4,1)+CF_CC_O_electricity(4,1)+CF_CC_O_cleaning(4,1)+CF_CC_O_hydrochloric_acid(4,1);
% CF_C_O_Eutrophication=CF_CC_O_electron_donor(5,1)+CF_CC_O_electricity(5,1)+CF_CC_O_cleaning(5,1)+CF_CC_O_hydrochloric_acid(5,1);
% CF_C_O_Carcinogens=CF_CC_O_electron_donor(6,1)+CF_CC_O_electricity(6,1)+CF_CC_O_cleaning(6,1)+CF_CC_O_hydrochloric_acid(6,1);
% CF_C_O_Non_Carcinogens=CF_CC_O_electron_donor(7,1)+CF_CC_O_electricity(7,1)+CF_CC_O_cleaning(7,1)+CF_CC_O_hydrochloric_acid(7,1);
% CF_C_O_Respiratory=CF_CC_O_electron_donor(8,1)+CF_CC_O_electricity(8,1)+CF_CC_O_cleaning(8,1)+CF_CC_O_hydrochloric_acid(8,1);
% CF_C_O_Ecotoxicity=CF_CC_O_electron_donor(9,1)+CF_CC_O_electricity(9,1)+CF_CC_O_cleaning(9,1)+CF_CC_O_hydrochloric_acid(9,1);
% CF_C_O_Fossil_Fuel=CF_CC_O_electron_donor(10,1)+CF_CC_O_electricity(10,1)+CF_CC_O_cleaning(10,1)+CF_CC_O_hydrochloric_acid(10,1);
% 
% %Construction%
CF_C_C_Total=CF_CC_C_Concrete+CF_CC_C_Reinforcing_Steel;
% CF_C_C_Ozone=CF_CC_C_Concrete(1,1)+CF_CC_C_Reinforcing_Steel(1,1);
% CF_C_C_GW=CF_CC_C_Concrete(2,1)+CF_CC_C_Reinforcing_Steel(2,1);
% CF_C_C_Smog=CF_CC_C_Concrete(3,1)+CF_CC_C_Reinforcing_Steel(3,1);
% CF_C_C_Acidification=CF_CC_C_Concrete(4,1)+CF_CC_C_Reinforcing_Steel(4,1);
% CF_C_C_Eutrophication=CF_CC_C_Concrete(5,1)+CF_CC_C_Reinforcing_Steel(5,1);
% CF_C_C_Carcinogens=CF_CC_C_Concrete(6,1)+CF_CC_C_Reinforcing_Steel(6,1);
% CF_C_C_Non_Carcinogens=CF_CC_C_Concrete(7,1)+CF_CC_C_Reinforcing_Steel(7,1);
% CF_C_C_Respiratory=CF_CC_C_Concrete(8,1)+CF_CC_C_Reinforcing_Steel(8,1);
% CF_C_C_Ecotoxicity=CF_CC_C_Concrete(9,1)+CF_CC_C_Reinforcing_Steel(9,1);
% CF_C_C_Fossil_Fuel=CF_CC_C_Concrete(10,1)+CF_CC_C_Reinforcing_Steel(10,1);
% 
% CF_C_C_Ozone_Matrix=[CF_CC_C_Concrete(1,1) CF_CC_C_Reinforcing_Steel(1,1) 0 0 0];
% CF_C_C_GW_Matrix=[CF_CC_C_Concrete(2,1) CF_CC_C_Reinforcing_Steel(2,1) 0 0 0];
% CF_C_C_Smog_Matrix=[CF_CC_C_Concrete(3,1) CF_CC_C_Reinforcing_Steel(3,1) 0 0 0];
% CF_C_C_Acidification_Matrix=[CF_CC_C_Concrete(4,1) CF_CC_C_Reinforcing_Steel(4,1) 0 0 0];
% CF_C_C_Eutrophication_Matrix=[CF_CC_C_Concrete(5,1) CF_CC_C_Reinforcing_Steel(5,1) 0 0 0];
% CF_C_C_Carcinogens_Matrix=[CF_CC_C_Concrete(6,1) CF_CC_C_Reinforcing_Steel(6,1) 0 0 0];
% CF_C_C_Non_Carcinogens_Matrix=[CF_CC_C_Concrete(7,1) CF_CC_C_Reinforcing_Steel(7,1) 0 0 0];
% CF_C_C_Respiratory_Matrix=[CF_CC_C_Concrete(8,1) CF_CC_C_Reinforcing_Steel(8,1) 0 0 0];
% CF_C_C_Ecotoxicity_Matrix=[CF_CC_C_Concrete(9,1) CF_CC_C_Reinforcing_Steel(9,1) 0 0 0];
% CF_C_C_Fossil_Fuel_Matrix=[CF_CC_C_Concrete(10,1) CF_CC_C_Reinforcing_Steel(10,1) 0 0 0];

CF_C_Total=CF_C_P_Total+CF_C_O_Total+CF_C_C_Total; 
%Total impacts from production, operation and construction
% 
%% EXCEL FILE OUTPUT
CatalystsTotals='CatalystsTotals_15.xlsx';
xlswrite(CatalystsTotals,cost_C_Total,'cost');
xlswrite(CatalystsTotals,CF_C_Total,'CF');

CatalystsCostsProduction='CatalystsCostsProduction_15.xlsx';

xlswrite(CatalystsCostsProduction,cost_CP_total_m3_DW,'Production Total');
xlswrite(CatalystsCostsProduction,cost_C_palladium_AC_m3_DW,'PalladiumAC');
xlswrite(CatalystsCostsProduction,cost_C_water_m3_DW,'Production Water');
xlswrite(CatalystsCostsProduction,cost_C_hydrochloric_acid_m3_DW,'P HCl');
xlswrite(CatalystsCostsProduction,cost_C_ammonium_perrhenate_m3_DW,'Perrhenate');
xlswrite(CatalystsCostsProduction,cost_CP_electricity_m3_DW,'P Electricity');
xlswrite(CatalystsCostsProduction,cost_CP_Transportation_m3_DW,'P Transportation')

CatalystsCostsOperation='CatalystsCostsOperation_15.xlsx';
xlswrite(CatalystsCostsOperation,cost_CO_total_m3_DW,'Operation Total');
xlswrite(CatalystsCostsOperation,cost_CO_hydrogen_m3_DW,'Hydrogen');
xlswrite(CatalystsCostsOperation,cost_CO_hydrochloric_acid_m3_DW,'O HCl');
xlswrite(CatalystsCostsOperation,cost_CO_electricity_m3_DW,'O Electricity');
xlswrite(CatalystsCostsOperation,cost_CO_NaClO,'NaClO');
xlswrite(CatalystsCostsOperation,cost_CO_Transportation_m3_DW,'O Transportation');

CatalystsCFProduction='CatalystsCFProduction_15.xlsx';
xlswrite(CatalystsCFProduction,CF_C_P_Total,'Production Total');
xlswrite(CatalystsCFProduction,CF_CC_palladium_AC,'PalladiumAC');
xlswrite(CatalystsCFProduction,CF_CC_water,'Water');
xlswrite(CatalystsCFProduction,CF_CC_hydrochloric_acid,'P HCl');
xlswrite(CatalystsCFProduction,CF_CC_ammonium_perrhenate,'Perrhenate');
xlswrite(CatalystsCFProduction,CF_CC_P_electricity,'P Electricity');
xlswrite(CatalystsCFProduction,CF_CC_P_transportation,'P Transportation');

CatalystsCFOperation='CatalystsCFOperation_15.xlsx';
xlswrite(CatalystsCFOperation,CF_C_O_Total,'Operation Total');
xlswrite(CatalystsCFOperation,CF_CC_O_electron_donor,'Hydrogen');
xlswrite(CatalystsCFOperation,CF_CC_O_cleaning,'NaClO');
xlswrite(CatalystsCFOperation,CF_CC_O_hydrochloric_acid,'O HCl');
xlswrite(CatalystsCFOperation,CF_CC_O_electricity,'O Electricity');
xlswrite(CatalystsCFOperation,CF_CC_O_transportation,'O Transportation');

CatalystsCFConstruction='CatalystsCFConstruction_15.xlsx';
xlswrite(CatalystsCFConstruction,CF_C_C_Total,1);
xlswrite(CatalystsCFConstruction,CF_CC_C_Concrete,2);
xlswrite(CatalystsCFConstruction,CF_CC_C_Reinforcing_Steel,3);

%% FIGURE OUTPUT FROM MATLAB

% figure
% bar([CF_C_O_Ozone_Matrix; CF_C_P_Ozone_Matrix; CF_C_C_Ozone_Matrix], 'stacked')
% title('Ozone')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Ozone [kg CFC-11 eq]')
% legend('palladium_AC')
% 
% figure
% bar([CF_C_O_GW_Matrix; CF_C_P_GW_Matrix; CF_C_C_GW_Matrix], 'stacked')
% title('GW')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('CO2 [kg CO2 eq]')
% 
% figure
% bar([CF_C_O_Smog_Matrix; CF_C_P_Smog_Matrix; CF_C_C_Smog_Matrix], 'stacked')
% title('Smog')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Smog [kg O3 eq]')
% 
% figure
% bar([CF_C_O_Acidification_Matrix; CF_C_P_Acidification_Matrix; CF_C_C_Acidification_Matrix], 'stacked')
% title('Acidification')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Acidification [kg SO2 eq]')
% 
% figure
% bar([CF_C_O_Eutrophication_Matrix; CF_C_P_Eutrophication_Matrix; CF_C_C_Eutrophication_Matrix], 'stacked')
% title('Eutrophication')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Eutrophication [kg N eq]')
% 
% figure
% bar([CF_C_O_Carcinogens_Matrix; CF_C_P_Carcinogens_Matrix; CF_C_C_Carcinogens_Matrix], 'stacked')
% title('Carcinogens')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Carcinogens [CTUh]')
% 
% figure
% bar([CF_C_O_Non_Carcinogens_Matrix; CF_C_P_Non_Carcinogens_Matrix; CF_C_C_Non_Carcinogens_Matrix], 'stacked')
% title('Non Carcinogens')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Non Carcinogens [CTUh]')
% 
% figure
% bar([CF_C_O_Respiratory_Matrix; CF_C_P_Respiratory_Matrix; CF_C_C_Respiratory_Matrix], 'stacked')
% title('Respiratory')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Respiratory [kg PM2.5 eq]')
% 
% figure
% bar([CF_C_O_Ecotoxicity_Matrix; CF_C_P_Ecotoxicity_Matrix; CF_C_C_Ecotoxicity_Matrix], 'stacked')
% title('Ecotoxicity')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Ecotoxicity [CTUe]')
% 
% figure
% bar([CF_C_O_Fossil_Fuel_Matrix; CF_C_P_Fossil_Fuel_Matrix; CF_C_C_Fossil_Fuel_Matrix], 'stacked')
% title('Fossil Fuel')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Fossil Fuel [MJ Surplus]')
