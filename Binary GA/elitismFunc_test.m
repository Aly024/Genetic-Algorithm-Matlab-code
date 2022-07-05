function [newpopulation] = elitismFunc_test(population, Er)

% number of individuals
M = length(population.Chromosomes);
no_of_elite = round(M*Er);

[max_val, index] = sort( [population.Chromosomes(:).fitness], 'descend' );

for k = 1:no_of_elite

    newpopulation.Chromosomes(k).Gene = population.Chromosomes(index(k)).Gene;
    newpopulation.Chromosomes(k).fitness  = population.Chromosomes(index(k)).fitness;

end

for k = no_of_elite + 1 : M

    newpopulation.Chromosomes(k).Gene = population.Chromosomes(k).Gene;
    newpopulation.Chromosomes(k).fitness  = population.Chromosomes(k).fitness;

end
end

%%
%This creates a problem in 3rd generation
