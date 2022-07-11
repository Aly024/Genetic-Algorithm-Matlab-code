function [parent_1, parent_2] = selection_func(population)

M = length(population.Chromosomes(:));

if any( [population.Chromosomes(:).fitness] < 0)
    % Fitness scaling of -ve numbers
    % scaled(f) = a*f + b

    a = 1;
    b = abs( min( [population.Chromosomes(:).fitness] ) );
    scaled_fitness = a*[population.Chromosomes(:).fitness] + b;

    normalized_fitness = [scaled_fitness] ./ sum([scaled_fitness]);

else
    normalized_fitness = [population.Chromosomes(:).fitness] ./ sum([population.Chromosomes(:).fitness]);
end

[sorted_fitness_values, sorted_index] = sort(normalized_fitness, 'descend');

for i = 1 : length(population.Chromosomes)
    temp_population.Chromosomes(i).Gene = population.Chromosomes(sorted_index(i)).Gene;
    temp_population.Chromosomes(i).fitness = population.Chromosomes(sorted_index(i)).fitness;
    temp_population.Chromosomes(i).normalized_fitness = normalized_fitness(sorted_index(i));
end

cumsum = zeros(1, M);

for i = 1:M
    for j = i:M
        cumsum(i) = cumsum(i) + temp_population.Chromosomes(j).normalized_fitness;
    end
end

R = rand();
parent_1_index = M;

for i = 1: length(cumsum)
    if R > cumsum(i)
        parent_1_index = i - 1;
        break;
    end
end

parent_2_index = parent_1_index;

while_loop_stop = 0;

while parent_2_index == parent_1_index
    while_loop_stop = while_loop_stop + 1;
    R = rand();
    if while_loop_stop > 20
        break;
    end

    for i = 1:length(cumsum)
        if R > cumsum(i)
            parent_2_index = i - 1;
            break;
        end
    end
end

parent_1 = temp_population.Chromosomes(parent_1_index);
parent_2 = temp_population.Chromosomes(parent_2_index);




end