% Genetic Algorithm version: v1.0

clc
clear

%% Definining the parameters of GA
M = 10; % Number of chromosomes (candidate solutions)
N = 10; % Number of genes (variables)
MaxGen = 20;
Pc = 0.85; % Probability of crossover
Pm = 0.01; % Probability of mutation
Er = 0.2; % Elitism rate

%% Initializing the initial population

[population] = initilization(M,N);

% Calculating the fitness value of the initial population
for a = 1:M
    population.Chromosomes(a).fitness = Sphere( population.Chromosomes(a).Gene(:) );
end

g=1;
disp(['Generation #', num2str(g)]);

%% Main loop
for g = 2:MaxGen
    disp(['Generation #', num2str(g)]);

    % Applying selection, crossover, mutaion
    for k = 1:2:M

        % Applying selection
        [parent1, parent2] = selectionFunc_RW_test(population);

        % Type of crossover
        crossover_type = "double"; % 'double' or 'single'

        % Applying crossover
        [child1, child2] = crossoverFunc_test(parent1, parent2, Pc, crossover_type);

        % Applying mutation for child1 and child2 separetly

        [child1] = mutationFunc_test(child1, Pm);
        [child2] = mutationFunc_test(child2, Pm);

        % Passing the children to the new population

        newpopulation.Chromosomes(k).Gene = child1.Gene;
        newpopulation.Chromosomes(k+1).Gene = child2.Gene;

    end

    % Calculating the fitness values of the new population

    for b = 1: M
        newpopulation.Chromosomes(b).fitness = Sphere( newpopulation.Chromosomes(b).Gene(:) );
    end

    % Applying elitism
    [newpopulation2] = elitismFunc_test_2(population, newpopulation, Er);

    population = newpopulation2;

end

%% Calculate the fitness values of each chromosom again

for a = 1: M
    population.Chromosomes(a).fitness = Sphere( population.Chromosomes(a).Gene(:) );
end

%% 
disp('The best solution found is: ');

[max_val , indx] = sort([ population.Chromosomes(:).fitness ] , 'descend');

population.Chromosomes(indx(1)).Gene
population.Chromosomes(indx(1)).fitness
