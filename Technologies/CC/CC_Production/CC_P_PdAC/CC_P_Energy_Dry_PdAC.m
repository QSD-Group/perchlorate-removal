DV_UP_Conversions

%Catalyst Production Heating to dry the palladium/AC (CPHD_PdAC)to get to 110C 
deltaT_CPHD_PdAC=T_CPHD_P_PdAC-T_CPH_P_PdAC; %temperature difference heat for drying and the residual heat of the catalysts from the production(C)
E_CPHD_PdAC_110=c_air_80_110*Yield_C_PdAC.*deltaT_CPHD_PdAC.*(1-H_Ex)*joule_kWhr; %The energy (kWhr) to dry catalyst from 1 liter of production

%Catalyst Production Heating to Maintain Temperature (CPHMD_PdAC_110)to dry palladium/AC at 110C
deltaT_CPHDM_PdAC=T_CPHD_P_PdAC-T_CPH_AMB; %temperature differnce (C) between reactor temperature and the facility ambient temperature
P_CPHMD_PdAC=deltaT_CPHDM_PdAC.*k_CPHM_INS*SA_Oven./t_CPHM_INS; %Heat Loss (W) from heating tank - corresponds to the power required to maintain the heat)
E_CPHMD_PdAC_110=P_CPHMD_PdAC*W_kW.*T_CP_INC_HR_110./V_CPT_L; %Energy (kWhr) to maintain heat in oven. The energy is spread over a liter of production from tank

%Catalyst Production Heating to dry the palladium/AC (CPHD_PdAC_250) to get to 250C
deltaT_CPHD_PdAC_250=T_CPHD_P_PdAC_250-T_CPHD_P_PdAC; %temperature differnce heat for drying the PdAC
E_CPHD_PdAC_250=c_air_110_250*Yield_C_PdAC.*deltaT_CPHD_PdAC_250.*(1-H_Ex)*joule_kWhr; 

%Catalyst Production Heating to Maintain Temperature (CPHMD_PdAC_250) to dry palladium/AC at 250C
deltaT_CPHDM_PdAC_250=T_CPHD_P_PdAC_250-T_CPHD_P_PdAC; %temperature differnce heat for drying the PdAC at 250C
P_CPHMD_PdAC_250=deltaT_CPHDM_PdAC_250.*k_CPHM_INS*SA_Oven./t_CPHM_INS; %Heat Loss (W) from heating tank - corresponds to the power required to maintain the heatat 250C
E_CPHMD_PdAC_250=P_CPHMD_PdAC_250*W_kW.*T_CP_INC_HR_250./V_CPT_L; %Energy (kWhr) to maintain heat in oven. The energy is spread over a liter of production from tank