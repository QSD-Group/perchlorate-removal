%Concentration of anions in water based on USGS data collected from 
%http://nwis.waterdata.usgu.gov/usa/nwis/qwdata

%values tabulated in excel file 'California Distribution'

%% Perchlorate Concentrations
%Reports perchlorate concentrations above 10 ug/L for treatment. Values
%obtained from USGS database and include all measurements for perchlorate
ClO4_10ug_1000=[10;10.1;11;11;11;12;12;12;12;12;13;13;14;14;14;16;17;17;17;18;18;19;19;19;20;20;20;20;20;20;20;20;20;22;22;23;26;27;27;28;29;31;32;33;36;37;38;45;45;49;49;50;51;52;54;87;110;200;210;230;250;260;280;340;440;1200;2100];
ClO4_Influent_10_1000=lhs_empir(ClO4_10ug_1000,1000);

%Reports perchlorate concentrations above 6 ug/L for treatment.
ClO4_6ug_1000=[6.23;6.3;6.3;6.37;6.7;6.9;6.9;7;7.1;7.2;7.2;7.6;7.77;8.27;8.8;8.8;8.86;8.93;9.1;9.1;9.1;9.18;9.7;9.96;10;10.1;11;11;11;12;12;12;12;12;13;13;14;14;14;16;17;17;17;18;18;19;19;19;20;20;20;20;20;20;20;20;20;22;22;23;26;27;27;28;29;31;32;33;36;37;38;45;45;49;49;50;51;52;54;87;110;200;210;230;250;260;280;340;440;1200;2100];
ClO4_Influent_6_1000=lhs_empir(ClO4_6ug_1000,1000);

%Reports perchlorate concentrations above 2 ug/L for treatment.
ClO4_2ug_1000=[2.02;2.04;2.06;2.1;2.1;2.1;2.1;2.1;2.1;2.11;2.13;2.14;2.17;2.18;2.19;2.2;2.2;2.2;2.2;2.22;2.24;2.25;2.3;2.31;2.32;2.32;2.5;2.5;2.5;2.51;2.52;2.54;2.54;2.56;2.57;2.58;2.6;2.6;2.75;2.8;2.8;2.84;2.9;2.95;3.02;3.1;3.18;3.2;3.2;3.3;3.4;3.53;3.59;3.6;3.61;3.62;3.67;3.7;3.9;3.92;3.98;4;4.03;4.1;4.14;4.2;4.22;4.26;4.4;4.53;4.6;4.72;4.72;4.8;4.89;5;5.05;5.1;5.23;5.4;5.6;5.8;5.8;5.8;5.8;6.23;6.3;6.3;6.37;6.7;6.9;6.9;7;7.1;7.2;7.2;7.6;7.77;8.27;8.8;8.8;8.86;8.93;9.1;9.1;9.1;9.18;9.7;9.96;10;10.1;11;11;11;12;12;12;12;12;13;13;14;14;14;16;17;17;17;18;18;19;19;19;20;20;20;20;20;20;20;20;20;22;22;23;26;27;27;28;29;31;32;33;36;37;38;45;45;49;49;50;51;52;54;87;110;200;210;230;250;260;280;340;440;1200;2100];
ClO4_Influent_2_1000=lhs_empir(ClO4_2ug_1000,1000);

%Perchlorate concentrations for all well data available.
ClO4_All_1000=[0.1;6.23;0.1;0.1;1.24;1.5;1.7;0.33;0.25;0.58;0.25;0.28;0.1;1;0.25;4.2;0.5;0.5;1;1.01;1.18;0.93;0.96;0.95;4.72;8.93;8.86;0.59;3.18;0.91;1.57;12;11;9.1;11;6.9;1;1;0.21;1.1;9.18;4.03;8.27;3.02;2.75;0.6;0.83;0.62;10.1;2.17;9.96;1.2;12;6.9;0.28;0.29;3.2;3.61;1.61;9.7;230;210;200;260;110;250;0.55;0.75;0.26;0.19;0.44;0.39;440;280;0.43;3.98;3.7;0.53;0.31;0.31;0.3;0.31;0.59;0.38;0.48;0.29;0.59;0.35;0.31;0.35;2.54;0.12;1.03;0.1;0.1;0.1;1.43;0.42;0.24;0.1;0.67;0.1;0.34;0.1;0.1;0.88;0.33;0.1;0.19;1.65;0.23;3.9;0.1;0.1;0.1;0.38;0.1;0.86;0.99;0.35;0.89;5.23;0.34;0.1;0.15;0.14;1.14;0.25;0.1;0.1;0.26;1.1;0.11;0.1;3.67;0.1;0.1;0.22;0.1;0.1;0.1;0.13;0.12;0.13;0.42;0.61;0.1;0.37;0.1;0.82;0.1;0.35;0.1;0.38;0.53;0.49;0.16;0.1;0.1;1.15;0.13;0.25;0.1;0.37;0.21;0.4;0.35;0.1;1.12;0.1;1.23;0.19;0.77;0.1;1.81;0.1;1.48;0.5;0.29;0.31;0.17;0.92;0.95;0.77;1.9;1.72;0.28;0.72;0.1;0.17;0.28;0.67;0.1;1.12;0.64;0.12;0.1;0.12;0.93;0.1;0.1;0.79;0.1;2.32;0.65;0.61;0.1;0.1;0.29;0.1;0.1;0.22;0.1;0.19;0.3;0.33;0.11;0.66;0.29;0.1;0.1;0.29;0.62;1.29;0.1;0.95;1.31;0.1;0.45;0.51;1.62;0.5;0.5;0.5;0.5;1.95;0.1;0.5;0.56;0.67;0.1;0.13;0.1;0.1;0.1;0.18;0.1;0.17;0.1;0.1;0.1;0.1;0.2;0.26;0.1;0.1;0.26;0.73;0.1;0.1;0.11;0.1;0.1;0.1;0.13;0.1;0.1;0.1;1.63;0.1;0.15;0.1;0.42;0.1;0.16;0.2;29;32;20;17;31;38;26;27;23;20;0.2;2.1;2.52;3.2;4;0.7;0.97;1.41;0.44;12;1.4;0.1;1.38;0.15;0.43;1.4;2.1;2.8;1.8;0.61;0.06;0.2;0.11;0.2;0.2;22;2.2;17;12;18;14;10;14;18;13;12;17;1;0.86;0.95;0.1;0.5;0.93;0.7;0.18;0.21;0.11;0.55;0.1;0.32;1.23;0.1;0.47;0.86;0.1;0.21;0.5;0.1;4.6;5.8;0.2;0.02;0.03;20;27;7;9.1;2.5;2.9;0.07;0.32;9.1;11;3.3;4.1;7.2;2.2;5.1;3.6;0.1;0.23;0.15;0.1;0.1;0.5;0.1;0.1;0.25;0.1;0.33;2.14;0.25;0.74;0.49;2.2;0.25;0.25;0.99;0.5;1.2;1.2;2.5;2.6;1.7;1.3;1;2;1;1;1;1;1;1.7;0.18;0.35;0.1;1;0.5;0.25;1.9;0.9;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.33;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.1;0.5;0.5;0.5;0.5;0.1;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.1;1;0.25;1.29;0.33;0.5;0.28;1.2;1.93;0.5;2.5;4.89;1;1;0.5;1;1;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;4.4;7.77;0.1;2.24;0.19;7.6;0.1;0.1;0.1;0.13;0.11;0.26;0.5;0.1;0.1;0.1;0.1;2.95;2.32;2.6;2.31;0.68;0.73;0.52;0.43;0.65;0.57;0.58;0.51;2.06;0.5;0.5;0.52;0.47;0.47;0.1;0.1;0.9;0.1;0.77;0.1;0.1;0.5;0.47;0.5;0.27;3.92;0.1;0.82;0.1;0.75;19;2;5;0.14;0.1;0.1;0.12;0.1;0.75;0.17;1.67;0.1;0.71;0.26;0.1;0.23;2.1;2.1;5.8;7.1;0.2;0.01;5.4;6.7;0.27;0;0.4;0;0.39;0;0.39;0;0.38;0;0.39;0;0.4;2100;87;2;2;2;2;2;2;0.1;0.1;0.1;0.1;1.11;0.1;0.1;0.31;0.47;1.34;0.78;1.03;0.7;0.1;0.33;0.1;0.77;0.16;0.17;0.1;0.35;1.24;0.31;0.16;0.17;0.1;0.41;0.15;0.73;0.8;0.18;1.76;0.1;0.67;0.1;0.4;0.1;0.1;0.1;0.19;2.8;0.27;0.21;0.1;0.1;0.1;1.65;1.95;0.37;0.22;0.63;0.23;0.1;0.84;0.1;1.84;0.15;0.1;0.22;0.2;0.53;0.12;0.1;0.88;0.1;0.82;0.16;0.17;0.13;0.1;0.16;0.1;0.27;0.91;0.1;0.1;0.21;0.1;0.96;1.22;0.73;0.18;0.1;2.02;0.1;0.1;0.1;1.07;0.48;0.1;1.17;0.19;0.25;0.1;0.1;0.85;0.1;0.1;0.21;0.62;0.18;0.17;0.8;0.58;0.2;0.33;0.37;0.1;1.2;0.28;0.42;0.1;0.1;0.25;0.5;0.6;0.1;0.69;0.1;0.1;0.39;1.73;0.11;0.1;0.26;0.1;0.33;0.1;0.46;0.1;0.12;0.17;0.1;0.1;0.22;0.28;0.1;0.1;1.09;0.1;0.1;0.1;0.1;0.1;0.1;0.35;0.1;0.17;2.11;0.42;0.15;2.84;1.17;6.37;0.72;0.37;0.1;4.14;1.74;0.44;0.91;0.6;0.1;0.1;0.15;0.1;0.1;0.1;0.18;0.11;0.1;0.1;0.1;0.1;0.3;0.42;0.61;0.43;0.48;0.1;0.11;0.1;0.1;0.1;0.2;0.1;0.36;0.4;0.1;0.1;0.1;0.1;0.12;0.28;0.25;0.3;0.21;0.38;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.31;0.1;0.1;0.1;0.1;0.12;0.1;3.53;5.05;0.22;0.99;0.23;0.1;0.55;0.14;0.1;0.27;1.83;0.35;0.3;0.19;0.57;0.1;0.26;0.66;8.8;0.11;0.1;0.14;0.1;0.1;0.1;0.1;0.1;0.41;0.1;0.27;0.1;0.1;0.27;0.1;0.1;0.1;0.26;0.1;0.1;0.1;0.1;0.13;0.1;0.12;0.1;0.1;0.12;0.67;0.2;0.1;0.1;0.1;0.1;0.1;0.1;0.5;0.1;0.1;0.1;0.1;0.52;0.19;0.37;1.87;0.1;0.1;0.88;0.87;0.47;3.59;1.48;0.3;0.83;0.1;1.2;0.1;0.71;0.44;0.33;0.3;1.32;0.1;0.1;0.1;0.47;0.1;0.1;0.1;0.12;0.16;1.15;0.1;0.3;0.1;0.1;0.1;4.53;0.1;0.1;0.2;0.28;0.15;0.47;0.2;0.14;0.4;0.22;0.1;0.23;0.17;0.27;0.21;0.26;0.14;0.96;0.49;0.24;0.47;2.54;3.62;2.19;2.51;0.48;0.1;0.1;0.1;0.1;0.15;0.1;0.1;0.1;0.1;0.1;0.1;0.2;0.5;0.1;0.1;0.28;0.46;0.1;0.1;0.1;0.1;0.1;0.1;0.13;1.32;0.1;0.1;0.12;0.1;0.22;0.1;0.1;0.16;0.1;0.1;0.13;0.2;0.1;0.12;0.1;0.1;0.1;0.38;0.18;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.24;1.3;0.1;0.1;0.1;0.36;0.1;0.19;0.21;0.1;0.1;0.1;0.1;0.41;0.16;0.27;0.12;0.1;0.31;0.1;0.1;0.65;0.1;0.1;19;20;20;20;20;2.1;0.6;1.4;2;1.7;1.6;1.9;1.9;340;1200;0.7;1.9;33;22;14;0.1;0.14;0.1;0.1;0.1;0.35;0.34;0.1;0.13;0.1;0.1;0.1;0.11;0.1;0.1;0.1;0.1;0.11;0.11;0.1;0.16;0.11;0.14;0.13;0.16;0.29;0.27;0.18;0.27;0.1;0.1;0.1;0.1;0.14;0.1;1.32;8.8;0.57;0.54;0.1;0.9;2.18;1.09;0.14;3.4;3.1;49;52;50;54;49;36;37;45;4.8;7.2;2.3;2.1;5.6;16;5.8;6.3;6.3;13;0.15;0.1;0.58;0.1;0.25;0.17;0.1;0.46;0.1;0.1;0.1;0.1;0.1;0.1;0.53;0.1;0.38;0.1;0.1;0.1;0.19;0.1;0.1;0.1;0.17;0.38;0.1;0.17;0.19;0.13;0.1;0.1;0.1;0.1;0.1;0.1;0.31;0.1;0.1;0.37;0.1;0.1;0.1;0.1;0.1;0.14;0.1;0.1;0.1;0.1;0.25;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.11;0.1;1.36;0.1;0.1;0.1;0.1;0.11;0.1;0.1;5.8;0.9;0.87;1;0.19;1;0.31;1;0.18;1.4;0.84;1.4;0.86;51;0.1;0.13;0.16;4.72;0.1;28;20;45;19;20;0.1;1.3;2.13;1.37;2.58;0.1;4.26;2.56;1.93;2.22;2.57;0.47;1.98;1.88;2.04;2.2;0.53;0.1;0.58;0.2;0.31;0.1;0.27;0.45;0.41;0.41;0.58;0.11;0.1;0.42;0.38;0.79;0.1;0.22;0.74;0.34;0.17;0.26;0.6;0.63;0.15;0.21;0.1;0.1;0.1;0.21;0.1;0.1;0.1;4.22;0.55;1.27;1.35;0.39;0.46;0.4;0.39;0.1;0.1;0.2;1.41;0.3;0.1;0.33;0.1;2.25;0.84;0.77;0.94;1.35;0.16;0.16];
LHS_ClO4_All_1000=lhs_empir(ClO4_All_1000,1000);

%Analyze perchlorate concentrations from well data pulled with other
%constituents. 
ClO4_Well_Data_1000=[20;20;20;2.1;0.6;1.4;2;1.7;1.6;1.9;1.9;340;1200;0.7;1.9;33;22;14;8.8;5.8;0.9;1;1;1;1.4;1.4;51;2.32;2.95;2.32;2.6;2.31;0.43;0.65;0.57;0.58;0.51;2.06;0.5;0.5;0.52;1.3;2.13;1.37;2.58;0.1;4.26;1.93;2.22;2.57;0.47;1.98;1.88;2.04;2.2;0.13;0.1;0.1;0.1;0.18;0.1;0.17;0.1;0.1;0.1;0.1;0.2;0.26;0.1;0.1;0.73;0.1;0.1;0.1;0.1;0.1;0.11;0.1;0.14;0.1;0.1;0.1;0.1;0.1;0.41;0.1;0.27;0.1;0.1;0.27;0.1;0.1;0.1;0.26;0.1;0.1;0.1;0.1;0.13;0.1;0.12;0.1;0.1;0.12;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.1;6.23;0.1;0.1;0.53;0.1;0.58;0.45;0.41;1.24;1.5;1.7;0.1;1.63;0.1;0.15;0.1;0.1;0.16;0.97;22;2.2;4.6;5.8;0.2;0.02;0.03;20;27;7;9.1;2.5;2.9;0.07;0.32;9.1;11;3.3;4.1;7.2;2.2;5.1;3.6;0.1;0.23;0.15;0.1;0.1;1.2;1.2;2.6;1.7;1.3;1.9;0.1;2.1;2.1;5.8;7.1;0.2;0.01;5.4;6.7;0.27;2100;87;0.1;0.66;0.1;0.31;0.1;0.27;0.41;0.58;0.11;0.1;0.42;0.38;0.79;0.1;0.22;0.74;0.34;0.17;0.26;0.6;0.63;0.15;0.21;0.1;0.1;0.1;0.21;0.1;0.1;0.1;4.22;0.55;1.27;1.35;0.39;0.46;0.4;0.39;0.1;0.1;0.2;1.41;0.3;0.1;0.33;0.1;2.25;0.84;0.77;0.94;1.35];
LHS_ClO4_Well_Data_1000=lhs_empir(ClO4_Well_Data_1000,1000);

%% Anion Concentrations
%Anion concentrations from data pulled for wells containing perchlorate.
%These LHS from these samples will be used to produce a perchlorate and
%other anion ratios and compared to similar ratios from the raw data. 

%Bicarbonate Distribution in Drinking Waters Contaminated with Perchlorate
HCO3_Well_Data_1000=[177;178;176;153;196;163;150;168;134;139;108;52;211;131;230;186;120;191;239;161;174;146;234;237;181;160;164;352;188;29.1;512;119;107;271;147;122;91.9;183;418;240;142;174;416;427;147;392;132;141;146;83.3;818;187;298;116;513;82.6;208;260;208;705;63.4;69;13.8;158;295;164;67.8;218;93.2;42.6;20.6;98.8;211;200;223;104;42.6;316;93.2;34.5;256;227;160;79;64;239;68;128;124;211;235;223;238;182;103;170;133;484;105;134;130;195;214;404;396;341;409;136;90;30.6;151;172;180;156;171;423;395;154;164;177;389;223;49;160;193;193;122;317;125;169;222;88.7;74.6;84.8;197;176;244;239;220;169;151;152;2070;421;228;236;212;229;218;137;192;162;184;279;183];
HCO3_Influent_1000=lhs_empir(HCO3_Well_Data_1000,1000);
%Chloride Distribution in Drinking Waters Contaminated with Perchlorate
Cl_Well_Data_1000=[13.3;13.2;12;7.52;11.5;6.25;9.76;9.69;9.05;9.74;9.99;6.51;4.33;9.91;5.28;6.16;5.86;7.64;11;16.9;7.48;3.98;4.46;3.65;7.8;7.83;26;21.3;37.3;36.8;37.7;36.1;11.3;11.6;11.6;11.5;12;12;11.8;11.8;96;30.8;139;21.8;42.5;465;30.8;31.4;32;32.5;31.6;31.2;31.4;10.8;34.9;23.6;11;10.2;5.51;6.63;9.21;3.95;40.7;3.67;87.9;8.37;4.45;3.42;8.69;45.6;18.8;31.1;30.6;16.3;9.71;8.16;5.33;7.68;13.7;50.4;2.26;6.86;11.4;40.4;17.8;5.01;6.7;23.5;15.6;92.7;13.9;29.5;6.96;78.1;7.71;15.4;11.6;33.2;18.1;5.38;4.31;15.5;22.2;22.4;22.3;18.2;5.2;63.8;13.6;40.8;14.4;356;84;163;44.6;16.5;719;310;198;138;51.8;31.1;61.9;73.8;21.6;522;64.2;79.8;8.1;7;620;640;3300;2900;490;1400;1500;63;69;2800;3900;2.5;12;100;130;22;22;49;12;16;20;21.1;24;30.7;9.93;311;38;138;38.5;11.4;11.8;39.7;7.35;270;280;42;38;5300;6800;190;160;15.9;4.9;13.1;1750;16.3;8.93;7.86;39.3;106;43.7;55.7;8.3;25.9;17.3;91.1;6.77;14.4;410;90.3;211;714;12;9;15.6;1.89;2.5;1.07;2.5;1.7;34.7;1;1.03;0.93;142;8.18;59.6;11;4.77;11.4;12.1;12.1;224;1660;1240;50.2;6.23;528;56.8;223;93.8;18.4;13.4;52.8;43.1];
Cl_Influent_1000=lhs_empir(Cl_Well_Data_1000,1000);
%Sulfate Distribution in Drinking Waters Contaminated with Perchlorate
SO4_Well_Data_1000=[22.6;22.6;21.8;18;13;19.6;19.2;19.2;17.5;19.2;19.6;9.98;12.9;21.1;21.8;18.5;24.8;24.9;19.2;34.4;26.2;9.44;11.7;11.1;25.9;26;22;123;84.1;86.7;87.3;88.8;3.72;3.66;3.56;3.57;3.82;3.82;3.72;3.76;62.2;36.6;58.9;29.7;128;199;58.8;60.7;62.6;67.8;66.6;67.3;67.4;29.4;8.24;107;12.6;4.01;13.6;18.2;2.43;2.12;10.6;1.45;1.72;3.88;1.26;14.2;14.8;0.18;4.81;0.4;0.18;6.43;5.9;7.65;11.5;3.71;14.9;1.98;2.89;61.7;4.62;12.8;24.2;4.76;2.42;4.24;0.11;20.3;3.99;11.3;8.3;0.18;7.11;2.31;17.8;9.05;8.56;2.68;1.81;3.98;22.7;17.7;10.3;1.49;2.98;0.18;17;4.59;8.68;246;149;270;78.9;39;764;178;70.2;74.8;116;53.6;59.6;84.3;47.7;454;40;165;14.3;33;8.9;870;970;1300;1100;610;1700;2000;140;160;1400;2200;28;37;200;210;98;94;170;70;81;62;69.1;33.5;27.7;50.1;169;151;137;238;35;38;102;28.9;210;220;100;100;1600;1600;750;800;29.1;8.7;8.9;974;128;30.2;17.6;49.7;120;218;167;60.1;39.2;26.2;323;22.2;56;803;25.9;93.7;228;44.6;18.8;25;8.6;12.5;14.3;9.56;7.26;217;2.95;7.58;2.39;454;17.2;104;25.8;19.3;14.6;29.3;29.2;145;242;72.5;40.8;22.6;302;64;276;658;23;48.7;48;55.3];
SO4_Influent_1000=lhs_empir(SO4_Well_Data_1000,1000);
%Nitrate Distribution in Drinking Waters Contaminated with Nitrate
NO3_Well_Data_1000=[0.146;0.16;0.167;0.171;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.177;0.218;0.232;0.273;0.287;0.307;0.345;0.549;0.586;0.668;0.691;0.756;0.775;0.823;0.832;0.89;0.903;0.978;1.04;1.29;1.38;1.4;1.54;1.58;1.59;1.64;1.65;1.69;1.72;1.93;2.08;2.09;2.11;2.19;2.24;2.24;2.25;2.39;2.44;2.58;2.64;2.7;2.75;2.76;2.77;2.88;2.92;3.14;3.51;3.61;3.87;3.94;3.99;4.03;4.45;4.5;4.56;4.64;4.7;4.76;4.77;5.02;5.15;6.17;6.6;7.15;7.35;7.41;7.65;7.85;7.9;7.93;8.79;8.83;9.66;10.2;10.4;10.6;10.7;11.9;12.4;12.4;12.5;12.5;12.6;12.7;13;13.2;13.3;13.6;13.6;13.6;14.9;15.1;15.6;15.6;16.1;16.5;16.7;16.9;17;17.5;17.8;18.3;18.7;19.6;19.7;20.7;20.7;21.9;22.1;23;23.8;24.3;27;27.8;30;30.8;30.8;32;32.4;32.6;32.6;32.7;32.9;35.4;35.4;35.5;36];
NO3_Influent_1000=lhs_empir(NO3_Well_Data_1000,1000);

%% Perchlorate Ratios Values for Comparison to Raw Values
ClO4_HCO3_Ratio_1000=LHS_ClO4_Well_Data_1000./HCO3_Influent_1000; %compares perchlorate and bicarbonate
ClO4_Cl_Ratio_1000=LHS_ClO4_Well_Data_1000./Cl_Influent_1000; %compares perchlorate and chloride
ClO4_SO4_Ratio_1000=LHS_ClO4_Well_Data_1000./SO4_Influent_1000; %compares perchlorate and sulfate
ClO4_NO3_Ratio_1000=LHS_ClO4_Well_Data_1000./NO3_Influent_1000; %compares perchlorate and nitrate

%% Other Anion Ratios
%Anions bicarbonate, nitrate, sulfate and chloride were compared amongst
%each other. 5, 25, 50, 75 and 95 confidence intervals were compared from
%data generated in perchlorate ratios to data for other compounds.

HCO3_Cl_Ratio_1000=HCO3_Influent_1000./Cl_Influent_1000;
HCO3_SO4_Ratio_1000=HCO3_Influent_1000./SO4_Influent_1000;
HCO3_NO3_Ratio_1000=HCO3_Influent_1000./NO3_Influent_1000;
Cl_SO4_Ratio_1000=Cl_Influent_1000./SO4_Influent_1000;
Cl_NO3_Ratio_1000=Cl_Influent_1000./NO3_Influent_1000;
SO4_NO3_Ratio_1000=SO4_Influent_1000./NO3_Influent_1000;

%% Create save files for water constituents
save('Cl_Influent_1000.mat','Cl_Influent_1000');
save('HCO3_Influent_1000.mat','HCO3_Influent_1000');
save('SO4_Influent_1000.mat','SO4_Influent_1000');
save('NO3_Influent_1000.mat','NO3_Influent_1000');
save('ClO4_Influent_10_1000.mat','ClO4_Influent_10_1000');
save('ClO4_Influent_6_1000.mat','ClO4_Influent_6_1000');
save('ClO4_Influent_2_1000.mat','ClO4_Influent_2_1000');
save('LHS_ClO4_All_1000.mat','LHS_ClO4_All_1000');
save('LHS_ClO4_Well_Data_1000.mat','LHS_ClO4_Well_Data_1000');
save('HCO3_Cl_Ratio_1000.mat','HCO3_Cl_Ratio_1000');
save('HCO3_SO4_Ratio_1000.mat','HCO3_SO4_Ratio_1000');
save('HCO3_NO3_Ratio_1000.mat','HCO3_NO3_Ratio_1000');
save('Cl_SO4_Ratio_1000.mat','Cl_SO4_Ratio_1000');
save('Cl_NO3_Ratio_1000.mat','Cl_NO3_Ratio_1000');
save('SO4_NO3_Ratio_1000.mat','SO4_NO3_Ratio_1000');
save('ClO4_HCO3_Ratio_1000.mat','ClO4_HCO3_Ratio_1000');
save('ClO4_Cl_Ratio_1000.mat','ClO4_Cl_Ratio_1000');
save('ClO4_SO4_Ratio_1000.mat','ClO4_SO4_Ratio_1000');
save('ClO4_NO3_Ratio_1000.mat','ClO4_NO3_Ratio_1000');

%% Perchlorate Ratios - Determines the ratio of the data from the raw data.  
%Uses the ratio to determine concentrations of water constituents
%Comparing data from ratios calculated before and after LHS

ClO4_HCO3_R_Raw_1000=[0.017811320754717;0.0297666666666667;0.0259824046920821;0.0036875;0.012421875;0.0085792349726776;0.0650887573964497;0.0610738255033557;0.064327485380117;0.0475862068965517;0.00625;0.00675675675675676;0.000780669144981413;0.0373170731707317;0.0225139664804469;0.0507361963190184;0.0175581395348837;0.0130331753554502;0.0312693498452012;0.0112435233160622;0.0592857142857143;0.0183908045977011;0.0214880952380952;0.00805;0.0541899441340782;1.4375;1.3125;1.26582278481013;1.57575757575758;0.723684210526316;1.52439024390244;0.00240174672489083;0.00328947368421053;2.51428571428571;1.53005464480874;0.00341935483870968;0.00210884353741497;0.00210884353741497;0.00197368421052632;0.0019620253164557;0.011731843575419;0.00887323943661972;0.019047619047619;0.0256410256410256;0.00397727272727273;0.00865030674846626;0.00276729559748428;0.0101470588235294;0.00513812154696133;0.0200913242009132;0.105555555555556;0.114285714285714;0.112994350282486;0.112359550561798;0.113636363636364;0.0137254901960784;0.00306122448979592;0.0122699386503067;0.0113333333333333;0.00952380952380952;0.0141791044776119;0.0136690647482014;3.14814814814815;23.0769230769231;0.0033175355450237;0.251908396946565;0.0956521739130435;0.0752688172043011;0.0733333333333333;0.0303664921465969;0.00376569037656904;0.0062111801242236;0.00574712643678161;0.00684931506849315;0.00598290598290598;0.00590717299578059;0.281767955801105;0.000691489361702128;0.00343642611683849;0.0001953125;0.000840336134453782;0.000934579439252336;0.0003690036900369;0.000680272108843537;0.000819672131147541;0.00108813928182807;0.00109289617486339;0.00062200956937799;0.000416666666666667;0.000704225352112676;0.00419540229885057;0.000240384615384615;0.000234192037470726;0.000680272108843537;0.000255102040816327;0.000757575757575758;0.000780141843971631;0.000684931506849315;0.00120048019207683;0.000122249388753056;0.00053475935828877;0.000335570469798658;0.00353448275862069;0.000194931773879142;0.00326876513317191;0.000480769230769231;0.000384615384615385;0.00129807692307692;0.000141843971631206;0.00157728706624606;0.00144927536231884;0.0188405797101449;0.000632911392405063;0.000338983050847458;0.000609756097560976;0.00147492625368732;0.000596330275229358;0.00107296137339056;0.0028169014084507;0.00485436893203883;0.00101214574898785;0.0004739336492891;0.0005;0.000448430493273543;0.000961538461538462;0.00234741784037559;0.000316455696202532;0.00107296137339056;0.00289855072463768;0.000390625;0.000440528634361233;0.0389375;0.00126582278481013;0.0015625;0.00221757322175732;0.00147058823529412;0.00453125;0.00362903225806452;0.00194312796208531;0.00527659574468085;0.00672645739910314;0.00714285714285714;0.000549450549450549;0.0158252427184466;0.000588235294117647;0.00112781954887218;0.000206611570247934;0.000952380952380952;0.00171641791044776;0.000769230769230769;0.00615384615384615;0.00560747663551402;0.00643564356435644;0.00429292929292929;0.00381231671554252;0.00464547677261614;0.000735294117647059;0.003;0.00326797385620915;0.00437086092715232;0.000581395348837209;0.00172222222222222;0.000641025641025641;0.00157894736842105;0.000969267139479905;0.00146835443037975;0.000714285714285714;0.000609756097560976;0.0023728813559322;0.000976863753213368;0.00354260089686099;0.00346938775510204;0.001625;0.00310880829015544;0.00326424870466321;0.00122950819672131;0.000662460567823344;0.0008;0.000591715976331361;0.00045045045045045;0.00112739571589628;0.00134048257372654;0.00117924528301887;0.0214213197969543;0.003125;0.00520491803278689;0.00564853556485356;0.00177272727272727;0.00272189349112426;0.00264900662251656;0.00256578947368421;4.83091787439614E-05;0.000237529691211401;0.00087719298245614;0.00597457627118644;0.00141509433962264;0.000436681222707424;0.00151376146788991;0.00072992700729927;0.01171875;0.00518518518518519;0.00418478260869565;0.00336917562724014;0.00737704918032787;0.0035625;0.00310975609756098;0.00630681818181818];
ClO4_HCO3_Ratio_Raw_1000=lhs_empir(ClO4_HCO3_R_Raw_1000,1000);
ClO4_NO3_R_Raw_1000=[0.100212314225053;0.118435013262599;0.133836858006042;0.0808219178082192;0.0744730679156909;0.0415525114155251;0.0541379310344828;0.96;0.973451327433628;0.925737538148525;0.956521739130435;0.824372759856631;0.160771704180064;0.14903129657228;0.109375;0.0748299319727891;0.120789473684211;0.158039215686275;0.170164609053498;0.0898809523809524;0.145502645502646;0.291907514450867;0.145637583892617;0.30273556231003;0.317460317460317;0.41522491349481;0.176923076923077;0.0930232558139535;0.0370843989769821;0.123552123552124;0.150416666666667;0.0600746268656716;0.404166666666667;13.5294117647059;12.8834355828221;16.5289256198347;13;10.6796116504854;12.6903553299492;0.0308988764044944;0.0186104218362283;8.11594202898551;0.119741100323625;0.0248;0.0248;0.0430416068866571;0.0582706766917293;0.052896725440806;0.140782122905028;0.0686695278969957;0.169491525423729;0.0289256198347107;0.102173913043478;0.0278481012658228;0.262008733624454;0.0773480662983425;0.0758241758241758;0.112485939257593;0.0364406779661017;0.0405982905982906;0.0871287128712871;0.0862745098039216;0.0426751592356688;0.0833333333333333;0.318979266347687;0.305810397553517;0.303490136570561;0.361663652802893;0.154411764705882;0.0289855072463768;0.0838323353293413;0.0563380281690141;0.0480225988700565;0.051948051948052;0.0527777777777778;0.0582822085889571;19.1011235955056;194.489465153971;0.0251798561151079;0.0798319327731092;1.49321266968326;1.41025641025641;0.710659898477157;0.325925925925926;0.0886850152905199;0.0275229357798165;0.212765957446809;0.126582278481013;0.25062656641604;0.0432098765432099;0.0429447852760736;0.0673575129533679;0.00282485875706215;0.325732899022801;0.120192307692308;0.0242914979757085;0.0628930817610063;0.0377777777777778;0.564971751412429;0.129032258064516;0.564971751412429;0.110741971207087;1.16959064327485;1.46892655367232;0.564971751412429;0.0632911392405063;0.25;0.598802395209581;0.564971751412429;0.564971751412429;0.564971751412429;0.00483091787439614;0.0166666666666667;0.0127388535031847;0.0307017543859649;0.0961538461538462;0.564971751412429;0.564971751412429;0.564971751412429;0.037037037037037;0.0242603550295858;0.564971751412429;0.0173076923076923;0.289855072463768;0.564971751412429;0.390738060781476;0.625;0.684931506849315;0.182149362477231;0.0152941176470588;0.112359550561798;0.564971751412429;0.564971751412429;0.036231884057971;0.0102362204724409;0.00757575757575758;0.00493827160493827;0.0480769230769231;0.0446428571428571;0.00735294117647059;0.0378787878787879;0.564971751412429;0.0775193798449612;0.149700598802395;0.564971751412429;0.0387596899224806;0.102249488752556;0.564971751412429;0.564971751412429;0.140632054176072;0.564971751412429;0.564971751412429;0.0509615384615385;0.431034482758621;0.0547169811320755;0.101123595505618;0.0796116504854369;0.0402597402597403;0.0857142857142857;0.112582781456954;0.564971751412429;0.122556390977444;0.564971751412429;0.0614754098360656;0.072463768115942;0.198198198198198;0.558375634517767;0.564971751412429;0.102222222222222;0.0684931506849315;0.564971751412429;0.170648464163823;0.0156657963446475;0.0173160173160173;0.0346205059920107;0.0126865671641791;0.0206022187004754;0.0310457516339869;0.564971751412429;0.0581896551724138;0.564971751412429;0.138364779874214;0.366300366300366;0.112727272727273;0.564971751412429;0.036734693877551;0.0573426573426573;0.0600414078674948;0.0785714285714286;0.132275132275132;0.0882352941176471;0.121019108280255;0.0996216897856242;0.121506682867558;0.0438247011952191;0.0725490196078431;0.207317073170732;0.0470914127423823;0.0645161290322581;0.0363636363636364;0.0713476783691959;0.0669642857142857;0.075812274368231;0.458715596330275;0.0284900284900285;0.0347222222222222;0.127272727272727;0.0649350649350649;0.0258397932816537;0.04739336492891;0.551633986928105;0.0514018691588785;0.0788819875776397;0.15358361774744;0.030952380952381;0.0251366120218579;0.232558139534884;0.230769230769231;0.564971751412429;0.564971751412429;0.0836820083682008;0.061304347826087;0.0220588235294118;0.348432055749129;0.157894736842105;0.564971751412429;0.114795918367347;0.0449197860962567;0.0351598173515982;0.0630872483221476;0.0421875;0.0227450980392157;0.0428779069767442;0.0337719298245614;0.0446153846153846;0.0408;0.166129032258065;0.04;0.0420168067226891;0.0419354838709677;0.0221843003412969;0.0197222222222222;0.0416413373860182;0.086;0.564971751412429;0.0488532110091743;0.0438566552901024;0.00784641068447412;0.0341379310344828;0.0317567567567568;0.0357267950963222;0.0376712328767123];
ClO4_NO3_Ratio_Raw_1000=lhs_empir(ClO4_NO3_R_Raw_1000,1000);
ClO4_Cl_R_Raw_1000=[0.0318918918918919;0.0940990516332982;0.0798198198198198;0.052212389380531;0.0482549317147193;0.0321554770318021;0.0737089201877934;2.4;2.35042735042735;1.99124726477024;2.32067510548523;1.65071770334928;0.221729490022173;0.204498977505112;0.012962962962963;0.120614035087719;0.301973684210526;0.338655462184874;0.239710144927536;0.21726618705036;0.134803921568627;0.25765306122449;0.0769503546099291;0.377272727272727;0.187207488299532;1.07142857142857;0.621621621621622;0.0622222222222222;0.0547169811320755;0.392156862745098;0.458703939008895;0.154807692307692;1.34535367545076;36.5079365079365;34.6534653465347;36.697247706422;37.5180375180375;22.7743271221532;36.0750360750361;0.0230125523012552;0.0449101796407186;38.8349514563107;0.641247833622184;0.0739856801909308;0.0739856801909308;0.087719298245614;0.103678929765886;0.103960396039604;0.027906976744186;0.065173116089613;0.445930880713489;0.0686274509803922;0.0754010695187166;0.00737018425460636;0.774193548387097;0.182529335071708;0.0958333333333333;0.137174211248285;0.0883864337101747;0.0956696878147029;0.22680412371134;0.63768115942029;0.0756207674943567;0.00168350168350168;1.50793650793651;1.51515151515152;1.50375939849624;1.51515151515152;1.66666666666667;0.279255319148936;0.0521739130434783;0.224;0.204918032786885;0.175438596491228;0.176795580110497;0.195071868583162;0.19019019019019;52.2273425499232;277.136258660508;0.070635721493441;0.359848484848485;5.35714285714286;3.7542662116041;1.83246073298429;0.8;0.343195266272189;0.120320855614973;0.251256281407035;0.224215246636771;0.273972602739726;0.179487179487179;0.178799489144317;1.96153846153846;0.012037037037037;0.00286532951289398;0.00423728813559322;0.00909090909090909;0.0176470588235294;0.0181488203266788;0.0256410256410256;0.01085776330076;0.0253164556962025;0.00245700245700246;0.0272479564032698;0.00227531285551763;0.031063321385902;0.0224719101123595;0.0292397660818713;0.0840046029919448;0.00219298245614035;0.00531914893617021;0.00321543408360129;0.00326797385620915;0.00613496932515337;0.0113285272914521;0.0122549019607843;0.026266416510319;0.0130208333333333;0.0072992700729927;0.00198412698412698;0.0442477876106195;0.0145772594752187;0.0359649122807017;0.00247524752475248;0.0151685393258427;0.0199600798403194;0.0149253731343284;0.0114893617021277;0.00641025641025641;0.00107874865156419;0.00719424460431655;0.0088135593220339;0.014367816091954;0.00128040973111396;0.012970168612192;0.00649350649350649;0.0112068965517241;0.00301204819277108;0.00662983425414365;0.0185873605947955;0.0232018561484919;0.00774193548387097;0.0045045045045045;0.00446428571428571;0.00448430493273543;0.00549450549450549;0.0192307692307692;0.00156739811912226;0.00735294117647059;0.00245098039215686;0.00694444444444444;0.000280898876404494;0.0741666666666667;0.000613496932515337;0.00224215246636771;0.0321212121212121;0.000139082058414465;0.00187096774193548;0.00227272727272727;0.00297101449275362;0.0239382239382239;0.0482315112540193;0.0274636510500808;0.0013550135501355;0.075462962962963;0.000191570881226054;0.00233644859813084;0.0012531328320802;0.0123456790123457;0.138571428571429;0.00741935483870968;0.0090625;6.06060606060606E-05;6.89655172413793E-06;6.12244897959184E-05;0.0142857142857143;0.018;0.111111111111111;0.131884057971014;0.000892857142857143;0.000743589743589744;0.028;0.0266666666666667;0.091;0.0846153846153846;0.15;0.186363636363636;0.146938775510204;0.183333333333333;0.31875;0.18;0.004739336492891;0.00958333333333333;0.00488599348534202;0.0100704934541793;0.000321543408360129;0.0315789473684211;0.00869565217391304;0.0675324675324675;0.149122807017544;0.110169491525424;0.0478589420654912;0.0136054421768707;0.00777777777777778;0.0075;0.138095238095238;0.186842105263158;3.77358490566038E-05;1.47058823529412E-06;0.0284210526315789;0.041875;0.0169811320754717;428.571428571429;6.6412213740458;5.71428571428571E-05;0.0404907975460123;0.0111982082866741;0.039440203562341;0.00254452926208651;0.00254716981132075;0.00938215102974828;0.0104129263913824;0.0132530120481928;0.00386100386100386;0.0242774566473988;0.00417124039517014;0.116691285081241;0.00694444444444444;0.000536585365853659;0.00819490586932447;0.00161137440758294;0.000238095238095238;0.0216666666666667;0.0666666666666667;0.0403846153846154;0.0793650793650794;0.084;0.0934579439252336;0.04;0.0588235294117647;0.00605187319884726;0.1;0.0970873786407767;0.10752688172043;0.0297183098591549;0.0672371638141809;0.0213087248322148;0.122727272727273;0.0817610062893082;0.0403508771929825;0.0330578512396694;0.0322314049586777;0.000446428571428571;6.02409638554217E-05;0.000161290322580645;0.0280876494023904;0.0481540930979133;0.000189393939393939;0.00580985915492958;0.000448430493273543;0.0239872068230277;0.0456521739130435;0.0574626865671642;0.0178030303030303;0.031322505800464;0.108920187793427;0.079088471849866;0.0630434782608696;0.0689655172413793;0.06398891966759;0.0380530973451327;0.0560344827586207;0.0491379310344828;0.0504347826086956;0.0425;0.171666666666667;0.0423728813559322;0.0423728813559322;0.0135416666666667;0.0691558441558442;0.00985611510791367;0.118348623853211;0.00235294117647059;0.00916129032258065;0.0626623376623377;0.0707006369426752;0.0803125;0.0144615384615385;0.0626582278481013;0.0602564102564103;0.064968152866242];
ClO4_Cl_Ratio_Raw_1000=lhs_empir(ClO4_Cl_R_Raw_1000,1000);
ClO4_SO4_R_Raw_1000=[0.0247120418848168;0.0522222222222222;0.103263403263403;0.0395973154362416;0.0365097588978186;0.0271641791044776;0.0279857397504456;0.816326530612245;0.700636942675159;0.583333333333333;0.700636942675159;0.466216216216216;0.0735294117647059;0.072463768115942;0.0100478468899522;0.0317919075144509;0.1039637599094;0.373148148148148;0.205721393034826;0.151;0.147058823529412;0.0878260869565217;0.0214851485148515;0.212366737739872;0.0504201680672269;0.466926070038911;0.154017857142857;0.015819209039548;0.021969696969697;0.114695340501792;0.172727272727273;0.145045045045045;0.384920634920635;17.4242424242424;15.9090909090909;15.0375939849624;20;7.9136690647482;19.3798449612403;0.0168711656441718;0.014792899408284;15.2173913043478;0.157446808510638;0.0164021164021164;0.0164021164021164;0.0136986301369863;0.0145539906103286;0.0603448275862069;0.04032;0.116788321167883;0.148148148148148;0.0220125786163522;0.0536121673003802;0.00389380530973451;0.244897959183673;0.0472972972972973;0.0570247933884298;0.0238095238095238;0.0198614318706697;0.0257452574525745;0.0740740740740741;0.14170692431562;0.013871635610766;0.00354609929078014;0.87962962962963;0.896860986547085;0.884955752212389;0.884955752212389;0.91743119266055;0.116666666666667;0.0461538461538461;0.0714285714285714;0.104166666666667;0.0885416666666667;0.0914285714285714;0.0989583333333333;0.0969387755102041;34.0681362725451;93.0232558139535;0.033175355450237;0.0871559633027523;1.78378378378378;0.887096774193548;0.562248995983936;0.458333333333333;0.168604651162791;0.0343511450381679;0.105932203389831;0.0854700854700855;0.0900900900900901;0.0540540540540541;0.0538461538461538;2.31818181818182;0.00442176870748299;0.0121359223300971;0.000934579439252336;0.00793650793650794;0.0448877805486284;0.00735294117647059;0.00934065934065934;0.0411522633744856;0.0471698113207547;0.00943396226415094;0.0689655172413793;0.116279069767442;0.0670103092783505;0.0793650793650794;0.00704225352112676;0.0493243243243243;0.555555555555556;0.0207900207900208;0.25;0.555555555555556;0.015552099533437;0.0186440677966102;0.0130718954248366;0.0121739130434783;0.0269541778975741;0.00671140939597315;0.0505050505050505;0.0346020761245675;0.00162074554294976;0.0887445887445887;0.0078125;0.0111570247933884;0.0210084033613445;0.0413223140495868;0.0636792452830189;0.909090909090909;0.00492610837438424;0.025062656641604;0.0230088495575221;0.0120481927710843;0.555555555555556;0.0140646976090014;0.0432900432900433;0.00730337078651685;0.0110497237569061;0.014018691588785;0.0373134328358209;0.0552486187845304;0.0301507537688442;0.00440528634361234;0.00564971751412429;0.00970873786407767;0.0671140939597315;0.0335570469798658;0.555555555555556;0.00588235294117647;0.0217864923747277;0.0115207373271889;0.00040650406504065;0.0418120805369128;0.00037037037037037;0.00126742712294043;0.0135897435897436;0.000130890052356021;0.00325842696629213;0.00641025641025641;0.00548128342245989;0.0106896551724138;0.0279850746268657;0.0285234899328859;0.00118623962040332;0.0341719077568134;0.000220264317180617;0.00375;0.000606060606060606;0.00699300699300699;0.00484848484848485;0.108988764044944;0.00528735632183908;0.00597938144329897;0.000153846153846154;1.81818181818182E-05;4.91803278688525E-05;0.0117647058823529;0.0135;0.05;0.056875;0.00178571428571429;0.00131818181818182;0.0025;0.00864864864864865;0.0455;0.0523809523809524;0.0336734693877551;0.0436170212765957;0.0423529411764706;0.0314285714285714;0.062962962962963;0.0580645161290323;0.00144717800289436;0.00686567164179105;0.00541516245487365;0.00199600798403194;0.000591715976331361;0.00794701986754967;0.00875912408759124;0.0109243697478992;0.0485714285714286;0.0342105263157895;0.0186274509803922;0.00346020761245675;0.01;0.00954545454545455;0.058;0.071;0.000125;0.00000625;0.0072;0.008375;0.00927835051546392;241.379310344828;9.7752808988764;0.000102669404517454;0.00515625;0.0033112582781457;0.0176136363636364;0.00201207243460765;0.00225;0.00188073394495413;0.00347305389221557;0.00183028286189684;0.00255102040816327;0.016030534351145;0.00117647058823529;0.0355855855855856;0.00178571428571429;0.000273972602739726;0.0285714285714286;0.00362860192102455;0.000745614035087719;0.00582959641255605;0.0319148936170213;0.0252;0.0174418604651163;0.0168;0.00699300699300699;0.0104602510460251;0.0137741046831956;0.000967741935483871;0.0338983050847458;0.0131926121372032;0.0418410041841004;0.00929515418502203;0.0319767441860465;0.0122115384615385;0.0523255813953488;0.0202072538860104;0.0315068493150685;0.0136518771331058;0.0133561643835616;0.000689655172413793;0.000413223140495868;0.00275862068965517;0.0345588235294118;0.0132743362831858;0.00033112582781457;0.00515625;0.00036231884057971;0.00341945288753799;0.0365217391304348;0.0158110882956879;0.0195833333333333;0.0244122965641953;0.0188617886178862;0.035077288941736;0.0267589388696655;0.0297823596792669;0.0260135135135135;0.115591397849462;0.177595628415301;0.160112359550562;0.162464985994398;0.133507853403141;0.539267015706806;0.134408602150538;0.132978723404255;0.0209003215434084;0.0581967213114754;0.0232597623089983;0.0868686868686869;0.00078125;0.0214070351758794;0.0328231292517007;0.0365733113673806;0.0410543130990415;0.00693215339233038;0.0297297297297297;0.0279346210995542;0.0302670623145401];
ClO4_SO4_Ratio_Raw_1000=lhs_empir(ClO4_SO4_R_Raw_1000,1000);
Test_ClO4_HCO3_Ratio_1000=LHS_ClO4_Well_Data_1000./ClO4_HCO3_Ratio_Raw_1000;
Test_ClO4_NO3_Ratio_1000=LHS_ClO4_Well_Data_1000./ClO4_NO3_Ratio_Raw_1000;
Test_ClO4_Cl_Ratio_1000=LHS_ClO4_Well_Data_1000./ClO4_Cl_Ratio_Raw_1000;
Test_ClO4_SO4_Ratio_1000=LHS_ClO4_Well_Data_1000./ClO4_SO4_Ratio_Raw_1000;

save('Test_ClO4_HCO3_Ratio_1000.mat','Test_ClO4_HCO3_Ratio_1000');
save('Test_ClO4_NO3_Ratio_1000.mat','Test_ClO4_NO3_Ratio_1000');
save('Test_ClO4_Cl_Ratio_1000.mat','Test_ClO4_Cl_Ratio_1000');
save('Test_ClO4_SO4_Ratio_1000.mat','Test_ClO4_SO4_Ratio_1000');
