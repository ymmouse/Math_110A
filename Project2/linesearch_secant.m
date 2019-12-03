function [alpha] = linesearch_secant (grad, x, d, check)
%% the secant method for the line search 
%% input
% grad: gradient vector
% x: x_value
% d: negative gradient
%% output 
% alpha: the minimum value
%% codes
% config_ls is the map object contains all configurations
config_ls = get_config("linesearch_secant");
i = 0;

grad0 = feval(grad,x);
deriv0 = grad0'*d;
alpha_new = config_ls("alpha_new");
alpha = config_ls("alpha");
deriv_new = deriv0;

while abs(deriv_new) >= config_ls("eps")*abs(deriv0)
    alpha_old = alpha_new;
    alpha_new = alpha;
    
    deriv_old = deriv_new;
    
    x_temp = x + alpha_new*d;
    grad_temp = feval(grad,x_temp);
    deriv_new = grad_temp'*d;
    
    % Secant Method
    alpha = ...
        (deriv_new*alpha_old-deriv_old*alpha_new)/(deriv_new-deriv_old);

    if i == config_ls("max_n")
        fprintf('max iteration reached')
        break
    end
    
    i = i + 1;
end
end
