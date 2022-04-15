function [fitness_value] = fitnessfunc(X)

%% We need a mathematical equ to calculate the efficiency
%% Give the inputs and solve using the equ
%% get the results

%% Pass everything as a vector and split later

%% Celing fan example
blades = X(1);
length = X(2);

%% This function returns the fitness value
fitness_value = blades + length;

end

%% How to use this fitnessfun to evaluate chromosomes? 
%% Open the gene_rep file
%% pass the fitnessfunc
