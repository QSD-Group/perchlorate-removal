%% DETERMINES THE NUMBER OF TANKS AND TANK SIZING FOR CHEMICAL CATALYSTS

%% INITIATE THE START OF INPUTS FOR THE MASTER WORKSHEET
DV_UP_Conversions


%Tank Size and Numbering
V_CC_Tank=T_CC_Fill*Flow_Rate_Facility_Min; %Volume of reactor (L) determined
%from the time to fill and the flow rate of the facility
T_CC_Empty=T_CC_Fill; %Tank fill time and empty (min) are the same
T_CC_Total_Cycle=HRT_CCO+T_CC_Fill+T_CC_Empty; 
%Total time (min) for full treatment cycle
Treatment_Cycles_Tank_CC=1440/T_CC_Total_Cycle; 
%Number of Treatment Cycles per Day for each tank
Treatment_Time_Tank_CC=T_CC_Fill*Treatment_Cycles_Tank_CC; 
%Total treatment time (min) per tank in one day
Number_Tanks_CC=1440/Treatment_Time_Tank_CC; 
%Total Number of Tanks Required to treat facility flow rate
r_CC_Tank=((V_CC_Tank*L_m3)./(h_to_r_ratio*pi)).^(1/3); 
%computes the radius(m) of the reactor assuming a fixed ratio for radius 
%and height of the reactor
h_C_C_Tank=h_to_r_ratio_CC.*r_CC_Tank; 
%The ratio of the height of the tank to the radius of the tank (m)
SA_CC_C_Tank=2*pi*r_CC_Tank.*h_C_C_Tank+2*pi*(r_CC_Tank).^2; 
%surface area of tank (m2) including the top and bottom equation SA=2pi*r*h+2pi*r^2

%Volume of Concrete
r_CC_Tank_Outer=r_CC_Tank+D_CC_Tank_Wall; 
%The outer radius of the tank assuming 1ft thick walls
V_CC_concrete_tank_wall=h_C_C_Tank*pi.*((r_CC_Tank_Outer.^2)-(r_CC_Tank.^2)); 
%The wall volume (m3) of concrete for the reactors
V_CC_concrete_top_bottom_tank=2*pi*(r_CC_Tank_Outer.^2).*H_CC_Tank_Top_Bottom; 
%Volume (m3) of the top and bottom of the reactor
V_CC_Concrete_Total=V_CC_concrete_tank_wall+V_CC_concrete_top_bottom_tank; 
%Total volume (m3) of concrete for one tank
V_CC_Concrete_Total_AllTanks=(Number_Tanks_CC+extra_tank).*V_CC_Concrete_Total; 
%Total volume (m3) of concrete for all reactors

%Mass of Reinforcing Steel - Simple Equation - Go to BC_Impacts_Costs for calculation