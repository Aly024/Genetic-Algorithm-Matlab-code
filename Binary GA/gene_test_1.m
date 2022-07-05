clc
clear

%number of chromosomes (candidate solutions)
M = 10;

%Number of genes (variables)
N = 8;

for k = 1:M
    population.Chromosomes(k).Gene(:) = [round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand())];
    population.Chromosomes(k).fitness = fitnessFunc( population.Chromosomes(k).Gene(:));

end


[parent1, parent2] = selectionFunc_RW_test(population)

% Probability of crossover
Pc = 0.5;

% Type of crossover 
crossover_type = "double";

[child1, child2] = crossoverFunc_test(parent1, parent2, Pc, crossover_type)


