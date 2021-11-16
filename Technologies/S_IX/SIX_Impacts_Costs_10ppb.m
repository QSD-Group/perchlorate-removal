DV_UP_Conversions
Costs
Characterization_Factors
S_IX_Operation_10

%% Mass of Compounds for SIX treatment

%Total Cleaning Solution (kg) for SIX Treatment Operation for 1m3 
%DW distributed over a year of DW based on biocatalytic treatment
kg_SIX_Cleaning_m3_DW=V_BC_O_Cleaning_Total*rho_NaClO/Total_Volume_m3_1year; 
%Total NaClO per m3 (normalized over a year with up to 12 cleaning cycles)

%Total Electricity (kWhr) for SIX Treatment Operation for 1m3 of DW
kWhr_SIX_Operation_m3_DW=(EBOT)/L_m3; %conversion is for L to m3 of DW
%kWhr_B_Operation_m3_DW_NoAeration=(EBOT_NoAeration)/L_m3; %electrical operation with no aeration

%% Transportation of Materials

kg_SIX_total=(2*total_kg_resin_m3_DW)+kg_SIX_Cleaning_m3_DW; %the two multiplication factor accounts for hauling the resin to the site and away for disposal.

%% Cost of SIX treatment per m3 of DW

cost_SIX_E_m3_DW=kWhr_SIX_Operation_m3_DW.*price_electricity;

cost_SIX_transportation_m3_DW=(kg_SIX_total/1000).*Transportation_Distance_Operation.*price_transportation;

cost_SIX_resin_m3_DW=total_kg_resin_m3_DW.*price_selective_resin;

cost_SIX_cleaning_m3_DW=kg_SIX_Cleaning_m3_DW.*price_NaClO;

cost_SIX_resin_disposal_m3_DW=total_kg_resin_m3_DW.*price_resin_disposal_selective;

%% Total Cost

cost_SIX_total=cost_SIX_E_m3_DW+cost_SIX_transportation_m3_DW+cost_SIX_resin_m3_DW+cost_SIX_cleaning_m3_DW+cost_SIX_resin_disposal_m3_DW;

%% Impact Categories

CF_SIX_E_m3_DW=kWhr_SIX_Operation_m3_DW*CF_electricity_average_US';

CF_SIX_transportation_m3_DW=(kg_SIX_total/1000).*Transportation_Distance_Operation*CF_truck_eff4_32t';

CF_SIX_resin_m3_DW=total_kg_resin_m3_DW*CF_anion_resin';

CF_SIX_cleaning_m3_DW=kg_SIX_Cleaning_m3_DW*CF_NaClO';

CF_SIX_resin_disposal_m3_DW=total_kg_resin_m3_DW*CF_anion_resin_disposal';

%% Total CF

CF_SIX_total=CF_SIX_E_m3_DW+CF_SIX_transportation_m3_DW+CF_SIX_resin_m3_DW+CF_SIX_cleaning_m3_DW+CF_SIX_resin_disposal_m3_DW;

%% EXCEL FILE OUTPUT
SIXTotals='SIX_10ppb_Totals.xlsx';
xlswrite(SIXTotals,cost_SIX_total,'cost_SIX_total');
xlswrite(SIXTotals,CF_SIX_total,'CF_SIX_total');

SIXCostsOperation='SIX_10ppb_CostsOperation.xlsx';
xlswrite(SIXCostsOperation,cost_SIX_total,'cost_SIX_total_m3_DW');
xlswrite(SIXCostsOperation,cost_SIX_E_m3_DW,'cost_SIX_electricity');
xlswrite(SIXCostsOperation,cost_SIX_resin_m3_DW,'cost_SIX_resin');
xlswrite(SIXCostsOperation,cost_SIX_cleaning_m3_DW,'cost_SIX_cleaning');
xlswrite(SIXCostsOperation,cost_SIX_transportation_m3_DW, 'cost_SIX_transportation');
xlswrite(SIXCostsOperation,cost_SIX_resin_disposal_m3_DW,'cost_SIX_resindisposal');

SIXCFOperation='SIX_10ppb_CFOperation.xlsx';
xlswrite(SIXCFOperation,CF_SIX_total,'CF_SIX_total_m3_DW');
xlswrite(SIXCFOperation,CF_SIX_E_m3_DW,'CF_SIX_electricity');
xlswrite(SIXCFOperation,CF_SIX_resin_m3_DW,'CF_SIX_resin');
xlswrite(SIXCFOperation,CF_SIX_cleaning_m3_DW,'CF_SIX_cleaning');
xlswrite(SIXCFOperation,CF_SIX_transportation_m3_DW, 'CF_SIX_transportation');
xlswrite(SIXCFOperation,CF_SIX_resin_disposal_m3_DW,'CF_SIX_resindisposal');
