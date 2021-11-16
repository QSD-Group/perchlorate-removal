DV_UP_Conversions

load('ClO4_Influent_2.mat')
load('NO3_Influent_10000.mat')

NO3_Influent=NO3_Influent_10000/62.0049; %conversion of nitrate into mM

ClO4_Influent_02=ClO4_Influent_2/99.45; %conversion of perchlorate into uM


Vmax_ClO4_Adjusted_Temp_BO=Pre_Exponential_Constant_BO.*e.^(-Activation_Energy_BO./(R.*Temp_Influent)); %Arrhenius adjustment of the perchlorate reducing activity
Vmax_ratio_temp=Vmax_ClO4_Adjusted_Temp_BO./Vmax_Perchlorate_BO; %ratio of arrhenius corrected value to Vmax
%Double check the following function
NO3_Adjustment_BO=((NO3_Influent./NO3_max_inhibit_BO.*NO3_reduction_ClO4_BO)); %The amount of activity attributed to nitrate activity
Vmax_ClO4_Adjusted_NO3_Temp_OB=Vmax_ClO4_Adjusted_Temp_BO-(NO3_Adjustment_BO.*Vmax_ratio_temp); %Perchlorate reducing activity adjusted for prescence of nitrate
v_reactor_BO_2=(Km_Perchlorate_BO.*(log(ClO4_Influent_02)-log(ClO4_Effluent_2))+(ClO4_Influent_02-ClO4_Effluent_2))/HRT_BO; %the reactor rate required to treat perchlorate down to the desired level in umole/min
Biocatalyst_Dosing_BO=v_reactor_BO_2./Vmax_ClO4_Adjusted_NO3_Temp_OB; %Biocatalyst Dosing Rate in ug of Molybdenum per 1L of treated water
Volume_Dosing_BO=Biocatalyst_Dosing_BO./L_ug_BO; %The volume of biocatalyst solution to treat 1L of water in L
Production_Media_Required_L_DW_BO_2=Volume_Dosing_BO./Yield_BO; %Production Media Volume (L) required to treat 1L of drinking water

