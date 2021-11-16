DV_UP_Conversions


load('ClO4_Influent_2.mat')
ClO4_Influent=ClO4_Influent_2/99.45; %conversion of perchlorate into uM

k_reactor_CO=((log(ClO4_Influent)-log(ClO4_Effluent_2))/HRT_CCO); %activity in the reactor requied to reudce the influent perchlorate to designated effluent concentration.
Catalyst_Dosing_CO=k_reactor_CO./k_Perchlorate_CCO; %the required dosing of the catalyst (g/L) to treat the perchlorate to acceptable levels
Catalyst_Dosing_CO_kg=Catalyst_Dosing_CO*g_kg; %dosing of the catalyst (kg) per liter of treated water
CC_Media_Required_L_DW=Catalyst_Dosing_CO_kg./Yield_C_RePdAC; %required production volume (L) to treat 1L of drinking water