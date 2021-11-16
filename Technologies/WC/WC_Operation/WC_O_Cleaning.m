DV_UP_Conversions
WC_C_Tank_Number_Sizing

%Amount of sodium hypochlorite for cleaning tanks
%Tanks are assumed to be cleaned twice a year

V_WC_O_Cleaning=SA_WC_C_Tank.*t_NaClO_WCOT*conc_NaClO; %volume(m3) of NaClO cleaning solution per tank
V_WC_O_Cleaning_Total=cleaning_year.*V_WC_O_Cleaning*(Number_Tanks_WCC+extra_tank); %total volume (m3) of NaClO cleaning solution for all tanks
