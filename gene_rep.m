clc
clear 

%% A population is made out of Choromosones and chromosones are made out of gene

%% Two approaches

%% 1: Create a 2D array row = chromoson, column = gene
%% 2: Use struct

%% Second technique is easier 

M = 10; %% Number of choromosomes ( Candidate solutions ) 
N = 2; %% Number of genes ( Variables, parameters, decsision variables)

%% For loop to go through each chromosomes and assign 0 their genes

for k = 1 : M
    rand(N);
    population.Choromosomes(k).Gene(:) = [round(rand()), round(rand())]
    population.Choromosomes(k).fitness= fitnessfunc( population.Choromosomes(k).Gene(:) )
end

%% Chromosomes by itself doesn't indicate how good it is
%% We need a fitness/ obj func to evaluate each gene

[parent1, parent2] = selection_RW(population)

