%% MASTER FUNCTION FOR BIOCATALYST CF AND COSTS

%% INITIATE THE START OF INPUTS FOR THE MASTER WORKSHEET

DV_UP_Conversions
Costs
Characterization_Factors
BC_O_Biocatalyst_2
BC_O_ElectronDonor_2
BC_P_Energy_L_Total
BC_O_Energy
BC_O_Cleaning
BC_C_Tank_Number_Sizing

%% TOTAL AMOUNTS TO DETERMINE CF AND COSTS

Production_Media_Required_L_DW_m3=Production_Media_Required_L_DW_BO_2/L_m3; 
%production media required (L) to treat m3 of water

%AMOUNTS%
%Amounts of Ingredients (kg) for Biocatalyst Production Media for 1m3 of DW
kg_sodium_phosphate_m3_DW=Production_Media_Required_L_DW_m3*BC_P_sodium_phosphate;
kg_soda_ash_m3_DW=Production_Media_Required_L_DW_m3*BC_P_soda_ash;
kg_protein_feed_m3_DW=Production_Media_Required_L_DW_m3*BC_P_protein_feed;
kg_acetic_acid_m3_DW=Production_Media_Required_L_DW_m3*BC_P_acetic_acid;
kg_sodium_perchlorate_m3_DW=Production_Media_Required_L_DW_m3*BC_P_sodium_perchlorate;
kg_water_m3_DW=Production_Media_Required_L_DW_m3*BC_P_water;
kg_sodium_chloride_m3_DW=Production_Media_Required_L_DW_m3*BC_P_sodium_chloride;
kg_ammonium_chloride_m3_DW=Production_Media_Required_L_DW_m3*BC_P_ammonium_chloride;
kg_potassium_chloride_m3_DW=Production_Media_Required_L_DW_m3*BC_P_potassium_chloride;
kg_magnesium_sulfate_m3_DW=Production_Media_Required_L_DW_m3*BC_P_magnesium_sulfate;
kg_calcium_chloride_m3_DW=Production_Media_Required_L_DW_m3*BC_P_calcium_chloride;
kg_EDTA_m3_DW=Production_Media_Required_L_DW_m3*BC_P_EDTA;
kg_potassium_hydroxide_m3_DW=Production_Media_Required_L_DW_m3*BC_P_potassium_hydroxide;
kg_iron_sulfate_m3_DW=Production_Media_Required_L_DW_m3*BC_P_iron_sulfate;
kg_cobalt_m3_DW=Production_Media_Required_L_DW_m3*BC_P_cobalt;
kg_zinc_monosulfate_m3_DW=Production_Media_Required_L_DW_m3*BC_P_zinc_monosulfate;
kg_copper_concentrate_m3_DW=Production_Media_Required_L_DW_m3*BC_P_copper_concentrate;
kg_nickel_m3_DW=Production_Media_Required_L_DW_m3*BC_P_nickel;
kg_selenium_m3_DW=Production_Media_Required_L_DW_m3*BC_P_selenium;
kg_molybdenum_m3_DW=Production_Media_Required_L_DW_m3*BC_P_molybdenum;

%Total Electricity (kWhr) for Biocatalyst Production for 1m3 of DW
kWhr_B_Production_m3_DW=Production_Media_Required_L_DW_m3.*EBPT; 
%Electricity required to produce production media to treat m3 of drinking water

%% TRANSPORTATION OF MATERIALS FOR PRODUCTION
%Total Transportation for Production of Biocatalyst for 1m3 of DW
%Uses the amounts determined above and calculates a total weight for the
%ingridents of the biocatalysts media. used later to calculate cost and cf
%for transportation.
kg_B_P_total=kg_sodium_phosphate_m3_DW+kg_soda_ash_m3_DW+kg_protein_feed_m3_DW...
    +kg_acetic_acid_m3_DW+kg_sodium_perchlorate_m3_DW+kg_sodium_chloride_m3_DW...
    +kg_ammonium_chloride_m3_DW+kg_potassium_chloride_m3_DW+kg_magnesium_sulfate_m3_DW...
    +kg_calcium_chloride_m3_DW+kg_EDTA_m3_DW+kg_potassium_hydroxide_m3_DW...
    +kg_iron_sulfate_m3_DW+kg_cobalt_m3_DW+kg_zinc_monosulfate_m3_DW...
    +kg_copper_concentrate_m3_DW+kg_nickel_m3_DW+kg_selenium_m3_DW...
    +kg_molybdenum_m3_DW;

%% BIOCATALYSTS OPERATION
kg_biocatalyst_m3_DW=Volume_Dosing_BO*density_water/L_m3; %The mass of biocatalyst
%required for transportation to treat 1m3 of drinking water. Used later to
%calculate cost and cf of transportation.
    
%Total Acetate Required to Treat Oxygen, Nitrate and Perchlorate in 1m3 of DW
kg_B_ElectronDonor_m3_DW=Total_ElectronDonor_BO_2*mmole_mole*gfm_acetate*g_kg/L_m3; 
%total electron donor (kg) to treat 1m3 of DW

%Total Electron Shuttle Required to treat 1m3 of DW
kg_B_ElectronShuttle_m3_DW=Electron_Shuttle_Dosing_BO/L_m3; 
%conversion is for L to m3 of DW

%Total Electricity (kWhr) for Biocatalyst Treatment Operation for 1m3 of DW
kWhr_B_Operation_m3_DW=(EBOT)/L_m3; %conversion is for L to m3 of DW
%kWhr_B_Operation_m3_DW_NoAeration=(EBOT_NoAeration)/L_m3; %electrical operation with no aeration

%Total Cleaning Solution (kg) for Biocatalytic Treatment Operation for 1m3 
%DW distributed over a year of DW
kg_B_Cleaning_m3_DW=V_BC_O_Cleaning_Total*rho_NaClO/Total_Volume_m3_1year; 
%Total NaClO per m3 (normalized over a year with up to 12 cleaning cycles)

%% TRANSPORTATION OF MATERIALS FOR OPERATION

kg_B_O_total=kg_biocatalyst_m3_DW+kg_B_ElectronDonor_m3_DW+kg_B_ElectronShuttle_m3_DW...
    +kg_B_Cleaning_m3_DW;

%% BIOCATALYST CONSTRUCTION

%Total Concrete (m3) for Facility Treatment of m3 (Concrete impacts distributed 
%over 30 years of treatment).
m3_B_Concrete_m3_DW=V_BC_Concrete_Total_AllTanks/Total_Volume_m3_Facility_Age; 
%volume of concrete for m3 DW over the lifespan of treatment (total kg concrete/m3 total treated)

%Total Reinforcing Steel (kg) for Facility Treatment of m3 (impacts distributed 
%over 30 years of treatment).
kg_B_Reinf_Steel_m3_DW=(V_BC_Concrete_Total_AllTanks*Reinforce_Steel_m3_Concrete)...
    /Total_Volume_m3_Facility_Age; 
%kg of reinforcing steel based on the volume of concrete for m3 DW over the lifespan of treatment.

%% COSTS
%Calculates the cost of biocatalytic treatment of water based on 1m3 of
%water

%% COSTS TOTAL PRODUCTION COST FOR BIOCATALYSTS PER M3 OF DW
%Individual item costs for the production of biocatalysts to treat 1m3 of
%water
cost_sodium_phosphate_m3_DW=kg_sodium_phosphate_m3_DW.*price_sodium_phosphate;
cost_soda_ash_m3_DW=kg_soda_ash_m3_DW.*price_soda_ash;
cost_protein_feed_m3_DW=kg_protein_feed_m3_DW.*price_protein_feed;
cost_acetic_acid_m3_DW=kg_acetic_acid_m3_DW.*price_acetic_acid;
cost_sodium_perchlorate_m3_DW=kg_sodium_perchlorate_m3_DW.*price_sodium_perchlorate;
cost_water_m3_DW=kg_water_m3_DW.*price_water;
cost_sodium_chloride_m3_DW=kg_sodium_chloride_m3_DW.*price_sodium_chloride;
cost_ammonium_chloride_m3_DW=kg_ammonium_chloride_m3_DW.*price_ammonium_chloride;
cost_potassium_chloride_m3_DW=kg_potassium_chloride_m3_DW.*price_potassium_chloride;
cost_magnesium_sulfate_m3_DW=kg_magnesium_sulfate_m3_DW.*price_magnesium_sulfate;
cost_calcium_chloride_m3_DW=kg_calcium_chloride_m3_DW.*price_calcium_chloride;
cost_EDTA_m3_DW=kg_EDTA_m3_DW.*price_EDTA;
cost_potassium_hydroxide_m3_DW=kg_potassium_hydroxide_m3_DW.*price_potassium_hydroxide;
cost_iron_sulfate_m3_DW=kg_iron_sulfate_m3_DW.*price_iron_sulfate;
cost_cobalt_m3_DW=kg_cobalt_m3_DW.*price_cobalt;
cost_zinc_monosulfate_m3_DW=kg_zinc_monosulfate_m3_DW.*price_zinc_monosulfate;
cost_copper_concentrate_m3_DW=kg_copper_concentrate_m3_DW.*price_copper_concentrate;
cost_nickel_m3_DW=kg_nickel_m3_DW.*price_nickel;
cost_selenium_m3_DW=kg_selenium_m3_DW.*price_selenium;
cost_molybdenum_m3_DW=kg_molybdenum_m3_DW.*price_molybdenum_trioxide;

%Electricity costs for production of biocatalysts to treat 1m3 of water
cost_BP_E_m3_DW=kWhr_B_Production_m3_DW.*price_electricity;

%transporation
cost_BP_Transportation_m3_DW=((kg_B_P_total/1000).*Transportation_Distance_Production).*(price_transportation); %divide cost by 1000 as it is in tons km.

%% TOTAL PRODUDCTION COST OF BIOCATALYSTS PER M3 of DW
cost_BP_Total_m3_DW=cost_sodium_phosphate_m3_DW+cost_soda_ash_m3_DW+cost_protein_feed_m3_DW...
+cost_acetic_acid_m3_DW+cost_sodium_perchlorate_m3_DW+cost_water_m3_DW...
+cost_sodium_chloride_m3_DW+cost_ammonium_chloride_m3_DW+cost_potassium_chloride_m3_DW...
+cost_magnesium_sulfate_m3_DW+cost_calcium_chloride_m3_DW+cost_EDTA_m3_DW...
+cost_potassium_hydroxide_m3_DW+cost_iron_sulfate_m3_DW+cost_cobalt_m3_DW...
+cost_zinc_monosulfate_m3_DW+cost_copper_concentrate_m3_DW+cost_nickel_m3_DW...
+cost_selenium_m3_DW+cost_molybdenum_m3_DW+cost_BP_E_m3_DW+cost_BP_Transportation_m3_DW;

%% COSTS TOTAL OPERATION COST FOR BIOCATALYSTS PER M3 OF DW
%Individual item costs for the operation of the biocatalyts to treat 1m3 of
%water

cost_BO_electrondonor_m3_DW=kg_B_ElectronDonor_m3_DW.*price_acetic_acid;
%acetic acid price used in place of acetate

cost_BO_ElectronShuttle_m3_DW=kg_B_ElectronShuttle_m3_DW.*price_electronshuttle;
%price of electron shuttle assume $10/kg

cost_BO_electricity_m3_DW=kWhr_B_Operation_m3_DW.*price_electricity;
%cost_BO_electricity_m3_DW_NoAeration=kWhr_B_Operation_m3_DW_NoAeration.*price_electricity;

cost_BO_cleaning_m3_DW=kg_B_Cleaning_m3_DW.*price_NaClO;

cost_BO_transportation_m3_DW=((kg_B_O_total/1000).*Transportation_Distance_Operation).*price_transportation;

%% TOTAL OPERATION COST 
cost_BO_Total_m3_DW=cost_BO_electrondonor_m3_DW+cost_BO_ElectronShuttle_m3_DW...
+cost_BO_electricity_m3_DW+cost_BO_cleaning_m3_DW+cost_BO_transportation_m3_DW;

%% TOTAL COSTS

cost_B_Total=cost_BO_Total_m3_DW+cost_BP_Total_m3_DW;

%% CHARACTERIZATION FACTORS
%CHARACTERIZATION FACTOR TOTALS%
%Impacts of Treatment for 1m3 of DW for individual components

%% IMPACT CATEGORIES BIOCATALYST PRODUCTION 
CF_BC_sodium_phosphate=kg_sodium_phosphate_m3_DW*CF_sodium_phosphate';
CF_BC_soda_ash=kg_soda_ash_m3_DW*CF_soda_ash';
CF_BC_protein_feed=kg_protein_feed_m3_DW*CF_protein_feed';
CF_BC_acetic_acid=kg_acetic_acid_m3_DW*CF_acetic_acid';
CF_BC_sodium_perchlorate=kg_sodium_perchlorate_m3_DW*CF_sodium_perchlorate';
CF_BC_water=kg_water_m3_DW*CF_water';
CF_BC_sodium_chloride=kg_sodium_chloride_m3_DW*CF_sodium_chloride';
CF_BC_ammonium_chloride=kg_ammonium_chloride_m3_DW*CF_ammonium_chloride';
CF_BC_potassium_chloride=kg_potassium_chloride_m3_DW*CF_potassium_chloride';
CF_BC_magnesium_sulfate=kg_magnesium_sulfate_m3_DW*CF_magnesium_sulfate';
CF_BC_calcium_chloride=kg_calcium_chloride_m3_DW*CF_calcium_chloride';
CF_BC_EDTA=kg_EDTA_m3_DW*CF_EDTA';
CF_BC_potassium_hydroxide=kg_potassium_hydroxide_m3_DW*CF_potassium_hydroxide';
CF_BC_iron_sulfate=kg_iron_sulfate_m3_DW*CF_iron_sulfate';
CF_BC_cobalt=kg_cobalt_m3_DW*CF_cobalt';
CF_BC_zinc_monosulfate=kg_zinc_monosulfate_m3_DW*CF_zinc_monosulfate';
CF_BC_copper_concentrate=kg_copper_concentrate_m3_DW*CF_copper_concentrate';
CF_BC_nickel=kg_nickel_m3_DW*CF_nickel';
CF_BC_selenium=kg_selenium_m3_DW*CF_selenium';
CF_BC_molybdenum=kg_molybdenum_m3_DW*CF_molybdenum';

CF_BC_P_electricity=kWhr_B_Production_m3_DW*CF_electricity_average_US';

CF_BC_P_transportation=((kg_B_P_total/1000).*Transportation_Distance_Production)*CF_truck_eff4_32t';
%impacts for transportation based on long ton (divide by 1000) and distance
%% IMPACT CATEGORIES BIOCATALYST OPERATION

CF_BC_O_electron_donor=kg_B_ElectronDonor_m3_DW*CF_acetic_acid';

CF_BC_O_electron_shuttle=kg_B_ElectronShuttle_m3_DW*CF_chemical_organic'; 
%There are two options for CF. The other option is anthraquionone

CF_BC_O_electricity=kWhr_B_Operation_m3_DW*CF_electricity_average_US';
%CF_BC_O_electricity_NoAeration=kWhr_B_Operation_m3_DW_NoAeration*CF_electricity_average_US';

CF_BC_O_cleaning=kg_B_Cleaning_m3_DW*CF_NaClO';

CF_BC_O_transportation=((kg_B_O_total/1000).*Transportation_Distance_Operation)*CF_truck_eff4_32t';

%% IMPACT CATEGORIES BIOCATALYST CONSTRUCTION

CF_BC_C_Concrete=m3_B_Concrete_m3_DW*CF_concrete_m3'; 
%note concrete impacts are determined from m3.

CF_BC_C_Reinforcing_Steel=kg_B_Reinf_Steel_m3_DW*CF_reinforcing_steel';

%% TOTAL IMPACT CATEGORIES

%Production%
CF_B_P_Ozone_Matrix=[CF_BC_sodium_phosphate(1,1) CF_BC_soda_ash(1,1) CF_BC_protein_feed(1,1) CF_BC_acetic_acid(1,1) CF_BC_sodium_perchlorate(1,1) CF_BC_water(1,1) CF_BC_sodium_chloride(1,1) CF_BC_ammonium_chloride(1,1) CF_BC_potassium_chloride(1,1) CF_BC_magnesium_sulfate(1,1) CF_BC_calcium_chloride(1,1) CF_BC_EDTA(1,1) CF_BC_potassium_hydroxide(1,1) CF_BC_iron_sulfate(1,1) CF_BC_cobalt(1,1) CF_BC_zinc_monosulfate(1,1) CF_BC_copper_concentrate(1,1) CF_BC_nickel(1,1) CF_BC_selenium(1,1) CF_BC_molybdenum(1,1) CF_BC_P_electricity(1,1)];
CF_B_P_GW_Matrix=[CF_BC_sodium_phosphate(2,1) CF_BC_soda_ash(2,1) CF_BC_protein_feed(2,1) CF_BC_acetic_acid(2,1) CF_BC_sodium_perchlorate(2,1) CF_BC_water(2,1) CF_BC_sodium_chloride(2,1) CF_BC_ammonium_chloride(2,1) CF_BC_potassium_chloride(2,1) CF_BC_magnesium_sulfate(2,1) CF_BC_calcium_chloride(2,1) CF_BC_EDTA(2,1) CF_BC_potassium_hydroxide(2,1) CF_BC_iron_sulfate(2,1) CF_BC_cobalt(2,1) CF_BC_zinc_monosulfate(2,1) CF_BC_copper_concentrate(2,1) CF_BC_nickel(2,1) CF_BC_selenium(2,1) CF_BC_molybdenum(2,1) CF_BC_P_electricity(2,1)];
CF_B_P_Smog_Matrix=[CF_BC_sodium_phosphate(3,1) CF_BC_soda_ash(3,1) CF_BC_protein_feed(3,1) CF_BC_acetic_acid(3,1) CF_BC_sodium_perchlorate(3,1) CF_BC_water(3,1) CF_BC_sodium_chloride(3,1) CF_BC_ammonium_chloride(3,1) CF_BC_potassium_chloride(3,1) CF_BC_magnesium_sulfate(3,1) CF_BC_calcium_chloride(3,1) CF_BC_EDTA(3,1) CF_BC_potassium_hydroxide(3,1) CF_BC_iron_sulfate(3,1) CF_BC_cobalt(3,1) CF_BC_zinc_monosulfate(3,1) CF_BC_copper_concentrate(3,1) CF_BC_nickel(3,1) CF_BC_selenium(3,1) CF_BC_molybdenum(3,1) CF_BC_P_electricity(3,1)];
CF_B_P_Acidification_Matrix=[CF_BC_sodium_phosphate(4,1) CF_BC_soda_ash(4,1) CF_BC_protein_feed(4,1) CF_BC_acetic_acid(4,1) CF_BC_sodium_perchlorate(4,1) CF_BC_water(4,1) CF_BC_sodium_chloride(4,1) CF_BC_ammonium_chloride(4,1) CF_BC_potassium_chloride(4,1) CF_BC_magnesium_sulfate(4,1) CF_BC_calcium_chloride(4,1) CF_BC_EDTA(4,1) CF_BC_potassium_hydroxide(4,1) CF_BC_iron_sulfate(4,1) CF_BC_cobalt(4,1) CF_BC_zinc_monosulfate(4,1) CF_BC_copper_concentrate(4,1) CF_BC_nickel(4,1) CF_BC_selenium(4,1) CF_BC_molybdenum(4,1) CF_BC_P_electricity(4,1)];
CF_B_P_Eutrophication_Matrix=[CF_BC_sodium_phosphate(5,1) CF_BC_soda_ash(5,1) CF_BC_protein_feed(5,1) CF_BC_acetic_acid(5,1) CF_BC_sodium_perchlorate(5,1) CF_BC_water(5,1) CF_BC_sodium_chloride(5,1) CF_BC_ammonium_chloride(5,1) CF_BC_potassium_chloride(5,1) CF_BC_magnesium_sulfate(5,1) CF_BC_calcium_chloride(5,1) CF_BC_EDTA(5,1) CF_BC_potassium_hydroxide(5,1) CF_BC_iron_sulfate(5,1) CF_BC_cobalt(5,1) CF_BC_zinc_monosulfate(5,1) CF_BC_copper_concentrate(5,1) CF_BC_nickel(5,1) CF_BC_selenium(5,1) CF_BC_molybdenum(5,1) CF_BC_P_electricity(5,1)];
CF_B_P_Carcinogens_Matrix=[CF_BC_sodium_phosphate(6,1) CF_BC_soda_ash(6,1) CF_BC_protein_feed(6,1) CF_BC_acetic_acid(6,1) CF_BC_sodium_perchlorate(6,1) CF_BC_water(6,1) CF_BC_sodium_chloride(6,1) CF_BC_ammonium_chloride(6,1) CF_BC_potassium_chloride(6,1) CF_BC_magnesium_sulfate(6,1) CF_BC_calcium_chloride(6,1) CF_BC_EDTA(6,1) CF_BC_potassium_hydroxide(6,1) CF_BC_iron_sulfate(6,1) CF_BC_cobalt(6,1) CF_BC_zinc_monosulfate(6,1) CF_BC_copper_concentrate(6,1) CF_BC_nickel(6,1) CF_BC_selenium(6,1) CF_BC_molybdenum(6,1) CF_BC_P_electricity(6,1)];
CF_B_P_Non_Carcinogens_Matrix=[CF_BC_sodium_phosphate(7,1) CF_BC_soda_ash(7,1) CF_BC_protein_feed(7,1) CF_BC_acetic_acid(7,1) CF_BC_sodium_perchlorate(7,1) CF_BC_water(7,1) CF_BC_sodium_chloride(7,1) CF_BC_ammonium_chloride(7,1) CF_BC_potassium_chloride(7,1) CF_BC_magnesium_sulfate(7,1) CF_BC_calcium_chloride(7,1) CF_BC_EDTA(7,1) CF_BC_potassium_hydroxide(7,1) CF_BC_iron_sulfate(7,1) CF_BC_cobalt(7,1) CF_BC_zinc_monosulfate(7,1) CF_BC_copper_concentrate(7,1) CF_BC_nickel(7,1) CF_BC_selenium(7,1) CF_BC_molybdenum(7,1) CF_BC_P_electricity(7,1)];
CF_B_P_Respiratory_Matrix=[CF_BC_sodium_phosphate(8,1) CF_BC_soda_ash(8,1) CF_BC_protein_feed(8,1) CF_BC_acetic_acid(8,1) CF_BC_sodium_perchlorate(8,1) CF_BC_water(8,1) CF_BC_sodium_chloride(8,1) CF_BC_ammonium_chloride(8,1) CF_BC_potassium_chloride(8,1) CF_BC_magnesium_sulfate(8,1) CF_BC_calcium_chloride(8,1) CF_BC_EDTA(8,1) CF_BC_potassium_hydroxide(8,1) CF_BC_iron_sulfate(8,1) CF_BC_cobalt(8,1) CF_BC_zinc_monosulfate(8,1) CF_BC_copper_concentrate(8,1) CF_BC_nickel(8,1) CF_BC_selenium(8,1) CF_BC_molybdenum(8,1) CF_BC_P_electricity(8,1)];
CF_B_P_Ecotoxicity_Matrix=[CF_BC_sodium_phosphate(9,1) CF_BC_soda_ash(9,1) CF_BC_protein_feed(9,1) CF_BC_acetic_acid(9,1) CF_BC_sodium_perchlorate(9,1) CF_BC_water(9,1) CF_BC_sodium_chloride(9,1) CF_BC_ammonium_chloride(9,1) CF_BC_potassium_chloride(9,1) CF_BC_magnesium_sulfate(9,1) CF_BC_calcium_chloride(9,1) CF_BC_EDTA(9,1) CF_BC_potassium_hydroxide(9,1) CF_BC_iron_sulfate(9,1) CF_BC_cobalt(9,1) CF_BC_zinc_monosulfate(9,1) CF_BC_copper_concentrate(9,1) CF_BC_nickel(9,1) CF_BC_selenium(9,1) CF_BC_molybdenum(9,1) CF_BC_P_electricity(9,1)];
CF_B_P_Fossil_Fuel_Matrix=[CF_BC_sodium_phosphate(10,1) CF_BC_soda_ash(10,1) CF_BC_protein_feed(10,1) CF_BC_acetic_acid(10,1) CF_BC_sodium_perchlorate(10,1) CF_BC_water(10,1) CF_BC_sodium_chloride(10,1) CF_BC_ammonium_chloride(10,1) CF_BC_potassium_chloride(10,1) CF_BC_magnesium_sulfate(10,1) CF_BC_calcium_chloride(10,1) CF_BC_EDTA(10,1) CF_BC_potassium_hydroxide(10,1) CF_BC_iron_sulfate(10,1) CF_BC_cobalt(10,1) CF_BC_zinc_monosulfate(10,1) CF_BC_copper_concentrate(10,1) CF_BC_nickel(10,1) CF_BC_selenium(10,1) CF_BC_molybdenum(10,1) CF_BC_P_electricity(10,1)];

CF_B_P_Total=CF_BC_sodium_phosphate+CF_BC_soda_ash+CF_BC_protein_feed+CF_BC_acetic_acid...
    +CF_BC_sodium_perchlorate+CF_BC_water+CF_BC_sodium_chloride+CF_BC_ammonium_chloride...
    +CF_BC_potassium_chloride+CF_BC_magnesium_sulfate+CF_BC_calcium_chloride+CF_BC_EDTA...
    +CF_BC_potassium_hydroxide+CF_BC_iron_sulfate+CF_BC_cobalt+CF_BC_zinc_monosulfate...
    +CF_BC_copper_concentrate+CF_BC_nickel+CF_BC_selenium+CF_BC_molybdenum+CF_BC_P_electricity...
    +CF_BC_P_transportation;
CF_B_P_Ozone=CF_BC_sodium_phosphate(1,1)+CF_BC_soda_ash(1,1)+CF_BC_protein_feed(1,1)+CF_BC_acetic_acid(1,1)+CF_BC_sodium_perchlorate(1,1)+CF_BC_water(1,1)+CF_BC_sodium_chloride(1,1)+CF_BC_ammonium_chloride(1,1)+CF_BC_potassium_chloride(1,1)+CF_BC_magnesium_sulfate(1,1)+CF_BC_calcium_chloride(1,1)+CF_BC_EDTA(1,1)+CF_BC_potassium_hydroxide(1,1)+CF_BC_iron_sulfate(1,1)+CF_BC_cobalt(1,1)+CF_BC_zinc_monosulfate(1,1)+CF_BC_copper_concentrate(1,1)+CF_BC_nickel(1,1)+CF_BC_selenium(1,1)+CF_BC_molybdenum(1,1)+CF_BC_P_electricity(1,1);
CF_B_P_GW=CF_BC_sodium_phosphate(2,1)+CF_BC_soda_ash(2,1)+CF_BC_protein_feed(2,1)+CF_BC_acetic_acid(2,1)+CF_BC_sodium_perchlorate(2,1)+CF_BC_water(2,1)+CF_BC_sodium_chloride(2,1)+CF_BC_ammonium_chloride(2,1)+CF_BC_potassium_chloride(2,1)+CF_BC_magnesium_sulfate(2,1)+CF_BC_calcium_chloride(2,1)+CF_BC_EDTA(2,1)+CF_BC_potassium_hydroxide(2,1)+CF_BC_iron_sulfate(2,1)+CF_BC_cobalt(2,1)+CF_BC_zinc_monosulfate(2,1)+CF_BC_copper_concentrate(2,1)+CF_BC_nickel(2,1)+CF_BC_selenium(2,1)+CF_BC_molybdenum(2,1)+CF_BC_P_electricity(2,1);
CF_B_P_Smog=CF_BC_sodium_phosphate(3,1)+CF_BC_soda_ash(3,1)+CF_BC_protein_feed(3,1)+CF_BC_acetic_acid(3,1)+CF_BC_sodium_perchlorate(3,1)+CF_BC_water(3,1)+CF_BC_sodium_chloride(3,1)+CF_BC_ammonium_chloride(3,1)+CF_BC_potassium_chloride(3,1)+CF_BC_magnesium_sulfate(3,1)+CF_BC_calcium_chloride(3,1)+CF_BC_EDTA(3,1)+CF_BC_potassium_hydroxide(3,1)+CF_BC_iron_sulfate(3,1)+CF_BC_cobalt(3,1)+CF_BC_zinc_monosulfate(3,1)+CF_BC_copper_concentrate(3,1)+CF_BC_nickel(3,1)+CF_BC_selenium(3,1)+CF_BC_molybdenum(3,1)+CF_BC_P_electricity(3,1);
CF_B_P_Acidification=CF_BC_sodium_phosphate(4,1)+CF_BC_soda_ash(4,1)+CF_BC_protein_feed(4,1)+CF_BC_acetic_acid(4,1)+CF_BC_sodium_perchlorate(4,1)+CF_BC_water(4,1)+CF_BC_sodium_chloride(4,1)+CF_BC_ammonium_chloride(4,1)+CF_BC_potassium_chloride(4,1)+CF_BC_magnesium_sulfate(4,1)+CF_BC_calcium_chloride(4,1)+CF_BC_EDTA(4,1)+CF_BC_potassium_hydroxide(4,1)+CF_BC_iron_sulfate(4,1)+CF_BC_cobalt(4,1)+CF_BC_zinc_monosulfate(4,1)+CF_BC_copper_concentrate(4,1)+CF_BC_nickel(4,1)+CF_BC_selenium(4,1)+CF_BC_molybdenum(4,1)+CF_BC_P_electricity(4,1);
CF_B_P_Eutrophication=CF_BC_sodium_phosphate(5,1)+CF_BC_soda_ash(5,1)+CF_BC_protein_feed(5,1)+CF_BC_acetic_acid(5,1)+CF_BC_sodium_perchlorate(5,1)+CF_BC_water(5,1)+CF_BC_sodium_chloride(5,1)+CF_BC_ammonium_chloride(5,1)+CF_BC_potassium_chloride(5,1)+CF_BC_magnesium_sulfate(5,1)+CF_BC_calcium_chloride(5,1)+CF_BC_EDTA(5,1)+CF_BC_potassium_hydroxide(5,1)+CF_BC_iron_sulfate(5,1)+CF_BC_cobalt(5,1)+CF_BC_zinc_monosulfate(5,1)+CF_BC_copper_concentrate(5,1)+CF_BC_nickel(5,1)+CF_BC_selenium(5,1)+CF_BC_molybdenum(5,1)+CF_BC_P_electricity(5,1);
CF_B_P_Carcinogens=CF_BC_sodium_phosphate(6,1)+CF_BC_soda_ash(6,1)+CF_BC_protein_feed(6,1)+CF_BC_acetic_acid(6,1)+CF_BC_sodium_perchlorate(6,1)+CF_BC_water(6,1)+CF_BC_sodium_chloride(6,1)+CF_BC_ammonium_chloride(6,1)+CF_BC_potassium_chloride(6,1)+CF_BC_magnesium_sulfate(6,1)+CF_BC_calcium_chloride(6,1)+CF_BC_EDTA(6,1)+CF_BC_potassium_hydroxide(6,1)+CF_BC_iron_sulfate(6,1)+CF_BC_cobalt(6,1)+CF_BC_zinc_monosulfate(6,1)+CF_BC_copper_concentrate(6,1)+CF_BC_nickel(6,1)+CF_BC_selenium(6,1)+CF_BC_molybdenum(6,1)+CF_BC_P_electricity(6,1);
CF_B_P_Non_Carcinogens=CF_BC_sodium_phosphate(7,1)+CF_BC_soda_ash(7,1)+CF_BC_protein_feed(7,1)+CF_BC_acetic_acid(7,1)+CF_BC_sodium_perchlorate(7,1)+CF_BC_water(7,1)+CF_BC_sodium_chloride(7,1)+CF_BC_ammonium_chloride(7,1)+CF_BC_potassium_chloride(7,1)+CF_BC_magnesium_sulfate(7,1)+CF_BC_calcium_chloride(7,1)+CF_BC_EDTA(7,1)+CF_BC_potassium_hydroxide(7,1)+CF_BC_iron_sulfate(7,1)+CF_BC_cobalt(7,1)+CF_BC_zinc_monosulfate(7,1)+CF_BC_copper_concentrate(7,1)+CF_BC_nickel(7,1)+CF_BC_selenium(7,1)+CF_BC_molybdenum(7,1)+CF_BC_P_electricity(7,1);
CF_B_P_Respiratory=CF_BC_sodium_phosphate(8,1)+CF_BC_soda_ash(8,1)+CF_BC_protein_feed(8,1)+CF_BC_acetic_acid(8,1)+CF_BC_sodium_perchlorate(8,1)+CF_BC_water(8,1)+CF_BC_sodium_chloride(8,1)+CF_BC_ammonium_chloride(8,1)+CF_BC_potassium_chloride(8,1)+CF_BC_magnesium_sulfate(8,1)+CF_BC_calcium_chloride(8,1)+CF_BC_EDTA(8,1)+CF_BC_potassium_hydroxide(8,1)+CF_BC_iron_sulfate(8,1)+CF_BC_cobalt(8,1)+CF_BC_zinc_monosulfate(8,1)+CF_BC_copper_concentrate(8,1)+CF_BC_nickel(8,1)+CF_BC_selenium(8,1)+CF_BC_molybdenum(8,1)+CF_BC_P_electricity(8,1);
CF_B_P_Ecotoxicity=CF_BC_sodium_phosphate(9,1)+CF_BC_soda_ash(9,1)+CF_BC_protein_feed(9,1)+CF_BC_acetic_acid(9,1)+CF_BC_sodium_perchlorate(9,1)+CF_BC_water(9,1)+CF_BC_sodium_chloride(9,1)+CF_BC_ammonium_chloride(9,1)+CF_BC_potassium_chloride(9,1)+CF_BC_magnesium_sulfate(9,1)+CF_BC_calcium_chloride(9,1)+CF_BC_EDTA(9,1)+CF_BC_potassium_hydroxide(9,1)+CF_BC_iron_sulfate(9,1)+CF_BC_cobalt(9,1)+CF_BC_zinc_monosulfate(9,1)+CF_BC_copper_concentrate(9,1)+CF_BC_nickel(9,1)+CF_BC_selenium(9,1)+CF_BC_molybdenum(9,1)+CF_BC_P_electricity(9,1);
CF_B_P_Fossil_Fuel=CF_BC_sodium_phosphate(10,1)+CF_BC_soda_ash(10,1)+CF_BC_protein_feed(10,1)+CF_BC_acetic_acid(10,1)+CF_BC_sodium_perchlorate(10,1)+CF_BC_water(10,1)+CF_BC_sodium_chloride(10,1)+CF_BC_ammonium_chloride(10,1)+CF_BC_potassium_chloride(10,1)+CF_BC_magnesium_sulfate(10,1)+CF_BC_calcium_chloride(10,1)+CF_BC_EDTA(10,1)+CF_BC_potassium_hydroxide(10,1)+CF_BC_iron_sulfate(10,1)+CF_BC_cobalt(10,1)+CF_BC_zinc_monosulfate(10,1)+CF_BC_copper_concentrate(10,1)+CF_BC_nickel(10,1)+CF_BC_selenium(10,1)+CF_BC_molybdenum(10,1)+CF_BC_P_electricity(10,1);

%Operation%
CF_B_O_Ozone_Matrix=[CF_BC_O_electron_donor(1,1) CF_BC_O_electron_shuttle(1,1) CF_BC_O_electricity(1,1) CF_BC_O_cleaning(1,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_O_GW_Matrix=[CF_BC_O_electron_donor(2,1) CF_BC_O_electron_shuttle(2,1) CF_BC_O_electricity(2,1) CF_BC_O_cleaning(2,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_O_Smog_Matrix=[CF_BC_O_electron_donor(3,1) CF_BC_O_electron_shuttle(3,1) CF_BC_O_electricity(3,1) CF_BC_O_cleaning(3,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_O_Acidification_Matrix=[CF_BC_O_electron_donor(4,1) CF_BC_O_electron_shuttle(4,1) CF_BC_O_electricity(4,1) CF_BC_O_cleaning(4,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_O_Eutrophication_Matrix=[CF_BC_O_electron_donor(5,1) CF_BC_O_electron_shuttle(5,1) CF_BC_O_electricity(5,1) CF_BC_O_cleaning(5,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_O_Carcinogens_Matrix=[CF_BC_O_electron_donor(6,1) CF_BC_O_electron_shuttle(6,1) CF_BC_O_electricity(6,1) CF_BC_O_cleaning(6,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_O_Non_Carcinogens_Matrix=[CF_BC_O_electron_donor(7,1) CF_BC_O_electron_shuttle(7,1) CF_BC_O_electricity(7,1) CF_BC_O_cleaning(7,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_O_Respiratory_Matrix=[CF_BC_O_electron_donor(8,1) CF_BC_O_electron_shuttle(8,1) CF_BC_O_electricity(8,1) CF_BC_O_cleaning(8,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_O_Ecotoxicity_Matrix=[CF_BC_O_electron_donor(9,1) CF_BC_O_electron_shuttle(9,1) CF_BC_O_electricity(9,1) CF_BC_O_cleaning(9,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_O_Fossil_Fuel_Matrix=[CF_BC_O_electron_donor(10,1) CF_BC_O_electron_shuttle(10,1) CF_BC_O_electricity(10,1) CF_BC_O_cleaning(10,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

CF_B_O_Total=CF_BC_O_electron_donor+CF_BC_O_electron_shuttle+CF_BC_O_electricity+CF_BC_O_cleaning...
    +CF_BC_O_transportation;
CF_B_O_Ozone=CF_BC_O_electron_donor(1,1)+CF_BC_O_electron_shuttle(1,1)+CF_BC_O_electricity(1,1)+CF_BC_O_cleaning(1,1);
CF_B_O_GW=CF_BC_O_electron_donor(2,1)+CF_BC_O_electron_shuttle(2,1)+CF_BC_O_electricity(2,1)+CF_BC_O_cleaning(2,1);
CF_B_O_Smog=CF_BC_O_electron_donor(3,1)+CF_BC_O_electron_shuttle(3,1)+CF_BC_O_electricity(3,1)+CF_BC_O_cleaning(3,1);
CF_B_O_Acidification=CF_BC_O_electron_donor(4,1)+CF_BC_O_electron_shuttle(4,1)+CF_BC_O_electricity(4,1)+CF_BC_O_cleaning(4,1);
CF_B_O_Eutrophication=CF_BC_O_electron_donor(5,1)+CF_BC_O_electron_shuttle(5,1)+CF_BC_O_electricity(5,1)+CF_BC_O_cleaning(5,1);
CF_B_O_Carcinogens=CF_BC_O_electron_donor(6,1)+CF_BC_O_electron_shuttle(6,1)+CF_BC_O_electricity(6,1)+CF_BC_O_cleaning(6,1);
CF_B_O_Non_Carcinogens=CF_BC_O_electron_donor(7,1)+CF_BC_O_electron_shuttle(7,1)+CF_BC_O_electricity(7,1)+CF_BC_O_cleaning(7,1);
CF_B_O_Respiratory=CF_BC_O_electron_donor(8,1)+CF_BC_O_electron_shuttle(8,1)+CF_BC_O_electricity(8,1)+CF_BC_O_cleaning(8,1);
CF_B_O_Ecotoxicity=CF_BC_O_electron_donor(9,1)+CF_BC_O_electron_shuttle(9,1)+CF_BC_O_electricity(9,1)+CF_BC_O_cleaning(9,1);
CF_B_O_Fossil_Fuel=CF_BC_O_electron_donor(10,1)+CF_BC_O_electron_shuttle(10,1)+CF_BC_O_electricity(10,1)+CF_BC_O_cleaning(10,1);

%Construction%
CF_B_C_Total=CF_BC_C_Concrete+CF_BC_C_Reinforcing_Steel;
CF_B_C_Ozone=CF_BC_C_Concrete(1,1)+CF_BC_C_Reinforcing_Steel(1,1);
CF_B_C_GW=CF_BC_C_Concrete(2,1)+CF_BC_C_Reinforcing_Steel(2,1);
CF_B_C_Smog=CF_BC_C_Concrete(3,1)+CF_BC_C_Reinforcing_Steel(3,1);
CF_B_C_Acidification=CF_BC_C_Concrete(4,1)+CF_BC_C_Reinforcing_Steel(4,1);
CF_B_C_Eutrophication=CF_BC_C_Concrete(5,1)+CF_BC_C_Reinforcing_Steel(5,1);
CF_B_C_Carcinogens=CF_BC_C_Concrete(6,1)+CF_BC_C_Reinforcing_Steel(6,1);
CF_B_C_Non_Carcinogens=CF_BC_C_Concrete(7,1)+CF_BC_C_Reinforcing_Steel(7,1);
CF_B_C_Respiratory=CF_BC_C_Concrete(8,1)+CF_BC_C_Reinforcing_Steel(8,1);
CF_B_C_Ecotoxicity=CF_BC_C_Concrete(9,1)+CF_BC_C_Reinforcing_Steel(9,1);
CF_B_C_Fossil_Fuel=CF_BC_C_Concrete(10,1)+CF_BC_C_Reinforcing_Steel(10,1);

CF_B_C_Ozone_Matrix=[CF_BC_C_Concrete(1,1) CF_BC_C_Reinforcing_Steel(1,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_C_GW_Matrix=[CF_BC_C_Concrete(2,1) CF_BC_C_Reinforcing_Steel(2,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_C_Smog_Matrix=[CF_BC_C_Concrete(3,1) CF_BC_C_Reinforcing_Steel(3,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_C_Acidification_Matrix=[CF_BC_C_Concrete(4,1) CF_BC_C_Reinforcing_Steel(4,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_C_Eutrophication_Matrix=[CF_BC_C_Concrete(5,1) CF_BC_C_Reinforcing_Steel(5,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_C_Carcinogens_Matrix=[CF_BC_C_Concrete(6,1) CF_BC_C_Reinforcing_Steel(6,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_C_Non_Carcinogens_Matrix=[CF_BC_C_Concrete(7,1) CF_BC_C_Reinforcing_Steel(7,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_C_Respiratory_Matrix=[CF_BC_C_Concrete(8,1) CF_BC_C_Reinforcing_Steel(8,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_C_Ecotoxicity_Matrix=[CF_BC_C_Concrete(9,1) CF_BC_C_Reinforcing_Steel(9,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
CF_B_C_Fossil_Fuel_Matrix=[CF_BC_C_Concrete(10,1) CF_BC_C_Reinforcing_Steel(10,1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

CF_B_Total=CF_B_P_Total+CF_B_O_Total+CF_B_C_Total; %Total Impacts for biocatalytic process


% % %% EXCEL FILE OUTPUT
% BiocatalystsTotals='HRT2hr_2ppb_BiocatalystsTotals.xlsx';
% xlswrite(BiocatalystsTotals,cost_B_Total,'cost_B_Total');
% xlswrite(BiocatalystsTotals,CF_B_Total,'CF_B_Total');
% 
% BiocatalystsCostsProduction='HRT2hr_2ppb_BiocatalystsCostsProduction.xlsx';
% 
% xlswrite(BiocatalystsCostsProduction,cost_BP_Total_m3_DW,'cost_BP_Total_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_sodium_phosphate_m3_DW,'cost_sodium_phosphate_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_soda_ash_m3_DW,'cost_soda_ash_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_protein_feed_m3_DW,'cost_protein_feed_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_acetic_acid_m3_DW,'cost_acetic_acid_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_sodium_perchlorate_m3_DW,'cost_sodium_perchlorate_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_water_m3_DW,'cost_water_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_sodium_chloride_m3_DW,'cost_sodium_chloride_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_ammonium_chloride_m3_DW,'cost_ammonium_chloride_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_potassium_chloride_m3_DW,'cost_potassium_chloride_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_magnesium_sulfate_m3_DW,'cost_magnesium_sulfate_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_calcium_chloride_m3_DW,'cost_calcium_chloride_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_EDTA_m3_DW,'cost_EDTA_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_potassium_hydroxide_m3_DW,'cost_potassium_hydroxide_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_iron_sulfate_m3_DW,'cost_iron_sulfate_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_cobalt_m3_DW,'cost_cobalt_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_zinc_monosulfate_m3_DW,'cost_zinc_monosulfate_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_copper_concentrate_m3_DW,'cost_copper_concentrate_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_nickel_m3_DW,'cost_nickel_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_selenium_m3_DW,'cost_selenium_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_molybdenum_m3_DW,'cost_molybdenum_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_BP_E_m3_DW,'cost_BP_E_m3_DW');
% xlswrite(BiocatalystsCostsProduction,cost_BP_Transportation_m3_DW,'cost_BP_Transportation_m3_DW');
% 
% BiocatalystsCostsOperation='HRT2hr_2ppb_BiocatalystsCostsOperation.xlsx';
% xlswrite(BiocatalystsCostsOperation,cost_BO_Total_m3_DW,'cost_BO_Total_m3_DW');
% xlswrite(BiocatalystsCostsOperation,cost_BO_electrondonor_m3_DW,'cost_BO_electrondonor_m3_DW');
% xlswrite(BiocatalystsCostsOperation,cost_BO_ElectronShuttle_m3_DW,'cost_BO_ElectronShuttle_m3_DW');
% xlswrite(BiocatalystsCostsOperation,cost_BO_electricity_m3_DW,'cost_BO_electricity_m3_DW');
% xlswrite(BiocatalystsCostsOperation,cost_BO_cleaning_m3_DW,'cost_BO_cleaning_m3_DW');
% xlswrite(BiocatalystsCostsOperation,cost_BO_transportation_m3_DW, 'cost_BO_transportation_m3_DW');
% 
% BiocatalystsCFProduction='HRT2hr_2ppb_BiocatalystsCFProduction.xlsx';
% xlswrite(BiocatalystsCFProduction,CF_B_P_Total,'CF_B_P_Total');
% xlswrite(BiocatalystsCFProduction,CF_BC_sodium_phosphate,'CF_BC_sodium_phosphate');
% xlswrite(BiocatalystsCFProduction,CF_BC_soda_ash,'CF_BC_soda_ash');
% xlswrite(BiocatalystsCFProduction,CF_BC_protein_feed,'CF_BC_protein_feed');
% xlswrite(BiocatalystsCFProduction,CF_BC_acetic_acid,'CF_BC_acetic_acid');
% xlswrite(BiocatalystsCFProduction,CF_BC_sodium_perchlorate,'CF_BC_sodium_perchlorate');
% xlswrite(BiocatalystsCFProduction,CF_BC_water,'CF_BC_water');
% xlswrite(BiocatalystsCFProduction,CF_BC_sodium_chloride,'CF_BC_sodium_chloride');
% xlswrite(BiocatalystsCFProduction,CF_BC_ammonium_chloride,'CF_BC_ammonium_chloride');
% xlswrite(BiocatalystsCFProduction,CF_BC_potassium_chloride,'CF_BC_potassium_chloride');
% xlswrite(BiocatalystsCFProduction,CF_BC_magnesium_sulfate,'CF_BC_magnesium_sulfate');
% xlswrite(BiocatalystsCFProduction,CF_BC_calcium_chloride,'CF_BC_calcium_chloride');
% xlswrite(BiocatalystsCFProduction,CF_BC_EDTA,'CF_BC_EDTA');
% xlswrite(BiocatalystsCFProduction,CF_BC_potassium_hydroxide,'CF_BC_potassium_hydroxide');
% xlswrite(BiocatalystsCFProduction,CF_BC_iron_sulfate,'CF_BC_iron_sulfate');
% xlswrite(BiocatalystsCFProduction,CF_BC_cobalt,'CF_BC_cobalt');
% xlswrite(BiocatalystsCFProduction,CF_BC_zinc_monosulfate,'CF_BC_zinc_monosulfate');
% xlswrite(BiocatalystsCFProduction,CF_BC_copper_concentrate,'CF_BC_copper_concentrate');
% xlswrite(BiocatalystsCFProduction,CF_BC_nickel,'CF_BC_nickel');
% xlswrite(BiocatalystsCFProduction,CF_BC_selenium,'CF_BC_selenium');
% xlswrite(BiocatalystsCFProduction,CF_BC_molybdenum,'CF_BC_molybdenum');
% xlswrite(BiocatalystsCFProduction,CF_BC_P_electricity,'CF_BC_P_electricity');
% xlswrite(BiocatalystsCFProduction,CF_BC_P_transportation,'CF_BC_P_transportation');
% 
% BiocatalystsCFOperation='HRT2hr_2ppb_BiocatalystsCFOperation.xlsx';
% xlswrite(BiocatalystsCFOperation,CF_B_O_Total,'CF_B_O_Total');
% xlswrite(BiocatalystsCFOperation,CF_BC_O_electron_donor,'CF_BC_O_electron_donor');
% xlswrite(BiocatalystsCFOperation,CF_BC_O_electron_shuttle,'CF_BC_O_electron_shuttle');
% xlswrite(BiocatalystsCFOperation,CF_BC_O_electricity,'CF_BC_O_electricity');
% xlswrite(BiocatalystsCFOperation,CF_BC_O_cleaning,'CF_BC_O_cleaning');
% xlswrite(BiocatalystsCFOperation,CF_BC_O_transportation,'CF_BC_O_transportation');
% 
% BiocatalystsCFConstruction='HRT2hr_2ppb_BiocatalystsCFConstruction.xlsx';
% xlswrite(BiocatalystsCFConstruction,CF_B_C_Total,'CF_B_C_Total');
% xlswrite(BiocatalystsCFConstruction,CF_BC_C_Concrete,'CF_BC_C_Concrete');
% xlswrite(BiocatalystsCFConstruction,CF_BC_C_Reinforcing_Steel,'CF_BC_C_Reinforcing_Steel');

%% FIGURE OUTPUT FROM MATLAB
% figure
% bar([CF_B_O_Ozone_Matrix; CF_B_P_Ozone_Matrix; CF_B_C_Ozone_Matrix], 'stacked')
% title('Ozone')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Ozone [kg CFC-11 eq]')
% 
% figure
% bar([CF_B_O_GW_Matrix; CF_B_P_GW_Matrix; CF_B_C_GW_Matrix], 'stacked')
% title('GW')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('CO2 [kg CO2 eq]')
% 
% figure
% bar([CF_B_O_Smog_Matrix; CF_B_P_Smog_Matrix; CF_B_C_Smog_Matrix], 'stacked')
% title('Smog')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Smog [kg O3 eq]')
% 
% figure
% bar([CF_B_O_Acidification_Matrix; CF_B_P_Acidification_Matrix; CF_B_C_Acidification_Matrix], 'stacked')
% title('Acidification')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Acidification [kg SO2 eq]')
% 
% figure
% bar([CF_B_O_Eutrophication_Matrix; CF_B_P_Eutrophication_Matrix; CF_B_C_Eutrophication_Matrix], 'stacked')
% title('Eutrophication')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Eutrophication [kg N eq]')
% 
% figure
% bar([CF_B_O_Carcinogens_Matrix; CF_B_P_Carcinogens_Matrix; CF_B_C_Carcinogens_Matrix], 'stacked')
% title('Carcinogens')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Carcinogens [CTUh]')
% 
% figure
% bar([CF_B_O_Non_Carcinogens_Matrix; CF_B_P_Non_Carcinogens_Matrix; CF_B_C_Non_Carcinogens_Matrix], 'stacked')
% title('Non Carcinogens')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Non Carcinogens [CTUh]')

% figure
% bar([CF_B_O_Respiratory_Matrix; CF_B_P_Respiratory_Matrix; CF_B_C_Respiratory_Matrix], 'stacked')
% title('Respiratory')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Respiratory [kg PM2.5 eq]')
% 
% figure
% bar([CF_B_O_Ecotoxicity_Matrix; CF_B_P_Ecotoxicity_Matrix; CF_B_C_Ecotoxicity_Matrix], 'stacked')
% title('Ecotoxicity')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Ecotoxicity [CTUe]')
% 
% figure
% bar([CF_B_O_Fossil_Fuel_Matrix; CF_B_P_Fossil_Fuel_Matrix; CF_B_C_Fossil_Fuel_Matrix], 'stacked')
% title('Fossil Fuel')
% set(gca,'XTickLabel',{'Operation', 'Production', 'Construction'})
% ylabel('Fossil Fuel [MJ Surplus]')






