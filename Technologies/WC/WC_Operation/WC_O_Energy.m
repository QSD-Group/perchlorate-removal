DV_UP_Conversions
WC_C_Tank_Number_Sizing

%Whole Cell Operation Tank Mixing (WCOTM)
P_WCOTM=G_WCOTM.^2*u_water_30*L_m3; %Power (J/s or W) to mix 1L 
E_WCOTM=P_WCOTM*W_kW*HRT_WCO*min_hr; %Energy (kWhr) to mix 1 liter in reactor for the HRT - HRT is given in min and must be converted to hours

%Whole Cell Operation Tank Fill (WCOTF)
Hdf_WCOTF=3.02*L_WCOT.^1.85.*C_WCOT.^-1.85.*D_WCOT.^-1.17;  %BOT Values are set based on facility flow
Hds_WCOTF=h_WC_C_Tank/2; %Discharge Static Head
Hts_WCOTF=Hds_WCOTF; % Total Static Head for Biocatalyst Operation
TDH_WCOTF=Hts_WCOTF+Hdf_WCOTF; %Total Dynamic Head for Biocatalyst Operation
BHP_WCOTF=Flow_Rate_Facility_Gal_Min*TDH_WCOTF./(HP_gal_min_ft*Pump_Eff); %Brake Horsepower to drive a pump for water with an efficiency of 80%
P_WCOTF=HP_kW*BHP_WCOTF./(Motor_Pump_Eff); %Power (kW) required for motor to operate pump with motor efficiency at 70%
T_WCOTF=1/(gallon_liter*Flow_Rate_Facility_Gal_Min/min_hrs); %Time to fill 1L into the tank in hours
E_WCOTF=P_WCOTF.*T_WCOTF; %Work (kWhr) to move 1L of media into the tank

DV_UP_Conversions

%Whole Cell Operation Tank Empty (WCOTE)
Hdf_WCOTE=3.02*L_WCOT.^1.85.*C_WCOT.^-1.85.*D_WCOT.^-1.17;
Hds_WCOTE=h_WC_C_Tank/2; %Discharge Static Head
Hts_WCOTE=Hds_WCOTE; % Total Static Head for Biocatalyst Operation
TDH_WCOTE=Hts_WCOTE+Hdf_WCOTE; %Total Dynamic Head for Biocatalyst Operation
BHP_WCOTE=Flow_Rate_Facility_Gal_Min*TDH_WCOTE./(HP_gal_min_ft*Pump_Eff); %Brake Horsepower to drive a pump for water with an efficiency of 80%
P_WCOTE=HP_kW*BHP_WCOTE./(Motor_Pump_Eff); %Power (kW) required for motor to operate pump with motor efficiency at 70%
T_WCOTE=1/(gallon_liter*Flow_Rate_Facility_Gal_Min/min_hrs); %Time to fill 1L into the tank in hours
E_WCOTE=P_WCOTE.*T_WCOTE; %Work (kWhr) to move 1L of media into the tank

% %Biocatalyst Operation Tank Aeration (BOTA) - Takes from biocatalysts
% P_HP_BOTA=((Weight_Flow_Air_lb_s*R_english*Temp_Influent_F_Abs./(n*550*Pump_Eff))*(((p_out_p_in)^0.283)-1)); 
% P_BOTA=P_HP_BOTA*HP_kW;
% %aeration power to reaerate the tank - units of kW - 29.7 is a fixed value
% 
% E_BOTA=P_BOTA.*T_BOTA; %Energy (kWhr) to reaerate tank

E_WCOTA=6/1000/1000./SAE; 
%standard aeration efficiency - uniform distribution from 0.5 to 4.5
%kgO2/kWhr - per Crittendon Chapter 14.

EWCOT=(E_WCOTM+E_WCOTF+E_WCOTE+E_WCOTA);
% EWCOT_NoAeration=(E_WCOTM+E_WCOTF+E_WCOTE);

%EWCOT=(E_WCOTM+E_WCOTF+E_WCOTE+E_BOTA); %Total Energy required for biocatalyst operation for 1 L of water

