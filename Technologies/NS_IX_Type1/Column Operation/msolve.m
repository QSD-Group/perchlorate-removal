function [F] = msolve(x,TR,KNC,KHC,KSC,KCC,TCl,TNO3,THCO3,TSO4,TClO4)


F = [x(1)+x(2)+x(3)+x(4)+x(5)-TR;
x(2)*x(6)-KNC*x(1)*x(7);
x(3)*x(6)-KHC*x(1)*x(8);
x(4)*x(6)^2-KSC*x(1)^2*x(9);
x(5)*x(6)-KCC*x(1)*x(10);
x(1)+x(6)-TCl;
x(2)+x(7)-TNO3;
x(3)+x(8)-THCO3;
x(4)+x(9)-TSO4;
x(5)+x(10)-TClO4];

%      
%Jacobian matrix used to provide an analytical solution for the column
%equilibrium equations.  The Jacobian didn't decrease computational time
%compared to the default MATLAB function.
%       J=[1,1,1,1,1,0,0,0,0,0;
%           -KNC*x(7),x(6),0,0,0,x(2), -KNC*x(1),0,0,0;
%           -KHC*x(8),0,x(6),0,0,x(3),0,-KHC*x(1),0,0;
%           -2*KSC*x(1)*x(9),0,0,(x(6))^2,0,2*x(4)*x(6),0,0,-KSC*(x(1))^2,0;
%           -KCC*x(10),0,0,0,x(6),x(5),0,0,0,-KCC*x(1);
%           1,0,0,0,0,1,0,0,0,0;
%           0,1,0,0,0,0,1,0,0,0;
%           0,0,1,0,0,0,0,1,0,0;
%           0,0,0,1,0,0,0,0,1,0;
%           0,0,0,0,1,0,0,0,0,1];
end

    
    

% function [F] = msolve(x,TR,KNC,KHC,KSC,KCC,TCl,TNO3,THCO3,TSO4,TClO4)
% 
% 
% F = [x(1)+x(2)+x(3)+x(4)+x(5)-TR;
% x(2)*x(6)-KNC*x(1)*x(7);
% x(3)*x(6)-KHC*x(1)*x(8);
% x(4)*x(6)^2-KSC*x(1)^2*x(9);
% x(5)*x(6)-KCC*x(1)*x(10);
% x(1)+x(6)-TCl;
% x(2)+x(7)-TNO3;
% x(3)+x(8)-THCO3;
% x(4)+x(9)-TSO4;
% x(5)+x(10)-TClO4];



% 
% Jack=[1,1,1,1,1,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0;
% -KNC*x(7),x(6),0,0,0,x(2), -KNC*x(1),0,0,0,0,-x(1)*x(7),0,0,0,0,0,0,0,0;
% -KHC*x(8),0,x(6),0,0,x(3),0,-KHC*x(1),0,0,0,0,-x(1)*x(8),0,0,0,0,0,0,0;
% -2*KSC*x(1)*x(9),0,0,(x(6))^2,0,2*x(4)*x(6),0,0,-KSC*(x(1))^2,0,0,0,0,-(x(1))^2*x(9),0,0,0,0,0,0;
% -KCC*x(10),0,0,0,x(6),x(5),0,0,0,-KCC*x(1),0,0,0,0,-x(1)*x(10),0,0,0,0,0;
% 1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,-1,0,0,0,0;
% 0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,-1,0,0,0;
% 0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,-1,0,0;
% 0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,-1,0;
% 0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,-1];
%  

%http://dali.feld.cvut.cz/ucebna/matlab/toolbox/optim/fsolve.html