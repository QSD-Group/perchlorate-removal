DV_UP_Conversions
BC_C_Tank_Number_Sizing

%Biocatalyst Operation Tank Mixing (BOTM)
P_BOTM=G_BOTM.^2*u_water_30*L_m3; %Power (J/s or W) to mix 1L 
E_BOTM=P_BOTM.*W_kW*HRT_BO*min_hr; %Energy (kWhr) to mix 1 liter in reactor for the HRT - HRT is given in min and must be converted to hours

%Biocatalyst Operation Tank Fill (BOTF)
Hdf_BOTF=3.02*L_BOT.^1.85.*C_BOT.^-1.85.*D_BOT.^-1.17;  %BOT Values are set based on facility flow
Hds_BOTF=h_B_C_Tank/2; %Discharge Static Head
Hts_BOTF=Hds_BOTF; % Total Static Head for Biocatalyst Operation
TDH_BOTF=Hts_BOTF+Hdf_BOTF; %Total Dynamic Head for Biocatalyst Operation
BHP_BOTF=Flow_Rate_Facility_Gal_Min.*TDH_BOTF./(HP_gal_min_ft.*Pump_Eff); %Brake Horsepower to drive a pump for water with an efficiency of 80%
P_BOTF=HP_kW*BHP_BOTF./(Motor_Pump_Eff); %Power (kW) required for motor to operate pump with motor efficiency at 70%
T_BOTF=1/(gallon_liter*Flow_Rate_Facility_Gal_Min/min_hrs); %Time to fill 1L into the tank in hours
E_BOTF=P_BOTF*T_BOTF; %Work (kWhr) to move 1L of media into the tank

%Biocatalyst Operation Tank Empty (BOTE)
Hdf_BOTE=3.02*L_BOT.^1.85.*C_BOT.^-1.85.*D_BOT.^-1.17;
Hds_BOTE=h_B_C_Tank/2; %Discharge Static Head
Hts_BOTE=Hds_BOTE; % Total Static Head for Biocatalyst Operation
TDH_BOTE=Hts_BOTE+Hdf_BOTE; %Total Dynamic Head for Biocatalyst Operation
BHP_BOTE=Flow_Rate_Facility_Gal_Min*TDH_BOTE./(HP_gal_min_ft*Pump_Eff); %Brake Horsepower to drive a pump for water with an efficiency of 80%
P_BOTE=HP_kW*BHP_BOTE./(Motor_Pump_Eff); %Power (kW) required for motor to operate pump with motor efficiency at 70%
T_BOTE=1/(gallon_liter*Flow_Rate_Facility_Gal_Min/min_hrs); %Time to fill 1L into the tank in hours
E_BOTE=P_BOTE*T_BOTE; %Work (kWhr) to move 1L of media into the tank

%Biocatalyst Operation Tank Aeration (BOTA)Power to aerate 1L of drinking
%water to 6mg/L
E_BOTA=6/1000/1000./SAE; 
%standard aeration efficiency - uniform distribution from 0.5 to 4.5
%kgO2/kWhr - per Crittendon Chapter 14.

%EBOT_NoAeration=(E_BOTM+E_BOTF+E_BOTE);
EBOT=(E_BOTM+E_BOTF+E_BOTE+E_BOTA); %Total Energy required for biocatalyst operation for 1 L of water

