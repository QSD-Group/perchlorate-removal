DV_UP_Conversions

%Catalyst Production Heating to dry the rhenium palladium/AC (CPHD_RePdAC)to get to 105C 
deltaT_CPHD_RePdAC=T_CPHD_P_RePdAC-T_CPH_AMB; %temperature difference heat for drying and the residual heat of the catalysts from the production(C)
E_CPHD_RePdAC_105=c_air_80_110*Yield_C_RePdAC.*deltaT_CPHD_RePdAC.*(1-H_Ex)*joule_kWhr; %The energy (kWhr) to dry catalyst from 1 liter of production

%Catalyst Production Heating to Maintain Temperature (CPHMD_RePdAC_105)to dry rhenium palladium/AC at 105C
deltaT_CPHDM_RePdAC=T_CPHD_P_RePdAC-T_CPH_AMB; %temperature differnce (C) between reactor temperature and the facility ambient temperature
P_CPHMD_RePdAC=deltaT_CPHDM_RePdAC.*k_CPHM_INS*SA_Oven./t_CPHM_INS; %Heat Loss (W) from heating tank - corresponds to the power required to maintain the heat)
E_CPHMD_RePdAC_105=P_CPHMD_RePdAC*W_kW.*T_CP_INC_HR_105./V_CPT_L; %Energy (kWhr) to maintain heat in oven. The energy is spread over a liter of production from tank

