DV_UP_Conversions

%Catalyst Re Pd/AC Production Tank Mixing (CPTM_RePdAC)
P_CPTM_RePdAC=G_CPTM_RePdAC.^2*u_water_30*L_m3; %Power (J/s or W) to mix 1L. 1L is given in m3 (.001) to maintain units
E_CPTM_RePdAC=P_CPTM_RePdAC*W_kW.*T_CP_Mix_Hr_RePdAC; %Energy (kWhr) to mix 1 liter in reactor for five hours 