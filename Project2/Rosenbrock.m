function [y] = Rosenbrock(x)
%% input:
% x: x_value; shape(x) = [2,1];
%% output:
% y: value of Rosenbrock function;
%% codes
y = 100*(x(2) - x(1)^2)^2 + (1-x(1))^2;
end
