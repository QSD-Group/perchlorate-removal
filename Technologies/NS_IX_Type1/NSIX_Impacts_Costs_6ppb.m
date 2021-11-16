DV_UP_Conversions
Costs
Characterization_Factors
NS_IX_Operation_6

%% Mass of Compounds for SIX treatment

%Total Cleaning Solution (kg) for SIX Treatment Operation for 1m3 
%DW distributed over a year of DW based on biocatalytic treatment
kg_NSIX_Cleaning_m3_DW=V_BC_O_Cleaning_Total*rho_NaClO/Total_Volume_m3_1year; 
%Total NaClO per m3 (normalized over a year with up to 12 cleaning cycles)

%Total Electricity (kWhr) for SIX Treatment Operation for 1m3 of DW
kWhr_NSIX_Operation_m3_DW=(EBOT)/L_m3; %conversion is for L to m3 of DW
%kWhr_B_Operation_m3_DW_NoAeration=(EBOT_NoAeration)/L_m3; %electrical operation with no aeration

%% Transportation of Materials

kg_NSIX_total=(2*kg_Total_Resin_m3_water)+kg_NSIX_Cleaning_m3_DW+kg_NaCl_m3_water; %the two multiplication factor accounts for hauling the resin to the site and away for disposal.

%% Cost of SIX treatment per m3 of DW

cost_NSIX_E_m3_DW=kWhr_NSIX_Operation_m3_DW.*price_electricity;

cost_NSIX_transportation_m3_DW=(kg_NSIX_total/1000).*Transportation_Distance_Operation.*price_transportation; %divide by 1000 to convert to tons

cost_NSIX_resin_m3_DW=kg_Total_Resin_m3_water.*price_resin;

cost_NSIX_cleaning_m3_DW=kg_NSIX_Cleaning_m3_DW.*price_NaClO;

cost_NSIX_resin_disposal_m3_DW=kg_Total_Resin_m3_water.*price_resin_disposal_NS;

cost_NSIX_NaCl_m3_DW=kg_NaCl_m3_water.*price_sodium_chloride;

%% Total Cost

cost_NSIX_total=cost_NSIX_E_m3_DW+cost_NSIX_transportation_m3_DW+cost_NSIX_resin_m3_DW+cost_NSIX_cleaning_m3_DW+cost_NSIX_resin_disposal_m3_DW+cost_NSIX_NaCl_m3_DW;

%% Impact Categories

CF_NSIX_E_m3_DW=kWhr_NSIX_Operation_m3_DW*CF_electricity_average_US';

CF_NSIX_transportation_m3_DW=(kg_NSIX_total/1000).*Transportation_Distance_Operation*CF_truck_eff4_32t';

CF_NSIX_resin_m3_DW=kg_Total_Resin_m3_water*CF_anion_resin';

CF_NSIX_cleaning_m3_DW=kg_NSIX_Cleaning_m3_DW*CF_NaClO';

CF_NSIX_resin_disposal_m3_DW=kg_Total_Resin_m3_water*CF_anion_resin_disposal';

CF_NSIX_NaCl_m3_DW=kg_NaCl_m3_water*CF_sodium_chloride';

%% Total CF

CF_NSIX_total=CF_NSIX_E_m3_DW+CF_NSIX_transportation_m3_DW+CF_NSIX_resin_m3_DW+CF_NSIX_cleaning_m3_DW+CF_NSIX_resin_disposal_m3_DW+CF_NSIX_NaCl_m3_DW;

%% EXCEL FILE OUTPUT
NSIXTotals='NSIX_6ppb_Totals.xlsx';
xlswrite(NSIXTotals,cost_NSIX_total,'cost_NSIX_total');
xlswrite(NSIXTotals,CF_NSIX_total,'CF_NSIX_total');

NSIXCostsOperation='NSIX_6ppb_CostsOperation.xlsx';
xlswrite(NSIXCostsOperation,cost_NSIX_total,'cost_NSIX_total_m3_DW');
xlswrite(NSIXCostsOperation,cost_NSIX_E_m3_DW,'cost_NSIX_electricity');
xlswrite(NSIXCostsOperation,cost_NSIX_resin_m3_DW,'cost_NSIX_resin');
xlswrite(NSIXCostsOperation,cost_NSIX_cleaning_m3_DW,'cost_NSIX_cleaning');
xlswrite(NSIXCostsOperation,cost_NSIX_transportation_m3_DW, 'cost_NSIX_transportation');
xlswrite(NSIXCostsOperation,cost_NSIX_resin_disposal_m3_DW,'cost_NSIX_resindisposal');
xlswrite(NSIXCostsOperation,cost_NSIX_NaCl_m3_DW,'cost_NSIX_NaCl');

NSIXCFOperation='NSIX_6ppb_CFOperation.xlsx';
xlswrite(NSIXCFOperation,CF_NSIX_total,'CF_NSIX_total_m3_DW');
xlswrite(NSIXCFOperation,CF_NSIX_E_m3_DW,'CF_NSIX_electricity');
xlswrite(NSIXCFOperation,CF_NSIX_resin_m3_DW,'CF_NSIX_resin');
xlswrite(NSIXCFOperation,CF_NSIX_cleaning_m3_DW,'CF_NSIX_cleaning');
xlswrite(NSIXCFOperation,CF_NSIX_transportation_m3_DW, 'CF_NSIX_transportation');
xlswrite(NSIXCFOperation,CF_NSIX_resin_disposal_m3_DW,'CF_NSIX_resindisposal');
xlswrite(NSIXCFOperation,CF_NSIX_NaCl_m3_DW,'CF_NSIX_NaCl');
