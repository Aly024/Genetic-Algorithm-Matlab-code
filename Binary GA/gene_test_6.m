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

%% 

for k = 1:2:M

    % Applying selection
    [parent1, parent2] = selectionFunc_RW_test(population);

    % Probability of crossover
    Pc = 0.5;

    % Type of crossover
    crossover_type = "double";

    % Applying crossover
    [child1, child2] = crossoverFunc_test(parent1, parent2, Pc, crossover_type);

    % Probability of mutation
    Pm = 0.1;

    % Applying mutation for child1 and child2 separetly

    [child1] = mutationFunc_test(child1, Pm);
    [child2] = mutationFunc_test(child2, Pm);

    % Creating new population

    newpopulation.Chromosomes(k).Gene = child1.Gene;
    newpopulation.Chromosomes(k+1).Gene = child2.Gene;

end

% Elitism rate
Er = 0.2;

% Applying elitism
[newpopulation2] = elitismFunc_test(population, Er);

population = newpopulation2;

%%
%In this program we create choromosom and gene. Choromosom = Total population, gene = indivuduals in the population
%We randomly generate the Choromosoms and use a fitness function to score
%them
% Then apply slection to select two individuals as parents for the next
% population
%Cross over the two childern and mutate them
%Save the elite memebrs of the chromosoms in a new matrix
%Pass the population as new population
