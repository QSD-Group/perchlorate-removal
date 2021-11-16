DV_UP_Conversions

%Catalyst Pd/AC Production Tank Mixing (CPTM_PdAC)
P_CPTM_PdAC=G_CPTM_PdAC.^2*u_water_30*L_m3; %Power (J/s or W) to mix 1L. 1L is given in m3 (.001) to maintain units
E_CPTM_PdAC=P_CPTM_PdAC*W_kW.*T_CP_INC_HR_PdAC; %Energy (kWhr) to mix 1 liter in reactor for 5 minutes