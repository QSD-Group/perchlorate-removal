DV_UP_Conversions


%Biocatalyst Production Heating to Maintain Temperature (BPHM)

deltaT_BPHM=T_BPH_P-T_BPH_AMB; %temperature differnce (C) between reactor temperature and the facility ambient temperature
P_BPHM=(2*pi*H_BPT.*k_BPHM_INS.*deltaT_BPHM./log(r_BPHM_INS./r_BPT_m))+2*(deltaT_BPHM.*k_BPHM_INS*pi.*(r_BPT_m.^2)./t_BPHM_INS); %Heat Loss (W) from heating tank - corresponds to the power required to maintain the heat)
E_BPHM=P_BPHM*W_kW.*T_BP_INC_HR/V_BPT_L; %Energy (kWhr) to maintain in tank for production