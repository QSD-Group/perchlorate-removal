%% DETERMINES THE NUMBER OF TANKS AND TANK SIZING FOR WHOLE CELL BIOLOGICAL DEGRADATION

%Tank Numbers and Sizing

%% INITIATE THE START OF INPUTS FOR THE MASTER WORKSHEET
DV_UP_Conversions


%% TANK SIZE AND NUMBERING
V_WCC_Tank=T_WCC_Fill*Flow_Rate_Facility_Min; 
%Volume of reactor (L) 
T_WCC_Empty=T_WCC_Fill; 
%Tank fill time and empty (min) are the same
T_WCC_Total_Cycle=HRT_WCO+T_WCC_Fill+T_WCC_Empty; 
%Total time (min) for full treatment cycle
Treatment_Cycles_Tank_WCC=1440/T_WCC_Total_Cycle; 
%Number of Treatment Cycles per Day for each tank
Treatment_Time_Tank_WCC=T_WCC_Fill*Treatment_Cycles_Tank_WCC; 
%Total treatment time (min) per tank in one day
Number_Tanks_WCC=1440/Treatment_Time_Tank_WCC; 
%Total Number of Tanks Required to treat facility flow rate
r_WCC_Tank=((V_WCC_Tank*L_m3)./(h_to_r_ratio_WCC*pi)).^(1/3); 
%computes the radius(m) of the reactor assuming a fixed ratio for radius and height of the reactor
h_WC_C_Tank=h_to_r_ratio_WCC.*r_WCC_Tank; 
%The ratio of the height of the tank to the radius of the tank (m)
SA_WC_C_Tank=2*pi*r_WCC_Tank.*h_WC_C_Tank+2*pi*(r_WCC_Tank).^2; 
%surface area of tank (m2) including the top and bottom equation SA=2pi*r*h+2pi*r^2

%Volume of Concrete
r_WCC_Tank_Outer=r_WCC_Tank+D_WCC_Tank_Wall; 
%The outer radius of the tank assuming 1ft thick walls
V_WCC_concrete_tank_wall=h_WC_C_Tank*pi.*((r_WCC_Tank_Outer.^2)-(r_WCC_Tank.^2)); 
%The wall volume (m3) of concrete for the reactors
V_WCC_concrete_top_bottom_tank=2*pi*(r_WCC_Tank_Outer.^2).*H_WCC_Tank_Top_Bottom; 
%Volume (m3) of the top and bottom of the reactor
V_WCC_Concrete_Total=V_WCC_concrete_tank_wall+V_WCC_concrete_top_bottom_tank; 
%total volume (m3) of concrete for one tank
V_WCC_Concrete_Total_AllTanks=(Number_Tanks_WCC+extra_tank)*V_WCC_Concrete_Total; 
%total volume (m3) of concrete for all reactors

%Mass of Reinforcing Steel - Simple Equation - Go to WCC_Impacts_Costs for calculation


