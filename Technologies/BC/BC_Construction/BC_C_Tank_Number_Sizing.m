%% DETERMINES THE NUMBER OF TANKS AND TANK SIZING

%% INITIATE THE START OF INPUTS FOR THE MASTER WORKSHEET
DV_UP_Conversions

%% TANK SIZE AND NUMBERING
V_BC_Tank=T_BC_Fill*Flow_Rate_Facility_Min; %Volume of reactor (L) determined
%from the time to fill and the flow rate of the facility
T_BC_Empty=T_BC_Fill; %Tank fill time and empty (min) are the same
T_BC_Total_Cycle=HRT_BO+T_BC_Fill+T_BC_Empty; 
%Total time (min) for full treatment cycle
Treatment_Cycles_Tank_BC=1440/T_BC_Total_Cycle; 
%Number of Treatment Cycles per Day for each tank
Treatment_Time_Tank_BC=T_BC_Fill*Treatment_Cycles_Tank_BC; 
%Total treatment time (min) per tank in one day
Number_Tanks_BC=1440/Treatment_Time_Tank_BC; 
%Total Number of Tanks Required to treat facility flow rate
r_BC_Tank=((V_BC_Tank*L_m3)./(h_to_r_ratio*pi)).^(1/3); 
%computes the radius(m) of the reactor assuming a fixed ratio for radius 
%and height of the reactor
h_B_C_Tank=h_to_r_ratio.*r_BC_Tank; 
%The ratio of the height of the tank to the radius of the tank (m)
SA_BC_C_Tank=2*pi*r_BC_Tank.*h_B_C_Tank+2*pi*(r_BC_Tank).^2; 
%surface area of tank (m2) including the top and bottom equation SA=2pi*r*h+2pi*r^2

%Volume of Concrete
r_BC_Tank_Outer=r_BC_Tank+D_BC_Tank_Wall; 
%The outer radius of the tank assuming 1ft thick walls
V_BC_concrete_tank_wall=h_B_C_Tank*pi.*((r_BC_Tank_Outer.^2)-(r_BC_Tank.^2)); 
%The wall volume (m3) of concrete for the reactors
V_BC_concrete_top_bottom_tank=2*pi*(r_BC_Tank_Outer.^2).*H_BC_Tank_Top_Bottom; 
%Volume (m3) of the top and bottom of the reactor
V_BC_Concrete_Total=V_BC_concrete_tank_wall+V_BC_concrete_top_bottom_tank; 
%total volume (m3) of concrete for one tank
V_BC_Concrete_Total_AllTanks=(Number_Tanks_BC+extra_tank)*V_BC_Concrete_Total; 
%total volume (m3) of concrete for all reactors

%Mass of Reinforcing Steel - Simple Equation - Go to BC_Impacts_Costs for calculation


