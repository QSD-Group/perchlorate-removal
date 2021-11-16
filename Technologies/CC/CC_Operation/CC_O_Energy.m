DV_UP_Conversions
CC_C_Tank_Number_Sizing

%Catalyst Operation Tank Mixing (COTM)
P_COTM=G_COTM.^2*u_water_30*L_m3; %Power (J/s or W) to mix 1L 
E_COTM=P_COTM*W_kW*HRT_CCO*min_hr; %Energy (kWhr) to mix 1 liter in reactor for the HRT - HRT is given in min and must be converted to hours

%Catalyst Operation Tank Fill (COTF)
Hdf_COTF=3.02*L_COT.^1.85.*C_COT.^-1.85.*D_COT.^-1.17;  %BOT Values are set based on facility flow
Hds_COTF=h_C_C_Tank/2; %Discharge Static Head
Hts_COTF=Hds_COTF; % Total Static Head for Catalyst Operation
TDH_COTF=Hts_COTF+Hdf_COTF; %Total Dynamic Head for Catalyst Operation
BHP_COTF=Flow_Rate_Facility_Gal_Min*TDH_COTF./(HP_gal_min_ft*Pump_Eff); %Brake Horsepower to drive a pump for water with an efficiency of 80%
P_COTF=HP_kW*BHP_COTF./(Motor_Pump_Eff); %Power (kW) required for motor to operate pump with motor efficiency at 70%
T_COTF=1/(gallon_liter*Flow_Rate_Facility_Gal_Min/min_hrs); %Time to fill 1L into the tank in hours
E_COTF=P_COTF*T_COTF; %Work (kWhr) to move 1L of media into the tank

DV_UP_Conversions

%Catalyst Operation Tank Empty (COTE)
Hdf_COTE=3.02*L_COT.^1.85.*C_COT.^-1.85.*D_COT.^-1.17;
Hds_COTE=h_C_C_Tank/2; %Discharge Static Head
Hts_COTE=Hds_COTE; % Total Static Head for Catalyst Operation
TDH_COTE=Hts_COTE+Hdf_COTE; %Total Dynamic Head for Catalyst Operation
BHP_COTE=Flow_Rate_Facility_Gal_Min*TDH_COTE./(HP_gal_min_ft*Pump_Eff); %Brake Horsepower to drive a pump for water with an efficiency of 80%
P_COTE=HP_kW*BHP_COTE./(Motor_Pump_Eff); %Power (kW) required for motor to operate pump with motor efficiency at 70%
T_COTE=1/(gallon_liter*Flow_Rate_Facility_Gal_Min/min_hrs); %Time to fill 1L into the tank in hours
E_COTE=P_COTE*T_COTE; %Work (kWhr) to move 1L of media into the tank

% %Catalyst Operation Tank Aeration (COTA)
% P_HP_COTA=((Weight_Flow_Air_lb_s*R_english*Temp_Influent_F_Abs./(n*550*Pump_Eff))*(((p_out_p_in)^0.283)-1)); 
% P_COTA=P_HP_COTA*HP_kW;

%old formula doesn't seem quite right 
%P_COTA=((Weight_Flow_Air*R.*Temp_Influent./(n*29.7*Pump_Eff))*(((p_out/p_in)^0.283)-1)); 
%aeration power to reaerate the tank - units of kW - 29.7 is a fixed value
% E_COTA=P_COTA.*T_COTA; %Energy (kWhr) to reaerate tank

%Biocatalyst Operation Tank Aeration (BOTA)Power to aerate 1L of drinking
%water to 6mg/L
E_COTA=6/1000/1000./SAE; 
%standard aeration efficiency - uniform distribution from 0.5 to 4.5
%kgO2/kWhr - per Crittendon Chapter 14.

ECOT=(E_COTM+E_COTF+E_COTE+E_COTA); %Total Energy required for Catalyst operation for 1 L of water
% ECOT_NoAeration=(E_COTM+E_COTF+E_COTE);
