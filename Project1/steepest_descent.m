function [i, y] = steepest_descent(grad, x_val, eps, max_n, ...
    eps_ls, max_n_ls)

for i = 1:max_n
    x_temp = x_val;
    grad_temp = grad(x_temp);
    
    if norm(grad_temp) <= eps
        break
    end
    
    % secant method line search step
    alpha = ...
        linesearch_secant(grad, x_temp, -grad_temp, eps_ls, max_n_ls);
    
    x_val = x_temp - alpha*grad_temp;
    
    if i == max_n
        fprintf("max_iteration of steepest descent reached\n\n")
    end
end
y = x_val;
end

