DV_UP_Conversions

%Catalyst Production Tank Empty (CPTE_PdAC)
Hdf_CPTE_PdAC=3.02*L_CPT_PdAC.^1.85.*C_CPT_PdAC.^-1.85.*D_CPT_PdAC.^-1.17;
Hss_CPTE_PdAC=H_CPT/2; %Suction Static Head
Hts_CPTE_PdAC=Hss_CPTE_PdAC; % Total Static Head for Catalyst Production
TDH_CPTE_PdAC=Hts_CPTE_PdAC+Hdf_CPTE_PdAC+TMP_CPTE_PdAC; %Total Dynamic Head for Catalyst Production with Transmembrane Pressure to account for harvesting
Q_CPTE_PdAC=pi*(D_CPT_PdAC/2).^2.*C_CPT_PdAC*cuft_gal/sec_min; %Flow rate of the system based on diameter of the pipe and water velocity as gal/min
BHP_CPTE_PdAC=Q_CPTE_PdAC.*TDH_CPTE_PdAC./(HP_gal_min_ft*Pump_Eff); %Brake Horsepower to drive a pump for water with an efficiency of 80%
P_CPTE_PdAC=0.746*BHP_CPTE_PdAC./(Motor_Pump_Eff); %Power (kW) required for motor to operate pump with motor efficiency at 70%
T_CPTE_PdAC=1./(gallon_liter*Q_CPTE_PdAC)*min_hrs; %Time to fill 1L into the tank in hours
E_CPTE_PdAC=P_CPTE_PdAC.*T_CPTE_PdAC; %Work (kWhr) to move 1L of media into the tank