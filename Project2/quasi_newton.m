function [i,y] = quasi_newton(grad, x, check)
%% Quasi-Newton method
%% input
% grad: the gradient of the function 
% x: initial point
% check: 1:Rank-one; 2:DFP; 3:BFGS 
%% Output
% y: local minimizer
% i: number of iterations
%% codes
% config_qn is the map object contains all configurations
config_qn = get_config("quasi_newton");
% get the length of x
n = length(x);
% initialize H
H0 = eye(n);
H = H0;
% initialize x
x_new = x;
% initialize g
g_new = feval(grad,x_new);
% initialize d
if norm(g_new) < config_qn("eps_g")
    i = 0;
    y = x_new;
    return
else
    d = -H0*g_new;
end


for i = 0:config_qn("max_n")
    x_temp = x_new;
    alpha = linesearch_secant(grad,x_temp,d, i);
    x_new = x_temp + alpha*d;
    
    x_delta = x_new - x_temp;
    
    g_temp = g_new;
    g_new = feval(grad,x_new);
    
    g_delta = g_new - g_temp;
    
    if norm(x_delta) < config_qn("eps_x")
        break
    elseif norm(g_delta) < config_qn("eps_g")
        break
    end
    
    
    gHg = g_delta'*H*g_delta;
    xg = x_delta'*g_delta;
    xx = x_delta*x_delta';
    Hg = H*g_delta;
    
    switch check
        case 1
            x_Hg = x_delta-Hg;
            g_x_Hg = g_delta'*x_Hg;
            H = H + x_Hg*x_Hg'/g_x_Hg;
        case 2
            H = H + xx/xg - Hg*Hg'/gHg;
        case 3
            Hgx = H*g_delta*x_delta';
            H = H + (1+gHg/xg)*xx/xg - (Hgx + Hgx')/xg;
    end
        
    if mod((i+1),config_qn("update_iteration")) == 0 
        d = -g_new;
        H = H0;
    else
        d = -H*g_new;
    end
    
    if i == config_qn("max_n")
        disp("max iteration of quasi-newton reached")
    end
    
end
y = x_new;
end
