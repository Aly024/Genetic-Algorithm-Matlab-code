function [newpopulation2] = elitismFunc_test_2(population, newpopulation, Er)

M = length(population.Chromosomes);
no_of_elite = round(M*Er);

[max_val, index] = sort( [population.Chromosomes(:).fitness], 'descend' );

% Elites from the previous population
for k = 1:no_of_elite

    newpopulation2.Chromosomes(k).Gene = population.Chromosomes(index(k)).Gene;
    newpopulation2.Chromosomes(k).fitness = population.Chromosomes(index(k)).fitness;

end

% Rest from the new population
for k = no_of_elite + 1: M

    newpopulation2.Chromosomes(k).Gene = newpopulation.Chromosomes(k).Gene;
    newpopulation2.Chromosomes(k).fitness = newpopulation.Chromosomes(k).fitness;

end

end

%%
%Creates a problem in 3rd generation