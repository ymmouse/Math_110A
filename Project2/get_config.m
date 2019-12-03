function config = get_config(x)
%% Create configurations object for each function
% and return the corresponding configurations of x
%% input
% x: a string represents the algorithm name
%% output: 
% config: a map object with all configurations of algorithm x
%% Quasi-Newton
qn = containers.Map;
qn("max_n") = 20;
qn("eps_g") = 1e-6;
qn("eps_x") = 1e-6;
qn("update_iteration") = 6;
%% linesearch_secant
ls = containers.Map;
ls("max_n") = 200;
ls("eps") = 1e-6;
ls("alpha_new") = 0;
ls("alpha") = 0.001;
%% configuration set with all algorithms
config_set = containers.Map;
config_set("quasi_newton") = qn;
config_set("linesearch_secant") = ls;
%% return the corresponding configurations of x 
config = config_set(x);
end