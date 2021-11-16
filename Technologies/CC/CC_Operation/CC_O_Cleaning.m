DV_UP_Conversions
CC_C_Tank_Number_Sizing

%Amount of sodium hypochlorite for cleaning tanks
%Tanks are assumed to be cleaned twice a year

V_CC_O_Cleaning=SA_CC_C_Tank.*t_NaClO_COT*conc_NaClO; %volume(m3) of NaClO cleaning solution per tank
V_CC_O_Cleaning_Total=cleaning_year.*V_CC_O_Cleaning*(Number_Tanks_CC+extra_tank); %total volume (m3) of NaClO cleaning solution for all tanks