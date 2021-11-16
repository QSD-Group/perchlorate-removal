%% MASTER FUNCTION FOR WHOLE CELL CF AND COSTS

%% INITIATE THE START OF INPUTS FOR THE MASTER WORKSHEET
DV_UP_Conversions
Costs
Characterization_Factors
WC_O_Cleaning
WC_O_ElectronDonor_15
WC_O_Energy
WC_C_Tank_Number_Sizing

%% TOTAL AMOUNTS TO DETERMINE CF AND COSTS

%% WHOLE CELL OPERATION

%Total Acetate Required to Treat Oxygen, Nitrate and Perchlorate in 1m3 of DW
kg_WC_ElectronDonor_m3_DW=Total_ElectronDonor_WCO*mmole_mole*gfm_acetate*g_kg/L_m3; 
%total electron donor (kg) to treat 1m3 of DW

%Total Phosphoric Acid Required to Supplement Biological Growth - assumed
%at 1% molar ratio of acetic acid concentration

molar_WC_ElectronDonor_m3_DW=kg_WC_ElectronDonor_m3_DW/gfm_acetate;

kg_WC_phosphoric_acid_m3_DW=molar_WC_ElectronDonor_m3_DW*gfm_phosphoric_acid...
    *phosphoric_acid_ratio;

%Total Cleaning Solution (kg) for Whole Cell Biological Treatment Operation 
%for 1m3 DW distributed over a year of DW
kg_WC_Cleaning_m3_DW=V_WC_O_Cleaning_Total*rho_NaClO/Total_Volume_m3_1year; 
%Total NaClO per m3 (normalized over a year with distribution of cleaning cycles)

%Total Electricity (kWhr) for Whole Cell Biological Treatment Operation for 1m3 of DW
kWhr_WC_Operation_m3_DW=(EWCOT)/L_m3; %conversion is for L to m3 of DW

%% TRANSPORTATION OF MATERIALS FOR OPERATION

%Total Transportation for Operation of Whole Cell for 1m3 of DW
%Uses the amounts determined above and calculates a total weight for the
%operation. used later to calculate cost and cf
%for transportation.

kg_WC_O_total=kg_WC_ElectronDonor_m3_DW+kg_WC_phosphoric_acid_m3_DW...
    +kg_WC_Cleaning_m3_DW;

%% WHOLE CELL CONSTRUCTION

%Total Concrete (m3) for Facility Treatment of m3 (Concrete impacts distributed over 30 years of treatment).
m3_WC_Concrete_m3_DW=V_WCC_Concrete_Total_AllTanks/Total_Volume_m3_Facility_Age; %volume of concrete for m3 DW over the lifespan of treatment (total kg concrete/m3 total treated)

%Total Reinforcing Steel (kg) for Facility Treatment of m3 (impacts distributed over 30 years of treatment).
kg_WC_Reinf_Steel_m3_DW=(V_WCC_Concrete_Total_AllTanks*Reinforce_Steel_m3_Concrete)/Total_Volume_m3_Facility_Age; %kg of reinforcing steel based on the volume of concrete for m3 DW over the lifespan of treatment.

%% COSTS
% calculates the cost of whole cell treatment of perchlorate based on 1m3
% of water

cost_acetic_acid_WC_m3_DW=kg_WC_ElectronDonor_m3_DW.*price_acetic_acid;
cost_phosphoric_acid_WC_m3_DW=kg_WC_phosphoric_acid_m3_DW.*price_phosphoric_acid;
cost_NaClO_WC_m3_DW=kg_WC_Cleaning_m3_DW.*price_NaClO;
cost_electricity_WC_m3_DW=kWhr_WC_Operation_m3_DW.*price_electricity;
cost_transportation_WC_m3_DW=((kg_WC_O_total/1000).*Transportation_Distance_Operation).*(price_transportation);%divide cost by 1000 as it is in tons km.
%% TOTAL OPERATION COSTS

cost_WCO_total_m3_DW=cost_acetic_acid_WC_m3_DW+cost_phosphoric_acid_WC_m3_DW+cost_NaClO_WC_m3_DW...
    +cost_electricity_WC_m3_DW+cost_transportation_WC_m3_DW;


%% COSTS TOTAL

cost_WC_total=cost_WCO_total_m3_DW;
%% IMPACT CATEGORIES WHOLE CELL OPERATION

%CHARACTERIZATION FACTOR TOTALS%
CF_WC_O_electron_donor=kg_WC_ElectronDonor_m3_DW*CF_acetic_acid';

CF_WC_O_electricity=kWhr_WC_Operation_m3_DW*CF_electricity_average_US';

CF_WC_O_cleaning=kg_WC_Cleaning_m3_DW*CF_NaClO';

CF_WC_O_phosphoric_acid=kg_WC_phosphoric_acid_m3_DW*(CF_phosphoric_acid/0.85)';
%0.85 is to account for the purity of the substance

CF_WC_O_transportation=((kg_WC_O_total/1000).*Transportation_Distance_Operation)*CF_truck_eff4_32t';

%% IMPACT CATEGORIES FOR WHOLE CELL CONSTRUCTION

CF_WC_C_Concrete=m3_WC_Concrete_m3_DW*CF_concrete_m3'; %note concrete impacts are determined from m3.

CF_WC_C_Reinforcing_Steel=kg_WC_Reinf_Steel_m3_DW*CF_reinforcing_steel';

%% TOTAL IMPACT CATEGORIES

% %Operation%
% CF_WC_O_Ozone_Matrix=[CF_WC_O_electron_donor(1,1) CF_WC_O_electricity(1,1) CF_WC_O_cleaning(1,1)];
% CF_WC_O_GW_Matrix=[CF_WC_O_electron_donor(2,1) CF_WC_O_electricity(2,1) CF_WC_O_cleaning(2,1)];
% CF_WC_O_Smog_Matrix=[CF_WC_O_electron_donor(3,1) CF_WC_O_electricity(3,1) CF_WC_O_cleaning(3,1)];
% CF_WC_O_Acidification_Matrix=[CF_WC_O_electron_donor(4,1) CF_WC_O_electricity(4,1) CF_WC_O_cleaning(4,1)];
% CF_WC_O_Eutrophication_Matrix=[CF_WC_O_electron_donor(5,1) CF_WC_O_electricity(5,1) CF_WC_O_cleaning(5,1)];
% CF_WC_O_Carcinogens_Matrix=[CF_WC_O_electron_donor(6,1) CF_WC_O_electricity(6,1) CF_WC_O_cleaning(6,1)];
% CF_WC_O_Non_Carcinogens_Matrix=[CF_WC_O_electron_donor(7,1) CF_WC_O_electricity(7,1) CF_WC_O_cleaning(7,1)];
% CF_WC_O_Respiratory_Matrix=[CF_WC_O_electron_donor(8,1) CF_WC_O_electricity(8,1) CF_WC_O_cleaning(8,1)];
% CF_WC_O_Ecotoxicity_Matrix=[CF_WC_O_electron_donor(9,1) CF_WC_O_electricity(9,1) CF_WC_O_cleaning(9,1)];
% CF_WC_O_Fossil_Fuel_Matrix=[CF_WC_O_electron_donor(10,1) CF_WC_O_electricity(10,1) CF_WC_O_cleaning(10,1)];
% 
CF_WC_O_Total=CF_WC_O_electron_donor+CF_WC_O_electricity+CF_WC_O_cleaning...
    +CF_WC_O_phosphoric_acid+CF_WC_O_transportation;
% CF_WC_O_Ozone=CF_WC_O_electron_donor(1,1)+CF_WC_O_electricity(1,1)+CF_WC_O_cleaning(1,1);
% CF_WC_O_GW=CF_WC_O_electron_donor(2,1)+CF_WC_O_electricity(2,1)+CF_WC_O_cleaning(2,1);
% CF_WC_O_Smog=CF_WC_O_electron_donor(3,1)+CF_WC_O_electricity(3,1)+CF_WC_O_cleaning(3,1);
% CF_WC_O_Acidification=CF_WC_O_electron_donor(4,1)+CF_WC_O_electricity(4,1)+CF_WC_O_cleaning(4,1);
% CF_WC_O_Eutrophication=CF_WC_O_electron_donor(5,1)+CF_WC_O_electricity(5,1)+CF_WC_O_cleaning(5,1);
% CF_WC_O_Carcinogens=CF_WC_O_electron_donor(6,1)+CF_WC_O_electricity(6,1)+CF_WC_O_cleaning(6,1);
% CF_WC_O_Non_Carcinogens=CF_WC_O_electron_donor(7,1)+CF_WC_O_electricity(7,1)+CF_WC_O_cleaning(7,1);
% CF_WC_O_Respiratory=CF_WC_O_electron_donor(8,1)+CF_WC_O_electricity(8,1)+CF_WC_O_cleaning(8,1);
% CF_WC_O_Ecotoxicity=CF_WC_O_electron_donor(9,1)+CF_WC_O_electricity(9,1)+CF_WC_O_cleaning(9,1);
% CF_WC_O_Fossil_Fuel=CF_WC_O_electron_donor(10,1)+CF_WC_O_electricity(10,1)+CF_WC_O_cleaning(10,1);
% 
% %Construction%
% CF_WC_C_Ozone_Matrix=[CF_WC_C_Concrete(1,1) CF_WC_C_Reinforcing_Steel(1,1) 0];
% CF_WC_C_GW_Matrix=[CF_WC_C_Concrete(2,1) CF_WC_C_Reinforcing_Steel(2,1) 0];
% CF_WC_C_Smog_Matrix=[CF_WC_C_Concrete(3,1) CF_WC_C_Reinforcing_Steel(3,1) 0];
% CF_WC_C_Acidification_Matrix=[CF_WC_C_Concrete(4,1) CF_WC_C_Reinforcing_Steel(4,1) 0];
% CF_WC_C_Eutrophication_Matrix=[CF_WC_C_Concrete(5,1) CF_WC_C_Reinforcing_Steel(5,1) 0];
% CF_WC_C_Carcinogens_Matrix=[CF_WC_C_Concrete(6,1) CF_WC_C_Reinforcing_Steel(6,1) 0];
% CF_WC_C_Non_Carcinogens_Matrix=[CF_WC_C_Concrete(7,1) CF_WC_C_Reinforcing_Steel(7,1) 0];
% CF_WC_C_Respiratory_Matrix=[CF_WC_C_Concrete(8,1) CF_WC_C_Reinforcing_Steel(8,1) 0];
% CF_WC_C_Ecotoxicity_Matrix=[CF_WC_C_Concrete(9,1) CF_WC_C_Reinforcing_Steel(9,1) 0];
% CF_WC_C_Fossil_Fuel_Matrix=[CF_WC_C_Concrete(10,1) CF_WC_C_Reinforcing_Steel(10,1) 0];
% 
CF_WC_C_Total=CF_WC_C_Concrete+CF_WC_C_Reinforcing_Steel;
% CF_WC_C_Ozone=CF_WC_C_Concrete(1,1)+CF_WC_C_Reinforcing_Steel(1,1);
% CF_WC_C_GW=CF_WC_C_Concrete(2,1)+CF_WC_C_Reinforcing_Steel(2,1);
% CF_WC_C_Smog=CF_WC_C_Concrete(3,1)+CF_WC_C_Reinforcing_Steel(3,1);
% CF_WC_C_Acidification=CF_WC_C_Concrete(4,1)+CF_WC_C_Reinforcing_Steel(4,1);
% CF_WC_C_Eutrophication=CF_WC_C_Concrete(5,1)+CF_WC_C_Reinforcing_Steel(5,1);
% CF_WC_C_Carcinogens=CF_WC_C_Concrete(6,1)+CF_WC_C_Reinforcing_Steel(6,1);
% CF_WC_C_Non_Carcinogens=CF_WC_C_Concrete(7,1)+CF_WC_C_Reinforcing_Steel(7,1);
% CF_WC_C_Respiratory=CF_WC_C_Concrete(8,1)+CF_WC_C_Reinforcing_Steel(8,1);
% CF_WC_C_Ecotoxicity=CF_WC_C_Concrete(9,1)+CF_WC_C_Reinforcing_Steel(9,1);
% CF_WC_C_Fossil_Fuel=CF_WC_C_Concrete(10,1)+CF_WC_C_Reinforcing_Steel(10,1);
% 
CF_WC_Total=CF_WC_O_Total+CF_WC_C_Total; 
%Total Impacts for whole cell process per m3 DW

%% EXCEL FILE OUTPUT
WCTotals='WCTotals_15.xlsx';
xlswrite(WCTotals,cost_WC_total,'cost');
xlswrite(WCTotals,CF_WC_Total,'CF');

WCCostsOperation='WCCostsOperation_15.xlsx';
xlswrite(WCCostsOperation,cost_WCO_total_m3_DW,'Total');
xlswrite(WCCostsOperation,cost_acetic_acid_WC_m3_DW,'Acetic Acid');
xlswrite(WCCostsOperation,cost_phosphoric_acid_WC_m3_DW,'Phosphoric Acid');
xlswrite(WCCostsOperation,cost_NaClO_WC_m3_DW,'NaClO');
xlswrite(WCCostsOperation,cost_electricity_WC_m3_DW,'O Electricity');
xlswrite(WCCostsOperation,cost_transportation_WC_m3_DW,'O Transportation');

WCCFOperation='WCCFOperation_15.xlsx';
xlswrite(WCCFOperation,CF_WC_O_Total,'Total');
xlswrite(WCCFOperation,CF_WC_O_electron_donor,'Acetic Acid');
xlswrite(WCCFOperation,CF_WC_O_electricity,'O Electricity');
xlswrite(WCCFOperation,CF_WC_O_cleaning,'NaClO');
xlswrite(WCCFOperation,CF_WC_O_phosphoric_acid,'Phosphoric Acid');
xlswrite(WCCFOperation,CF_WC_O_transportation,'O Transporation');

WCCFConstruction='WCCFConstruction_15.xlsx';
xlswrite(WCCFConstruction,CF_WC_C_Total,1);
xlswrite(WCCFConstruction,CF_WC_C_Concrete,2);
xlswrite(WCCFConstruction,CF_WC_C_Reinforcing_Steel,3);

%% FIGURE OUTPUT FROM MATLAB

% figure
% bar([CF_WC_O_Ozone_Matrix; CF_WC_C_Ozone_Matrix], 'stacked')
% title('Ozone')
% set(gca,'XTickLabel',{'Operation', 'Construction'})
% ylabel('Ozone [kg CFC-11 eq]')
% 
% figure
% bar([CF_WC_O_GW_Matrix; CF_WC_C_GW_Matrix], 'stacked')
% title('GW')
% set(gca,'XTickLabel',{'Operation', 'Construction'})
% ylabel('CO2 [kg CO2 eq]')
% 
% figure
% bar([CF_WC_O_Smog_Matrix; CF_WC_C_Smog_Matrix], 'stacked')
% title('Smog')
% set(gca,'XTickLabel',{'Operation', 'Construction'})
% ylabel('Smog [kg O3 eq]')
% 
% figure
% bar([CF_WC_O_Acidification_Matrix; CF_WC_C_Acidification_Matrix], 'stacked')
% title('Acidification')
% set(gca,'XTickLabel',{'Operation', 'Construction'})
% ylabel('Acidification [kg SO2 eq]')
% 
% figure
% bar([CF_WC_O_Eutrophication_Matrix; CF_WC_C_Eutrophication_Matrix], 'stacked')
% title('Eutrophication')
% set(gca,'XTickLabel',{'Operation', 'Construction'})
% ylabel('Eutrophication [kg N eq]')
% 
% figure
% bar([CF_WC_O_Carcinogens_Matrix; CF_WC_C_Carcinogens_Matrix], 'stacked')
% title('Carcinogens')
% set(gca,'XTickLabel',{'Operation', 'Construction'})
% ylabel('Carcinogens [CTUh]')
% 
% figure
% bar([CF_WC_O_Non_Carcinogens_Matrix; CF_WC_C_Non_Carcinogens_Matrix], 'stacked')
% title('Non Carcinogens')
% set(gca,'XTickLabel',{'Operation', 'Construction'})
% ylabel('Non Carcinogens [CTUh]')
% 
% figure
% bar([CF_WC_O_Respiratory_Matrix; CF_WC_C_Respiratory_Matrix], 'stacked')
% title('Respiratory')
% set(gca,'XTickLabel',{'Operation', 'Construction'})
% ylabel('Respiratory [kg PM2.5 eq]')
% 
% figure
% bar([CF_WC_O_Ecotoxicity_Matrix; CF_WC_C_Ecotoxicity_Matrix], 'stacked')
% title('Ecotoxicity')
% set(gca,'XTickLabel',{'Operation', 'Construction'})
% ylabel('Ecotoxicity [CTUe]')
% 
% figure
% bar([CF_WC_O_Fossil_Fuel_Matrix; CF_WC_C_Fossil_Fuel_Matrix], 'stacked')
% title('Fossil Fuel')
% set(gca,'XTickLabel',{'Operation', 'Construction'})
% ylabel('Fossil Fuel [MJ Surplus]')






