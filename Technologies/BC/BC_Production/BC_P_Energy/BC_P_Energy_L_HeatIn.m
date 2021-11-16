DV_UP_Conversions


%Biocatalyst Production Heating for Instream (BPHI)
deltaT_BPHI=T_BPH_P-T_BPHI_IN; %temperature difference between influent and operating temperature (C)
E_BPHI=c_water*kg_L_water*deltaT_BPHI.*(1-H_Ex)*joule_kWhr; %The energy (kWhr) to heat water per liter for media production