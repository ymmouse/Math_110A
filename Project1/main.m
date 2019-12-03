% QingyangZhang 63831894
%% Initialization
% version R2019B
clear ; close all; clc
format long
syms x;

%% Configuration
% initial condition for steepest_descent
eps_sd = 1e-6; % epsilon for steepest descent
max_n_sd = 10000; % max iteration for steepest descent

% initial condition for line search
eps_ls = 1e-6; % epsilon for secant method line search
max_n_ls = 2000; % max iteration for secant method line search

%% one test for question 8.1
fprintf('-------------------------------------------------\n')
fprintf("This part is a test of question 8.1\n")
% function 
f2 = @(x) x(1) + 0.5*x(2) + 0.5*x(1)^2 + x(2)^2 + 3;
g2 = @(x) [1+x(1);0.5+2*x(2)];
% optimal x
optimal_x = [-1, -0.25]';

% Steepest descent step
[n1, x_final] = steepest_descent(g2,[0 0]',eps_sd,max_n_sd, ...
    eps_ls, max_n_ls);

fprintf('The algorithm terminated after %i iterations\n', n1) 
fprintf('The final x point:\n')
disp(x_final)
fprintf("The optimal solution:\n")
disp(optimal_x)
fprintf("The abs diff:\n")
disp(abs(vpa(optimal_x- x_final)))

%% Question 8.25
fprintf('-------------------------------------------------\n')
fprintf('This part is for question 8.25\n')
% function of 8.25
f_25 = @(x) (x(1) - 4)^4 + (x(2) - 3)^2 + 4*(x(3) + 5)^4;
grad_25 = @(x) [4*(x(1)-4)^3; 2*(x(2)-3); 16*(x(3)+5)^3];

% initial x and optimal x
x_25_ini1 = [0 -2 1024]'; x_25_ini2 = [-4 5 1]';
x25_optimal = [4 3 -5]';

% Steepest descet step
[n_251, x_251] = steepest_descent(grad_25, x_25_ini1, eps_sd, max_n_sd, ...
    eps_ls, max_n_ls);
[n_252, x_252] = steepest_descent(grad_25, x_25_ini2, eps_sd, max_n_sd, ...
    eps_ls, max_n_ls);

fprintf('initial x1:\n')
disp(x_25_ini1)
fprintf('The algorithm terminated after %i iterations\n', n_251) 
fprintf('The final x point:\n')
disp(x_251)
fprintf("The optimal solution:\n")
disp(x25_optimal)
fprintf("The abs diff:\n")
disp(abs(vpa(x25_optimal- x_251)))
fprintf('----\ninitial x2:\n')
disp(x_25_ini2)
fprintf('The algorithm terminated after %i iterations\n', n_252) 
fprintf('The final x point:\n')
disp(x_252)
%% Question 8.26
fprintf('-------------------------------------------------\n')
fprintf('This part is for question 8.26\n')
% f is Rosenbrock's function, the shape of x = (2 1)
f = @(x) 100*(x(2) - x(1)^2)^2 + (1-x(1))^2;
% gradient
grad = @(x) [400*x(1)^3 - (400*x(2)-2)*x(1) - 2;...
    -200*x(1)^2 + 200*x(2);];

% initial point
x0 = [-2 2]';

% Steepest descent step
[n_26, x_26] = steepest_descent(grad, x0, 1e-4, max_n_sd, ...
    eps_ls, max_n_ls);
% n2 is the numebr of iterations
% final_x_val is the final x point

fprintf('The algorithm terminated after %i iterations\n', n_26) 
fprintf('The final x point:\n')
disp(x_26)

