DV_UP_Conversions

load('ClO4_Influent_10000_10.mat')
ClO4_Influent=ClO4_Influent_10000_10/99.45; %conversion of perchlorate into uM

load('NO3_Influent_10000.mat')
NO3_Influent=NO3_Influent_10000/62.0049; %conversion of nitrate into mM


ElectronDonor_O2_WCO=O2_Influent*electron_eq_O2/electron_eq_Acetate; 
%Concentration of electron donor (mmole/L) to remove oxygen from 1L of treated water
ElectronDonor_ClO4_WCO=umole_mmole*(ClO4_Influent-ClO4_Effluent)*electron_eq_ClO4/electron_eq_Acetate; 
%Concentration of electron donor (mmole/L) to remove perchlorate 
ElectronDonor_NO3_WCO=NO3_Influent*electron_eq_NO3/electron_eq_Acetate; 
%Concentration of electron donor (mmole/L) to remove nitrate

f_s_ClO4=Y_perchlorate_acetate/gCOD_acetate*gCOD_gcell; 
%fraction of electron donor required for cell growth on perchlorate
f_s_NO3=Y_nitrate_acetate/gCOD_acetate*gCOD_gcell; 
%fraction of electron donor required for cell growth on nitrate
f_s_O2=Y_oxygen_acetate/gCOD_acetate*gCOD_gcell; 
%fraction of electron donor required for cell growth on oxygen

Total_ElectronDonor_WCO=ElectronDonor_O2_WCO./(1-f_s_O2)...
+ElectronDonor_ClO4_WCO./(1-f_s_ClO4)+ElectronDonor_NO3_WCO...
./(1-f_s_NO3); 
%Total electron donor (mM) required to reduce electron acceptors including cell growth
