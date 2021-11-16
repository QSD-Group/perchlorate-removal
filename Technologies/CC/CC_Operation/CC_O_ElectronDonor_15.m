DV_UP_Conversions
CC_O_Catalyst_15

load('ClO4_Influent_15.mat')
ClO4_Influent=ClO4_Influent_15/99.45; %conversion of perchlorate into uM

load('NO3_Influent_10000.mat')
NO3_Influent=NO3_Influent_10000/62.0049; %conversion of nitrate into mM

ElectronDonor_O2_CO=O2_Influent*electron_eq_O2/electron_eq_H2; %Concentration of electron donor (mmole/L) to remove oxygen from 1L of treated water
ElectronDonor_ClO4_CO=umole_mmole*(ClO4_Influent-ClO4_Effluent_15)*electron_eq_ClO4/electron_eq_H2; %Concentration of electron donor (mmole/L) to remove perchlorate 
ElectronDonor_NO3_CO=NO3_Influent*electron_eq_NO3/electron_eq_H2; %Concentration of electron donor (mmole/L) to remove nitrate from 1L of treated water
Total_ElectronDonor_CO=ElectronDonor_O2_CO+ElectronDonor_ClO4_CO+ElectronDonor_NO3_CO; %total electron donor (mmole/L acetate) to remove oxygen, treat perchlorate and nitrate treatment

