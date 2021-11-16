DV_UP_Conversions

%Biocatalyst Production Tank Empty (BPTE)
Hdf_BPTE=3.02*L_BPT.^1.85.*C_BPT.^-1.85.*D_BPT.^-1.17;
Hss_BPTE=H_BPT/2; %Suction Static Head
Hts_BPTE=Hss_BPTE; % Total Static Head for Biocatalyst Production
TDH_BPTE=Hts_BPTE+Hdf_BPTE+TMP_BPTE; %Total Dynamic Head for Biocatalyst Production with Transmembrane Pressure to account for harvesting
Q_BPTE=pi*(D_BPT/2).^2.*C_BPT*cuft_gal/sec_min; %Flow rate of the system based on diameter of the pipe and water velocity as gal/min
BHP_BPTE=Q_BPTE.*TDH_BPTE./(HP_gal_min_ft*Pump_Eff); %Brake Horsepower to drive a pump for water with an efficiency of 80%
P_BPTE=0.746*BHP_BPTE./(Motor_Pump_Eff); %Power (kW) required for motor to operate pump with motor efficiency at 70%
T_BPTE=1./(gallon_liter*Q_BPTE)*min_hrs; %Time to fill 1L into the tank in hours
E_BPTE=P_BPTE.*T_BPTE; %Work (kWhr) to move 1L of media into the tank