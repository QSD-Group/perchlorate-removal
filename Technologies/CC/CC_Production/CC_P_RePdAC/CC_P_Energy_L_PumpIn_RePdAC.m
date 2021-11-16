DV_UP_Conversions

%Catalyst RePdAC Production Tank Fill (CPTF_RePdAC)- note, tank sizing is assumed similar for both catalyst production
Hdf_CPTF_PdAC=3.02*L_CPT_PdAC.^1.85.*C_CPT_PdAC.^-1.85.*D_CPT_PdAC.^-1.17;
Hds_CPTF_PdAC=H_CPT/2; %Discharge Static Head
Hts_CPTF_PdAC=Hds_CPTF_PdAC; % Total Static Head for Catalyst Production
TDH_CPTF_PdAC=Hts_CPTF_PdAC+Hdf_CPTF_PdAC; %Total Dynamic Head for Catalyst Production
Q_CPTF_PdAC=pi*(D_CPT_PdAC/2).^2.*C_CPT_PdAC*cuft_gal/sec_min; %Flow rate of the system based on diameter of the pipe and water velocity as gal/min
BHP_CPTF_PdAC=Q_CPTF_PdAC.*TDH_CPTF_PdAC./(HP_gal_min_ft*Pump_Eff); %Brake Horsepower to drive a pump for water with an efficiency of 80%
P_CPTF_PdAC=HP_kW*BHP_CPTF_PdAC./(Motor_Pump_Eff); %Power (kW) required for motor to operate pump with motor efficiency at 70%
T_CPTF_RePdAC=1./(gallon_liter*Q_CPTF_PdAC)*min_hrs; %Time to fill 1L into the tank in hours
E_CPTF_RePdAC=P_CPTF_PdAC.*T_CPTF_RePdAC; %Work (kWhr) to move 1L of media into the tank
