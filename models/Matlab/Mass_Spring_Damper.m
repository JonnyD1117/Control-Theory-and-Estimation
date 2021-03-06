%% Mass-Spring-Damper

% Input -> Force 
% Output -> State Derivatives


% Default Parameters
m =1; % Kg
b = .25; 
k = 10; 


P = struct; 
P.m  = m; 
P.k = k; 
P.b = b; 

% Governing Equation: 
%
% m*x_dot_dot + b*x_dot + k*x = F

F = .5;

dt = .1; 
sim_len = 20; 


x1_0 = 3; 
x2_0 = 0;

for k = 1:1:(20/dt)
    
    [x1_dot, x2_dot] = MSD_model(x1_0, x2_0,F, P); 
    
    x1_new(k) = x1_0 + dt*(x1_dot);
    x2_new(k) = x2_0 + dt*(x2_dot);
    
    x1_0 = x1_new(k); 
    x2_0 = x2_new(k); 

end 


plot(x1_new)


 






function [x1_dot x2_dot] = MSD_model(x1_0, x2_0, F, P)

m = P.m; 
k = P.k; 
b = P.b;

x1_dot = x2_0; 
x2_dot = (1/m)*(-b*x2_0-k*x1_0 + F);


end 



