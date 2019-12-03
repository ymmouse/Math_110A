function [alpha] = linesearch_secant (grad, x, d, eps, max_n)
% the secant method for the line search 
% initial conditions
i = 0;
deriv0 = grad(x)'*d;
% dphi_zerp = feval(grad,x)'*d
alpha_new = 0;
alpha = 0.001;
deriv_new = deriv0;

while abs(deriv_new) >= eps*abs(deriv0)
    alpha_old = alpha_new;
    alpha_new = alpha;
    
    deriv_old = deriv_new;
    
    x_temp = x + alpha_new*d;
    grad_temp = grad(x_temp);
    deriv_new = grad_temp'*d;
    
    % Secant Method
    alpha = ...
        (deriv_new*alpha_old-deriv_old*alpha_new)/(deriv_new-deriv_old);
    
    if i == max_n
        fprintf('max iteration reached')
        break
    end
    
    i = i + 1;
end
end
