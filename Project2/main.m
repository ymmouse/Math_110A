% Qingyang Zhang
% 63831894
%% Initialization
% version R2019B
clear; clc; close all
format short
%% file introduction
% get_config.m: all configurations 
%
% linesearch_secant.m: the secant line search algorithm
%
% quasi_newton.m: the quasi_newton algorithm with 
% check = 1(Rank-one), check = 2(DFP), check = 3(BFGS)
%
% Rosenbrock.m: Rosenbrock's function
%
% grad_Rosenbrock.m: gradient of Rosenbrock's function
%% test of Rosenbrock's function 
x0 = [-2 2]';
[i1,x_final1] = quasi_newton("grad_Rosenbrock",x0,1);
[i2,x_final2] = quasi_newton("grad_Rosenbrock",x0,2);
[i3,x_final3] = quasi_newton("grad_Rosenbrock",x0,3);

fprintf("\n rank-one \n")
fprintf("number of iterations: %i\n",i1)
fprintf("x:\n")
disp(x_final1)

fprintf("\n DFP \n")
fprintf("number of iterations: %i\n",i2)
fprintf("x:\n")
disp(x_final2)

fprintf("\n BFGS \n")
fprintf("number of iterations: %i\n",i3)
fprintf("x:\n")
disp(x_final3)

