DV_UP_Conversions


%Biocatalyst Production Tank Fill (BPTF)

Hdf_BPTF=3.02*L_BPT.^1.85.*C_BPT.^-1.85.*D_BPT.^-1.17;
Hds_BPTF=H_BPT/2; %Discharge Static Head
Hts_BPTF=Hds_BPTF; % Total Static Head for Biocatalyst Production
TDH_BPTF=Hts_BPTF+Hdf_BPTF; %Total Dynamic Head for Biocatalyst Production
Q_BPTF=pi*(D_BPT/2).^2.*C_BPT*cuft_gal/sec_min; %Flow rate of the system based on diameter of the pipe and water velocity as gal/min
BHP_BPTF=Q_BPTF.*TDH_BPTF./(HP_gal_min_ft*Pump_Eff); %Brake Horsepower to drive a pump for water with an efficiency of 80%
P_BPTF=HP_kW*BHP_BPTF./(Motor_Pump_Eff); %Power (kW) required for motor to operate pump with motor efficiency at 70%
T_BPTF=1./(gallon_liter*Q_BPTF)*min_hrs; %Time to fill 1L into the tank in hours
E_BPTF=P_BPTF.*T_BPTF; %Work (kWhr) to move 1L of media into the tank
