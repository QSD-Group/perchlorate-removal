DV_UP_Conversions


%Biocatalyst Production Tank Mixing (BPTM)
P_BPTM=G_BPTM.^2*u_water_30*L_m3; %Power (J/s or W) to mix 1L. 1L is given in m3 (.001) to maintain units
E_BPTM=P_BPTM*W_kW.*T_BP_INC_HR; %Energy (kWhr) to mix 1 liter in reactor for two days 