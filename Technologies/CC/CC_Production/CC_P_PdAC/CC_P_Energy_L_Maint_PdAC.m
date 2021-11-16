DV_UP_Conversions

%Catalyst Production Heating to Maintain Temperature (CPHM)to produce the Palladium/AC

deltaT_CPHM_PdAC=T_CPH_P_PdAC-T_CPH_AMB; %temperature differnce (C) between reactor temperature and the facility ambient temperature
P_CPHM_PdAC=(2*pi*H_CPT.*k_CPHM_INS.*deltaT_CPHM_PdAC./log(r_CPHM_INS./r_CPT_m))+2*(deltaT_CPHM_PdAC.*k_CPHM_INS*pi.*(r_CPT_m.^2)./t_CPHM_INS); %Heat Loss (W) from heating tank - corresponds to the power required to maintain the heat)
E_CPHM_PdAC=P_CPHM_PdAC*W_kW.*T_CP_INC_HR_PdAC./V_CPT_L; %Energy (kWhr) to maintain in tank for production