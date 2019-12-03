function [g] = grad_Rosenbrock(x)
%% gradient of Rosenbrock function
%% input
% x: x_val
%% output
% g: gradient 
%% codes
x1 = x(1);
x2 = x(2);

g1 = 200*(x2-x1^2)*(-2*x1)+2*x1-2;
g2 = 200*(x2-x1^2);

g = [g1 g2]';
end
