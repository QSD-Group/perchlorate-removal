DV_UP_Conversions

%Catalyst Production Heating for Instream (CPHI_PdAC)to produce the palladium/AC
deltaT_CPHI_PdAC=T_CPH_P_PdAC-T_CPHI_IN; %temperature difference between influent and operating temperature (C)
E_CPHI_PdAC=c_water*kg_L_water*deltaT_CPHI_PdAC.*(1-H_Ex)*joule_kWhr; %The energy (kWhr) to heat water per liter for production